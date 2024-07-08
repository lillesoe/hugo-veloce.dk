---
title: Get rid of the warning fro AFP shares
date: '2012-01-24'
tags: ['AFP', 'netatalk', 'Mac']
draft: false
summary: 
images: []
---

Does your Mac also complain when you mount a share via AFP (netatalk)? Something like this:

```
Something wrong with the volume\'s CNID DB, using
temporary CNID DB instead. Check server messages
for details. Switching to read-only mode.
```

I solved this by adding a little to the rc.conf:

```
cnid_metad_enable="yes"
```