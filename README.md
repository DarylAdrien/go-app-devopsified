# DevOpsified Go Web App

## Overview
This project is a **Go Web Application** that has been fully DevOpsified with **Docker, Kubernetes, Helm, GitHub Actions for CI, and ArgoCD for CD**. The application is deployed in a Kubernetes cluster with **NGINX Ingress Controller** handling DNS and routing.

## Tech Stack
- **Go** (Backend)
- **Docker** (Containerization)
- **Kubernetes** (Orchestration)
- **Helm** (Kubernetes Package Manager)
- **GitHub Actions** (CI - Continuous Integration)
- **ArgoCD** (CD - Continuous Deployment)
- **NGINX Ingress Controller** (Ingress & DNS)

---

## Setup & Deployment

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-repo/go-app-devopsified.git
cd go-app-devopsified
```

### 2️⃣ Build & Run Locally
```sh
go build -o app .
./app
```

Or using Docker:
```sh
docker build -t your-dockerhub-username/go-app-devopsified:latest .
docker run -p 8080:8080 your-dockerhub-username/go-app-devopsified:latest
```

---

## Kubernetes Deployment

### 3️⃣ Deploy to Kubernetes
```sh
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

### 4️⃣ Verify Deployment
```sh
kubectl get pods -n your-namespace
kubectl get svc -n your-namespace
kubectl get ingress -n your-namespace
```

---

## Helm Deployment
### 5️⃣ Install Using Helm
```sh
helm install my-go-app helm/
```

---

## CI/CD Pipeline

### **GitHub Actions for CI**
- **Trigger:** On push or PR to `main`
- **Steps:**
  1. Build & Test Go App
  2. Build & Push Docker Image
  3. Update Helm Chart & K8s Manifests

### **ArgoCD for CD**
- **Monitors GitHub Repo** for changes in manifests
- **Automatically Syncs Deployments** to Kubernetes
- **Rollback Support** for failed deployments

---

## Ingress & DNS Setup
- **Ingress Controller:** NGINX
- **Host Mapping:** Add the following entry in `/etc/hosts`
```sh
127.0.0.1  your-app.local
```
- Access the app at: `http://your-app.local`

---

## Cleanup
```sh
kubectl delete -f k8s/
helm uninstall my-go-app
argocd app delete devops-go-app
```
---

## License
This project is licensed under the MIT License.

