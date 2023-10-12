#!/bin/bash
export OCI_REGION="CHANGE ME!!"
export OCI_COMPARTMENT_ID="CHANGE ME!!"
export OCI_MANAGED_NODE_IMAGE_ID="CHANGE ME!!"
export OCI_OCNE_IMAGE="CHANGE ME!!"
export OCI_SSH_KEY="CHANGE ME!!"
export OCI_REGION_B64="$(echo -n "$OCI_REGION" | base64 | tr -d '\n')"
export USE_INSTANCE_PRINCIPAL="true"
export USE_INSTANCE_PRINCIPAL_B64="$(echo -n "$USE_INSTANCE_PRINCIPAL" | base64 | tr -d '\n')"
export KUBERNETES_VERSION=v1.26.6
export OKE_VERSION=v1.27.2
export NODE_MACHINE_COUNT=1
export EXP_MACHINE_POOL=true
export EXP_CLUSTER_RESOURCE_SET=true
export EXP_OKE=true
