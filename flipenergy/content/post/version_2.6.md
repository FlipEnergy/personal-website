---
title: "V2.6 - Invidious"
date: 2020-09-06T14:22:34-07:00
draft: false
---

I came across a [reddit post](https://www.reddit.com/r/chrome/comments/imrp1s/extension_that_redirects_a_url_to_another/) in which OP asked for a redirector chrome extension to forward YouTube video urls to something called Invidious. I was intrigued. With a quick whoogle, I found that this was something I needed in my life. The YouTube site pretty bloated and I just know they have tons of trackers and stuff for ads there. Anyways, I found in their opensource github repo that they actually had a helm chart (though not as fleshed out as I'd like) and went and set it up right away without any major issues. The site uses RSS for chanel subscriptions which I was able to export from YouTube and because it's so light, I'm replacing my youtube app on my phone with a shortcut to this site. No ads!

I recommend checking it out! They have public instances too if you don't want to self-host.

Here's the github repo: https://github.com/iv-org/invidious
And a list of official public instances: https://invidio.us/

I also submitted a PR to improve their helm charts a bit which should be merge in this week.

Here's a screenshot of what the site looks like:
![Invidious](invidious.png)


Updated Diagram:
![Version 2.6 Diagram](homelab2.6.png)
