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
	#level 0-1
	echo "bandit 0"
	mkdir ./otw/tmp
	echo "bandit0"> ./otw/tmp/pass
	sshAccess 0 'ls'
	sshCopy 0 /home/bandit0/readme ./otw/tmp
	mv ./otw/tmp/readme ./otw/tmp/pass
	echo "bandit 1 password is: $(<./otw/tmp/pass)"
	
	rm -r ./otw/tmp
}
autoSSH;
