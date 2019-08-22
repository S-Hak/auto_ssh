# auto_ssh
一个批量连接ssh执行命令的工具

### 需要的环境：
  sshpass

### 简单使用：
####    bash auto_ssh.sh loginfile commandfile
    其中：
    loginfile是含有IP 账号 密码的文件
    commandfile是含有执行的命令的文件
    
#### 文件格式：
    ##登陆信息文件使用：【ip 空格 用户名 空格 密码】的格式保存；例：
    127.0.0.1       root 123456
		123.123.123.123 user 000000
		111.11.11.1     adm  password
    ##命令文件内输入要执行的命令即可；例：
    cd /opt
    echo "tset" >>./test
    rm -rf ./test
    
  
### 运行时未加参数，脚本会进行提示

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/tip.png)

  
### 运行成功界面

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/run1.png)

##### 未提示：  |+| Connected to IP :x.x.x.x  则是未连接成功

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/run2.png)


### 脚本会自动检测环境中是否有需要的命令，如果没有，则给出安装建议：

![image](https://github.com/ShiLE-up/auto_ssh/blob/master/images/install.png)


