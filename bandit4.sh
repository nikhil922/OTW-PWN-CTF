#!/bin/sh

USER=bandit4
PASS=$(./bandit3.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "find . -type f -exec cat {} + | grep ASCII" 

(>&2 echo "Completed $USER")
