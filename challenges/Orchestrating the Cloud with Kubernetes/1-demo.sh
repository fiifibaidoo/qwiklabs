gcloud config set compute/zone us-central1-b

gcloud container clusters create io

git clone https://github.com/googlecodelabs/orchestrate-with-kubernetes.git

cd orchestrate-with-kubernetes/kubernetes

ls

kubectl create deployment nginx --image=nginx:1.10.0

kubectl get pods

kubectl expose deployment nginx --port 80 --type LoadBalancer

kubectl get services