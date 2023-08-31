---
title: Installing FreeBSD on my NAS
date: '2012-01-13'
tags: ['freebsd']
draft: false
summary: Installing FreeBSD on my NAS
images: []
---
Using the new `bsdinstall` works like a charm :-) Thanks!

I want a very small install - no `doc`, no `games`, no `lib32`, no `src` 
(I'm ok with the prebuilt kernels).

So I just selected `ports` - I want to be able to add ports.

It turns out that after boot I needed to install the following `ports` (with their dependencies):

- `bash`
- `screen`
- `sudo`
- `portupgrade`


Back in November 2009 I installed my NAS with the newest FreeBSD: 8.0. 
I made some choices about partitioning that I now want to redo.

My initial partitioning was
- `/` had around 4.5 GB
- `/tmp` had around 0.5 GB
- `/var` had around 3 GB
- `/home` had around 895 GB

And back then I actually decided that the 2 GB RAM in the server was enough, 
so I didn\'t have a swap partition :-/

First - having no swap is bad when the server is very busy! 
And for home use there is no need to separate /tmp and /var from /. 
And last - the / partition was way too small. I was having trouble using 
ports all the time, and need to clean up very often...

So I found a new HD for the new boot disk. Luckily I had a WD Caviar Green 1TB
with 64 MB cache. Perfect!

I settled for the following partitioning

- `/` has around 39 GB
- `/home` has around 873 GB
- And `swap` has 4 GB
