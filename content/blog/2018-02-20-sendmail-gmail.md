---
title: Using ssmtp instead of sendmail
date: '2018-02-20'
tags: ['FreeBSD', 'sendmail', 'GMail']
draft: false
summary: Using ssmtp instead of sendmail
images: []
---
I had problems with my mails from my server got categorized as spam in GMail :-(
    
So I decided to use Google's smtp gateway for sending the mails ...

I run FreeBSD:

```bash
[root@prism ~]# uname -a
FreeBSD prism.local 11.0-RELEASE-p9 FreeBSD 11.0-RELEASE-p9 #0: Tue Apr 11 08:48:40 UTC 2017 root@amd64-builder.daemonology.net:/usr/obj/usr/src/sys/GENERIC  amd64
```

First disable `sendmail` (insert this into `/etc/rc.conf`:

```
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"
```

And ensure that `sendmail` is no longer running: `killall sendmail`

Now install (I use `pkg`) `ssmtp`:

```bash
[root@prism ~]# pkg install ssmtp
```

And then to replace `sendmail` with `ssmtp` change your `/etc/mail/mailer.conf` to:

```
sendmail	/usr/local/sbin/ssmtp
send-mail	/usr/local/sbin/ssmtp
mailq		/usr/local/sbin/ssmtp
newaliases	/usr/local/sbin/ssmtp
hoststat	/usr/bin/true
purgestat	/usr/bin/true
```

To use Google's `smtp`, you need to:
* Create an App-password for you GMail account
* Modify `/usr/local/etc/ssmtp/ssmtp.conf`

Goto [apppasswords](https://myaccount.google.com/apppasswords) to create an App-password for the server to use your account.

And insert/uncomment something like this into the `/usr/local/etc/ssmtp/ssmtp.conf`:

```
mailhub=smtp.gmail.com:587
AuthUser=yourmail@gmail.com
AuthPass=yournewapppassword
rewriteDomain=yourdomain.dk
FromLineOverride=YES
UseSTARTTLS=YES
```

You should now be able to send mails from the commandline:

```
mail -v -s \"test subject\" yourmail@something.com
```

I also created a `.forward` file in `/root/` with the to-email where I wanted all my system mail to go.
