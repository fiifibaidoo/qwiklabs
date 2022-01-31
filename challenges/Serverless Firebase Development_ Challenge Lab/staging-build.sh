#!/usr/bin/env bash

gcloud config set project $(gcloud projects list --format='value(PROJECT_ID)' --filter='qwiklabs-gcp')

git clone https://github.com/rosera/pet-theory.git

cd ~/pet-theory/lab06/firebase-import-csv/solution

npm install

cd ~/pet-theory/firebase-rest-api/solution-01

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/rest-api:0.1

gcloud beta run deploy netflix-dataset-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/rest-api:0.1 \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated

cd ~/pet-theory/firebase-rest-api/solution-02

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/rest-api:0.2

gcloud beta run deploy netflix-dataset-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/rest-api:0.2 \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated

cd ~/pet-theory/firebase-frontend

gcloud builds submit \
  --tag gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-staging:0.1

gcloud beta run deploy frontend-staging-service \
  --image gcr.io/$GOOGLE_CLOUD_PROJECT/frontend-staging:0.1 \
  --platform managed \
  --region us-central1

 cd ~/pet-theory/firebase-import-csv/solution/
 node index.js netflix_titles_original.csv
