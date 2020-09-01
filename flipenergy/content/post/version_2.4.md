---
title: "V2.4 - Concourse CI"
date: 2020-08-31T20:12:37-07:00
draft: false
---

Since I wanted to update my website to what you see now, I had to speed up the time it takes to iterate. In fact, I want full CI/CD. In addition to that reason, I think it's just fun to automate things in general. I'm sure I can think of more ways to use concourse down the road.

Before Concourse, I had to build, tag and push my images in the commandline. At the point of this writing, I have 2 pipelines, one to build images off the default branch and another for when I'm ready to publish.

![Personal Website Pipeline](website_concourse.png)
![Personal Website Tasks](website_master_concourse_tasks.png)

I also added another pipeline that indexes my helm charts repo that's served out of Github pages when push a change to add/remove helm chart packages.

![Helm Charts Pipeline](helm_charts_concourse.png)
![Helm Charts Pipeline](helm_index_concourse_tasks.png)

![Version 2.4 Diagram](homelab2.4.png)
