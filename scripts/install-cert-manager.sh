#!/bin/bash
set -e -o pipefail
cd "$(dirname "$0")"

source ../context.conf

# Load local cluster
kubectl config use-context $CONTEXT

# Create namespaces
kubectl create namespace cert-manager

# Install / update helm chart dependencies
helm repo add jetstack https://charts.jetstack.io
helm repo update jetstack

helm install cert-manager jetstack/cert-manager -n cert-manager --wait \
  --version 1.11.1 \
  --set installCRDs=true
