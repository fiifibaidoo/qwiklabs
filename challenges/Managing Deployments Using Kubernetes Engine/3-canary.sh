cd orchestrate-with-kubernetes/kubernetes

cat deployments/hello-canary.yaml

kubectl create -f deployments/hello-canary.yaml

kubectl get deployments

curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`/version