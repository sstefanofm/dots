#! /usr/bin/env bash

compressed=data.gzip

xxd -r hexdump.txt $compressed

while true; do
  7z l "$compressed" > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    next=$(7z l "$compressed" | grep "Name" -A2 | tail -n1 | awk '{ print $NF }')
    7z x "$compressed" > /dev/null 2>&1 && compressed="$next"
  else
    awk '{ print $NF }' $compressed 
    rm data*
    exit 0
  fi
done

