#!/bin/sh

USER=bandit6
PASS=$(./bandit5.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'cat $(find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null)' 

(>&2 echo "Completed $USER")
