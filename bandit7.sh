#!/bin/sh

USER=bandit7
PASS=$(./bandit6.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "grep millionth data.txt | sed 's/millionth//g' | sed -e 's/[ \t*]//'" 

(>&2 echo "Completed $USER")
