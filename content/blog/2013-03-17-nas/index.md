---
title: Booting FreeBSD from USB
date: '2013-03-17'
tags: ['FreeBSD', 'USB']
draft: false
summary: 
images: []
---

I have (again) changed disk layout on my NAS. I have got a PATA SSD on which I need to install and boot FreeBSD. I hope this can save me som electicity (the non SSD can spin down). And of course it will give me some speed.

First get the newest boot image for USB sticks: [FreeBSD-9.1-RELEASE-amd64-memstick.img](ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/ISO-IMAGES/9.1/FreeBSD-9.1-RELEASE-amd64-memstick.img)

Write it to the USB stick (mounted in the FreeBSD box:

```
[jesper@tranquil ~]$ sudo dd if=FreeBSD-9.1-RELEASE-amd64-memstick.img of=/dev/da0 bs=64k
11732+1 records in\r\n11732+1 records out
768925696 bytes transferred in 87.933050 secs (8744445 bytes/sec)
[jesper@tranquil ~]$
```

On my Tranquil BBS2 i had already set the USB-boot to be first priority in the BIOS, so the boot went just fine.
