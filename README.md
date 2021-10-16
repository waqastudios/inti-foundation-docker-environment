# Deploy WordPress and Inti Foundation on Docker

### Deploy WordPress with:
 * nginx
 * mysql
 * php
 * phpmyadmin

With [Inti Foundation](https://github.com/waqastudios/inti-foundation) (or any WordPress Theme) allowing use of:
 * ssl
 * gulp
 * npm and node modules
 * wp-cli


## Built for Foundation 6.6.x
[Inti Foundation](https://github.com/waqastudios/inti-foundation) is a WordPress parent theme that uses [Foundation for Sites](https://get.foundation/) 6.6, the most advanced responsive front-end framework in the world.


## Description
This repo contains a set of Docker files to quickly bring up a local development environment for WordPress that mirrors many typical hosting environments. In particular it is tailored to one specific theme framework, but is very easily adapted to any other theme framework and is a good model to follow for setting up any custom WordPress development environment.

## Getting Started
#### To begin:
You'll find a Makefile included that can run a series of commands that you can otherwise perform manually if you'd prefer, just reference the file and the correct sections below and follow the same order.

 * Edit docker-compose.yml, and if you're going to use the node container, find and rename the theme directory in in the node: service's volumes: and working_directory:

```
  node:
...
    volumes:
      - ./wordpress:/var/www/html:delegated
      - /usr/local/lib/node_modules/**inti-acf-starter**/node_modules
    working_dir: /var/www/html/wp-content/themes/**inti-acf-starter**
```

 * Run `make install` to build all the relevant Docker containers from images. This will also automatically download the latest version of WordPress.
 * Open https://localhost/ in your browser and set the same details found in docker-compose.yml (wpdb, wpdbuser, secret) and proceed to install WordPress via the browser.

If you are using your own theme framework, you're all done!

#### To continue with Inti Foundation:
If you're using [Inti Foundation](https://github.com/waqastudios/inti-foundation) with [Inti ACF Starter](https://github.com/waqastudios/inti-acf-starter):

 * Run `make configure` to download the themes and prepare everything.
 * If you are using ACF, install it now. You can do this via the browser, or use the wp-cli container for all your wp-cli needs! i.e. `docker-compose run --rm wp plugin install <path or url> --activate`
 * Rename the theme folder (i.e. acf-starter) and style.css theme name to your project name and activate theme. It will have no CSS or JS yet. (If you didn't choose a new theme directory name in the first steps, where you edited docker-compose.yml, bring down the containers now with `make down`, make the edits, and bring up with `make up`, then continue)
 * In a side terminal window or new tab, go into the nodejs container with `docker exec -it nodejs sh`
 * Inside that container, run `gulp default`, to compile CSS and JS. Browsersync server will begin the server.
 * WordPress will still be accessible via https://localhost/ as before, but a Browsersync server with live reload will be available at https://localhost:3000/ (with a security warning, to be fixed). Use the first to access the Dashboard and the former to view your CSS or JS changes in realtime.
