#!/usr/bin/env bash

while :
do 
  echo "Attempting to push"
  git add . && git commit -m "update" && git push origin main
  sleep 5s
done
