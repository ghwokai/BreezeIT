#git03
1. git clone
```
    $ git clone https://github.com/schacon/simplegit-progit
```
2. git log
```
    $ git log -p -2
    $ git log --stat
    $ git log --pretty=online
    $ git log --pretty=format:"%h - %an, %ar : %s"
    $ git log --pretty=format:"%h %s" --graph
    $ git log --since=2.weeks
    $ git log --until="2008-01-15"
    $ git log -S <string>

```
```
     Table 2-1. git log --pretty=format 常用的选项

    %H      提交对象（commit）的完整哈希字串

    %h      提交对象的简短哈希字串哈希字串

    %T      树对象（tree）的完整哈希字串

    %t      树对象的简短哈希字串

    %P      父对象（parent）的完整哈希字串

    %p      父对象的简短哈希字串

    %an     作者（author）的名字

    %ae     作者的电子邮件地址

    %ad     作者修订日期（可以用 --date= 选项定制格式）

    %ar     作者修订日期，按多久以前的方式显示

    %cn     提交者(committer)的名字

    %ce     提交者的电子邮件地址

    %cd     提交日期

    %cr     提交日期，按多久以前的方式显示

    %s      提交说明
```
```
    Table 2-2. git log 的常用选项
    -p                  按补丁格式显示每个更新之间的差异。

    --stat              显示每次更新的文件修改统计信息。

    --shortstat         只显示 --stat 中最后的行数修改添加移除统计。

    --name-only         仅在提交信息后显示已修改的文件清单。

    --name-status       显示新增、修改、删除的文件清单。

    --abbrev-commit     仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。

    --relative-date     使用较短的相对时间显示（比如，“2 weeks ago”）。

    --graph             显示 ASCII 图形表示的分支合并历史。

    --pretty            使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。
```
```
     Table 2-3. 限制 git log 输出的选项

    -(n)                仅显示最近的 n 条提交

    --since, --after    仅显示指定时间之后的提交。

    --until, --before   仅显示指定时间之前的提交。

    --author            仅显示指定作者相关的提交。

    --committer         仅显示指定提交者相关的提交。

    --grep              仅显示含指定关键字的提交

    -S                  仅显示添加或移除了某个关键字的提交
```
