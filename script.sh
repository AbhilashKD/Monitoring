#!/bin/bash

mkdir -p prometheus
mkdir -p alertmanager
mkdir -p grafana/provisioning

docker-compose up -d
