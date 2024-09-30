#!/bin/bash

#############################################################################
# Build URL from parts
full_apps_url="https://${DT_ENV_ID_OBSLAB_SQL_INJECTION_DETECTION}"
full_gen2_url=""

if [ "${DT_ENVIRONMENT_OBSLAB_SQL_INJECTION_DETECTION}" = "dev" ]; then
  echo "environment is dev"
  full_apps_url+=".dev.apps.dynatracelabs.com"
  # Remove apps.
  full_gen2_url=${full_apps_url/apps.}
elif [ "${DT_ENVIRONMENT_OBSLAB_SQL_INJECTION_DETECTION}" = "sprint" ]; then
  echo "environment is sprint"
  full_apps_url+=".sprint.apps.dynatracelabs.com"
  # Remove apps.
  full_gen2_url=${full_apps_url/apps.}
else
  echo "DT_ENVIRONMENT_OBSLAB_SQL_INJECTION_DETECTION is either 'live' or some other value. Defaulting to live"
  full_apps_url+=".apps.dynatrace.com"
  full_gen2_url=${full_apps_url/.apps./.live.}
fi

#############################################################################
# Create cluster
kind create cluster --config .devcontainer/kind-cluster.yml --wait 300s

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

#############################################################################
# Install OneAgent
# Replace placeholders for dynakube
sed -i "s@ENVIRONMENT_URL_PLACEHOLDER@$full_gen2_url@g" dynakube.yaml

kubectl create namespace dynatrace
kubectl -n dynatrace create secret generic unguard --from-literal=apiToken=$DT_API_TOKEN_OBSLAB_SQL_INJECTION_DETECTION --from-literal=dataIngestToken=$DT_API_TOKEN_OBSLAB_SQL_INJECTION_DETECTION
helm install dynatrace-operator oci://public.ecr.aws/dynatrace/dynatrace-operator --namespace dynatrace --atomic --values values.yaml
kubectl apply -f dynakube.yaml

#############################################################################
# Install MariaDB
helm install unguard-mariadb bitnami/mariadb --version 11.5.7 --set primary.persistence.enabled=false --wait --namespace unguard --create-namespace

#############################################################################
# Install Unguard
helm install unguard  oci://ghcr.io/dynatrace-oss/unguard/chart/unguard --wait --namespace unguard --create-namespace