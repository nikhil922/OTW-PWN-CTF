#!/bin/sh

USER=bandit14
PASS=$(./bandit13.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "echo $PASS | nc localhost 30000" | grep -Eo "\<.{32}\>" 
 
(>&2 echo "Completed $USER")
