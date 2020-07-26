#!/bin/sh

USER=bandit2
PASS=$(./bandit1.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "cat 'spaces in this filename'"

(>&2 echo "Completed $USER")
