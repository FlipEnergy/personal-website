---
title: "3-node cluster + Grafana dashboards + more pipelines"
date: 2021-02-11T19:37:41-08:00
draft: false
---

# 3-node k3s cluster
Since I've started, I wanted to have a 3 node cluster. Microk8s was too heavy and I couldn't run it on my rock64. It couldn't even run on my old surface well enough. Thankfully now that I switched over to k3s, it's super light and can run comfortably on all my hardware. As mentioned in my previous post about K3s, I personally think it's a much better distribution for homelab k8s.

Thanks to the good practice of infrastructure as code, setting up this new node was as simple as installing the OS add it to my ansible hosts inventory and running the playbook. My automation adds it as a k3s node to my existing cluster seamlessly.

Check out what's running in my k8s cluster by [here](https://kube.pleasenoddos.com/#scale=2)!

# more nodes means more servers I need to monitor
So I tweaked my main grafana dashboard to give me better information at a glance. This is the summary section of my server metrics dashboard.

![grafana dashboard](grafana.png)


# More concourse pipelines!
I added some more jobs and pipelines! Of course they all trigger automatically and ping a channel in my Mattermost instance to let me know they've run. I just get giddy when I see them working all on their own.

![pipelines](pipelines.png)

## k8s-homelab jobs
I combined my k8s-homelab deploy job and the helm charts repo indexing job into one pipeline.

![k8s-homelab pipeline](k8s-homelab.png)

## utilities image builders
As part of my other pipelines, I need some images that have some utilty tools for me to automate certain things. Things like using bitwarden cli to fetch secrets from my password manager, or my recent addition of using yq to bump semvers in my helm charts. These jobs watch the Github repos of their respective tools and triggers on any new github releases, at which point they will build a new docker image with that version and push it to my docker hub repository.

![utilities pipeline](utilities.png)

## helm charts pipeline
Now that I have a couple of helm charts that I wrote and maintain. I wanted to automate version bumping when new versions of the application comes out. To do that, I'm leveraging concourse and my utility images to trigger a new helm chart package build every new version of the respective software comes out, completely automatically. It bumps the version of my helm chart, sets it to use the updated software's image, and pushes a commit to the git repo for that helm chart. In a subsequent job, it then packages that helm chart, and sends it to my helm chart repo which is served out of my github pages for my k8s-homelab repo. This will then trigger my helm chart index job that will index the new chart that was just added, and make it available for the world to use!

![helm charts pipeline](helm-charts.png)
