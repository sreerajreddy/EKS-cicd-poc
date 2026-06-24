#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-configs/dev.env}"
IMAGE_TAG="${2:-latest}"

source "$ENV_FILE"

IMAGE_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_STATELESS}:${IMAGE_TAG}"

aws eks update-kubeconfig \
  --region "$AWS_REGION" \
  --name "$CLUSTER_NAME"

kubectl create namespace "$K8S_NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -

sed "s|IMAGE_PLACEHOLDER|${IMAGE_URI}|g" k8s/stateless-app/deployment.yaml | kubectl apply -f -
kubectl apply -f k8s/stateless-app/service.yaml -n "$K8S_NAMESPACE"

kubectl rollout status deployment/stateless-app -n "$K8S_NAMESPACE"
