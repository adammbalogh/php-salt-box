install-redis-commander:
  cmd.wait:
    - name: npm install -g redis-commander
    - watch:
      - cmd: make-node

redis-commander-upstart-conf:
  file.managed:
    - name: /etc/init/redis-commander.conf
    - source: salt://_files/upstart/redis-commander.conf
    - template: jinja

start-redis-commander:
  cmd.wait:
    - name: start redis-commander
    - watch:
      - cmd: install-redis-commander
      - file: /etc/init/redis-commander.conf
    - require:
      - file: /etc/init/redis-commander.conf
