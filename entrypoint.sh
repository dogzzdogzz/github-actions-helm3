#!/bin/sh

# helm upgrade --values values.yaml --set $set_overrides \
#      $INPUT_NAME $INPUT_CHART_NAME
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
printf ${KUBECONFIG_FILE} > /.kube/config.yaml
export KUBECONFIG=/.kube/config.yaml
helm install --namespace ${INPUT_NAMESPACE} ${INPUT_RELEASE} ${INPUT_CHART}