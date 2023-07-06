---
title: New disks for the NAS
date: '2013-03-18'
tags: ['Backup', 'zpool', 'Western Digital']
draft: false
summary: 
images: []
---

I needed some disks for an external backup project - more on that later. Why not replace some of the disks in the NAS with some bigger, and use the old one in the remote place :-)

I got myself two Western Digital WD30EZRX 3TB drives. They were replacing two Western Digital WD10EADS 1 TB drives.

Here is my current layout:

```
ada0: WD10EADS
ada1: WD15EADS
ada2: WD15EADS
ada3: TS64
ada4: WD10EADS
ada5: WD10EADS
```

`ada0-2` are on the Silicon Image RAID SATA controller, the `TS64` on `ada3` is on the PATA port on the motherboard, and the last two `ada4-5` are on the SATA ports directly on the motherboard. `ada4` is my old boot disk before I got the PATA SSD on `ada3`.

The two zpools (data1 and data2) are lay out as follows:

```
[jesper@tranquil ~]$ zpool status
   pool: data1
  state: ONLINE
   scan: resilvered 784G in 11h58m with 0 errors on Thu Feb 28 20:05:15 2013
 config:
 
         NAME         STATE     READ WRITE CKSUM
         data1        ONLINE       0     0     0
           raidz1-0   ONLINE       0     0     0
             ada0s1e  ONLINE       0     0     0
             ada1s1e  ONLINE       0     0     0
             ada2s1e  ONLINE       0     0     0
             ada5s1e  ONLINE       0     0     0

 errors: No known data errors

   pool: data2
  state: ONLINE
   scan: resilvered 406G in 4h21m with 0 errors on Thu Feb 28 00:25:48 2013
 config:
 
         NAME         STATE     READ WRITE CKSUM
         data2        ONLINE       0     0     0
           mirror-0   ONLINE       0     0     0
             ada1s1f  ONLINE       0     0     0
             ada2s1f  ONLINE       0     0     0
 errors: No known data errors
```   
   
As you see the RAID-Z (data1) consistes of 4 1TB partitions, and the mirror (data2) of two 0.5 TB partitions. 
   
The big problem is not, that I want to have a RAID-Z with 4 1.5TB partitions, This means that I have to move data around! It becomes kind of a "Towers og Hanoi" problem, as there is almost not enough space.
