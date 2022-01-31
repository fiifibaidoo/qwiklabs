#!/bin/bash

cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

# Create an instance template :

gcloud compute instance-templates create nginx-template \
--metadata-from-file startup-script=startup.sh

# Create a target pool :

gcloud compute target-pools create nginx-pool

# Create a managed instance group :

gcloud compute instance-groups managed create nginx-group \
--base-instance-name nginx \
--size 2 \
--template nginx-template \
--target-pool nginx-pool

gcloud compute instances list

# Create a firewall rule to allow traffic (80/tcp) :

gcloud compute firewall-rules create www-firewall --allow tcp:80

gcloud compute forwarding-rules create nginx-lb \
--region us-east1 \
--ports=80 \
--target-pool nginx-pool

gcloud compute forwarding-rules list

# Create a health check :

gcloud compute http-health-checks create http-basic-check

gcloud compute instance-groups managed \
set-named-ports nginx-group \
--named-ports http:80

# Create a backend service and attach the manged instance group :

gcloud compute backend-services create nginx-backend \
--protocol HTTP --http-health-checks http-basic-check --global

gcloud compute backend-services add-backend nginx-backend \
--instance-group nginx-group \
--instance-group-zone us-east1-b \
--global

# Create a URL map and target HTTP proxy to route requests to your URL map :

gcloud compute url-maps create web-map \
--default-service nginx-backend

gcloud compute target-http-proxies create http-lb-proxy \
--url-map web-map

# Create a forwarding rule :

gcloud compute forwarding-rules create http-content-rule \
--global \
--target-http-proxy http-lb-proxy \
--ports 80

gcloud compute forwarding-rules list