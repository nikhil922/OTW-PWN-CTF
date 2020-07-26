#!/bin/sh

USER=bandit9
PASS=$(./bandit8.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'strings data.txt | grep -Eo "\<.{32}\>"'
 

(>&2 echo "Completed $USER")
