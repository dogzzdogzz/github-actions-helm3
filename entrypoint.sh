#!/bin/sh

set -e
# helm upgrade --values values.yaml --set $set_overrides \
#      $INPUT_NAME $INPUT_CHART_NAME
echo "${KUBECONFIG_FILE}" > /root/kubeconfig.yaml
export KUBECONFIG=/root/kubeconfig.yaml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
VALUES_TEMPLATE="${INPUT_CHART}/values.yaml"
if [ "${INPUT_ENV_FILES}" != "" ]; then
    VALUES_TEMPLATE="${VALUES_TEMPLATE} ${INPUT_ENV_FILES}"
fi
ls -l ${GITHUB_WORKSPACE}/${INPUT_CHART}/
echo ${VALUES_TEMPLATE} | xargs printf -- "-f ${GITHUB_WORKSPACE}/%s\n" | xargs helm upgrade ${INPUT_RELEASE} ${GITHUB_WORKSPACE}/${INPUT_CHART} -i --namespace ${INPUT_NAMESPACE}
