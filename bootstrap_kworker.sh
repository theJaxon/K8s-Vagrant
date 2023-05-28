#!/bin/bash


# Install sshpass
echo "[TASK 1] Install sshpass"
dnf groupinstall "Development Tools"
dnf install gcc libssh2-devel
wget http://sourceforge.net/projects/sshpass/files/latest/download/sshpass-1.08.tar.gz
tar -xf sshpass-1.08.tar.gz
cd sshpass-1.10
./configure
make
make install


# Join worker nodes to the Kubernetes cluster
echo "[TASK w] Join node to Kubernetes Cluster" 
sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kmaster.example.com:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1
