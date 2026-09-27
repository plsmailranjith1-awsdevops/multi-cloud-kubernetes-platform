# Multi-Cloud Kubernetes Platform Architecture

## Overview

This project provides a Kubernetes platform deployed across AWS EKS and Azure AKS.

## Architecture

- AWS VPC → Amazon EKS → Kubernetes workloads
- Azure VNet → Azure AKS → Kubernetes workloads
- Terraform manages cloud infrastructure
- Kubernetes manages workloads
- Helm packages and deploys the ecommerce application
- NGINX Ingress provides HTTP access
- HPA is configured for application scaling

## Deployment Model

The same ecommerce Helm chart is deployed independently to both AWS EKS and Azure AKS.

## Cloud Components

### AWS
- VPC
- Public and private subnets
- NAT Gateway
- Amazon EKS
- Managed node group
- EKS managed addons

### Azure
- Resource Group
- Virtual Network
- AKS subnet
- Azure Kubernetes Service
- System node pool
- NGINX Ingress LoadBalancer

## Kubernetes Components

- Namespace
- Deployment
- Service
- ConfigMap
- Secret
- Horizontal Pod Autoscaler
- Ingress

## Infrastructure as Code

Terraform directories:

- `terraform/aws`
- `terraform/azure`

Application deployment:

- `helm/ecommerce`

Kubernetes configuration:

- `kubernetes/base`
- `kubernetes/overlays/aws`
- `kubernetes/overlays/azure`
