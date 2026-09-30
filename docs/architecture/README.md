# Multi-Cloud Kubernetes Architecture

## Platform

GitHub
  |
  +-- GitHub Actions
  |
  +-- Terraform
        |
        +-- AWS VPC + EKS
        |
        +-- Azure VNet + AKS

## Application

Ecommerce Application
  |
  +-- Docker
  |
  +-- AWS ECR / Azure ACR
  |
  +-- Helm
  |
  +-- Kubernetes
        |
        +-- AWS EKS
        |
        +-- Azure AKS

## GitOps

gitops/
  +-- aws/
  +-- azure/

Both environments use shared Kubernetes base manifests with cloud-specific overlays.
