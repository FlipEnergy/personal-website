---
title: "NFS for K8s PVs"
date: 2020-11-03T13:22:01-08:00
draft: false
---

For a quick setup, I originally just used hostPath for my k8s persistence volumes. It was fast, simple, and because I only had 1 k8s node anyways.

But I want to add nodes to this k8s cluster eventually, so I needed a host-agnostic way of mounting the same data regardless of where the pods will be running. Since I don't have anything underlying, like openstack, and didn't want to bloat my setup with similar platforms or plugins, I just opted for good old fashioned NFS. Worked out pretty nicely and had the bonus of root squashing my k8s process permissions for when they are accessing my disk.

Of course, nfs server is set up via ansible so it's automated if I need to recreate my host.

related links:

https://kubernetes.io/docs/concepts/storage/volumes/#nfs

https://github.com/FlipEnergy/ansible-playground/blob/master/roles/site_node/tasks/nfs.yml

https://github.com/FlipEnergy/k8s-homelab/blob/master/bitwarden/persistencevolume.yaml
