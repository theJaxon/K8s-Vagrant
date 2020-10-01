# AnsiblePort 
Deploy kubernetes cluster using vagrant with the help of ansible.

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