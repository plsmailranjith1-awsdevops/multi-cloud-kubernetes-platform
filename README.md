# Multi-Cloud Kubernetes Platform

## Project Summary

A production-style multi-cloud Kubernetes platform running workloads across AWS EKS and Azure AKS.

### Key Technologies

- AWS EKS
- Azure AKS
- Terraform
- Kubernetes
- Helm
- NGINX Ingress
- HPA
- Git/GitHub

### Deployment

The ecommerce application is deployed using the same Helm chart across both AWS EKS and Azure AKS.

Architecture documentation: `docs/architecture/README.md`

## Current Platform Status

- AWS EKS: deployed and running
- Azure AKS: deployed and running
- Terraform: AWS and Azure infrastructure managed
- Kubernetes: base manifests and cloud overlays
- Helm: ecommerce application deployment
- AWS ECR: application image 1.2.0
- Azure ACR: application image 1.2.0
- GitHub Actions: Docker build and AWS ECR push
- Trivy: container vulnerability scan completed
- HPA: CPU-based autoscaling configured from 2 to 5 replicas
- NGINX Ingress: configured for ecommerce
