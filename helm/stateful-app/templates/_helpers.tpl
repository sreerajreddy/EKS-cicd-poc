{{- define "stateful-app.name" -}}
stateful-app
{{- end }}

{{- define "stateful-app.fullname" -}}
stateful-app
{{- end }}

{{- define "stateful-app.serviceAccountName" -}}
{{ .Values.serviceAccount.name }}
{{- end }}
