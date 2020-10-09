---
title: "V3.0 Change LB to rock64"
date: 2020-10-08T21:18:04-07:00
draft: false
---

Bought a [rock64](https://smile.amazon.com/gp/product/B0868WSTXH/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) off amazon that has SD card, case, LCD display all included for $20. It was even cheaper before at $8 but I missed it and it has since increased in price everytime it's out of stock. But even at $20 it's a steal.

I flashed a [Ubuntu Bionic minimal image](https://github.com/ayufan-rock64/linux-build/releases/tag/0.9.14) on to the SD card and ran my ansible playbook (after tweaking it a little to support arm64 arch) and boom, it's my new load balancer. I still have to figure out how to make that LCD display work though.

Anyways, updated the diagram to reflect the new hardware. I'll have to find a new use for the surface 3. I couldn't add it as a new k8s node because it was simply not powerful enough. Just the overhead of running k8s on it was using up most of its resources.

Updated Diagram:
![Version 23.0 Diagram](homelab3.0.png)
