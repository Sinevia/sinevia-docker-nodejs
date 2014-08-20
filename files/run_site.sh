#!/bin/bash
echo "Showing the container's ip:"
ip addr show | grep 'eth0'
echo "Starting sshd:"
/usr/sbin/sshd -D
echo "Starting node.js:"
/site/node_modules/.bin/supervisor /site/app.js
echo "Ready!"