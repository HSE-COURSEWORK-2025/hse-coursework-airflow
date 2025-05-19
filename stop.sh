#!/usr/bin/env bash

helm delete airflow --namespace hse-coursework-health
kubectl delete -f deploy/secret.yaml --namespace hse-coursework-health
kubectl delete -f deploy/values.yaml --namespace hse-coursework-health
