# vimtutor学习  

## 1、 vimtutor学习录制  

* Lesson 1 https://asciinema.org/a/AhRlfI85rTiQREPkcEvaHa2jJ  
* Lesson 2 https://asciinema.org/a/M4NCk9TXOv9BiSmFGIRUN854Z  
* Lesson 3 https://asciinema.org/a/BzyWGwR0W69AnX8hgLJX5k39U  
* Lesson 4 https://asciinema.org/a/9ghhGhKQqdQ1KPep9u4j2UCdf  
* Lesson 5 https://asciinema.org/a/Bxqk9BHvWVYT3IKWesJD3hhRu  
* Lesson 6 https://asciinema.org/a/9U1iS0wyzQdXH4GS7SBeRcpmz  
* Lesson 7 https://asciinema.org/a/PKXQQWO6WqNtROwnU11OcPsFl  

## 2、vimtutor自查清单  

(1) 你了解vim有哪几种工作模式？   

- 正常模式 (Normal-mode)
- 插入模式 (Insert-mode)
- 命令模式 (Command-mode)
- 可视模式 (Visual-mode) 

(2) Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？  
- 10j  

(3) 如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？  
- 快速移动到文件开始行: gg  
- 快速移动到文件结束行: G  
- 快速跳转到文件中的第N行: NG  

(4) Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？  
- 删除单个字符: x  
- 删除单个单词: dw
- 从当前光标位置一直删除到行尾: d$
- 从当前光标位置一直删除单行: dd  
- 从当前光标位置一直删除当前行开始向下数N行: Ndd  

(5) 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？  
- 在vim中快速插入N个空行: 100o  
- 在vim中快速输入80个-: 80i-<ESC>  

(6) 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？  
- 撤销最近一次编辑操作: u  
- 重做最近一次被撤销的操作: CTRL-R

(7) vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？  
- 剪切粘贴  
 - 单个字符: x p  
 - 单个单词:  dw p
 - 单行: dd p
- 复制粘贴  
  - 复制：进入visual模式 选中 复制内容，执行y。   
  - 粘贴：执行p


(8) 为了编辑一段文本你能想到哪几种操作方式（按键序列）？  
- vim 打开文件： vim filename
- i 进入插入模式： 写文件
- :wq 保存并退出文件  

(9) 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？
- 查看当前正在编辑的文件名的方法: Normal模式下 :f
- 查看当前光标所在行的行号的方法: Ctrl+G  


(10) 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？  
- 关键词搜索: /worlds
-	忽略大小写的情况下进行匹配搜索: set ic
-	高亮: set hls is
-	批量替换:
  - #,#s/old/new/g 其中，#,#是要更改的行号的范围  
  - %s/old/new/g 更改全文件中的所有事件。  
  -  %s/old/new/gc 更改全文件中的所有事件,并给出替换与否的提示。  


(11) 在文件中最近编辑过的位置来回快速跳转的方法？  
- Ctrl+O（以前）、Ctrl+I（以后）  

(12) 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }  
- 把光标定位到各种括号的匹配项：把光标放到(, [, or {对应匹配的),], or }上，按‘%’  


(13) 在不退出vim的情况下执行一个外部程序的方法？  
- :!command  

(14) 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？  
- : help 快捷键名称
- 在两个不同的分屏窗口中移动光标：Ctrl+w
