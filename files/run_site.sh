#!/bin/bash
echo "Showing the container's ip:"
ip addr show | grep 'eth0'
echo "Starting sshd:"
/usr/sbin/sshd -D
echo "Ready!"