---
title: "Homelab Version 1.0"
date: 2020-08-31T00:12:51-07:00
draft: false
---

I started out wanting a cluster so I had 2 nodes. But realized because I was using MetalLB, my ISP's gateway can't tell which machine to send traffic to based on IP since MetalLB assigns a new IP to my K8s services. However that IP is not always correct mapped to the correct machine's network adapter MAC address in the gateway. So as soon as I wanted to host a website, I knew this setup wouldn't work.

![Version 1.0 Diagram](homelab.png)
