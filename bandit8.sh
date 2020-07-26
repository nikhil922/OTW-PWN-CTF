#!/bin/sh

USER=bandit8
PASS=$(./bandit7.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "sort data.txt | uniq -u" 

(>&2 echo "Completed $USER")
