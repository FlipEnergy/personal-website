---
title: "V2.1 - More Self-hosted Apps"
date: 2020-08-31T19:29:54-07:00
draft: false
---

Added some stuff:

- [Helmsman](https://github.com/Praqma/helmsman): This is a way to managed Helm Charts as Code to version control charts and their versions you wish to deploy.
- Monitoring: Setup Telegraf on my hosts, InfluxDB to run in K8s for metrics data storage, and Grafana for visualization of this data. I'll make a post about my Grafana dashboards later.
- [Statping](https://github.com/statping/statping): Wanted to have some sort of system to alert me if my public services go down but since this runs in my K8s too, if my server goes down, this would too. I ended up replacing this with the very nice free service [Freshping](https://www.freshworks.com/website-monitoring/).
- [Syncthing](https://syncthing.net/): This is my Google Drive replacement. It's not a cloud drive, but it syncs folders across devices, even my Android phone. Now I don't need to manually add my music to my phone or photos to my computer.
- [Fail2ban](https://www.fail2ban.org/wiki/index.php/Main_Page): I see this mentioned in the self-hosting reddit community a lot. It's a nice little program that defends against DDoS and bots.

![Version 2.1 Diagram](homelab2.1.png)
