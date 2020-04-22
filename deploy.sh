docker build -t johndyer24/multi-docker-client -f ./client/Dockerfile ./client
docker build -t johndyer24/multi-docker-server -f ./server/Dockerfile ./server
docker build -t johndyer24/multi-docker-worker -f ./worker/Dockerfile ./worker
docker push johndyer24/multi-docker-client
docker push johndyer24/multi-docker-server
docker push johndyer24/multi-docker-worker
kubectl apply -f k8s
