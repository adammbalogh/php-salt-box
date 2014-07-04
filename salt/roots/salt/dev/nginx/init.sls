nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default
      - pkg: nginx

nginx-conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://_files/nginx/conf/nginx.conf
    - template: jinja
    - require:
      - pkg: nginx

nginx-vhost-default:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://_files/nginx/vhosts/default
    - template: jinja
    - require:
      - pkg: nginx

nginx-vhost-default-enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/default
    - target: /etc/nginx/sites-available/default
    - require:
      - file: nginx-vhost-default
