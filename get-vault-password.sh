#!/bin/sh -
# macOS only
/usr/bin/security find-generic-password -s homelab-playbooks -a ansible-vault -w
