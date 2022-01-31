docker build -t echo-app:v2 .
export PROJECT_ID=$(gcloud info --format='value(config.project)')
docker tag echo-app:v2 gcr.io/${PROJECT_ID}/echo-app:v2
docker push gcr.io/${PROJECT_ID}/echo-app:v2