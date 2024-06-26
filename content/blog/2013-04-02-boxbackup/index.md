---
title: Setting up Boxbackup
date: '2013-04-02'
tags: ['FreeBSD', 'backup']
draft: true
summary: Setting up Boxbackup
thumbnail: "backup-service-svgrepo-com.svg"
---

I have been looking into getting a remote backup. I run TimeMachine backups in my Mac-environment, but I need a remote backup of eg.
my digital pictures.

So I have been working on a server in our cottage that could be a backup server, and my NAS back home could be a client to that server :-) 
Belov is a description of my installation of the server and a client of a [Boxbackup] (http://www.boxbackup.org/) setup. 
For the base installation of the client and server software, please consult the [wiki] (http://www.boxbackup.org/wiki/Installation). 
I will describe my configuration only.

## Server configuration

The server is a Dell OptiPlex-760 running Linux Mint Maya. I have reserved 2 disks (1TB each) in the server. 
These will act as disks in the backup storage. I have made a directory on each of the disks to put the backup files into:

```
OptiPlex-760 ~ # mkdir /mnt/backup1/box
OptiPlex-760 ~ # mkdir /mnt/backup2/box
```

Boxbackup stores on RAID only - and I dont have RAID. But the configuration handles this nicely:

```
OptiPlex-760 ~ # raidfile-config /etc/boxbackup 4096 /mnt/backup1/box
WARNING: userland RAID is disabled.
Config file written.
```

This added one of the disks. To add another, you need to edit the raid-config file (/etc/boxbackup/raidfile.conf). 
Below `disc0` was generated by the tool, and the `disc1` was added by hand.

```
disc0
{
            SetNumber = 0
            BlockSize = 4096
            Dir0 = /mnt/backup1/box
            Dir1 = /mnt/backup1/box
            Dir2 = /mnt/backup1/box
}

disc1
{
            SetNumber = 1
            BlockSize = 4096
            Dir0 = /mnt/backup2/box
            Dir1 = /mnt/backup2/box
            Dir2 = /mnt/backup2/box
}
```

Remember to let the backup daemon have rights to the backup directories:

```
OptiPlex-760 ~ # chown -R bbstored:bbstored box
```

We are ready to configure bbstored to run as the user `bbstored` on the server `backupserver` (changed to prevent misuse), 
with configuration file in `/etc/boxbackup`:

```
OptiPlex-760 ~ # bbstored-config /etc/boxbackup backupserver bbstored
```

In order for the server and the client to be able to communicate secure, a PKI infrastructure 
is [established](https://www.boxbackup.org/wiki/CertificatesAndAccountsManagement\):

```
OptiPlex-760 ~ # bbstored-certs /root/certs init
OptiPlex-760 ~ # bbstored-certs /root/certs sign-server /etc/boxbackup/bbstored/backupserver-csr.pem
OptiPlex-760 ~ # cp /root/certs/servers/backup.rasta.dk-cert.pem /etc/boxbackup/bbstored/
OptiPlex-760 ~ # cp /root/certs/roots/clientCA.pem /etc/boxbackup/bbstored/
```

Now the clients can be configured. A client needs an account on the server:

```
OptiPlex-760 ~ # bbstoreaccounts create 0 0 970G 1000G
```

This creates the account `0` on the disk set `0` with a soft limit at `970GB` and a hard limit at `1000GB`.

## Client configuration

On the client we need to create a configuration and a certificate that we can send to the administrator of the server 
(in order to get it signed and registered).

```
[jesper@tranquil ~]$ sudo bbackupd-config /usr/local/etc/boxbackup snapshot 0 backupserver /var/bbackupd /home
```

This creates a configuration in `/usr/local/etc/boxbackup`, uses `snapshot` backup as the account `0` against the server `backupserver`. 
It uses a working dir `/var/bbackupd` and initially backs up `/home`. I need more paths in my backup, 
and this is accomplished by editing the configuration `/usr/local/etc/boxbackup/bbackupd.conf`. Below I have 
added `/root`, `/etc` and my photos `/data1/photo`

```
BackupLocations
{
            home
            {
                        Path = /home
            }
            root-dir
            {
                        Path = /root
            }
            etc
            {
                        Path = /etc
            }
            photo
            {
                        Path = /data1/photo
            }
}
```

We have with the bbackupd-config command created a certificate to be signed by the administrator of the server. 
So send `/usr/local/etc/boxbackup/bbackupd/0-csr.pem` to the administrator, and he will

```
OptiPlex-760 ~ # bbstored-certs certs sign 0-csr.pem
```

and send back `0-cert.pem` and `serverCA.pem` which on the client can be installed under `/usr/local/etc/boxbackup/bbackupd/`

On the client (re)start the daemon `bbackupd` and on the server (re)start the daemon `bbstored`.

Remember to make a copy of the private key on the client in order to be able to read the backups. 
It is located in `/usr/local/etc/boxbackup/bbackupd/0-FileEncKeys.raw`

This should be a secure offsite backup. Without it, you cannot restore backups. Everything else can be replaced. But this cannot. 
KEEP IT IN A SAFE PLACE, OTHERWISE YOUR BACKUPS ARE USELESS.

To make a backup initiated from the client run:

```
/usr/local/bin/bbackupctl -q sync
```

This should be part of a cron-job.
