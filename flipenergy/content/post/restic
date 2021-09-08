---
title: "Restic and Nextcloud"
date: 2021-09-08T15:45:43-07:00
draft: false
---

As mentioned in my previous post, I wanted to setup a cloud storage solution for my dad to store files. Before I did that, however, I needed to make sure that the files I store are safely backed up offsite. I had tried out Duplicati but I simply could not get it to work. Probably due to how slow my upload speed is, Duplicati simply would get stuck at a near the end and never complete the first full back up. Even after several tries. Adn so, I looked around some more and found Restic.

[Restic](https://restic.net/) is a CLI snapshotting program that supports many backends, including Backblaze's B2 which is what I wanted to use. It actually has more stars on Github than Duplicati so it seems well regarded. I wrote a Helm chart which runs a kubernetes cronJob that runs a script I put together that intializes a repository if not exisdts for backing up to, takes a back up, and runs a clean up of old backups according to parameters I've set. Now that this is setup, it's been working like a charm. I even have curls in the script to send me Discord notifications of when backups, start, finish and fail. When the time comes that I need to do a restore, restic offers partial restores so I don't need to re-download the entire back up. Furthermore, it even has a feature to let you mount the backup and explore it like any filesystem. I highly recommend Restic as a back up utility.

Now that I have the back up solution sorted out, I used the official Helm chart to install [Nextcloud](https://nextcloud.com/) in my kubernetes cluster. There were quite a lot of tweaks I had to do, like running it as non-root so the permissions are correct for TrueNAS storage. This means I also had to mount modified Apache configs so the program wouldn't fail due to being unable to bound to port 80. So far I like Nextcloud. It's got a lot of features and plugins but I think it also makes the application a little heavy and slow. Overall I'm pretty satisfied with it and it will be the main storage solution for my dad. For me, I will use it as a file sharing solution and replacing Sharry.
