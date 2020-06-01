#!/bin/bash -e

pidfile="{{ .product.pid }}"
if [ -f "$pidfile" ]
then
  pid=$(cat "$pidfile")
  kill $pid
  i=0
  while [ -e "$pidfile" ]
  do
    i=$[$i+1]
    sleep 1
    if [ $i -eq 10 ]
    then
     kill -9 $pid
    fi
  done
fi