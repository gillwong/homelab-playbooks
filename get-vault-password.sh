#!/bin/sh -

kernel=$(uname -s)

[ kernel = 'Darwin' ] && /usr/bin/security find-generic-password -s homelab-playbooks -a ansible-vault -w
[ kernel = 'Linux' ] && /usr/bin/pass Homelab/playbooks
