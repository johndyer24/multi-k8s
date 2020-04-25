docker build -t johndyer24/multi-docker-client:latest -t johndyer24/multi-docker-client:$SHA -f ./client/Dockerfile ./client
docker build -t johndyer24/multi-docker-server:latest -t johndyer24/multi-docker-server:$SHA -f ./server/Dockerfile ./server
docker build -t johndyer24/multi-docker-worker:latest -t johndyer24/multi-docker-worker:$SHA -f ./worker/Dockerfile ./worker
docker push johndyer24/multi-docker-client:latest
docker push johndyer24/multi-docker-server:latest
docker push johndyer24/multi-docker-worker:latest
docker push johndyer24/multi-docker-client:$SHA
docker push johndyer24/multi-docker-server:$SHA
docker push johndyer24/multi-docker-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=johndyer24/multi-docker-server:$SHA
kubectl set image deployments/client-deployment client=johndyer24/multi-docker-client:$SHA
kubectl set image deployments/worker-deployment worker=johndyer24/multi-docker-worker:$SHA
