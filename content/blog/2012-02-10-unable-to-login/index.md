---
title: Remember the permissions for .ssh
date: '2012-02-10'
tags: ['ssh', 'permissions', 'login']
draft: false
summary: 
images: []
---

I had a weid experience. All of a sudden I wasn't able to login on my `NAS` with `ssh`. I use `PKI (RSA)` for login and have disabled pure password login. A `ssh -v revealed:

```
debug1: Authentications that can continue: publickey
3 times.
```

First I thought that the keys didn't match - that was not it (I generated a new pair and installed them - same result).

Then I remembered that sshd is really picky with the permissions on the directories. If the private key in `.ssh` is accessible by others than the user, it will by default fail.

That was it. :-) Now I just need to find out why the permissions has changed...
