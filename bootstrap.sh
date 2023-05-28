#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.42.42.100 kmaster.example.com kmaster
172.42.42.101 kworker1.example.com kworker1
172.42.42.102 kworker2.example.com kworker2
EOF


# Change the mirrors to vault.centos.org
echo "[TASK 2] Change the mirrors to vault.centos.org"
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y

# Install docker from Docker-ce repository
echo "[TASK 3] Install docker container engine"
yum install -y -q yum-utils device-mapper-persistent-data lvm2 > /dev/null 2>&1
wget https://raw.githubusercontent.com/theJaxon/K8s-Vagrant/master/repo/docker-ce.repo -P /etc/yum.repos.d/
yum repolist
yum install -y -q docker-ce >/dev/null 2>&1

# Enable docker service
echo "[TASK 4] Enable and start docker service"
systemctl enable --now docker >/dev/null 2>&1

# Disable SELinux
echo "[TASK 5] Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Stop and disable firewalld
echo "[TASK 6] Stop and Disable firewalld"
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld

# Add sysctl settings
echo "[TASK 7] Add sysctl settings"
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system >/dev/null 2>&1

# Disable swap
echo "[TASK 8] Disable and turn off SWAP"
sed -i '/swap/d' /etc/fstab
swapoff -a

# Add yum repo file for Kubernetes
echo "[TASK 9] Add yum repo file for kubernetes"
wget https://raw.githubusercontent.com/theJaxon/K8s-Vagrant/master/repo/kubernetes.repo -P /etc/yum.repos.d/

# Install Kubernetes
echo "[TASK 10] Install Kubernetes (kubeadm, kubelet and kubectl)"
yum install -y -q kubeadm kubelet kubectl --disableexcludes=kubernetes

# Start and Enable kubelet service
echo "[TASK 11] Enable and start kubelet service"
systemctl enable --now kubelet

# Enable ssh password authentication
echo "[TASK 12] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "[TASK 13] Set root password"
echo "kubeadmin" | passwd --stdin root >/dev/null 2>&1

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc
