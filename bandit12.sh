#!/bin/sh

USER=bandit12
PASS=$(./bandit11.sh)
PORT=2220
HOST=bandit.labs.overthewire.org

sshpass -p $PASS ssh -qp $PORT $USER@$HOST '
	if [ -d "/tmp/tmpBan" ] 
	then
		rm -r /tmp/tmpBan
	fi
	mkdir /tmp/tmpBan
	cp data.txt /tmp/tmpBan/
	cd /tmp/tmpBan
	xxd -r data.txt >f0
	mv ./f0 ./f0.gz
	gzip -d ./f0.gz
	mv ./f0 ./f0.bz2
	bzip2 -d ./f0.bz2
	mv ./f0 ./f0.gz
	gunzip ./f0.gz
	mv ./f0 ./f0.tar
	tar xf ./f0.tar
	mv ./data5.bin ./f0.tar
	tar xf ./f0.tar
	mv ./data6.bin ./f0.bz2
	bunzip2 ./f0.bz2
	mv ./f0 ./f0.tar
	tar xf ./f0.tar
	mv ./data8.bin ./f0.gz
	gzip -d ./f0.gz
	cat ./f0 | grep -Eo "\<.{32}\>"
'

(>&2 echo "Completed $USER")
