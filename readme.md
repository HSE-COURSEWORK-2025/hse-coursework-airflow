# HSE Coursework: Apache Airflow в Kubernetes

Этот репозиторий содержит Helm-чарт и скрипты для деплоя Apache Airflow в Kubernetes-кластере.

![](https://github.com/HSE-COURSEWORK-2025/hse-coursework-airflow/blob/master/airflow_demo.jpg)

## Структура
- `deploy/values.yaml` — основные настройки Helm-чарта Airflow
- `deploy/secret.yaml` — секреты для Airflow (добавьте свои пароли/ключи)
- `deploy.sh` — автоматический деплой Airflow и зависимостей
- `stop.sh` — удаление всех ресурсов Airflow из кластера

## Быстрый старт
1. Запустите деплой:
   ```bash
   ./deploy.sh
   ```
2. Для удаления:
   ```bash
   ./stop.sh
   ```
