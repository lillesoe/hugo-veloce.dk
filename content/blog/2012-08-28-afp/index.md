---
title: Using Apple Filing Protocol (AFP) with FreeBSD
date: '2012-08-28'
tags: ['AFP', 'FreeBSD']
draft: false
summary: 
images: []
---

I want to access my files on the FreeBSD NAS via [AFP](http://en.wikipedia.org/wiki/Apple_Filing_Protocol) and not [SMB](http://en.wikipedia.org/wiki/Samba_(software)\"). `SMB` is too Windows-like ;-)

First we nee `Bonjour` to multicast the `DNS`-name of the server. This is implemented by `avahi`. (Why does it nee to install so many X ports...?)

```
# cd /usr/ports/net/avahi
# make install clean
```

Now start the daemons (remember to modify `rc.conf`)

``` 
#Avahi
avahi_daemon_enable="YES"
dbus_enable="YES"
```

```
# /usr/local/etc/rc.d/dbus start
# /usr/local/etc/rc.d/avahi-daemon start
```

Now we need a service talking AFP: netatalk

```
# cd /usr/ports/net/netatalk
# make install clean
```

Now start the daemons (remember to modify `rc.conf`

```
#Netatalk (AFP)
netatalk_enable="YES"
atalkd_enable="NO"
afpd_enable="YES"
papd_enable="NO"
```

```
# /usr/local/etc/rc.d/netatalk start
```

Now the AFP is running, and you should be able to see the server in a Finder + be able to login and see the home directory of a specific user.
