---
title: "TrueNAS Core and Duplicati"
date: 2021-09-03T17:25:08-07:00
draft: false
---

When my dad said he wants somewhere to store all his GoPro footage, I had to jump at the opportunity. I already had a PC with a big case running a mini-ITX motherboard and have been wanting to fill in the empty space for a while.

This was my Proxmox machine running a NFS server and a k8s node. It had a 1TB boot drive and a 2TB HDD for NFS storage so I ended up buying 2 more of the 2TB HDD and a 500GB SSD to replace the boot drive. This is because the case only has three 3.5 inch mounting bays and two SSD mounting bays. So I took a weekday evening to install all the new drives and [TrueNAS Core](https://www.truenas.com/) onto the machine without trouble and have a reliable ZFS NAS with 3.6TB NFS and Samba storage. Unfortunately I don't have an extra SSD for cache but for my use case, the speed should be fine.

Now I feel like the machine is too powerful to just be a TrueNAS server. Although I don't need the extra computing power or the higher electric bill, I'm probably just going to leave it alone. I'm not a big fan of using the jails, plugins or VMs that works with TrueNAS because I like to keep all my applications on one platform for easier management.

With more data now, I had to think about back ups and heard about [Duplicati](https://www.duplicati.com/) from the Selfhosted podcast. The program seems pretty straightforward. You can choose from a variety of backends that it supports, from local disk, to S3 and Duplicati will break up your source directory into what they call volumes of roughly the same size and upload them encrypted into the destination. It seems to be fairly light and you can setup a backup on a schedule and have Duplicati maintain the retention. I chose the smart retention which keeps more copies of more recent snapshots and fewer copies of less recent snapshots.

I decided to use Backblaze as my cloud offsite storage and used their relatively immature Terraform Provider to create an API key and B2 bucket. I haven't completed a full backup yet so I can't test the restore but I trust it should work just fine.
