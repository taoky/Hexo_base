---
layout: post
title: "KDE 5 体验：「一下拍扁」"
description: "KDE 5 的试用。新的设计风格。"
category: "KDE"
tags: ["KDE 5","Linux"]
---
{% include JB/setup %}

今天……嗯……是情人节暨世界癫痫日。我既没有女生喜欢，又没有癫痫，所以今天还是一个平常的日子。当我看到下载堆栈里的 KDE 5 的体验光盘文件的时候，我想，要不今天不写研究性学习报告了，放松一下，来看看 KDE 最近发展的情况吧。

在用 OS X 之前，我用的操作系统是 Linux，发行版是 Fedora，桌面环境是 KDE。这是一个不错的桌面环境，并且我也不太喜欢 GNOME、Unity 之类的，自然便投向了 Qt 系的桌面环境。只是换了 OS X 之后不再怎么用 Linux 了。那时的 KDE 应该是到了 4.11 吧，稳定性尚可，但有时还会崩溃，更多的是直接卡住。卡着的时候我便知道八成又是用了 swap，swap 一用太多就卡的很。

似乎扯得太多了，直接开始看吧。当然因为是虚拟机试用，所以动画效果之类的会有些缓慢。

我用的是 KDE 提供的[体验光盘文件](http://files.kde.org/snapshots/neon5-latest.iso.mirrorlist)，下载完一开始用的时候发现这张 LiveCD 提供的内容很不全：有中文翻译，但没有中文字体，于是中文字便直接变为「方块字」，没有 PDF 阅读器，自带的浏览器 Konqueror 只有 KHTML 内核的。KHTML 其实还是 WebKit 的源头，但现在已不怎么能跟得上这个 HTML 5 的时代了。

于是尝试配置源下载点东西，但最后放弃了。主要原因是：分配的内存太小，下载一些东西就快用完了（我没分配硬盘）。所以我还是看英文好了。

### 新的扁平风格：看上去不错

![登陆界面](http://taoky.github.io/pic/kde5/login-screen.png)

登陆的界面很现代化，进入之后可以明显注意到 KDE 5 正在尝试一步步抛弃 KDE 4 时代的毛玻璃、立体化（或者说叫拟物化）效果。进入 KDE 的 System Settings，可以明显发现默认的主题已不再是 Oxygen，而是一款新主题：Breeze。从桌面风格、鼠标指针、锁屏界面、KDE 程序风格都发生了较大的变化，除了窗口边框仍然是 Oxygen（但也可以换成 Breeze）以外，其它组件的外貌都变了。从中可以体现出 KDE 开发成员已经在抛弃拟物，尝试扁平。

![Breeze 风格](http://taoky.github.io/pic/kde5/all-breeze.png)

准确地说，KDE 有一点点 Windows 8 设计风格的感觉，但不是很明显。OS X 的影子还是可以体现出来的。

![KDE 窗口效果](http://taoky.github.io/pic/kde5/KDE5-style.png)

下面放几张图，大家看看吧。

![Appearance 1](http://taoky.github.io/pic/kde5/appearance-1.png)

![Appearance 2](http://taoky.github.io/pic/kde5/appearance-2.png)

![Appearance 3](http://taoky.github.io/pic/kde5/appearance-3.png)

![Appearance 4](http://taoky.github.io/pic/kde5/appearance-4.png)

![Appearance 5](http://taoky.github.io/pic/kde5/appearance-5.png)

### 速度与稳定性

嗯，估计是由于使用虚拟机的缘故，KDE 5 的表现并不好。速度不快，但一般也不怎么卡，如果开的程序太多分配的内存不太够的话 Plasma 或者其它的 KDE 进程就会崩溃，也有可能死机。

至于放在真机上 KDE 5 的表现会如何就不清楚了。小内存的机器运行会~~略~~有较大压力。

![KDE 的崩溃](http://taoky.github.io/pic/kde5/crash-kde.png)

### 一些问题

不少程序（Dolphin、Konqueror……几乎除了 System Settings 以外都是）仍然还是 KDE 4 的风格，似乎使用的是 QtCurve 的风格，与新风格非常不协调。并且似乎并没有准备好给 GTK 程序的主题。

![KDE 5 与 KDE 4](http://taoky.github.io/pic/kde5/KDE5-and-4.png)

PS：KDE 5 关于窗口的左边的吉祥物很可爱啊。

同时也发现了一个 Bug：

![一个小 Bug](http://taoky.github.io/pic/kde5/bug-1.png)