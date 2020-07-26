#!/bin/sh

USER=bandit0
PASS=bandit0
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST "cat readme"

(>&2 echo $PASS "Completed $USER")
