# < AESTHETHICS >
    CYAN='\x1b[36m'
    NC='\x1b[0m'

# < START MINIKUBE >
    minikube start --vm-driver=virtualbox


# < INSTALL METALLB >
# https://metallb.universe.tf/installation/
echo -e "${CYAN}Installing MetalLB${NC}"

    # see what changes would be made, returns nonzero returncode if different
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/strictARP: false/strictARP: true/" | \
    kubectl diff -f - -n kube-system > /dev/null
    # actually apply the changes, returns nonzero returncode on errors only
    kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/strictARP: false/strictARP: true/" | \
    kubectl apply -f - -n kube-system > /dev/null
    # Apply the manifest
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null
    # On first install only
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
    # Apply configuration to metalLB (https://metallb.universe.tf/configuration/)
    kubectl apply -f srcs/metalLB.yaml > /dev/null

# < DELETE OLD MINIKUBE COMPONENTS >
echo -e "${CYAN}Deleting old minikube components${NC}"

    kubectl delete deployments --all > /dev/null 
    kubectl delete svc --all > /dev/null
    kubectl delete pvc --all > /dev/null
    kubectl delete pv --all > /dev/null

minikube dashboard &
eval $(minikube docker-env)
docker build -t service_nginx ./srcs/nginx
kubectl create -f ./srcs/