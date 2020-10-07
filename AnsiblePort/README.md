# AnsiblePort 
Deploy kubernetes cluster using vagrant with the help of ansible.

### :x: Issues:
1. After the initial configuration you have to do `systemctl restart network` on both `worker1` and `worker2` so that the InternalIP change, this is required because commands like `kubectl logs <pod-name>` fail without it, ansible can't restart the network successfully till now, i didn't figure a way out, although the handler triggers and it should restart, the IP doesn't change so it must be manually done.

2. There are 2 commented lines found in the Vagrantfile as follows:
```bash
worker.ssh.host = "172.42.42.10#{i}"
worker.ssh.port = 22
```
After the first vagrant up and the IP changes you won't be able to do vagrant ssh <machine-name> without uncommenting those lines first.

* A workaround is to directly use `ssh vagrant@ip-address -p 22` and enter `vagrant` as password

---

List of nodes:

| Machine Name |   IP address   |     FQDN    |
|:------------:|:--------------:|:-----------:|
|    master    | 192.168.50.210 |  master.com |
|   worker-1   | 192.168.50.211 | worker1.com |
|   worker-2   | 192.168.50.212 | worker2.com |

Accessing machines:
```bash
vagrant ssh master 
vagrant ssh worker-1
vagrant ssh worker-2
```

You can access any node from within the master machine using ssh 
```bash
[vagrant@master ~]$ ssh worker1
[vagrant@master ~]$ ssh worker2
```