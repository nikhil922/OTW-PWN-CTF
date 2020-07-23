#!/bin/sh

USER=bandit3
PASS=$(./bandit2.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "cat inhere/.hidden"

(>&2 echo "Completed $USER")
