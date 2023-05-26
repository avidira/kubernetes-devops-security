#!/bin/bash

echo ".........----------------#################._.-.-INSTALL-.-._.#################----------------........."
PS1='\[\e[01;36m\]\u\[\e[01;37m\]@\[\e[01;33m\]\H\[\e[01;37m\]:\[\e[01;32m\]\w\[\e[01;37m\]\$\[\033[0;37m\] '
echo "PS1='\[\e[01;36m\]\u\[\e[01;37m\]@\[\e[01;33m\]\H\[\e[01;37m\]:\[\e[01;32m\]\w\[\e[01;37m\]\$\[\033[0;37m\] '" >> ~/.bashrc
sed -i '1s/^/force_color_prompt=yes\n/' ~/.bashrc
source ~/.bashrc

sudo apt-get autoremove -y  #removes the packages that are no longer needed
sudo apt-get update
sudo systemctl daemon-reload

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# KUBE_VERSION=1.27.0
# sudo apt-get update
# sudo apt-get install -y docker.io vim build-essential jq python3-pip kubelet=${KUBE_VERSION}-00 kubectl=${KUBE_VERSION}-00 kubernetes-cni=1.0.0-00 kubeadm=${KUBE_VERSION}-00
# sudo pip3 install jc

### UUID of VM 
### comment below line if this Script is not executed on Cloud based VMs
# sudo jc dmidecode | sudo jq .[1].values.uuid -r

# sudo cat > /etc/docker/daemon.json <<EOF
# {
#   "exec-opts": ["native.cgroupdriver=systemd"],
#   "log-driver": "json-file",
#   "storage-driver": "overlay2"
# }
# EOF
# sudo mkdir -p /etc/systemd/system/docker.service.d

# sudo stemctl daemon-reload
# sudo systemctl restart docker
# sudo systemctl enable docker
# sudo systemctl enable kubelet
# sudo systemctl start kubelet

# echo ".........----------------#################._.-.-KUBERNETES-.-._.#################----------------........."
# sudo rm /root/.kube/config
# sudo kubeadm reset -f

# uncomment below line if your host doesnt have minimum requirement of 2 CPU
# kubeadm init --kubernetes-version=${KUBE_VERSION} --ignore-preflight-errors=NumCPU --skip-token-print
# sudo kubeadm init --kubernetes-version=${KUBE_VERSION} --skip-token-print

# mkdir -p ~/.kube
# sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config

# kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# sleep 60

# echo "untaint controlplane node"
# sudo kubectl taint node $(kubectl get nodes -o=jsonpath='{.items[].metadata.name}') node.kubernetes.io/not-ready:NoSchedule-
# sudo kubectl taint node $(kubectl get nodes -o=jsonpath='{.items[].metadata.name}') node-role.kubernetes.io/master:NoSchedule-
# sudo kubectl get node -o wide

# sudo usermod -a -G docker jenkins

echo ".........----------------#################._.-.-COMPLETED-.-._.#################----------------........."
