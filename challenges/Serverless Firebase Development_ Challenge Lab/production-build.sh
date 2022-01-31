cd ~/pet-theory/lab06/firebase-frontend

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-production:0.1

gcloud beta run deploy frontend-production-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-production:0.1 \
  --platform managed \
  --region us-central1