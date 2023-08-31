rm -rf public
hugo --gc --minify
rclone -P sync public/ web:/var/www/html/veloce.dk/veloce.dk/
