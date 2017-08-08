---
layout: post
title: "Markdown 简要使用手册"
description: ""
category: "Markdown"
tags: ["Markdown", "手册"]
---


Markdown 是一种简单易用的标记语言。它被用来编写简单的多格式的文档，语法简单。纵使你不了解它的语法，你也非常容易看懂 Markdown 文档。它可以被转换为 HTML。它有助于编写结构化的文档，实现内容与结构的~~有机统一~~分离。（简单的说，就是 Markdown 写的是结构，至于长什么样子是 CSS 的事）
<!--more-->
初次使用时注意一个特点：段与段之间需要空一行。不然下面的文档：

```
First line
Second line
```

会变成以下 HTML 代码：


	<p>First line
	Second line</p>


在 `<p>` 标签中有空行，然而这并没有什么用，显示结果是：

- - -
First line
Second line
- - -

另外，当有一些「特殊的字符」时，需要在字符前加入「\」（反斜杠），不然 Markdown 会解析成别的东西。

### 标题

使用：

```
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

Markdown 将根据 # 的个数，分别使用 `<h1>` 到 `<h6>` 的标签显示标题。

### 引用

使用：

```
> 640 K ought to be enough for anybody.
```

显示为：

---
> 640 K ought to be enough for anybody.

---

### 列表

#### 无序列表

使用：

```
* Review lessons
* Update software
* Write an article
```

（`*` 也可以用 `-`）

显示为：

---
* Review lessons
* Update software
* Write an article

---

#### 有序列表

使用：

```
1. Install OS X 10.10
2. Open 'Terminal.app'
3. Input 'ls'
```

显示为：

---
1. Install OS X 10.10
2. Open 'Terminal.app'
3. Input 'ls'

---

不管序号前面的数字是什么，这个列表都会按正整数顺序输出。

注意：列表包含多个段落时需要缩进（四个空格或一个制表符），像这样：

```
1. Today is a nice day.

	I hope you will think so.
	
2. Sorry.
```

### 代码

#### 区块代码

使用：

	```
	#include <stdio.h>
	
	int main(void)
	{
		printf("Hello, world!\n");
		return 0;
	}
	```
	
或者每行前加入缩进。

显示为：

---
```
#include <stdio.h>

int main(void)
{
	printf("Hello, world!\n");
	return 0;
}
```

---

#### 行内代码

使用：

```
The first line of the code of a HTML5 web page is ``<!DOCTYPE html>``.
```

显示为：

---
The first line of the code of a HTML5 web page is ``<!DOCTYPE html>``.

---

如果代码内无 `` ` ``，也可以使用 `` `Code Inside...` `` 单个包裹。

### 分隔符

使用：

```
---
***
```

都可以。

### 文本强调

使用：

```
**Attention!**: System will close all connections in 30 minutes!

*Isn't it amazing?*
```

显示为：

---
**Attention!**: System will close all connections in 30 minutes!

*Isn't it amazing?*

---

### 其它文本行内样式（部分）

注意：部分程序可能不支持。不同程序可能支持标准不同。

使用：

```
~~What I said is wrong.~~

<http://www.github.com>
```

显示为：

---
~~What I said is wrong.~~

<http://www.github.com>

---

### 图片

使用：

```
![Test (Alt Text)](/pic/md/test.png "Photo in markdown")
```

显示为：

---
![Test (Alt Text)](/pic/md/test.png "Photo in markdown")

---

其中引号内可选。

或者是「参考式」：


	![Test (Alt Text)][2536]
	[2536]: /pic/md/test.png "Photo in markdown"


### 链接

使用：


	Fork this repo: [website]("http://www.github.com" "GitHub")

	Wikipedia: [English][wiki]
	
	[wiki]: http://en.wikipedia.org "Wikipedia"


显示为：

- - -
Fork this repo: [website]("http://www.github.com" "GitHub")

Wikipedia: [English][wiki]

[wiki]: http://en.wikipedia.org "Wikipedia"

- - -

同样，引号可选。

### 表格

注意：部分程序可能不支持

使用：

```
Name  | Class
------------- | -------------
Alice  | 1
Bob  | 2
```

显示为：

---

Name  | Class
------------- | -------------
Alice  | 1
Bob  | 2

---

可以设置对齐：

```
| Application  | Operating System  | Latest Version |
|:------------- |:---------------:| -------------:|
| Microsoft Office | Windows, OS X | 2013 |
| iTunes      | Windows, OS X | 12 |
| Google Chrome | Windows, Linux, OS X        | 43 |
```
显示为：

---

| Application  | Operating System  | Latest Version |
|:------------- |:---------------:| -------------:|
| Microsoft Office | Windows, OS X | 2013 |
| iTunes      | Windows, OS X | 12 |
| Google Chrome | Windows, Linux, OS X        | 43 |

---

第一列左对齐，第二列居中对齐，第三列右对齐。