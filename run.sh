#!/bin/bash
./node_modules/.bin/supervisor app.js

if [ ! -f /.root_pw_set ]; then
/set_root_pw.sh
fi
exec /usr/sbin/sshd -D
