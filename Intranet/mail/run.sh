#!/bin/bash
service dovecot start
service postfix start

tail -f /dev/null