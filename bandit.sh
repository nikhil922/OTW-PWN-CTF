#!/bin/bash
### Auto SSH OTW-bandit Script ###
# WARNING! put script in folder, cd before running script to prevent files from being possibly deleted 
# NIKHIL JEEWA

start=`date +%s`

#access server
sshAccess(){ 
	sshpass -f ./pass ssh -o StrictHostKeyChecking=no bandit$1@bandit.labs.overthewire.org -p2220 "$2"
} 

#transfer files from remote server to local system
sshCopy(){
	sshpass -f ./pass scp -P 2220 bandit$1@bandit.labs.overthewire.org:$2 $3
}

#level 0-1
#pasword is bandit0
echo "bandit 0"
echo "bandit0"> ./pass
sshAccess 0 'ls'
sshCopy 0 /home/bandit0/readme ./
mv ./readme ./pass
echo "bandit 1 password is: $(<./pass)"

#level 1-2
#password is in a file called -
sshAccess 1 'ls'	
sshCopy 1 /home/bandit1/./- ./
mv ././- ./pass
echo "bandit 2 password is: $(<./pass)"

#level 2-3
#pasword is in a file with spaces in filename use "" or '' or backslash (spaces\ in\ this\ filename)
ban2(){
	ls	
	mkdir /tmp/tempY
	cp "spaces in this filename" /tmp/tempY/f0
}
sshAccess 2 "$(typeset -f ban2); ban2"
sshCopy 2 /tmp/tempY/f0 ./
sshAccess 2 'rm -r /tmp/tempY'
mv ./f0 ./pass
echo "bandit 3 password is: $(<./pass)"

#level 3-4
#password is in a hidden file
sshAccess 3 'ls; cd inhere; ls -a'
sshCopy 3 /home/bandit3/inhere/.hidden ./
mv ./.hidden ./pass
echo "bandit 4 password is: $(<./pass)"

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
sshCopy 4 /home/bandit4/inhere/./-file07 ./
mv ././-file07 ./pass
echo "bandit 5 password is: $(<./pass)" 

#level 5-6
#password has properties: human-readable, 1033 bytes in size, not executable
sshAccess 5 'find -type f -size 1033c ! -executable'
sshCopy 5 /home/bandit5/inhere/maybehere07/.file2 ./
mv ./.file2 ./pass
echo "bandit 6 password is:  $(<./pass)"

#level 6-7
#password is somewhere in server has properties: owned by user bandit7, owned by group6, 33 bytes in size
#/ to search entire file system
#2>dev/null redirects error messages ("Permission denied etc.") from terminal to /dev/null thats discarded by system
sshAccess 6 'find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null'
sshCopy 6 /var/lib/dpkg/info/bandit7.password ./
mv ./bandit7.password ./pass
echo "bandit 7 password is $(<./pass)"

#level 7-8
#password stored in file next to word millionth 
ban7(){
	ls
	#find line with millionth: cat (or strings) data.txt | grep "millionth" or
	grep millionth data.txt
	mkdir /tmp/tempY
	#find line with millionth remove word millionth output to file
	grep millionth data.txt | sed 's/millionth//g' > /tmp/tempY/f0
}
sshAccess 7 "$(typeset -f ban7); ban7"
sshCopy 7 /tmp/tempY/f0 ./
sshAccess 7 'rm -r /tmp/tempY'
mv ./f0 ./pass
echo "bandit 8 password is: $(<./pass)"

rm ./pass

end=`date +%s`
runtime=$((end-start))
echo "*** script took"  $runtime "seconds to execute ***"
