#!/bin/sh

USER=bandit11
PASS=$(./bandit10.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST 'cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' | grep -Eo "\<.{32}\>"'
 

(>&2 echo "Completed $USER")
