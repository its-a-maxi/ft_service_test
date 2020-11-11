minikube --vm-driver=hyperkit start --extra-config=apiserver.service-node-port-range=1-35000
#minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube dashboard &
eval $(minikube docker-env)
docker build -t service_nginx ./srcs/nginx
kubectl create -f ./srcs/