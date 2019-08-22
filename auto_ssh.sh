#!/bin/bash

rsa=

welcome_go(){
	echo '''
	  _________.__    .__.____     ___________
	 /   _____/|  |__ |__|    |    \_   _____/
	 \_____  \ |  |  \|  |    |     |    __)_ 
	 /        \|   Y  \  |    |___  |        \
	/_______  /|___|  /__|_______ \/_______  /
	        \/      \/           \/        \/ 
		Automatic Connection SSH
			from:ShiLE
	'''
	
}
welcome_txt(){
echo '''
please input user and pass file
  	for example:    
 		bash auto_ssh.sh loginfile commandfile
		
		-----------loginfile-----------
		127.0.0.1       root 123456
		123.123.123.123 user 000000
		111.11.11.1     adm  password
		..... ... .....
		-------------------------------

		----------commandfile----------
		cd /
		ls |grep -v bin
		cd /tmp
		ls -al
		-------------------------------
	'''
}




install_help(){
	echo '''
	1. Network Connection 
		redhat : yum -y install sshpass
		ubnutu : apt-get -y install sshpass
	2. No network 
		wget https://jaist.dl.sourceforge.net/project/sshpass/sshpass/1.06/sshpass-1.06.tar.gz
		[Copy files to target computer]
		tar -zxvf sshpass-1.05.tar.gz
		cd sshpass-1.05
		./configure
		make && make install
	'''
}

start_process(){
	echo -e "\e[33m
========================================================
|-| Start the $num process

|>| Test connect IP :$ssh_ip
	\e[0m"
}
command_over(){
	echo -e "\e[33m \n|-| The command is executed.
       
	\e[0m"

}
type sshpass >/dev/null 2>&1 || { 
	echo -e >&2 "\e[33m
	Uninstalled sshpass was detected Please install sshpass
	\e[0m";
	install_help
	exit 1;
}

if [ $rsa ]
	then rsaon_off=" -o StrictHostKeyChecking=no "  
	else rsaon_off=" "
		fi


if [[ ! $1 || ! $2 ]]
	then welcome_txt
	exit
fi

command_s=`cat $2`
num=0
welcome_go
cat $1 |while read line
do
	ssh_ip=`echo $line |awk '{print $1}'`
	ssh_user=`echo $line |awk '{print $2}'`
	ssh_pass=`echo $line |awk '{print $3}'`
	let num=num+1
	start_process
	sshpass -p $ssh_pass ssh $rsaon_off $ssh_user@$ssh_ip <<EOF 
echo -e "\e[33m\n|+| Connected to IP :$ssh_ip \n\n|>| Start executing command \n\e[0m"
$command_s
EOF

command_over
done


