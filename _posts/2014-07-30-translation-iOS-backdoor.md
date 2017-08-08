---
layout: post
title: "渣翻译：Identifying Back Doors, Attack Points, and Surveillance Mechanisms in iOS Devices"
description: ""
category: "翻译"
tags: ["iOS","英文","后门","漏洞"]
---
{% include JB/setup %}

似乎最近关于 iOS 被发现存在后门的事情传得火热，本着不怎么相信媒体评论，自己看传出后门的文档的想法，找到了源文档，顺便用了几个小时翻译了一遍。说是翻译，其实信达雅，一样都没有。有几个词出现很多次，但就算查了词典，也根本不知道是什么意思。我只能保证你看完翻译之后了解事情的大概情况。

源文档：[Here](http://www.zdziarski.com/blog/wp-content/uploads/2014/07/iOS_Backdoors_Attack_Points_Surveillance_Mechanisms_Moved.pdf)

渣翻译文档：[Here](/docs/iOS_backdoor.pdf)

以上。

利益相关：OS X/Linux/Windows/iOS 用户。

PS：Apple 回复原作者发现「后门」事件：

> 我们在设计iOS时，加入了设备诊断功能。这一功能的目的是向(用户所在的)公司的IT维护部门，程序设计者及苹果公司提供信息，以诊断设备。我们确保了这一“设备诊断”功能不会危害用户的隐私和信息安全。任何苹果设备都只有在解锁并连接至可信任的电脑后，苹果才会获取这些有限的诊断信息。如果用户没有同意分享这些信息，我们不会传输任何数据。