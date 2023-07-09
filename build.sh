rm -rf public
hugo --gc --minify
pushd public; scp -r * berryserver:/var/www/html/veloce.dk/veloce.dk/; popd