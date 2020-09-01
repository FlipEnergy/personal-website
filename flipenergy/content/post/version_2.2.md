---
title: "V2.2 - Bitwarden, Wireguard, and Nginx"
date: 2020-08-31T19:49:03-07:00
draft: false
---

I stopped using Lastpass as my password manager because I had found Bitwarden. I'm using [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) which is another opensource implementation of the already opensource Bitwarden.

I really like the the design of the Chrome extensions and the Android app for it. It has all the features I want: auto-fill in Chrome, auto-fill on Android and 2FA.

Now is it safe to self-host a password manager? I can't say I know more about server security than folks who run the public password managers, but I know enough to setup firewalls and use HTTPS. Limiting exposure is one thing, but the fact that I'm not running a large data center with hundreds of thousands of people's passwords means I'm **much** less of a target.

OpenVPN was also giving me trouble because the Helm charts weren't well maintained so I switched to using WireGuard. Apparently it's faster and I liked the simplicity of setting it up. Because Wireguard uses UDP for it's traffic, I had to stop using HAproxy as my load balancer because it does not support UDP. So I chose the next best thing, Nginx.

![Version 2.2 Diagram](homelab2.2.png)
