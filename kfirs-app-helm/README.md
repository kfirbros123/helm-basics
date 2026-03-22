# kfirs-app-helm

This folder is a Helm chart.

Raw Kubernetes YAMLs are kept in `k8s/` for reference.

## Install

1. Create the Secret (recommended; keep `secrets.create=false`):

```bash
kubectl create secret generic kfirs-app-secrets \
  --from-literal=POSTGRES_PASSWORD='CHANGE_ME' \
  --from-literal=APP_PASSWORD_HASH='scrypt:...$...$...' \
  --from-literal=FLASK_SECRET_KEY='CHANGE_ME'
```

2. Install:

```bash
helm install kfirs-app .
```

3. Local access:

```bash
kubectl port-forward svc/kfirs-app-kfirs-app-app 8080:8080
```
