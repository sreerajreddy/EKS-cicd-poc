apiVersion: apps/v1
kind: Deployment
metadata:
  name: stateless-app
  namespace: {{ .Release.Namespace }}
  labels:
    app: stateless-app
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: stateless-app
  template:
    metadata:
      labels:
        app: stateless-app
    spec:
      serviceAccountName: {{ .Values.serviceAccount.name }}
      containers:
        - name: stateless-app
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - containerPort: {{ .Values.app.port }}
              name: http
          readinessProbe:
            httpGet:
              path: /health
              port: {{ .Values.app.port }}
            initialDelaySeconds: 5
            periodSeconds: 10
          livenessProbe:
            httpGet:
              path: /health
              port: {{ .Values.app.port }}
            initialDelaySeconds: 10
            periodSeconds: 20
          resources:
{{ toYaml .Values.resources | indent 12 }}
