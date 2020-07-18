#!/bin/bash
### Auto SSH Wargame Script ###
#NIKHIL JEEWA

sshAccess(){ 
	sshpass -f ./otw/tmp/pass ssh -o StrictHostKeyChecking=no bandit$1@bandit.labs.overthewire.org -p2220 "$2"
} 

sshCopy(){
	sshpass -f ./otw/tmp/pass scp -P 2220 bandit$1@bandit.labs.overthewire.org:$2 $3
}

autoSSH(){
	mkdir ./otw/tmp

	#level 0-1
	echo "bandit 0"
	echo "bandit0"> ./otw/tmp/pass
	sshAccess 0 'ls'
	sshCopy 0 /home/bandit0/readme ./otw/tmp
	mv ./otw/tmp/readme ./otw/tmp/pass
	echo "bandit 1 password is: $(<./otw/tmp/pass)"
	
	#level 1-2
	sshAccess 1 'ls'	
	sshCopy 1 /home/bandit1/./- ./otw/tmp
	mv ./otw/tmp/./- ./otw/tmp/pass
	echo "bandit 2 password is: $(<./otw/tmp/pass)"

	#level 2-3
	ban2(){
		ls
		mkdir /tmp/tempY
		cp "spaces in this filename" /tmp/tempY/f0
}
	sshAccess 2 "$(typeset -f ban2); ban2"
	sshCopy 2 /tmp/tempY/f0 ./otw/tmp
	sshAccess 2 'rm -r /tmp/tempY'
	mv ./otw/tmp/f0 ./otw/tmp/pass
	echo "bandit 3 password is: $(<./otw/tmp/pass)"

	rm -r ./otw/tmp
}
autoSSH;
