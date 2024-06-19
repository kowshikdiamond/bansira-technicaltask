# Bansira Technical Assessment


## Info
This CI/CD pipeline ensures that a Docker image is built with the commit SHA as the tag whenever changes are made on the main or feature branches. The built image is then pushed to a Docker registry.

For continuous deployment into a Kubernetes cluster, the deploy stage ensures that the image tag is updated in helmcharts values.yml file with the commit sha.

ArgoCD is configured to monitor changes in the specified repository and update the deployment status in the Kubernetes cluster accordingly.

**Flow:**

1. Building and Pushing Docker Image:

- Whenever changes are detected on the main or feature branches:
- Docker image is built using the commit SHA as the tag.
- The built image is pushed to the Docker registry.

2. Continuous Deployment to Kubernetes:

- The build container image is reflected in the values.yml file.
- This ensures that the Kubernetes deployment uses the latest version of the Docker image.

3. ArgoCD Integration:

- ArgoCD is configured to monitor the specified repository for changes.
- Upon detecting changes:
- ArgoCD updates the deployment status in the Kubernetes cluster.
- This facilitates continuous deployment and ensures the Kubernetes environment is always synchronized with the latest application version.

## To run in an existing Kubernetes cluster with ArgoCD installed:

1. Clone the repository:
```
git clone https://github.com/kowshikdiamond/bansira-technicaltask
```

2. Navigate into the directory:
```
cd bansira-technicaltask
```

3. Deploy the application:
```
kubectl apply -f argocd/argocd.yml -n argocd
```

## If you want to set this up on your GitHub account:

1. Clone the repository:
```
git clone https://github.com/kowshikdiamond/bansira-technicaltask
```

2. Navigate into the directory:
```
cd bansira-technicaltask
```

3. Edit `values.yml` in `helmcharts` folder:

- Update the image repository with your Docker repository.
- Adjust the service port type to your desired type.

4. Edit `argocd.yml` in `argocd` folder:

- Modify source with your new repository URL, ensuring it is public.
- Optionally, adjust the namespace if you want to deploy to a different namespace.

Note: 
- Ensure your Docker username and password are set in repository secrets with variable names `DOCKERHUB_USERNAME` & `DOCKERHUB_PASSWORD`.

5. Commit the changes:
```
git add .
git commit -m "Commit new changes"
```

6. Push the changes to your repository:
```
git push <your-repository-url>
```

7. After pushing, deploy the application. Ensure ArgoCD is installed:
```
kubectl apply -f argocd/argocd.yml -n argocd
```
