---
title: Keeping my FreeBSD box up-to-date
date: '2012-01-27'
tags: ['FreeBSD', 'ports']
draft: false
summary: 
images: []
---

Every once in a while the ports software on the NAS needs to be "rebased" with the newest.

I have made a script that I can run in a `screen`. It will update the `ports` tree and compile the new software:

```
portsnap fetch extract update
pkgdb -F
portsdb -Fu
portupgrade -ac
```
