cd ~/wp-k8s

gcloud container clusters get-credentials griffin-dev --zone=us-east1

kubectl apply -f wp-env.yaml

gcloud iam service-accounts keys create key.json \
       --iam-account=cloud-sql-proxy@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com
   kubectl create secret generic cloudsql-instance-credentials \
       --from-file key.json