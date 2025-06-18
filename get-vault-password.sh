#!/bin/sh -

kernel=$(uname -s)

[ "$kernel" = 'Darwin' ] && /usr/bin/security find-generic-password -s homelab-playbooks -a ansible-vault -w && exit
[ "$kernel" = 'Linux' ] && /usr/bin/pass Homelab/playbooks && exit
