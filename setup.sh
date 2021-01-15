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

# < OPEN KUBERNETES DASHBOARD >
echo -e "${CYAN}Opening kubernetes web dashboard${NC}"

    minikube dashboard > /dev/null &
    eval $(minikube docker-env)

# < BUILD ALL DOCKER IMAGES >
echo -e "${CYAN}Building all docker images${NC}"

    docker build -t service_nginx ./srcs/nginx
    docker build -t service_ftps ./srcs/ftps
    docker build -t service_mysql ./srcs/mysql
    docker build -t service_phpmyadmin ./srcs/phpmyadmin
    docker build -t service_wordpress ./srcs/wordpress
    docker build -t service_grafana ./srcs/grafana
    docker build -t service_influxdb ./srcs/influxdb
    docker build -t service_telegraf ./srcs/telegraf
    
# < STARTING ALL MINIKUBE COMPONENTS >
echo -e "${CYAN}Creating all kubernetes clusters${NC}"

    kubectl apply -f ./srcs/nginx.yaml
    kubectl apply -f ./srcs/ftps.yaml
    kubectl apply -f ./srcs/mysql.yaml
    kubectl apply -f ./srcs/phpmyadmin.yaml
    kubectl apply -f ./srcs/wordpress.yaml
    kubectl apply -f ./srcs/grafana.yaml
    kubectl apply -f ./srcs/influxdb.yaml
    kubectl apply -f ./srcs/telegraf.yaml


sleep 10
POD_NAME=`kubectl get pods | awk '/mysql/ {print $1}'`
while [ "Running" != "$(kubectl get pods | awk '/mysql/ {print $3}')" ]; do
	echo MySQL pod not ready
    sleep 2
done
echo $POD_NAME
kubectl exec -it $POD_NAME -- mariadb < srcs/mysql/srcs/data.sql
kubectl exec -it $POD_NAME -- mariadb < srcs/mysql/srcs/wordpress.sql
