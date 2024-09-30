#!/bin/bash

# Create cluster
kind create cluster --config .devcontainer/kind-cluster.yml --wait 300s

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Install MariaDB
helm install unguard-mariadb bitnami/mariadb --version 11.5.7 --set primary.persistence.enabled=false --wait --namespace unguard --create-namespace

# Install Unguard
helm install unguard  oci://ghcr.io/dynatrace-oss/unguard/chart/unguard --wait --namespace unguard --create-namespace

# TODO: Install OneAgent