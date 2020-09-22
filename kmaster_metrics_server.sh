#!/bin/bash
yum install -y vim

# -nc is --no-clobber shorthand that skips downloading the file if it already exists in the current dir
wget -nc  https://raw.githubusercontent.com/theJaxon/K8s-Vagrant/master/metrics-server/components.yaml -P /home/vagrant/

# Switch to vagrant user
su - vagrant <<'EOF'
    kubectl apply -f /home/vagrant/components.yaml
EOF