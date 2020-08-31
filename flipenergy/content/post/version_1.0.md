---
title: "Homelab Version 1.0"
date: 2020-08-31T00:12:51-07:00
draft: false
---

I started out wanting a cluster so I had 2 nodes. But realized because I was using MetalLB, my ISP's gateway can't tell which machine to send incoming traffic to since MetalLB assigns IPs to my K8s services. However the gateway does not always map the MetalLB IPs to the correct machine's network adapter MAC address meaning the traffic could be sent to a machine that isn't listening for that traffic. So as soon as I wanted to host a website that would take incoming traffic, I knew this setup wouldn't work.

![Version 1.0 Diagram](homelab.png)
