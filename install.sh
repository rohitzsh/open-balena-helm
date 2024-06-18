#!/bin/bash
set -e -o pipefail
cd "$(dirname "$0")"

if [ ! -f "./context.conf" ]; then
    echo "context.conf not found"
    echo "please add your context to $PWD/context.conf"
    echo "CONTEXT=<your context name>" >>./context.conf
    exit 1
fi

./scripts/install-cert-manager.sh
./scripts/install-openbalena.sh regenerate-config
