gcloud auth list

gcloud config set compute/zone us-central1-a

git clone https://github.com/googlecodelabs/orchestrate-with-kubernetes.git
cd orchestrate-with-kubernetes/kubernetes

gcloud container clusters create bootcamp --num-nodes 5 --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"

kubectl explain deployment

kubectl explain deployment --recursive

kubectl explain deployment.metadata.name