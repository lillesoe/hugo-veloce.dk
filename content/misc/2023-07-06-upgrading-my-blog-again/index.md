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

On my MBP I use `brew` to install Hugo:

```
brew install go
brew install hugo
```

Then I am ready to install the source of my blog:

```
➜  src hugo new site veloce.dk 
Congratulations! Your new Hugo site was created in /Users/jesper/src/veloce.dk.

Just a few more steps...

1. Change the current directory to /Users/jesper/src/veloce.dk.
2. Create or install a theme:
   - Create a new theme with the command "hugo new theme <THEMENAME>"
   - Install a theme from https://themes.gohugo.io/
3. Edit hugo.toml, setting the "theme" property to the theme name.
4. Create new content with the command "hugo new content <SECTIONNAME>/<FILENAME>.<FORMAT>".
5. Start the embedded web server with the command "hugo server --buildDrafts".

See documentation at https://gohugo.io/.
➜  src 
```

I am going to use Hugo Modules:

Use the instruction on the [Theme](https://github.com/chipzoller/hugo-clarity) page to install it as a module.

If you need to keep the modules up to date, use:

```
hugo mod get -u ./...
```