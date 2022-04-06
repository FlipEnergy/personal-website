---
title: "OPNsense"
date: 2022-04-03T11:06:51-07:00
draft: false
---

[OPNsense](https://opnsense.org/) is an operating system based on FreeBSD that could be installed onto most hardware to turn it into a router and firewall. Despite using Google Wifi as my router without problems for years, I wanted to run OPNsense for my home network mostly because it gives me much more control than what Google Wifi offers. As I found out after installing it, it allowed me to remove a dedicated Pi-Hole as well. I'm still using Google Wifi as a downstream router but I will try to setup them in bridge-mode in the future and hopefully get them to work as access points only.
![OPNsense Traffic](opnsense_traffic.png)

The installation and setup was simple and it allows you to test your setup before installing it. Once installed, all further configuration can be done remotely using the web UI it serves. OPNsense comes with pretty sane defaults like blocking incoming WAN packets, as expected. I didn't need to change much except opening a port to allow HTTPS traffic. I also limit the incoming IPs to those of Cloudflare so only Cloudflare Proxied traffic are accepted to my homelab hosted webapps. This was the main reason I wanted more control over my firewall. Further security can be added as firewall rules such as only allowing port 22 SSH to my servers from select IPs only. I also can easily set static IP address for each of my servers and setup the built-in unbound service as my new DNS ad blocker for the whole network. It also has an option to automatically add hostnames of devices with static IPs (or even those with non-static DHCP leases) which is very handy. Setting up DNS overrides was also very simple and has a much better UI than doing so with Pi-Hole. The aliases feature is incredibly handy. I can override all my websites to prevent my traffic from going out to Cloudflare and the internet just to come back in again to a server on the same network. This of course saves data and improves the speed by keeping everything on the LAN.
![OPNsense Unbound](unbound.png)

I also added the HaProxy plugin and despite hating the interface to configure it (I would much prefer just editing the conf file), it works great. Instead of port-forwarding HTTPS traffic to a single K8s node, I just direct it to the local HaProxy which then load-balances the traffic to multiple K8s nodes that are deemed healthy by HaProxy TCP checks. Similarly, I also load balance the K8s control-plane so I don't need to update where I'm pointing my kubectl if a server is down.
![OPNsense HaProxy](haproxy.png)

Overall, I'm quite pleased with OPNsense. There seems to be a lot more things I can do with it but it's a complex piece of software so I'm taking my time trying various things. I really hope Google Wifi will play nice with it in bridge-mode and let me setup a wifi with multiple wired nodes but I won't know until I try in the near future.
