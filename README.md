# BS23 Task 1

## Steps

```bash
mkdir -p app{1..2}/{build,deploy,src} nginx/deploy infra/config

cd app1/src
composer create-project laravel/laravel .
# modify route, dockerfile and manifests
docker build . -f ../build/Dockerfile -t mhryhan/app1

cd ..

cd app1/src
composer create-project laravel/laravel .
# modify route, dockerfile and manifests
docker build . -f ../build/Dockerfile -t mhryhan/app2

cd ..

cd infra/config
# create kind config
kind create cluster --config kind.yaml

cd ..

cd nginx/deploy
# create vhost config

cd ..

# push images to registry
docker login
docker push mhryhan/app1
docker push mhryhan/app2

# apply manifests
kubectl apply -f app1/deploy
kubectl apply -f app2/deploy
kubectl apply -f nginx/deploy
```
