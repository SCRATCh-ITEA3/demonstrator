#!/bin/sh

while :
do
      clear
      UPSTREAM=${1:-'@{u}'}
      LOCAL=$(git rev-parse @)
      REMOTE=$(git rev-parse "$UPSTREAM")
      BASE=$(git merge-base @ "$UPSTREAM")
      date=$(date +'%Y-%m-%d %k:%M:%S')

      echo === NXP automatic SCRATCh deployment  ===
      echo = $date
      echo =========================================
      echo

      if [ $LOCAL = $REMOTE ]; then
              echo "Up-to-date - output below:"
              echo
              ./src/helloworld
      elif [ $LOCAL = $BASE ]; then
              echo "Need to pull"
              git pull
              gcc -o ./src/helloworld ./src/helloworld.cpp
      elif [ $REMOTE = $BASE ]; then
              echo "Need to push"
      else
              echo "Diverged"
      fi
echo
echo
echo Remote: $REMOTE
echo Local:$LOCAL
git remote update
sleep 5

done
