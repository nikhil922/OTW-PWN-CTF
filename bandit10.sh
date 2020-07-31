#!/bin/sh

USER=bandit10
PASS=$(./bandit9.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'base64 -d data.txt | grep -Eo "\<.{32}\>"'
 
(>&2 echo "Completed $USER")
