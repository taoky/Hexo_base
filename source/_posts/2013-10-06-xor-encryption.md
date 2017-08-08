---
layout: post
title: "异或加密"
description: ""
category: "程序"
tags: ["加密","Linux","C","程序"]
---


在网上看到有人用手机的九宫格输入法的键位加密汉字。

比如说「你好」两个字，因为「N」在「6」，「I」在「4」……

然后就「加密」成了「64426」。

但是突然想到这种方法太弱了，又想到前阵子看到的异或加密法，就写了个程序试一试。
<!--more-->
```c
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int random(void);

int main(void)
{
    int number;
    char c;
    if(argc == 1)
    {
        number = random();
        fprintf(stderr,"生成随机数：%i\n",number);
    }
    else
    {
        number = atoi(argv[1]);
    }
    while((c=getchar())!=EOF)
    {
        c = c ^ number;
        putchar(c);
    }
    printf("\n");
    return 0;
}

int random(void)
{
    int dev = open("/dev/random", O_RDONLY);
    /* 因为使用了 /dev/random，所以不能直接在 Windows 下编译 */
    int number;
    read(dev,&number,sizeof number);
    close(dev);
    return number;
}

```

使用方法：

```sh
./progname < needfile > resultfile 2> randomfile
```
就是这样。

解密：

```sh
./progname randomnumber < resultfile > needfile
```

OK.

PS：维基百科：[异或密码](https://zh.wikipedia.org/wiki/%E5%BC%82%E6%88%96%E5%AF%86%E7%A0%81)
