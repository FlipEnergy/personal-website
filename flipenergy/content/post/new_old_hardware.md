---
title: "New (Old) Hardware + HA K3s + Prometheus"
date: 2021-07-20T18:12:59-07:00
draft: false
---

![The Homelab in all its glory](lab.jpg)
*The MacBook is for work. I just SSH into it.*

Despite having no need for extra computing power, and despite only wanting to buy one extra computer... I ended up with two. To be fair, it was very inexpensive for the both of them and now with 3 roughly equivalent machines, I was finally able to have an HA K3s cluster. Each node is also a Kubernetes control-plane so I can cordon and drain a node to upgrade or whatever without disrupting service! All traffic to the k8s cluster is now load balanced by my rock64 load balancer.

Next thing I want to do is to setup keep-alive and Nginx on another rock64 of mine so I have auto-failover between two load balancers. This would eliminate another single point of failure server-wise. I may eventually have to Pi-Hole setups too but that's been quite solid and doesn't bring down the network when down.

I also setup Prometheus and some scrapers so I can get k8s metrics and so far it's been quite helpful since I can now tell which of my pods are taking up the most resources at a glance.

![Snippet of the Resources Dashboard](resources.png)
![Snippet of the Kubelet Dashboard](kubelet.png)
![Snippet of the Network Dashboard](network.png)
