---
title: "Oracle Cloud Free Tier, Cloudflare, and Terraform"
date: 2021-08-25T19:00:22-07:00
draft: false
---

*Edit: Aug 29, 2021
So... I didn't like managing both docker-compose via Ansible and stuff in K8s with Helm so I ended up changing the ARM VM in Oracle to run a single node K3s as well. Works just fine so I think the issue with the TCP connections was just that the lower powered single-core, 1GB VMs I had before were just too slim to run K3s in a HA cluster configuration.*

Out of all public Cloud platforms, to my knowledge, Oracle Cloud offers the best [always free services](https://www.oracle.com/cloud/free/). I had know about it for a little while but never had the desire to take advantage of it until recently. Since not all the things I host store my personal data, there are some things that I could host up in a public cloud to reduce the burden on my homelab. It would be nice to have some service still be up and running if my homelab goes down.

Oracle lab offers two 1VCPU, 1GB RAM AMD instances. I spun up one of these as a secondary Pi-Hole in the sky, if you will. It's configured exactly as my instance at home is set as the secondary nameserver for my home network in case my local one is down. Oracle also offers 4VCPU with 24GB RAM with ARM architecture that you could use as one instance or split it up into multiple. I originally wanted to divide this into two instances and spin up the second AMD instance and form a k3s cluster but found some unbearable performance issues when hosting websites. TCP connects were constantly failing to be established and timing out, even from Oracle's free load balancer I set up. After thinking it was probably too much overhead anyways, I decide to just spin up one giant 4VCPU 24GB ARM server and used docker-compose to host 3 services:
- Influxdb2 for all my telegraf metrics to send to
- Hastebin so I don't waste local storage on random paste snippets
- Whoogle so I always have my search engine up
I, of course, also have an Nginx container to reverse proxy these services with my HTTPS certs.

I used Terraform to deploy these VM instances using the Oracle cloud provider, and modified my existing Ansible playbooks to configure these new VMs. In the process of this, I also decided to check if Cloudflare has free services and it does! I configured my domain nameservers to be Cloudflare and also used Terraform to manage my DNS entries as well as letsencrypt certs. This is a big win for me since now I no longer need to manually do DNS challenges to renew my cert. Once I have updated certs, I simply plug them in my Ansible playbooks and my sites will have their certs renewed.

My homepage has been updated with the latest diagram to include these new instances. I definitely recommend Oracle Cloud's free services. They are quite generous and was great practice for me to use Terraform and pushed me to improve my infrastructure.

Next up, I gotta find free/cheap cold cloud storage for my offsite backups because I'm about to setup a TrueNAS server to store some data for my folks.
