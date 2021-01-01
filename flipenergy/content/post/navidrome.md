---
title: "Navidrome: self-hosted music streaming"
date: 2020-12-31T17:28:33-08:00
draft: false
---

When this whole pandemic is over and I'm back working in the office, I'll need a way to listen to my music from my work laptop. I used to use Google Play Music but that's going away and I want to self-host opensource applications instead. So, I took some time and looked through a few options to stream music including Airsonic, Subsonic, Polaris, and Funkwhale.

I tried Polaris at first, and it was simple and clean. However, I just simply didn't like the UI. It felt dated and the project doesn't seem as well supported as alternatives.

Enter [Navidrome](https://www.navidrome.org/). This one is kinda like Polaris. Simple, dockerized, light-weight, and has a much more modern material UI. I wrote a helm chart for it and pointed it to my syncthing music directory so my library will be automatically updated whenever I buy new songs.

For those who care, it also supports the Subsonic API if you want to download a compatible app to stream to your phone. Anyways, I'm really happy with it and I highly recommend Navidrome.

![Navidrome UI](ss-desktop-player.png)
