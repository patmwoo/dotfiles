# dotfiles
## macOS setup
1. Clone this repo to any location
2. Run macOS.sh
3. Manually do the following (optional)
    * Set mouse/trackpad tracking speed
    * Put installed apps onto second page of Launchpad
    * Removed unused apps from dock and add installed apps
    * Remove unnecessary items from Finder sidebar (in Preferences of Finder)
    * Install ClearPass OnGuard

## Bash setup
1. Clone this repo to any location
2. Run bash.sh from root directory of dotfiles repo (script will remove local repo when complete)

## Web dev environment setup
Note, most of the necessary information on what needs to be done can be found from the end of the output of the brew install command for each of the following.

#### Apache
1. Install Apache with `brew install apache`
2. Set the default port to 80 in /usr/local/etc/httpd/httpd.conf (this will make it so starting Apache requires sudo but that is okay)
3. Run `sudo apachectl start` to start Apache

#### PHP
1. Install PHP with `brew install php`
2. Add the following to httpd/httpd.conf to enable PHP in Apache (requires Apache restart)
```
LoadModule php7_module /usr/local/opt/php/lib/httpd/modules/libphp7.so
<FilesMatch .php$>
    SetHandler application/x-httpd-php
</FilesMatch>
```
3. Ensure that DirectoryIndex in httpd.conf include index.php like the following
```
DirectoryIndex index.php index.html
```
4. Run `php-fpm` to start PHP

### MySQL
1. Install MySQL with `brew install mysql`
2. Run `mysql.server start` to start MySQL server
