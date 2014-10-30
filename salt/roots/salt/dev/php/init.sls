php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5

php5-fpm:
  pkg.latest:
    - force_yes: true
    - require:
      - pkgrepo: php5_ppa
    - names:
      - php5-fpm
      - php5-cli
      - php5-dev
      - php5-intl
      - php5-mcrypt
      - php5-curl
      - php5-mysql
      - php5-xdebug
  service.running:
    - watch:
      - file: /etc/php5/fpm/php.ini
      - file: /etc/php5/mods-available/xdebug.ini

php-ini:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://_files/php/php.ini
    - template: jinja
    - require:
      - pkg: php5-fpm

/var/lib/php:
  file:
    - directory
    - user: www-data
    - group: vagrant
    - mode: 775
    - makedirs: True
    - require:
      - pkg: php5-fpm

php-cli-ini:
  file.managed:
    - name: /etc/php5/cli/php.ini
    - source: salt://_files/php/php-cli.ini
    - template: jinja
    - require:
      - file: php-ini

xdebug-ini:
  file.managed:
    - name: /etc/php5/mods-available/xdebug.ini
    - source: salt://_files/php/xdebug.ini
    - template: jinja
    - require:
      - pkg: php5-fpm

xdebug-cli-env-var-php-ide-config:
  cmd.run:
    - name: echo 'export PHP_IDE_CONFIG="serverName=phpsaltbox"' >> /home/vagrant/.bashrc
    - unless: grep 'PHP_IDE_CONFIG' /home/vagrant/.bashrc

xdebug-cli-env-var-xdebug-config:
  cmd.run:
    - name: echo 'export XDEBUG_CONFIG="remote_host=192.168.33.1 idekey=phpsaltbox"' >> /home/vagrant/.bashrc
    - unless: grep 'XDEBUG_CONFIG' /home/vagrant/.bashrc
