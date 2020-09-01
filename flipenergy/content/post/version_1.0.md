---
title: "Homelab Version V1.0"
date: 2020-08-31T00:12:51-07:00
draft: false
---

I got my hands on a old Raspberry Pi and decided that will have the sole purpose of running Pi-hole since I didn't know what else to use it for.

As for Kubernetes, I wanted a *cluster*, which is why I had a 2 computers runing MicroK8s that served as two K8s nodes. However, I realized that my ISP's gateway didn't jive with [MetalLB](https://metallb.universe.tf/).

I wanted to set a different IP for each of my services so I can map custom DNS to each website that I serve. This is why I chose to use MetalLB, but my ISP's gateway sometimes incorrectly maps the service IP to the wrong MAC address. When this happens, any incomming traffic could be sent to a machine that isn't listening for that traffic. So as soon as I wanted to host a website, I knew this setup wouldn't work. Thus, the need to change my setup a bit.

![Version 1.0 Diagram](homelab.png)
