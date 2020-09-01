---
title: "V2.0 - Need a separate LB"
date: 2020-08-31T18:51:39-07:00
draft: false
---

With version 2.0, my homelab actually will have a load balancer in front of the K8s cluster. In a public cloud environment, the cloud provider would be the ones to provide this. In my case, since load balancing is a pretty light task, I'm using my lower power surface to do the job. I chose HAproxy because I liked it's simple config file syntax.

Since there was a lot of headroom to run other stuff on my surface in addition to HAproxy, I decided to setup DNS over TLS for my Pi-hole. I decided to use [DNSCrypt proxy](https://github.com/DNSCrypt/dnscrypt-proxy) for this, and updated my Pi-hole to use this as its upstream DNS.

In my K8s at this time, I am running OpenVPN, my website and Folding at home to donate some computing power.

![Version 2.0 Diagram](homelab2.png)
