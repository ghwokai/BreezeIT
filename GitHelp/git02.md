#git02
##git staging area
1. git log
```
    $ git log -stat
    $ git log --pretty=oneline
```
2. git diff
```
    $ git diff
    $ git diff HEAD
```
3. git status
```
    $ git status -s
```
4. git clone [URL]
```
    $ git clone https://github.com/libgit2/libgit2

    $ git clone https://github.com/libgit2/libgit2 mylibgit
```
5. git add \<file/folder\>
```
    $ git add  ttt.txt
```
6. .gitignore
```
    文件 .gitignore 的格式规范如下：

    所有空行或者以 ＃ 开头的行都会被 Git 忽略。

    可以使用标准的 glob 模式匹配。

    匹配模式可以以（/）开头防止递归。

    匹配模式可以以（/）结尾指定目录。

    要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（!）取反。
```
7. git diff
```
    $ git diff
    $ git diff --cached
    $ git diff --staged
    $ git diff HEAD
```
```
    modified          staged           committed
      |      git diff   |   git diff --cached|
      | git         diff        HEAD         |
```
8. git commit
```
    $ git commit
    $ git commit -m "contents"
    $ git commit -a  //自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤
```
9. git rm
```
    $ git rm <file>
    $ git rm --cached <file>
    $ git rm -f <file>
```
10. git mv
```
    $ git mv README.md README  //重命名
```
