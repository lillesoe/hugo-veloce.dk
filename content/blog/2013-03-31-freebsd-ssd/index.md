---
title: SSD on FreeBSD
date: '2013-03-31'
tags: ['SSD', 'FreeBSD']
draft: false
summary: 
images: []
---

```
1. Single user mode
2. # mount
3. # tunefs -t enable /dev/ada0p2
```

```
[/usr/home/ezyclie]# tunefs -p /dev/ada0p2
tunefs: POSIX.1e ACLs: (-a)                                disabled
tunefs: NFSv4 ACLs: (-N)                                   disabled
tunefs: MAC multilabel: (-l)                               disabled
tunefs: soft updates: (-n)                                 enabled
tunefs: soft update journaling: (-j)                       enabled
tunefs: gjournal: (-J)                                     disabled
tunefs: trim: (-t)                                         enabled
tunefs: maximum blocks per file in a cylinder group: (-e)  4096
tunefs: average file size: (-f)                            16384
tunefs: average number of files in a directory: (-s)       64
tunefs: minimum percentage of free space: (-m)             8%
tunefs: optimization preference: (-o)                      time
tunefs: volume label: (-L)
```