---
title: "Proxmox"
date: 2021-06-22T10:40:09-07:00
draft: false
---

So I finally bit the bullet and changed the OS on my main server to [Proxmox](https://proxmox.com/en/proxmox-ve).

I had 3 reasons for doing this. First, I wanted to split up the computing power of the physical hardware so I can have 2 K3s nodes running as individual VMs. The second reason was that I wanted to separate out my NFS server a single host isn't doing two different things. The final reason was that I just wanted to learn and try out Proxmox.

I want to give a plug for the excellent tutorial I used. It's made by one of my favorite content creators, CraftComputing. I used [this video](https://www.youtube.com/watch?v=azORbxrItOo) as a reference for the installation and setting up my VMs.

Now that all that is done, I have a separate NFS server, and a 3 node cluster of K3s. Two of which run AMD64 architecture and the third runs ARM64 since it's a rockbox single board computer. Check out the diagram on the homepage.

![Snippet of my main Grafana Dashboard with the new hosts](grafana.png)
