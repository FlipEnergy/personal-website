---
title: "MicroK8s -> K3s"
date: 2021-01-17T20:17:55-08:00
draft: false
---

So... I got some more hardware in the form of rock64 boards. One to replace my old first-gen raspbery pi which is barely enough to keep up as a pihole ad-blocker. The other I was adding to my k8s cluster, so it's actually a cluster with more than one node. Thing is, microk8s isn't micro enough to run on the rock64 board, so I went to another k8s distribution that everyone online seems to approve of: Rancher's [K3s](https://k3s.io/). It's super light and runs just fine on my new node. K3s was a breeze to set up with their install script, but I still automated that process with some ansible code so I could spin up a cluster with a single command. The major pain in the but is I had to switch from metallb to using an ingress controller. First I used the bundled Traefik ingress controller but it seems to not work well with concourse UI. Probably due to buffering or something, but I couldn't figure out how to fix it so I switched to the tried and tested nginx ingress.

After some use, K3s seems like a better distribution than MicroK8s for a homelab kubernetes cluster on baremetal.

![Part of my Grafana dashboard](graf.png)
