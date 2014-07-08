nginx_ppa:
  pkgrepo.managed:
    - ppa: nginx/stable

nginx:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: nginx_ppa
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-enabled/tools
      - file: /etc/nginx/sites-enabled/default
      - pkg: nginx

/var/www/app:
  file:
    - directory
    - user: vagrant
    - group: vagrant
    - mode: 775
    - makedirs: True

/var/www/tools:
  file:
    - directory
    - user: vagrant
    - group: vagrant
    - mode: 775
    - makedirs: True

nginx-conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://_files/nginx/conf/nginx.conf
    - template: jinja
    - require:
      - file: /var/www/app
      - file: /var/www/tools
      - pkg: nginx

nginx-vhost-default:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://_files/nginx/vhosts/default
    - template: jinja
    - require:
      - file: nginx-conf
      - pkg: nginx

nginx-vhost-default-enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/default
    - target: /etc/nginx/sites-available/default
    - require:
      - file: nginx-vhost-default

nginx-vhost-tools:
  file.managed:
    - name: /etc/nginx/sites-available/tools
    - source: salt://_files/nginx/vhosts/tools
    - template: jinja
    - require:
      - file: nginx-vhost-default
      - pkg: nginx

nginx-vhost-tools-enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/tools
    - target: /etc/nginx/sites-available/tools
    - require:
      - file: nginx-vhost-tools
