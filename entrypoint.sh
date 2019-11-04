#!/bin/sh

# helm upgrade --values values.yaml --set $set_overrides \
#      $INPUT_NAME $INPUT_CHART_NAME
echo "${KUBECONFIG_FILE}" > /root/kubeconfig.yaml
export KUBECONFIG=/root/kubeconfig.yaml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install --namespace ${INPUT_NAMESPACE} ${INPUT_RELEASE} ${INPUT_CHART} 