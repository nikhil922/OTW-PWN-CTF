#!/bin/sh

USER=bandit1
PASS=$(./bandit0.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "cat ./-"

(>&2 echo "Completed $USER")
