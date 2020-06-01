#!/bin/bash -e

pidfile="{{ .product.pid }}"
if [ ! -f "$pidfile" ]
then
  httpd -k start
  i=0
  while [ ! -f "$pidfile" ]
  do
    i=$[$i+1]
    sleep 1
    if [ $i -eq 60 ]
    then
     exit 1
    fi
  done
fi