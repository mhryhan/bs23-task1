#!/bin/bash

cd app1/src
docker build . -f ../build/Dockerfile -t mhryhan/app1

cd app2/src
docker build . -f ../build/Dockerfile -t mhryhan/app2

cd ..

docker login
docker push mhryhan/app1
docker push mhryhan/app2

kind create cluster --config kind.yaml

kubectl apply -f app1/deploy
kubectl apply -f app2/deploy
kubectl apply -f nginx/deploy
