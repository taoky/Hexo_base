---
layout: post
title: "班级网页第二版发布！"
description: ""
category: "班级"
tags: ["班级","网页","Bootstrap"]
---


班级网页第二版发布了！使用最新版本的 Bootstrap，全新扁平化设计，更好兼容手机、平板等移动设备，并抛弃对旧版本浏览器（IE 6/7）的支持。

其实新版的班级网页是从八个月前（2013 年 11 月 17 日）开始做的（你没看错）。做了一天，约一个月后（12 月 8 日）又修修补补了一些东西，又两个月后又做了一小部分，然后一直烂尾到……中考结束才继续开始。

现在我表示我终于熟悉用 jekyll 和 liquid 的使用了……表示 liquid 竟然不能进行文件的 I/O 操作，导致制作换页器的时候遇到了很大的阻力，用了两天才解决问题，貌似我踩到了一个坑吧……
<!--more-->
因为 GitHub 上「建议」不要放视频（也放不了，文件太大了），所以视频托管在优酷上，广告什么的我不负责。

另外表示从老师博客上搜集文章也是一件很繁的事情。我居然打开了 Firefox（OS X 上 Firefox 的触摸板体验太差，所以我换 Chrome 了），用 DownThemAll 一页页翻出来下载，然后用 Sublime Text 的文件批量替换网页的各种格式（网易博客的 HTML 文件很乱，各种内嵌 CSS），最后转换成 Markdown，就花了我两天。

另外压缩图片也很繁琐。表示压缩图片需要小心翼翼——可能一个参数没弄好，图片就糊了（在 Retina 屏幕上特别明显）。一开始图片有 >300 M，最后尝试各种压缩方法才压到 <1 M（当然图像的损失很多）。

PS：OS X 上无损压缩可以用 ImageOptim，有损可以尝试安装 imagemagick，然后 `convert -resize 80%x80%` [原图像] [目标图像] 来缩放，运行多次直到压缩到满意效果。

最后发布的时候也踩到一个 jekyll 的大坑。我路径用的是 "/path/file" 这类的，结果放到子目录里面各种文件加载不出。结果新建一个 repo，定义变量 `site.baseurl`，然后各种修改才解决……然后发现 https 的时候因为浏览器的安全规定文件加载不出，最后干脆用 `baseurl = https://...` 这样了。

不管怎么说，沉沉浮浮八个月，它终于上来了，不是吗 :-) ？

附：
班级网页第二版地址：https://taoky.github.io/class-9/index.html

源代码（jekyll）：https://github.com/taoky/ClassV2

发布版本：https://github.com/taoky/class-9/tree/gh-pages