#!/bin/bash
### Auto SSH Wargame Script ###
#NIKHIL JEEWA

#access server
sshAccess(){ 
	sshpass -f ./otw/tmp/pass ssh -o StrictHostKeyChecking=no bandit$1@bandit.labs.overthewire.org -p2220 "$2"
} 

#transfer files from remote server to local system
sshCopy(){
	sshpass -f ./otw/tmp/pass scp -P 2220 bandit$1@bandit.labs.overthewire.org:$2 $3
}

#mkdir ./otw/tmp

#level 0-1
#pasword is bandit0
echo "bandit 0"
echo "bandit0"> ./otw/tmp/pass
sshAccess 0 'ls'
sshCopy 0 /home/bandit0/readme ./otw/tmp
mv ./otw/tmp/readme ./otw/tmp/pass
echo "bandit 1 password is: $(<./otw/tmp/pass)"

#level 1-2
#password is in a file called -
sshAccess 1 'ls'	
sshCopy 1 /home/bandit1/./- ./otw/tmp
mv ./otw/tmp/./- ./otw/tmp/pass
echo "bandit 2 password is: $(<./otw/tmp/pass)"

#level 2-3
#pasword is in a file with spaces in filename use "" or '' or backslash (spaces\ in\ this\ filename)
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

#level 3-4
#password is in a hidden file
sshAccess 3 'ls; cd inhere; ls -a'
sshCopy 3 /home/bandit3/inhere/.hidden ./otw/tmp
mv ./otw/tmp/.hidden ./otw/tmp/pass
echo "bandit 4 password is: $(<./otw/tmp/pass)"

#level 4-5
#password is stored in the only human-readable file
ban4(){
	cd inhere
	echo "list of files and their types using wildcard:"
	file ./-file*
	echo "list files and their types using xargs:"
	find . -type f | xargs file
	echo "list only human-readable files:"
	find . -type f -exec file {} + | grep ASCII
}
sshAccess 4 "$(typeset -f ban4); ban4"
sshCopy 4 /home/bandit4/inhere/./-file07 ./otw/tmp
mv ./otw/tmp/./-file07 ./otw/tmp/pass
echo "password for level 5 is: $(<./otw/tmp/pass)" 

#level 5-6
#password has properties: human-readable, 1033 bytes in size, not executable
sshAccess 5 'find -type f -size 1033c ! -executable'
sshCopy 5 /home/bandit5/inhere/maybehere07/.file2 ./otw/tmp
mv ./otw/tmp/.file2 ./otw/tmp/pass
echo "bandit 6 password is:  $(<./otw/tmp/pass)"

#level 6-7
sshAccess 6 'ls -a'

#rm -r ./otw/tmp
