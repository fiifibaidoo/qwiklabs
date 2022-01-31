cd orchestrate-with-kubernetes/kubernetes

cat deployments/auth.yaml

kubectl create -f deployments/auth.yaml

kubectl get deployments

kubectl get replicasets

kubectl get pods

kubectl create -f services/auth.yaml

kubectl create -f deployments/hello.yaml
kubectl create -f services/hello.yaml

kubectl create secret generic tls-certs --from-file tls/
kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
kubectl create -f deployments/frontend.yaml
kubectl create -f services/frontend.yaml

kubectl get services frontend

curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`

kubectl scale deployment hello --replicas=5

kubectl scale deployment hello --replicas=5

kubectl scale deployment hello --replicas=3

kubectl get pods | grep hello- | wc -l