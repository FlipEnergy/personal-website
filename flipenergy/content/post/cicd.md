---
title: "This site is now CICD"
date: 2020-09-01T19:50:25-07:00
draft: false
---

Hell yeah! I enhanced my existing concourse pipeline of simply building the images to also grab secrets and run a k8s deployment. From a simple bump of a version file, my pipeline will now build, tag, and push an image, then deploy the new image into my k8s cluster for the world to see.

To outline roughly what the stack is for this website:
- [Hugo](https://gohugo.io/): A wonderful static site generator written in Go.
- [Docker](https://www.docker.com/): Most people should know this one. It's... well, Docker.
- [Concourse](https://concourse-ci.org/): A really cool CI system. I chose it mostly because I love the UI (see pictures below!)
- [Helm](https://helm.sh/): The one (and only?) package manager for K8s. It's quite easy to write a helm chart for something simple like hosting this website.
- [Helm Secrets](https://github.com/zendesk/helm-secrets): Helm secrets uses [sops](https://github.com/mozilla/sops) to encrypt yaml files so they can be checked in. I really like this solution because then I can avoid self-hosting something like [Vault](https://www.vaultproject.io/) to manage my secrets for helm. I actually also use it for Concourse and Ansible secrets since those are all YAML based.
- [Helmsman](https://github.com/Praqma/helmsman): A great tool to specify helm charts and their versions via a desired state file (DSF). It allows for easy environment overrides for setting helm values which is really great for CICD pipelines. It also can be run idempotently.

The repo for this site, its helm chart and the Helmsman DSF are all checked in my public [Github Repo](https://github.com/FlipEnergy/personal-website).
You can also checkout my [Concourse Repo](https://github.com/FlipEnergy/concourse-pipelines).

Here's the pipeline:
![Website CICD Pipeline](website_concourse.png)

And here is the job in *deploy-to-k8s* job:
![Deploy to K8s Job](website_deploy.png)
