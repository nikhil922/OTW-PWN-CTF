#!/bin/sh

USER=bandit5
PASS=$(./bandit4.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'cat $(find ./inhere -type f -size 1033c ! -executable)' 

(>&2 echo "Completed $USER")
