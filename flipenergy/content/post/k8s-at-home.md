---
title: "K8s at Home"
date: 2021-01-08T20:24:48-08:00
draft: false
---

I found a repo with lots of charts on github called [k8s-at-home/charts](https://github.com/k8s-at-home/charts).

Turns out navidrome is one of those charts. The whole repo is really cool because they have a common chart that is pretty robust and serves as a base for all their app specific charts. I did find a flaw though, I couldn't map a service port differently from the container port that it's directing traffic to. I.e if the app in the container listened on port 8080, I had to use port 8080 in my service instead of just 80. I created an issue to ask about it and within a day, a contributor had replied and pushed a new version out to support this. Impressive!

Anyways, my Navidrome instance is now running off of their charts since it met has all my needs. In fact, after looking through their [available charts](https://artifacthub.io/packages/search?org=k8s-at-home), I ended up spinning up a meta-search-engine called [Searx](https://searx.me/) to replace Whoogle, and also [FreshRSS](https://freshrss.org/) for RSS feeds of gaming news, tech news, and comics.

Go check K8s at Home out!

![Searx](searx.png)

![FreshRSS](rss.png)
