---
title: Remounting geli and ZFS partitions
date: '2012-01-23'
tags: ['ZFS', 'geli', 'FreeBSD']
draft: false
summary: 
images: []
---
As I did a clean install and not an upgrade of my `FreeBSD 8.2` to `9.0`, I have to reconfigure everything from scratch :-)

I have 4 Western Digital disks with data - all in `RAID-Z`. And because they are Western Digital, they have `4K` sectors and don't work well with `ZFS`. So I also have encrypted them with `geli` - a standard [trick](http://www.cod3r.com/2010/06/zfs-on-western-digital-ears-drives/.

I had a huge problem attaching the `geli` devices after reinstall.

The devices have changed names, and the `geli attach` will fail if using the "alias" device :-/

So if using e.g. `ad6s1e` as provider under `8.2`, then attach will fail under `9.0` with:

```
geli: Provider ad6s1e is invalid
```

The `/dev/ad6s1e` is now an alias for `/dev/ada0s1e` (look in the `dmesg`).

So remember to keep this in mind when editing `rc.conf` and `loader.conf`. Also remember to copy the `zpool.cache` in `/boot/zfs` in order for the `zfs` mounts to work.
