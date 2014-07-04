php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5

php5-fpm:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: php5_ppa
    - names:
      - php5-fpm
      - php5-cli
      - php5-dev
      - php5-intl
      - php5-mcrypt
      - php5-curl
      - php5-memcache
      - php5-mysql
      - php5-xdebug
  service.running:
    - watch:
      - file: /etc/php5/fpm/php.ini

php-ini:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://_files/php/php.ini
    - template: jinja
    - require:
      - pkg: php5-fpm

php-cli-ini:
  file.managed:
    - name: /etc/php5/cli/php.ini
    - source: salt://_files/php/php-cli.ini
    - template: jinja
    - require:
      - file: php-ini
