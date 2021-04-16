---
title: "Contributing to K8s at Home"
date: 2021-04-16T09:28:38-07:00
draft: false
---

So I decided to deprecate all the charts I wrote and migrate them to this open source repo maintained by folks from [k8s-at-home](https://github.com/k8s-at-home/charts). I've been using some of their charts already and they have a robust [library chart](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common) that makes it very simple to add new charts on top of. So naturally, I took my charts for Syncthing, Whoogle, Owncast, and Pretend You're Xyzzy and contributed them to k8s-at-home! You can even see me in their contributors section in the readme at the root of the repo.

This way, I don't have to write pipelines myself to auto bump versions since they have a pretty sophisticated automation for all their charts. Anyways, that's all for this post. Here are the charts that I contributed:

https://github.com/k8s-at-home/charts/tree/master/charts/stable/syncthing
https://github.com/k8s-at-home/charts/tree/master/charts/stable/whoogle
https://github.com/k8s-at-home/charts/tree/master/charts/stable/owncast
https://github.com/k8s-at-home/charts/tree/master/charts/stable/pretend-youre-xyzzy

Feel free to check out all their available charts!
https://artifacthub.io/packages/search?repo=k8s-at-home
