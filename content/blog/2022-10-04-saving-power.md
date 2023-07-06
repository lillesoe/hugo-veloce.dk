---
title: Saving Power
date: '2022-10-04'
tags: ['power', 'green', 'linux']
draft: false
summary: I wanted to save power due to the high energy prices. I have a NAS running 24/7.
images: []
---

I wanted to save power due to the high energy prices. I have a NAS running 24/7.

It turns out the there is a way to program the RTC in the NAS to wake up on a specified time: `rtcwake`.

First I needed to ensure that if my RTC was in UTC;

```
➜  ~ timedatectl
               Local time: Tue 2022-10-04 20:55:19 CEST
           Universal time: Tue 2022-10-04 18:55:19 UTC
                 RTC time: Tue 2022-10-04 18:55:19
                Time zone: Europe/Copenhagen (CEST, +0200)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

Then I can create a cron job that issues the `rtcwake` at the right time:

```0 22 * * * /usr/sbin/rtcwake -m off -s 43200```

So every day at 22 hours (10pm) turn the NAS off, and set the wakeup to be 43200 later (12 hours)
