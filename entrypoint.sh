#!/bin/sh

# helm upgrade --values values.yaml --set $set_overrides \
#      $INPUT_NAME $INPUT_CHART_NAME
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
printf ${KUBECONFIG_FILE} > /root/kubeconfig.yaml
export KUBECONFIG=/root/kubeconfig.yaml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install --namespace ${INPUT_NAMESPACE} ${INPUT_RELEASE} ${INPUT_CHART}