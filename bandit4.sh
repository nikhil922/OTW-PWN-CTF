#!/bin/sh

USER=bandit4
PASS=$(./bandit3.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'cat $(find ./inhere -type f -exec file {} + | grep ASCII | cut -d':' -f1)' 

(>&2 echo "Completed $USER")
