gcloud services enable container.googleapis.com

gcloud container clusters create fancy-cluster --num-nodes 3

kubectl create deployment fancytest --image=gcr.io/${GOOGLE_CLOUD_PROJECT}/fancytest:1.0.0

kubectl expose deployment fancytest --type=LoadBalancer --port 80 --target-port 8080