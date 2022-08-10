---
title: "An overview of my Concourse jobs at the moment"
date: 2022-08-09T17:58:45-07:00
draft: false
---

# Intro

["Concourse is an open-source continuous thing-doer."](https://concourse-ci.org/)

This is yet another pipeline tool in the same category as Gitlab CI or Github Actions.

I selfhost this in my kubernetes cluster and use it mostly as a platform to automate things. Here's a quick overview of the jobs I have on it.

![My pipelines in all their glory](overview.png)

# misc-notifications
Random discord notifications for myself go in this pipeline. I only have two jobs that remind me to drink water and take walking breaks based on timers.
![misc-notifications](misc-notifications.png)

# personal-website
This is pipeline that runs the jobs to publish this website! It builds the image on each git repo update and deploys it to my Oracle K3s instance.

![personal-website](personal-website.png)

# deploy-k8s-homelab
This deploys all the apps I run in K3s to both of my K3s clusters. They run automatically on git repo updates. I define what's deployed using [helmsman](https://github.com/Praqma/helmsman).

![deploy-k8s-homelab](deploy.png)

# images-build
Exactly what the name suggests, it build docker images I maintain automatically. Usually from upstream Github releases. They're up on Docker hub so feel free to pull and use them

![images-build](images-build.png)

# image-notifications
These are just discord notifications that let me know when a new version of an image has been published to Docker hub.

![image-notifications](image-notifications.png)

# artifacthub-to-branch
Since so far all the Helm charts I use are all on Artifacthub, I have this pipeline that watches Helm charts I use on Artifacthub. It pushes a branch for each of the Helm charts I'm interested with the latest version of the Helm chart specified in my Helmsman desired state file. So if a new version of a chart comes up, then that branch will be updated to use the latest version of that chart. This way, I can simply cherry-pick or merge the latest commit on that side branch into my main branch to upgrade.

![artifacthub-to-branch](artifacthub-to-branch.png)

# k8s-homelab-branch-tracker
This job is responsible for creating a pipeline for each branch in my git repo. The pipeline it creates will be the next section.

![branch-tracker](branch-tracker.png)

# k8s-homelab-diff
This group of pipelines is what the k8s-homelab-branch-tracker job creates. As the name suggests, the purpose of these pipelines is to show me what each branch would change if applied to my currently setup on my main branch. Since I have two clusters, these are two jobs that diff each of them. These two jobs trigger automatically on each new commit on the branch and sends me a discord notification with a link to the logs for me to inspect.

If I decide that the diffs are low risk enough from the logs, then I can manually run the third job, which cherry-picks the latest upgrade commit to main branch. This commit would then, of course, trigger a deployment to my clusters from the deploy-k8s-homelab pipeline.

![the group of diff pipelines](diff-group.png)
![a single diff pipeline from the group](diff-pipeline.png)

# Conclusion
That's every job I run in my Concourse instance at the moment. It was slowly built up over a few years and it's all publicly available [here](https://github.com/FlipEnergy/concourse-pipelines).
