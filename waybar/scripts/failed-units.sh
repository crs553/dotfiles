#!/usr/bin/env bash
set -u

printf '\nSystem failed units\n'
systemctl --failed --no-pager

printf '\nUser failed units\n'
systemctl --user --failed --no-pager

printf '\n'
