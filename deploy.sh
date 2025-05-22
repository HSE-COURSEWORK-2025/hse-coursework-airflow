#!/usr/bin/env bash

helm delete airflow --namespace hse-coursework-health
kubectl delete -f deploy/secret.yaml --namespace hse-coursework-health
kubectl delete -f deploy/values.yaml --namespace hse-coursework-health

kubectl create namespace hse-coursework-health

helm repo add apache-airflow https://airflow.apache.org

helm repo update

helm install airflow apache-airflow/airflow --namespace hse-coursework-health --debug --timeout 10m01s

kubectl apply -f deploy/secret.yaml --namespace hse-coursework-health
kubectl apply -f deploy/values.yaml --namespace hse-coursework-health


helm upgrade --install airflow apache-airflow/airflow -n hse-coursework-health -f deploy/values.yaml --debug --timeout 10m02s

echo "🎉 Скрипт завершён"
