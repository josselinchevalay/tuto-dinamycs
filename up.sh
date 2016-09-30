#!/bin/bash
docker build -t tuto-node ./project/ && \
docker build -t tuto-lb   ./lb/ && \
cd ./terraform/ && \
terraform apply && \
cd ..
