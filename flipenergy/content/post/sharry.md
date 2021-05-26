---
title: "Sharry"
date: 2021-05-26T13:52:46-07:00
draft: false
---

[Sharry](https://github.com/eikek/sharry) is a simple no-frills file sharing web application.

I wanted a way to share multiple files that were too large to share via my usual chat client. Sharry allows me to upload these files, and then get a link that allows people to view and download them directly. The link is generated and not easily guessable so the rest of the public won't have easy access to it. It even allows you to setup a password for the link you're sharing to ensure only privileged eyes can view the files. It's got a pleasent and intuitive UI and I'm very happy with how lightweight it is.

I did not set it up with any permanent storage so all the files, and hence links, are ephermal and can be deleted at anytime, in addition to the options Sharry itself allows such as setting the number of times the link could be opened.

I, of course, run it in k8s through this wonderful chart from my usual (favorite) helm repo: https://artifacthub.io/packages/helm/k8s-at-home/sharry

![Sharry shares page](sharry.png)
