---
title: "Archivy - self hosted knowledge repository"
date: 2021-02-05T16:42:57-08:00
draft: false
---

I've been kinda looking for a pastebin sorta app to self-host. Saw this open source flask app that just hit version 1 and it seemed to fit my needs and more. It's called [Archivy](https://archivy.github.io/) and basically it has enough functionality for me to use it as a pastebin, wiki, and just general text and web page archiving service. Backed by Elasticsearch, it allows for full text search as well. 
Once I saw they had docker support, I was sold. Took a few hours to setup a [helm chart](https://github.com/FlipEnergy/archivy-helm-chart) and boom, I have it up and running in my k8s exposed to the internet for my use anywhere.

So far, I've moved some old bookmarks into it and started on a wiki about my homelab to reference in the future. No major issues so far so I'm really liking it. Looking forward to the new features.

![archivy](archivy.png)
![editing](archivy_edit.png)
