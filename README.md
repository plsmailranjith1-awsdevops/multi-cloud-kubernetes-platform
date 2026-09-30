# 🚀 Multi-Cloud Kubernetes Platform

A production-style multi-cloud Kubernetes platform that deploys the same containerized e-commerce application across **AWS EKS** and **Azure AKS** using **Terraform, Kubernetes, Helm, Kustomize, Docker, GitHub Actions, ECR/ACR, NGINX Ingress, HPA, and Trivy**.

The project demonstrates Infrastructure as Code, containerized application delivery, multi-cloud Kubernetes operations, CI/CD automation, container security scanning, configuration management, autoscaling, ingress routing, and Git-based deployment organization.

---

## 📌 Project Overview

### 🎯 Objective

The objective of this project is to build a repeatable Kubernetes platform that can run the same application on two major cloud providers:

```text
                    GitHub Repository
                           │
                           ▼
                    GitHub Actions
                           │
                 ┌─────────┴─────────┐
                 │                   │
                 ▼                   ▼
            AWS ECR              Azure ACR
                 │                   │
                 ▼                   ▼
              AWS EKS             Azure AKS
                 │                   │
                 └─────────┬─────────┘
                           │
                    Kubernetes App
                           │
                    Helm / Kustomize
                           │
                    NGINX Ingress
                           │
                    E-commerce App
```

The application is deployed using the same Kubernetes/Helm approach while cloud-specific configuration is maintained through environment overlays.

---

# 🏗️ Architecture

## 🌐 Multi-Cloud Architecture

```text
                              GitHub
                                │
                                │ Source / CI
                                ▼
                        GitHub Actions
                                │
                    ┌───────────┴───────────┐
                    │                       │
                    ▼                       ▼
                  AWS                     Azure
                    │                       │
             Amazon ECR                  Azure ACR
                    │                       │
                    ▼                       ▼
                AWS EKS                  Azure AKS
                    │                       │
              ┌─────┴─────┐           ┌─────┴─────┐
              │ Kubernetes │           │ Kubernetes │
              │  Workload  │           │  Workload  │
              └─────┬─────┘           └─────┬─────┘
                    │                       │
               NGINX Ingress           NGINX Ingress
                    │                       │
                    ▼                       ▼
              E-commerce App          E-commerce App
```

### Architecture components

| Layer | AWS | Azure |
|---|---|---|
| Kubernetes | Amazon EKS | Azure AKS |
| Container Registry | Amazon ECR | Azure ACR |
| Kubernetes Networking | AWS VPC / Load Balancer | Azure VNet / Load Balancer |
| Ingress | NGINX Ingress | NGINX Ingress |
| Application Packaging | Helm | Helm |
| Configuration | Kustomize / Kubernetes | Kustomize / Kubernetes |
| Autoscaling | Kubernetes HPA | Kubernetes HPA |
| CI/CD | GitHub Actions | GitHub Actions |

---

## 🖼️ Architecture Diagram

Add the final architecture image here:

```text
docs/architecture/multi-cloud-architecture.png
```

Markdown:

```markdown
![Multi-Cloud Kubernetes Architecture](docs/architecture/multi-cloud-architecture.png)
```

---

# 🔄 End-to-End Deployment Workflow

```text
Developer
   │
   │ git push
   ▼
GitHub Repository
   │
   ▼
GitHub Actions
   │
   ├── Application validation
   │
   ├── Docker build
   │
   ├── Trivy security scan
   │
   └── Container image push
          │
          ├──────────────► Amazon ECR
          │
          └──────────────► Azure ACR
                              │
                              ▼
                     Kubernetes Deployment
                              │
                    ┌─────────┴─────────┐
                    ▼                   ▼
                  AWS EKS             Azure AKS
                    │                   │
                    ▼                   ▼
              Helm/Kustomize      Helm/Kustomize
                    │                   │
                    ▼                   ▼
             NGINX Ingress        NGINX Ingress
                    │                   │
                    ▼                   ▼
              Application           Application
```

---

# 📁 Project Structure

```text
multi-cloud-kubernetes-platfrom/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── docs/
│   ├── architecture/
│   │   └── README.md
│   │
│   ├── screenshots/
│   │   ├── aws-eks.png
│   │   ├── azure-aks.png
│   │   ├── aws-application.png
│   │   ├── azure-application.png
│   │   ├── kubernetes-pods.png
│   │   ├── helm.png
│   │   ├── hpa.png
│   │   ├── github-actions.png
│   │   └── trivy.png
│   │
│   └── validation.md
│
├── gitops/
│   ├── README.md
│   ├── aws/
│   │   └── kustomization.yaml
│   └── azure/
│       └── kustomization.yaml
│
├── helm/
│   └── ecommerce/
│       ├── Chart.yaml
│       ├── NOTES.txt
│       ├── values.yaml
│       └── templates/
│           ├── _helpers.tpl
│           ├── configmap.yaml
│           ├── deployment.yaml
│           ├── hpa.yaml
│           ├── ingress.yaml
│           ├── secret.yaml
│           └── service.yaml
│
├── kubernetes/
│   ├── base/
│   │   ├── configmap.yaml
│   │   ├── deployment.yaml
│   │   ├── hpa.yaml
│   │   ├── ingress.yaml
│   │   ├── kustomization.yaml
│   │   ├── namespace.yaml
│   │   ├── secret.yaml
│   │   └── service.yaml
│   │
│   └── overlays/
│       ├── aws/
│       │   └── kustomization.yaml
│       └── azure/
│           └── kustomization.yaml
│
├── terraform/
│   ├── aws/
│   │   ├── backend.tf
│   │   ├── eks.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   │
│   └── azure/
│       ├── aks.tf
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── versions.tf
│
├── .gitignore
└── README.md
```

---

# 🧰 Technologies Used

## ☁️ Cloud Platforms

### AWS

- Amazon EKS
- Amazon ECR
- Amazon VPC
- IAM
- EC2 / EKS managed nodes
- Elastic Load Balancing

### Microsoft Azure

- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure Virtual Network
- Azure Load Balancer
- Azure IAM/RBAC

---

## 🏗️ Infrastructure as Code

- Terraform
- Terraform AWS Provider
- Terraform AzureRM Provider
- Terraform variables
- Terraform outputs
- Terraform state management
- Reusable infrastructure configuration

---

## ☸️ Kubernetes

- Kubernetes
- Amazon EKS
- Azure AKS
- Pods
- Deployments
- Services
- Namespaces
- ConfigMaps
- Secrets
- Ingress
- Horizontal Pod Autoscaler

---

## 📦 Containerization

- Docker
- Dockerfile
- NGINX Alpine
- Amazon ECR
- Azure ACR

---

## 📦 Application Packaging

- Helm
- Helm values
- Helm templates
- Kustomize
- Kubernetes overlays

---

## 🔄 CI/CD

- Git
- GitHub
- GitHub Actions
- Automated Docker builds
- Container image publishing
- CI validation

---

## 🔐 Security

- Trivy
- Container vulnerability scanning
- Kubernetes Secrets
- IAM
- Azure RBAC
- Secure registry authentication

---

# 🐳 Application

## Application Description

The project uses a lightweight containerized e-commerce application.

The application is served using NGINX and deployed as a Kubernetes workload.

### Application file

```text
app/index.html
```

### Application container

```text
app/Dockerfile
```

The Docker image is based on NGINX Alpine and includes a container health check.

---

# 🐳 Docker Implementation

## Dockerfile

The application is packaged into a lightweight NGINX container.

Main operations:

```text
NGINX Alpine base image
        │
        ▼
Package upgrade
        │
        ▼
Copy application HTML
        │
        ▼
Expose port 80
        │
        ▼
Container health check
```

## Docker image lifecycle

```text
Application Source
       │
       ▼
Docker Build
       │
       ▼
Docker Image
       │
       ▼
Trivy Scan
       │
       ▼
Container Registry
       │
       ├── AWS ECR
       └── Azure ACR
```

---

# 🏗️ Terraform Infrastructure

Terraform is used to define the cloud infrastructure required by the Kubernetes platforms.

## AWS Terraform

```text
terraform/aws/
```

The AWS configuration provisions and manages the EKS environment.

Major components include:

- EKS cluster
- Managed node group
- VPC/networking
- IAM
- EKS add-ons
- Kubernetes access configuration
- Cluster encryption

## Azure Terraform

```text
terraform/azure/
```

The Azure configuration provisions and manages the AKS environment.

Major components include:

- Resource group
- Virtual network
- AKS cluster
- AKS node pool
- Networking
- Azure infrastructure configuration

---

# ☸️ Kubernetes Architecture

The Kubernetes configuration follows a base-and-overlay model.

```text
                  Kubernetes
                      │
                ┌─────┴─────┐
                │    Base   │
                └─────┬─────┘
                      │
          ┌───────────┴───────────┐
          │                       │
          ▼                       ▼
       AWS Overlay             Azure Overlay
          │                       │
          ▼                       ▼
        AWS EKS                 Azure AKS
```

## Base resources

```text
kubernetes/base/
```

Contains common Kubernetes resources:

- Namespace
- Deployment
- Service
- ConfigMap
- Secret
- Ingress
- HPA
- Kustomization

## AWS overlay

```text
kubernetes/overlays/aws/
```

Provides AWS-specific configuration.

## Azure overlay

```text
kubernetes/overlays/azure/
```

Provides Azure-specific configuration.

---

# 🚀 Kubernetes Deployment

## Namespace

The application runs inside the dedicated:

```text
ecommerce
```

namespace.

This separates application resources from system workloads.

---

## Deployment

The Kubernetes Deployment manages the application Pods.

The Deployment provides:

- Replica management
- Rolling updates
- Container configuration
- Resource requests
- Resource limits
- ConfigMap integration
- Secret integration
- Health probes

---

## Service

The Kubernetes Service provides stable internal networking for the application Pods.

```text
Ingress
   │
   ▼
Service
   │
   ├── Pod
   └── Pod
```

---

# 🔐 ConfigMap and Secret

## ConfigMap

Configuration that does not contain sensitive information is stored separately from the application container.

```text
Kubernetes ConfigMap
        │
        ▼
Application Deployment
```

## Secret

Sensitive configuration is represented using Kubernetes Secret resources.

```text
Kubernetes Secret
        │
        ▼
Application Pod
```

Sensitive values should not be committed as plaintext credentials.

---

# ❤️ Application Health Checks

The deployment uses Kubernetes health checks to improve application reliability.

## Liveness Probe

The liveness probe determines whether the application container is still functioning.

```text
Pod
 │
 ▼
Liveness Probe
 │
 ├── Healthy → Continue
 │
 └── Failed → Kubernetes restarts container
```

## Readiness Probe

The readiness probe determines whether the Pod is ready to receive traffic.

```text
Pod
 │
 ▼
Readiness Probe
 │
 ├── Ready → Receive traffic
 │
 └── Not Ready → Removed from service endpoints
```

---

# 📈 Horizontal Pod Autoscaler

HPA automatically adjusts the number of application replicas according to CPU utilization.

Current configuration:

```text
Minimum replicas: 2
Maximum replicas: 5
Target CPU: 70%
```

## Scaling model

```text
              CPU Utilization
                     │
             ┌───────┴───────┐
             │               │
           < 70%           > 70%
             │               │
             ▼               ▼
        Maintain/      Increase replicas
        reduce         up to maximum
```

The HPA was validated on both AWS EKS and Azure AKS.

---

# 🌐 NGINX Ingress

NGINX Ingress provides HTTP routing into the Kubernetes application.

```text
Internet
   │
   ▼
Cloud Load Balancer
   │
   ▼
NGINX Ingress Controller
   │
   ▼
Ingress Resource
   │
   ▼
Kubernetes Service
   │
   ▼
Application Pods
```

Application host:

```text
ecommerce.example.com
```

The host-based ingress configuration is deployed across the environments.

---

# 📦 Helm

Helm packages the Kubernetes application into a reusable chart.

Chart location:

```text
helm/ecommerce/
```

## Helm chart

```text
helm/ecommerce/
│
├── Chart.yaml
├── values.yaml
├── NOTES.txt
│
└── templates/
    ├── _helpers.tpl
    ├── configmap.yaml
    ├── deployment.yaml
    ├── hpa.yaml
    ├── ingress.yaml
    ├── secret.yaml
    └── service.yaml
```

## Helm responsibilities

The chart manages:

- Application Deployment
- Service
- Ingress
- HPA
- ConfigMap
- Secret
- Image configuration
- Replica configuration
- Environment-specific settings

---

# 🔄 GitHub Actions CI/CD

Workflow:

```text
Git Push
   │
   ▼
GitHub Actions
   │
   ├── Checkout source
   │
   ├── Validate application
   │
   ├── Build Docker image
   │
   ├── Security scan
   │
   └── Push container image
             │
             └── Amazon ECR
```

Workflow file:

```text
.github/workflows/ci-cd.yml
```

The pipeline automates container image creation and registry publishing.

---

# 🔐 Trivy Security Scanning

Trivy is used to scan container images for known vulnerabilities.

```text
Docker Build
     │
     ▼
Container Image
     │
     ▼
Trivy Scan
     │
     ├── Vulnerabilities found
     │
     └── Clean result
```

The hardened application image was scanned before deployment.

The validated application image version is:

```text
1.2.0
```

---

# ☁️ AWS Deployment

## AWS Region

```text
ap-south-1
```

## AWS Kubernetes Platform

```text
EKS Cluster:
multi-cloud-eks
```

The AWS environment includes:

- Amazon EKS
- Managed node group
- Kubernetes add-ons
- Amazon ECR
- NGINX Ingress
- Kubernetes application
- HPA

## AWS application flow

```text
Internet
   │
   ▼
AWS Load Balancer
   │
   ▼
NGINX Ingress
   │
   ▼
EKS Service
   │
   ▼
E-commerce Pods
```

The application endpoint was validated successfully with HTTP 200.

---

# ☁️ Azure Deployment

## Azure Region

```text
Central India
```

## Azure Kubernetes Platform

```text
AKS Cluster:
multi-cloud-aks
```

The Azure environment includes:

- Azure AKS
- Azure VNet
- Azure Container Registry
- NGINX Ingress
- Kubernetes application
- HPA
- ACR image pull configuration

## Azure application flow

```text
Internet
   │
   ▼
Azure Load Balancer
   │
   ▼
NGINX Ingress
   │
   ▼
AKS Service
   │
   ▼
E-commerce Pods
```

The Azure application endpoint was validated successfully with HTTP 200.

---

# 🗂️ GitOps Structure

The repository contains GitOps-oriented environment entry points:

```text
gitops/
│
├── README.md
│
├── aws/
│   └── kustomization.yaml
│
└── azure/
    └── kustomization.yaml
```

The GitOps directory connects each environment to its Kubernetes overlay.

```text
Git Repository
      │
      ▼
   GitOps
      │
 ┌────┴────┐
 ▼         ▼
AWS       Azure
 │         │
 ▼         ▼
Overlay   Overlay
 │         │
 ▼         ▼
EKS       AKS
```

> Note: This repository provides the GitOps/Kustomize structure. It does not claim that Argo CD is installed unless it is explicitly added later.

---

# 📊 Current Platform Status

| Component | Status |
|---|---|
| AWS EKS | ✅ Deployed |
| Azure AKS | ✅ Deployed |
| Terraform AWS | ✅ Applied |
| Terraform Azure | ✅ Applied |
| Kubernetes Base | ✅ Configured |
| AWS Overlay | ✅ Configured |
| Azure Overlay | ✅ Configured |
| Helm | ✅ Deployed |
| AWS ECR | ✅ Image 1.2.0 |
| Azure ACR | ✅ Image 1.2.0 |
| GitHub Actions | ✅ Working |
| Trivy | ✅ Security scan completed |
| HPA | ✅ 2–5 replicas / 70% CPU |
| NGINX Ingress | ✅ Configured |
| AWS Application | ✅ HTTP 200 validated |
| Azure Application | ✅ HTTP 200 validated |

---

# 🧪 Validation

The platform was validated at multiple layers.

## Infrastructure validation

```text
Terraform
   │
   ├── AWS infrastructure
   └── Azure infrastructure
```

## Kubernetes validation

```text
Nodes
Pods
Deployments
Services
Ingress
HPA
Helm
```

## Application validation

```text
AWS endpoint → HTTP 200
Azure endpoint → HTTP 200
```

## Security validation

```text
Docker Image
     │
     ▼
   Trivy
     │
     ▼
Security Scan
```

Detailed validation information:

```text
docs/validation.md
```

---

# 📸 Screenshots

Store project evidence under:

```text
docs/screenshots/
```

Recommended screenshots:

```text
docs/screenshots/
├── aws-eks-cluster.png
├── aws-nodes.png
├── azure-aks-cluster.png
├── azure-nodes.png
├── aws-application.png
├── azure-application.png
├── kubernetes-pods.png
├── kubernetes-services.png
├── ingress.png
├── hpa.png
├── helm.png
├── github-actions.png
├── trivy.png
├── amazon-ecr.png
└── azure-acr.png
```

Example:

```markdown
## AWS EKS

![AWS EKS](docs/screenshots/aws-eks-cluster.png)

## Azure AKS

![Azure AKS](docs/screenshots/azure-aks-cluster.png)

## Application

![Application](docs/screenshots/aws-application.png)

## HPA

![HPA](docs/screenshots/hpa.png)

## GitHub Actions

![GitHub Actions](docs/screenshots/github-actions.png)
```

---

# 🚀 Getting Started

## 1️⃣ Clone the Repository

```bash
git clone git@github.com:plsmailranjith1-awsdevops/multi-cloud-kubernetes-platform.git
cd multi-cloud-kubernetes-platform
```

---

## 2️⃣ Configure AWS Terraform

```bash
cd terraform/aws
terraform init
terraform validate
terraform plan
```

Apply only when the configuration and AWS credentials are ready:

```bash
terraform apply
```

---

## 3️⃣ Configure Azure Terraform

```bash
cd ../azure
terraform init
terraform validate
terraform plan
```

Apply only when the Azure subscription and authentication are configured:

```bash
terraform apply
```

---

## 4️⃣ Configure Kubernetes

Select the required cloud context and deploy the corresponding environment overlay.

AWS:

```text
kubernetes/overlays/aws/
```

Azure:

```text
kubernetes/overlays/azure/
```

---

## 5️⃣ Deploy Using Helm

Chart:

```text
helm/ecommerce/
```

The chart contains the application Deployment, Service, Ingress, HPA, ConfigMap and Secret templates.

---

## 6️⃣ Validate the Deployment

Check:

```text
Pods
Services
Ingress
HPA
Helm release
```

Then validate the application through the configured ingress endpoint.

---

# 🛠️ Troubleshooting

## Pod is not running

Check:

```bash
kubectl get pods -n ecommerce
kubectl describe pod <pod-name> -n ecommerce
```

---

## ImagePullBackOff

Check:

- Registry image exists
- Registry authentication
- Image name
- Image tag
- Kubernetes image pull secret

---

## Ingress is not working

Check:

```bash
kubectl get ingress -n ecommerce
kubectl get svc -n ingress-nginx
kubectl get pods -n ingress-nginx
```

---

## HPA is not scaling

Check:

```bash
kubectl get hpa -n ecommerce
kubectl top pods -n ecommerce
```

Verify that Kubernetes metrics are available.

---

## Helm deployment issue

Check:

```bash
helm list -n ecommerce
helm status ecommerce -n ecommerce
```

---

# 🔒 Security Considerations

This project includes several security controls:

- Trivy container vulnerability scanning
- Kubernetes Secrets
- IAM-based cloud access
- Azure RBAC
- Container image scanning before deployment
- Terraform-managed infrastructure
- `.gitignore` protection for sensitive Terraform state/plan files
- No cloud credentials committed to the repository

Never commit:

```text
AWS access keys
AWS secret keys
Azure credentials
Kubeconfig files
Terraform state containing sensitive data
Private keys
Registry passwords
```

---

# 📚 What This Project Demonstrates

This project demonstrates practical knowledge of:

### Cloud

- AWS
- Azure
- EKS
- AKS
- ECR
- ACR
- VPC
- VNet
- IAM/RBAC

### Infrastructure as Code

- Terraform
- Providers
- Variables
- Outputs
- State management
- Cloud infrastructure automation

### Containers

- Docker
- Dockerfile
- Container registries
- Image versioning
- Image security scanning

### Kubernetes

- Pods
- Deployments
- Services
- Namespaces
- ConfigMaps
- Secrets
- Ingress
- HPA
- Health probes

### Kubernetes Packaging

- Helm
- Kustomize
- Environment overlays

### DevOps

- Git
- GitHub
- GitHub Actions
- CI/CD
- Automated image builds
- Registry publishing

### Security

- Trivy
- IAM
- RBAC
- Secrets management
- Container security

---

# 🎯 Key Project Outcomes

- Built a Kubernetes platform spanning **AWS EKS and Azure AKS**.
- Provisioned cloud infrastructure using **Terraform**.
- Containerized the application using **Docker**.
- Published application images to **Amazon ECR and Azure ACR**.
- Deployed the application using **Kubernetes and Helm**.
- Created reusable Kubernetes base manifests and cloud-specific overlays.
- Configured **NGINX Ingress** for external application access.
- Implemented **HPA** with 2–5 replicas and 70% CPU target.
- Integrated **GitHub Actions** for CI automation.
- Integrated **Trivy** for container vulnerability scanning.
- Validated the application successfully on both cloud platforms.

---

# 📈 Future Enhancements

Potential future improvements include:

- Argo CD for full GitOps reconciliation
- Prometheus and Grafana integration
- Centralized logging
- Alertmanager
- AWS/Azure workload identity improvements
- Remote Terraform state backends
- Policy-as-code
- Additional security gates
- Blue/green deployment
- Canary deployment
- Automated disaster recovery testing

These are future enhancements and are not represented as completed features in the current implementation.

---

# 👨‍💻 Author

**Ranjithkumar**

Cloud & DevOps Engineer

GitHub:

```text
https://github.com/plsmailranjith1-awsdevops
```

---

# 📄 License

This project is maintained as a personal Cloud & DevOps portfolio project.

---

# ⭐ Project Summary

```text
Terraform
    ↓
AWS EKS + Azure AKS
    ↓
Docker Containers
    ↓
ECR + ACR
    ↓
Kubernetes
    ↓
Helm + Kustomize
    ↓
NGINX Ingress
    ↓
HPA
    ↓
GitHub Actions
    ↓
Trivy Security
    ↓
Validated Multi-Cloud Application
```

**☁️ Build Multi-Cloud. 📦 Containerize. ☸️ Orchestrate. 🔐 Secure. 🚀 Deploy.**
