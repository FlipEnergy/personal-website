---
title: "Focalboard"
date: 2021-04-26T10:57:51-07:00
draft: false
---

![Focalboard](focal.png)

Using a kanban board for tracking my personal to-dos was something I should have started a long time ago. I've been using Kanboard and while it's great and feature-rich, it is a little overkill for my needs and it frankly looks a little dated. Mattermost folks recently came out with [Focalboard](https://www.focalboard.com/) and it looks simple, powerful and I love the UI. I waited a bit to see if anyone was going to start maintainnig an image and helm chart for it but ended up doing it myself.

I have an image that I maintain and have automation to build a new one on each release. The [docker image](https://hub.docker.com/repository/docker/flipenergy/focalboard) can be publically pulled and you can look at the supported environment variables and the dockerfile [here](https://github.com/FlipEnergy/concourse-pipelines/blob/master/images/focalboard/Dockerfile).

And of course, I contributed a [helm chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/focalboard) so feel free to use that!
