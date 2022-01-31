cd orchestrate-with-kubernetes/kubernetes

curl http://127.0.0.1:10080

TOKEN=$(curl http://127.0.0.1:10080/login -u user|jq -r '.token')

curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:10080/secure

kubectl logs monolith

curl http://127.0.0.1:10080

kubectl exec monolith --stdin --tty -c monolith /bin/sh

ping -c 3 google.com

exit