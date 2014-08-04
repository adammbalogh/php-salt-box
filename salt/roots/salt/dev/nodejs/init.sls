# https://gist.github.com/avimar/3092732
source-nodejs:
  git.latest:
    - target: /usr/src/nodejs
    - name: git://github.com/joyent/node.git
    - rev: v{{ salt['pillar.get']('nodejs:version', '0.10.30') }}-release

install-nodejs:
  cmd.run:
    - cwd: /usr/src/nodejs
    - name: ./configure &> /dev/null && make &> /dev/null && make install &> /dev/null
    - onlyif: if [ -z $(node --version) ] || [ $(node --version) != "v{{ salt['pillar.get']('nodejs:version', '0.10.30') }}" ]; then echo "should update"; else exit 1; fi;
    - output_loglevel: quiet
    - require: 
      - git: source-nodejs
