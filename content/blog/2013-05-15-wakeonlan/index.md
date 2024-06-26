---
title: Making WakeOnLan work
date: '2013-05-15'
tags: ['FreeBSD', 'wake-on-lan', 'backup']
draft: true
summary: Making WakeOnLan work
thumbnail: "network-tree-svgrepo-com.svg"
---


I was looking for a solution to have the server in our cottage ready for "service", but not using a lot of power. 
Of course I have used `hdparm` to make the disk spin down, but the rest of the computer is also using power. 
So I thought of WakeOnLan (WOL) combined with some kind of sleep. Below is my setup:

Install `sleepd`:

```
sudo apt-get install sleepd
```

It is difficult to find the right settings for it to sleep at the right times, and not during a backup. 
I have found that these values in `/etc/default/sleepd` work for me:

```
PARAMS="-a -N -U 60"
```

The restart the daemon

```
sudo service sleepd restart
```

In the BIOS of the server, you might need to enable WakeOnLan. This differs from vendow to vendor - no help here :-)
Same goes for the router - you need to route port 7 and 9 to the server that needs to support WOL.

On the client (the computer that needs to wake up the server) you will need to have a way to send the magic packets to the right port. 
I have found that it is also nice to have an App on my iPhone to WOL.

On my FreeBSD box (which acts as a client to the box in the cottage) i have installed `net/wakeonlan`. 
This means that I can wake up my server from my FreeBSD box like this:

```
wakeonlan -p 9 -i router-ip  server-MAC-address
```
