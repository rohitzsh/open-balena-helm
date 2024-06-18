#!/bin/bash
set -e -o pipefail
cd "$(dirname "$0")"

source ../context.conf

# Load local cluster
kubectl config use-context $CONTEXT

# Uninstall cert-manager
helm uninstall cert-manager -n cert-manager --wait