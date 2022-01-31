# Provision Environment
echo "Provisioning GCP Environment"
gcloud config set project \
  $(gcloud projects list --format='value(PROJECT_ID)' \
  --filter='qwiklabs-gcp')

gcloud config set run/region us-central1
gcloud config set run/platform managed
git clone https://github.com/rosera/pet-theory.git && cd pet-theory/lab07
echo "GCP Environment setup complete"
# Task 1
cd ~/pet-theory/lab07/unit-api-billing
gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/billing-staging-api:0.1
gcloud beta run deploy public-billing-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/billing-staging-api:0.1 \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
SERVICE_URL=$(gcloud run services describe public-billing-service \
  --platform managed \
  --region us-central1 \
  --format "value(status.url)")
curl -X GET $SERVICE_URL

#Task 2
cd ~/pet-theory/lab07/staging-frontend-billing
gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-staging:0.1
gcloud beta run deploy frontend-staging-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-staging:0.1 \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
FRONTEND_URL=$(gcloud run services describe frontend-staging-service \
  --platform managed \
  --region us-central1 \
  --format "value(status.url)")
curl -X GET $FRONTEND_URL

#Task 3
cd ~/pet-theory/lab07/staging-api-billing
gcloud beta run services delete public-billing-service
gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/billing-staging-api:0.2
gcloud beta run deploy private-billing-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/billing-staging-api:0.2 \
  --platform managed \
  --region us-central1 \
  --no-allow-unauthenticated

BILLING_SERVICE=private-billing-service
BILLING_URL=$(gcloud run services describe $BILLING_SERVICE \
  --platform managed \
  --region us-central1 \
  --format "value(status.url)")

curl -X get -H "Authorization: Bearer $(gcloud auth print-identity-token)" $BILLING_URL

# Task 4: Create a Billing Service Account
gcloud iam service-accounts create billing-service-sa --display-name "Billing Service Cloud Run"

# Task 5: Deploy the Billing Service
cd ~/pet-theory/lab07/prod-api-billing

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/billing-prod-api:0.1
gcloud beta run deploy billing-prod-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/billing-prod-api:0.1 \
  --platform managed \
  --region us-central1 \
  --no-allow-unauthenticated
gcloud run services add-iam-policy-binding billing-prod-service \
  --member=serviceAccount:billing-service-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com \
  --role=roles/run.invoker

PROD_BILLING_SERVICE=private-billing-service

PROD_BILLING_URL=$(gcloud run services \
  describe $PROD_BILLING_SERVICE \
  --platform managed \
  --region us-central1 \
  --format "value(status.url)")

curl -X get -H "Authorization: Bearer \
  $(gcloud auth print-identity-token)" \
  $PROD_BILLING_URL

# Task 6 Create a Billing Service Account
gcloud iam service-accounts create frontend-service-sa --display-name "Billing Service Cloud Run Invoker"

# Task 7: Redeploy the Frontend Service
cd ~/pet-theory/lab07/prod-frontend-billing

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-prod:0.1
gcloud beta run deploy frontend-prod-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-prod:0.1 \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated

gcloud run services add-iam-policy-binding frontend-prod-service \
  --member=serviceAccount:frontend-service-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com \
  --role=roles/run.invoker

FRONTEND_PROD_URL=$(gcloud run services describe frontend-prod-service \
  --platform managed \
  --region us-central1 \
  --format "value(status.url)")
curl -X GET $FRONTEND_PROD_URL