#!/bin/sh

while :
do
      clear
      date=$(date +'%Y-%m-%d %k:%M:%S')

      echo === NXP automatic SCRATCh deployment  ===
      echo = $date
      echo =========================================
      echo

      docker run scratchitea3/demonstrator

echo
echo

docker pull scratchitea3/demonstrator
sleep 5

done
