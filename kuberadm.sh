KUBE_VERSION=v1.14.1
DASHDOARD_VERSION=v1.10.1
username=mirrorgooglecontainers
images=(
        kube-apiserver:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-proxy:${KUBE_VERSION}
pause:3.1
etcd:3.3.10
 	kubernetes-dashboard-amd64:${DASHDOARD_VERSION}
        )
docker pull quay.io/coreos/flannel:v0.11.0-amd64
docker pull coredns/coredns
docker tag coredns/coredns k8s.gcr.io/coredns:1.3.1
docker rmi coredns/coredns
for image in ${images[@]}
do
docker pull ${username}/${image}
docker tag ${username}/${image} k8s.gcr.io/${image}
docker rmi ${username}/${image}
done

EOF