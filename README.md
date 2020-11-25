# K8s-Vagrant

![Kubeadm](https://img.shields.io/badge/-Kubeadm-326CE5?style=for-the-badge&logo=Kubernetes&logoColor=white)
![Vagrant](https://img.shields.io/badge/-Vagrant-1563FF?style=for-the-badge&logo=Vagrant&logoColor=white)
![CentOS](https://img.shields.io/badge/-CentOS-262577?style=for-the-badge&logo=CentOS&logoColor=white)
![Ansible](https://img.shields.io/badge/-ansible-C9284D?style=for-the-badge&logo=ansible&logoColor=white)

Deploy kubernetes cluster using Kubeadm + Vagrant Multi-machine.

---

* The stable and recommended setup is in the directory **centos-7**
* By default the setup uses 3 machines as follows:

|  Machine |    Address    |         FQDN         |
|:--------:|:-------------:|:--------------------:|
|  kmaster | 172.42.42.100 |  kmaster.example.com |
| kworker1 | 172.42.42.101 | kworker1.example.com |
| kworker2 | 172.42.42.102 | kworker2.example.com |

---

#### CentOS-8 [WIP]:

* The script was modified to support `bento/centos-8` image instead of centos-7
* Added `metrics-server` with the [fix](https://github.com/kubernetes-sigs/metrics-server/issues/278) to support CentOS 8
* AnsiblePort directory contains the same setup but using ansible.

---

- Credit goes to `exxactcorp` and their tutorial [Building Kubernetes cluster using vagrant](https://blog.exxactcorp.com/building-a-kubernetes-cluster-using-vagrant/)

- The source of the files can be found at [bitbucket](https://bitbucket.org/exxsyseng/k8s_centos/src/master/vagrant-provisioning/)
