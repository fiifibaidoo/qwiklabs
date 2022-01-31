### Step 1 - Build and push the sample application
1. Run the following command `gsutil cp gs://qwiklabs-gcp-04-8512d75974f3.V2/echo-web-v2.tar.gz ~/`
2. Run `tar -xvzf echo-web-v2.tar.gz`
3. Edit /manifests/echoweb-deployment.yaml with the following information: 
`apiVersion: apps/v1beta1
   kind: Deployment
   metadata:
     name: echoweb
     labels:
       app: echo
   spec:
     template:
       metadata:
         labels:
           app: echo
           tier: web
       spec:
         containers:
         - name: echo-app
           image: gcr.io/PROJECT_ID/echo-app:v2 # Update this to v2.
                                                # Replace PROJECT_ID
                                                # with your project
           ports:
           - containerPort: 8000`
 4. Save the file and upload the .sh files from the computer. Run the following command: 
 `. 1-build-push.sh` 
 5. Confirm the docker image has been built and tagged with v2 by navigating to Container Registry -> Images. 
 
 ### Step 2 - Update the application to the Kubernetes Cluster
 
 1. Navigate to Kubernetes Engine > Workloads, click the name `echo-web` to show the Deployment details. Press the Burget Menu icon to expand the menu and select Rolling Update.
 2. In the Rolling Update dialog, modify the end of the image field from v1 to v2 and click **UPDATE**.
 
 ### Step 3 - Update the application to the Kubernetes Cluster
 1. Navigate to Kubernetes Engine > Workloads, click the name `echo-web` to show the Deployment details. Press the menu icon to expand the menu and select Scale.
 2. In the Scale dialog, type 2 to the field Replicas
 3. Click **SCALE**, then wait for creating/deleting instances until 2 replicas exist in the Kubernetes cluster.