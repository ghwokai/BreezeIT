#git 01.md
##git config
1.user config
```
    $ git config --global user.name "name"
    $ git config --global user.email "email@xxx.com"
```
2.editor
```
    $ git config --global core.editor xxxeditor
```
3.config
```
    $ git config --list
```
git config \<key\>  

4.alias
```
    $ git config --system alias.st staus
    $ git config --system alias.ci commit

    $ git config --global alias.st status
    $ git config --global alias.ci commit
```
and so on  
  
5.git help
```
    $ git help <verb>
    $ git <verb> --help
    $ man git-<verb>
    
    $git help config
```
##git init
1.init
```
    $ cd /path/workspace
    $ git init demo

    $ cd demo
    $ ls -aF
```
.git目录就是版本库（repository）  

2.add commit
```
    $ echo "Hello" > welcome.txt
    $ git add welcome.txt

    $ git commit -m "add wel"
```
```
    $ git grep "工作区文件内容搜索"
```
显示.git目录所在
```
    $ git rev-parse --git-dir
```
显示工作区根目录
```
    $ git rev-parse --show-toplevel
```
显示相对于工作区根目录的相对目录
```
    $ git rev-parse --show -prefix
```
显示当前目录后退到工作区根的深度
```
    $ git rev-parse --show-cdup
```
日志
```
    $ git log --pretty=fuller
```

##git01 over

