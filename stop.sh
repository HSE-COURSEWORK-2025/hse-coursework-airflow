#!/usr/bin/env bash

NAMESPACE=hse-coursework-health
RELEASE=airflow

echo "Удаление Helm-релиза..."
helm delete "$RELEASE" --namespace "$NAMESPACE" || true

echo "Удаление связанных PersistentVolumeClaims (PVC)..."
kubectl delete pvc -n "$NAMESPACE" -l release="$RELEASE" \
  --grace-period=0 --force --wait=false || true

echo "Удаление секретов, configmaps, serviceaccounts Airflow..."
kubectl delete secret,configmap,serviceaccount --namespace "$NAMESPACE" --selector "release=$RELEASE" || true

echo "Удаление манифестов..."
kubectl delete -f deploy/secret.yaml --namespace "$NAMESPACE" || true
kubectl delete -f deploy/values.yaml --namespace "$NAMESPACE" || true

echo "Удаление всех подов, имя которых начинается с \"airflow-\"..."
kubectl get pods -n "$NAMESPACE" -o name \
  | grep '^pod/airflow-' \
  | xargs -r kubectl delete -n "$NAMESPACE" --force --grace-period=0 --wait=false || true

echo "Очистка завершена."
