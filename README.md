# auto_ssh
一个批量连接ssh执行命令的工具

[+] 由于第一次登陆是会询问是否接受指纹，所以更新后免rsa密钥指纹验证了

[+] 想要验证指纹，可直接在代码3行【rsa=ture】处将【ture】删除


#### 需要的环境：
  sshpass

#### 简单使用：
####    bash auto_ssh.sh loginfile commandfile
    其中：
    loginfile是含有【IP 账号 密码】的文件
    commandfile是含有【要执行的命令】的文件
    
#### 文件格式：
    ##登陆信息文件使用：【ip 空格 用户名 空格 密码】的格式保存；例：
    
    127.0.0.1       root 123456
    123.123.123.123 user 000000
    111.11.11.1     adm  password 第四个字段这里可以写备注

    ##命令文件内输入要执行的命令即可；例：
    
    cd /opt
    echo "tset" >>./test
    rm -rf ./test
    
  
#### 运行时未加参数，脚本会进行命令提示

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/tip.png)



  
#### 运行成功界面

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/run3.png)



未提示：【  |+| Connected to IP :x.x.x.x  】则是未连接成功

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/run2.png)




#### 脚本会自动检测环境中是否有需要的命令，如果没有，则给出安装建议：

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/install.png)


	Uninstalled sshpass was detected Please install sshpass
	
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



