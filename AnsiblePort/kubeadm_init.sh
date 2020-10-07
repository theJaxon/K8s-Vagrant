#!/bin/bash
kubeadm init --apiserver-advertise-address=172.42.42.100 --cert-dir=/etc/kubernetes/pki --pod-network-cidr=192.168.0.0/16 --kubernetes-version=stable-1.19 --ignore-preflight-errors=all 
