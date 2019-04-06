# Build images
docker build -t deiveris/multi-client:latest -t deiveris/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t deiveris/multi-server:latest -t deiveris/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t deiveris/multi-worker:latest -t deiveris/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Push to Docker Hub

docker push deiveris/multi-client:latest
docker push deiveris/multi-server:latest
docker push deiveris/multi-worker:latest

docker push deiveris/multi-client:$SHA
docker push deiveris/multi-server:$SHA
docker push deiveris/multi-worker:$SHA

# Apply configrations
kubectl apply -f k8s

# Imperatively set latest images on each deployment
kubectl set image deployments/server-deployment server=deiveris/multi-server:$SHA
kubectl set image deployments/client-deployment client=deiveris/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=deiveris/multi-worker:$SHA