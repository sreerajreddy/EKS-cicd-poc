#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-configs/dev.env}"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Environment file not found: $ENV_FILE"
  exit 1
fi

source "$ENV_FILE"

echo "Using environment: $ENVIRONMENT"
echo "Cluster: $CLUSTER_NAME"
echo "Region: $AWS_REGION"

aws eks update-kubeconfig \
  --region "$AWS_REGION" \
  --name "$CLUSTER_NAME"

kubectl create namespace "$MONITORING_NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts || true
helm repo update

helm upgrade --install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --namespace "$MONITORING_NAMESPACE" \
  --create-namespace \
  -f monitoring/kube-prometheus-values.yaml

kubectl apply -f monitoring/stateless-app-servicemonitor.yaml
kubectl apply -f monitoring/stateful-app-servicemonitor.yaml

kubectl get pods -n "$MONITORING_NAMESPACE"
