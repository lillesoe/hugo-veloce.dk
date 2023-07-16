---
title: Netflix on the Apple TV :-)
date: '2012-01-15'
tags: ['appletv']
draft: false
summary: Apple TV 2
images: []
---

Today I bought myself an Apple TV 2 (ATV2). Damn that thing is small!

First thing I did was to JailBreak it in order to get [XBMC](http://xbmc.org) running on it.
I used [Seas0nPass](http://support.firecore.com/entries/387605-jailbreaking-101-seas0npass\)
from [Firecore](http://firecore.com/) to do this. And fortunately
it is very easy - they actually have an untethered jailbreak of the latest 4.4.4 (iOS 5.0.1 - 9A406a).

In order to get XBMC running one just has to ssh to the ATV2 :-)

```
$ ssh root@<your ATV2 IP address>;
```

(Use “alpine” as your password if you haven’t changed it already.)

```
$ echo “deb http://mirrors.xbmc.org/apt/atv2 ./” > /etc/apt/sources.list.d/xbmc.list
$ apt-get update
$ apt-get install org.xbmc.xbmc-atv2
```
