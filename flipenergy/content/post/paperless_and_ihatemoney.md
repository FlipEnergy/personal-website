---
title: "Paperless and Ihatemoney"
date: 2022-07-09T09:28:08-07:00
draft: false
---

# [Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx)
![Paperless](paperless.png)
In my life long quest to own as few physical things as possible (unless they spark joy, of course), I am thankful to have found Paperless. This tool is a document archival and indexing platform where I can upload scanned documents. These uploads then can be tagged, placed in categories, or even have an associated correspondent, making organization super clean and simple. The best part about this tool is the OCR (Optical Character Recognition) that is automatically run on each document. What this means is I can actually look for documents that contain what I've searched. No longer do I need to skim through multiple documents looking for some specific line I vaguely remember. I also find this is a great way to keep instruction manuals that I want to reference in the future.

Paperless only requires Redis as cache to speed up searching and indexing so it is rather light-weight. As usual, I run this through a [helm chart](https://artifacthub.io/packages/helm/k8s-at-home/paperless) from the wonderful [k8s-at-home repository](https://github.com/k8s-at-home/charts). Two thumbs up.

---

# [Ihatemoney](https://github.com/spiral-project/ihatemoney)
![Ihatemoney](ihatemoney.png)
Simple little web application that lets you create one or more ledgers where you can track shared budget amongst multiple people. It's not fancy by any means but it works and is now used by my girlfriend and I almost daily. If you've used splitwise, it basically solves the same problem. You can add bills or settlements manually and it'll calculate who owes who how much and even track spending month over month for each person. A simple feature it has that I love is the ability to type out simple math expressions directly in the amount field.

I also ended up adding a simple [helm chart](https://artifacthub.io/packages/helm/k8s-at-home/ihatemoney) to run this. You can again find it at [k8s-at-home](https://github.com/k8s-at-home/charts).
