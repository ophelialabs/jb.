# Clone GKE retail [example](https://github.com/GoogleCloudPlatform/microservices-demo)
```bash
git clone --depth 1 --branch v0 https://github.com/GoogleCloudPlatform/microservices-demo.git
cd microservices-demo/
```
- Export Google Cloud project and region and ensure the Google Kubernetes Engine API is enabled
- Substitute <PROJECT_ID> with the ID of your Google Cloud project
```bash
export PROJECT_ID=<PROJECT_ID>
export REGION=us-central1
gcloud services enable container.googleapis.com \
  --project=${PROJECT_ID}
```
- Create a GKE cluster and get the credentials for it
```bash
gcloud container clusters create-auto online-boutique \
  --project=${PROJECT_ID} --region=${REGION}
```
- Deploy App to cluster
```bash
kubectl apply -f ./release/kubernetes-manifests.yaml
```
- Access the web frontend in a browser using the frontend's external IP
- Visit http://EXTERNAL_IP in a web browser to access your instance
```bash
kubectl get service frontend-external | awk '{print $4}'
```
- Delete cluster when finished
```bash
gcloud container clusters delete online-boutique \
  --project=${PROJECT_ID} --region=${REGION}
```
## Addition deployment options
 - [Terraform](https://github.com/GoogleCloudPlatform/microservices-demo/blob/main/terraform)
 - [Istio/Cloud](https://github.com/GoogleCloudPlatform/microservices-demo/blob/main/kustomize/components/service-mesh-istio/README.md) Service Mesh
 - [Non-GKE](https://github.com/GoogleCloudPlatform/microservices-demo/blob/main/docs/development-guide.md) (Minikube, Kind)
 - [AI](https://github.com/GoogleCloudPlatform/microservices-demo/blob/main/kustomize/components/shopping-assistant/README.md) assistant using Gemini
 - [/kustomize](https://github.com/GoogleCloudPlatform/microservices-demo/tree/main/kustomize) directory contains instructions for customizing the deployment of Online Boutique with other variations


  