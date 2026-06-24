# Monitoring Setup

This POC uses Prometheus and Grafana for Kubernetes and application monitoring.

## Components
- Prometheus
- Grafana
- Alertmanager
- kube-state-metrics
- node-exporter

## Installation
```bash
kubectl create namespace monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm upgrade --install kube-prom-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  -f monitoring/kube-prometheus-values.yaml
