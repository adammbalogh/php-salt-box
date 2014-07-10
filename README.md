php-salt-box
============
Masterless, Salt powered Vagrant Php box.

### Requirements
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/) 1.3.0+

### Set up
* `git clone --recursive https://github.com/adammbalogh/php-salt-box.git`
* Customize **Vagrantfile** *(optional)*
* `vagrant up` *(takes several minutes)*

### Customize
* change environment in **salt/minion**
  * environment can be **base** (it means dev) or **prod**
* edit configurations in **salt/roots/pillar**
  * see configs.sls.example to the entire configuration

### Know-how
* Simply use the **app** directory as the root of your application
* Go to 192.168.33.10 *(default ip)*
* Go to 192.168.33.10:8080 for tools (phpmyadmin, webgrind)
* Go to 192.168.33.10:8081 for redis admin (redis-commander)

### Components
* ubuntu 12.04
* core (curl, htop...)
* git
* openssl
* nginx 1.6
* php 5.5 (fpm)
  * xdebug (with web and cli debugging by default)
* composer
* mysql 5.5
* nodejs 0.10.22
* redis
* tools
  * phpmyadmin (rev: stable)
  * webgrind
  * redis admin (redis-commander)
