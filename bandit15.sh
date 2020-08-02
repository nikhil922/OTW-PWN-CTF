#!/bin/sh

USER=bandit15
PASS=$(./bandit14.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "echo $PASS | openssl s_client -connect localhost:30001 -ign_eof" | sed -n '65p'

(>&2 echo "Completed $USER")
