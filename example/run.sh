#!/usr/bin/env bash

sudo killall socket > /dev/null 2>&1

sudo killall nginx > /dev/null 2>&1

#set nginx web root directory
sed -i '/.*set \$rtdir.*/c\set $rtdir '"$(pwd)"';' $(pwd)/nginx/conf/nginx.conf

sudo $(pwd)/nginx/sbin/nginx -c $(pwd)/nginx/conf/nginx.conf

chibi-scheme -r main.scm

