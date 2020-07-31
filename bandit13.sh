#!/bin/sh

USER=bandit13
PASS=$(./bandit12.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "ssh -o StrictHostKeyChecking=no -q -i \$(ls) bandit14@localhost 'cat /etc/bandit_pass/bandit14'"
 
(>&2 echo "Completed $USER")
