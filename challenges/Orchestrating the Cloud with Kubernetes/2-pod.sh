cd orchestrate-with-kubernetes/kubernetes

cat pods/monolith.yaml

kubectl create -f pods/monolith.yaml

kubectl get pods

kubectl describe pods monolith

kubectl port-forward monolith 10080:80

