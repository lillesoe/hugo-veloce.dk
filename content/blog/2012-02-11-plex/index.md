---
title: How not to install Plex Media Server on FreeBSD
date: '2012-02-11'
tags: ['FreeBSD', 'Plex Media Server', 'Plex']
draft: false
summary: 
images: []
---

I have a `FreeBSD` server with a lot of out media on it. And I want to view this contents on my Apple TV.

`Plex` and `Plex Media Server (PMS)` comes to mind.

There is, however, not a port for `FreeBSD` of `PMS`. But fortunately there is good `Linux` support in `FreeBSD, so I was hoping to get support that way... Here is what I tried:

Install Linux support:

```
cd /usr/ports/emulators/linux_base-gentoo-stage3
make install clean
```

Download: [plexmediaserver_0.9.5.2-7a18da4_i386](http://www.plexapp.com/repo/pool/main/p/plexmediaserver/plexmediaserver_0.9.5.2-7a18da4_i386.deb) from [plexapp.com](http://www.plexapp.com/repo/pool/main/p/plexmediaserver/)

Unpack it using `ar`.

Find the file `data.tar.gz` and extract the contents in the root of `/compat/linux`.

Try to start the PMS:

```
chroot /compat/linux/usr/sbin/start_pms
```

It fails... The kernel emulation of Linux sys call does not implement `epoll` - which is used by `PMS` :-( Even a patch will not solve the problem.

So - don't go this way for support of `PMS` in `FreeBSD`...
