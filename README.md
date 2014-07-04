php-salt-box
============
Masterless, Salt powered Vagrant Php box.

### Requirements
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/) 1.3.0+

### Set up
* `git clone https://github.com/adammbalogh/php-salt-box.git`
* Customize **Vagrantfile** *(optional)*
* `vagrant up` *(takes several minutes)*

### Customize
* change environment in **salt/minion**
  * environment can be **base** (it means dev) or **prod**
* edit configurations in **salt/roots/pillar**
  * see configs.sls.example to the entire configuration

### Know-how
* Simply use the **www** directory
* Go to 192.168.33.10 *(default ip)*

### Components
* core
  * mc
  * htop
  * zip
  * unzip
* git 
* openssl
* nginx
* php-fpm (php5.5)

### Todo
* components
  * composer
  * mysql
  * mongodb
  * redis
  * xdebug
  * python
