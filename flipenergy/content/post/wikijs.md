---
title: "Wiki.js"
date: 2021-03-01T11:31:49-08:00
draft: false
---

So I took a look through [Archivy's](https://archivy.github.io/) code, trying to determine if we can scale it up as a gunicorn WSGI app rather than the single threaded Flask app that it is now. Unfortunately, the app doesn't seem to be completely stateless (i.e. login sessions weren't shared between the instances) so I decided find a new wiki or notes alternative. I looked through about 10 options and landed on [wiki.js](https://js.wiki/) because it was feature rich, it had password protection, it already has a maintained helm chart so I didn't need to write my own, and it uses just PostgreSQL for its database, which I'm already running for Concourse.

So I went to work. First by changing the way I deployed concourse to not include the PostgreSQL dependency and spun up the latest bitnami PostgreSQL helm chart in its own namespace, and simply pointed my concourse instance to it. Then I also spun up wiki.js and pointed it to a new database in my PostgreSQL and moved all the data for PostgreSQL into syncthing for automatic back up.

I migrated all my documents from Archivy to wiki.js and am very pleased with its ease of use. I use it to document things about my homelab, links to various sites, code snippits, recipes, my D&D notes, and much more.

![wiki.js](wikijs.png)
