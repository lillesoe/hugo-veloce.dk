---
title: Automounting AFS shares from the NAS
date: '2012-02-02'
tags: ['AFP', 'automount']
draft: false
summary: 
images: []
---

Instead of mounting shares manually every time at login, one can use autos. I have followed the guide [here](http://forums.plexapp.com/index.php/topic/14201-howto-automount-afpsmb-shares-using-autofs/)

So in my case I created a file `/etc/fstab` and inserted a file for the home directory on my server (local ip: `192.168.1.40`):

```
192.168.1.40:/jesper /Users/jesper/tranquil/jesper url automounted,url==afp://jesper:PASSWORD@192.168.1.40/jesper 0 0
```

Then I created the directory locally on my laptop: `/Users/jesper/tranquil/jesper`

And ran:

```
sudo automount -vc
```

And wupti I could cd into `/Users/jesper/tranquil/jesper` and the Mac mounted it and it worked just like any other directory on the laptop :-)
