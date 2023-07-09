---
title: Upgrading my blog
date: '2022-09-09'
tags: ['hello']
draft: false
summary: Today I started moving my blog to NextJS
thumbnail: "blog-svgrepo-com.svg"
---

Today I started moving my blog to NextJS. Both new and old blog posts will be migrated here as time lets.

I have adopted the template from [GitHub](https://tailwind-nextjs-starter-blog.vercel.app/)

Please be gentle - I am learning ...

The old posts are taken from at WordPress database dump ;-)

As the NextJS framework is served ny e NodeJS server, I need to have that automatically started. I guess the
standard says [PM2](https://pm2.keymetrics.io/). So I have installed that `npm install pm2 -g` and added the 
"build" of my NextJS blog.

```
pm2 start npm --name veloce -- run serve
pm2 save
```

In order for `systemd`to start `pm2` on boot:

```
$ pm2 startup
[PM2] You have to run this command as root. Execute the following command:
      sudo su -c "env PATH=$PATH:/home/unitech/.nvm/versions/node/v14.3/bin pm2 startup <distribution> -u <user> --hp <home-path>
```

My `nginx`need to forward trafic to the port that `NodeJS` exposes my blog on:

```
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name veloce.dk;

    ssl_certificate /etc/letsencrypt/live/veloce.dk/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/veloce.dk/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
    add_header Strict-Transport-Security "max-age=31536000" always;
    ssl_trusted_certificate /etc/letsencrypt/live/veloce.dk/chain.pem;
    ssl_stapling on;
    ssl_stapling_verify on;

    # Security / XSS Mitigation Headers
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```