KUBE_VERSION=v1.15.0
DASHDOARD_VERSION=v1.10.1
registry=mirrorgooglecontainers
images=(
        kube-apiserver-amd64:${KUBE_VERSION}
kube-controller-manager-amd64:${KUBE_VERSION}
kube-scheduler-amd64:${KUBE_VERSION}
kube-proxy-amd64:${KUBE_VERSION}
pause:3.1
etcd-amd64:3.3.10
coredns:1.3.1
 	kubernetes-dashboard-amd64:${DASHDOARD_VERSION}
        )
docker pull quay.io/coreos/flannel:v0.11.0-amd64
for image in ${images[@]}
do
docker pull ${registry}/${image}
docker tag ${registry}/${image} k8s.gcr.io/${image}
docker rmi ${registry}/${image}
done
