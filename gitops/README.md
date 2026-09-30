# GitOps

This directory contains environment-specific Kubernetes deployment entry points.

- `aws/` — AWS EKS deployment configuration
- `azure/` — Azure AKS deployment configuration
- Both environments use the shared Kubernetes base manifests and cloud-specific overlays.
