# 灵感来源
   我在读研学习计算机的过程中，无数次重复输入各种字符串，有些很难记忆，也没有必要记忆；
   
在我找工作的时候，需要记忆java的基础知识，这些东西本来是百度就可以找到的，但是局限于时间和有时候的不让访问外部数据限制，所以必须占用我可怜的脑部空间；

我一直尝试用搜狗，但是它在支持上做的不够好，不好添加，修改和管理，难以记忆添加过的东西，我也尝试找其他的软件，发现没有一款能满足我的要求，例如需要输入多行，并且有描述信息，便于添加和修改；

所以我无数次想做一款快捷短语，能够快速输入重复字符串，并且能够管理，利于记忆。

在华为工作之后，依然没有放弃最初的想法，因为在工作中存在更多的同样问题，所以利用晚上和周末的时间尝试无数中方案，对比过C++，QT，C#，electron，python等桌面开发框架，最终发现了windows神器：AutoHotkey，基于此开发周期短，开发的包比较小，最终耗费数月的精力完成了该软件。

目前该软件完美实现我的想法，每天用的最多的除了chrome，idea，就是他了!
![image](https://user-images.githubusercontent.com/10683246/142795763-49bcb223-12ec-406a-bc10-196132f2ea44.png)

软件在此，完全开源和免费，好东西也不好推广，觉得好用的话请点个star鼓励一下吧，并推荐给你女朋友hhh，解放双手，释放脑部空间：
https://github.com/zttAsoiaf/smartString/edit/master/README.md

看看效果吧：

![image](https://user-images.githubusercontent.com/10683246/142794422-acbc318b-e107-4b2d-941d-f002dbd04284.png)

PS： 我所在部门CBG在进行招聘工作，java后端工程师，待遇好，奖金高（15级综合约 50+），有意愿的可以找我进行内推。



# 智能字符串

#### 介绍
智能字符串，用于快捷进行文字处理，当前主要功能是提供缩略语功能（快捷短语），可以添加常用的缩略语，对于任何的电脑工作者均有巨大帮助，可以快捷的打印出任意多行文字。
例如：

dh] -> 13128812409 这是我的微信号

gh] -> 工号

sfz -> 身份证

dz -> 淘宝地址

jm -> java main函数

jp -> System.out.println(); java打印

jt -> java 测试函数

无论在中英文状态下，均可以打印出来。

本软件致力于减少重复文字处理工作，提升工作效率，不论您是学生，程序员，律师，会计，客服等均可使用此软件来简化输入。

软件基本功能完善，后续实用且有趣的功能会陆续开发中。

#### 安装教程

1.  下载并解压，
git 下载：https://github.com/zttAsoiaf/smartString/archive/master.zip

![git 下载](https://images.gitee.com/uploads/images/2020/0301/035908_cd391ef0_5544911.png "屏幕截图.png")


如果网络不好可以在gitee下载（需要注册账号）：https://gitee.com/smartString/smartString/repository/archive/master.zip

![gitee下载](https://images.gitee.com/uploads/images/2020/0223/143847_76c9177e_5544911.png "屏幕截图.png")



2.  点击[AutoHotkey_1.1.32.00_setup.exe]进行安装，或者从Autohotkey官网下载安装。
3.  点击start.ahk启动。

#### 使用说明

1.  点击start.ahk进入主界面，可以查看所有的快捷短语，【win + n】 进行刷新。
2.  使用鼠标划取要添加短语，然后使用快捷键【win + z】来添加短语。
3.  尝试在编辑的地方打印 dh] 看看效果。
4.  所有的快捷短语的触发键为 ]（暂时不允许修改）, 所以请关闭搜狗的【左右方括号选词】

![输入图片说明](https://images.gitee.com/uploads/images/2020/0223/181454_adc75a60_5544911.png "屏幕截图.png")


#### 注意事项
 **此软件暂时没有云端备份功能，因此更新软件时务必将自定义的短语文件[phrase.ahk]和[send.ahk]备份，否则自定义短语会丢失。** 

#### 参与贡献

1. 在gitee留下您的建议。
2. 提交代码。
3. 点击star按钮收藏。
