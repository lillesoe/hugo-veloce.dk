---
title: Upgrading my blog - again
date: '2023-07-06'
tags: ['hello']
draft: false
summary: Today I started moving my blog to Hugo
thumbnail: "blog-svgrepo-com.svg"
---

Today I started moving my blog to Hugo. Both new and old blog posts will be migrated here as time lets.

I have adopted the template from [GitHub](https://themes.gohugo.io/themes/hugo-clarity/)

Please be gentle - I am learning ...

The old posts are in md format, so they could be used directly.

Now I can host without `NodeJS`, so I can disable that:

```
pm2 unstartup
```

And remove `NodeJS`:

```
sudo apt purge --autoremove nodejs npm
```
