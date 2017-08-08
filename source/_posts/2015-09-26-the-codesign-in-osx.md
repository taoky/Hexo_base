---
layout: post
title: "OS X 下的 App 数字证书和更多"
description: ""
category: "安全"
tags: ["数字证书", "安全", "App"]
---



最近的 XcodeGhost 事情闹得沸沸扬扬，大家都被吓得不轻。假的 Xcode 这么长时间没有被发现，一方面可能是关掉了 Gatekeeper 的原因；另一方面，有时开了 Gatekeeper 还是没有被检测出来，并且表面上是看不出来程序有没有数字签名的，不像 Windows 里面右键属性就可以看到。
<!--more-->
### Gatekeeper 是什么？它出了什么问题？

Gatekeeper 可以检查下载到电脑中的 App 是否有数字签名，文件是否被篡改。如果检测到问题，它会停止应用的运行。然而，它只会检查从互联网上下载的应用。

根据 Apple 官方给的[帮助](https://support.apple.com/zh-cn/HT202491)，Gatekeeper 在检测有问题的 App 时会有如下信息：

* 仅允许 Mac App Store 应用时其它的应用都会被阻止，提示「打不开“XXX”，因为它不是从 Mac App Store 下载的。」
* 仅允许 Mac App Store 和被认可的开发者时未签名或已被篡改的应用会被阻止，提示「打不开“XXX”，因为它来自身份不明的开发者。」
* 允许任何来源时被篡改的应用仍然会被阻止，提示「“XXX”已损坏，打不开。您应该将它移到废纸篓。」


“不对啊，那 Gatekeeper 也应该检测出有问题的 Xcode 并阻止它运行啊。”

Gatekeeper 是通过 com.apple.quarantine 标记来判断文件是否从互联网上下载的。标记可以用 `xattr` 来查看。

```
➜  Downloads  xattr -l *.app             
CheatSheet.app: com.apple.quarantine: 0023;00000000;The\x20Unarchiver;8F22E217-7ED8-44D7-B11F-88B319E5B82E
Retinizer.app: com.apple.quarantine: 0043;00000000;The\x20Unarchiver;5E278371-834C-4C31-BC70-58E89F7CD0AF
diumoo.app: com.apple.quarantine: 0003;00000000;The Unarchiver;C91583C2-3D0B-4639-A2D7-41C37AEF5650
```

这是 xattr 在我的电脑的下载目录里的运行结果。从 quarantine 中可知这三个应用都是从网络上下载的。（并且还有一些别的内容，比如说都是用「The Unarchiver」解压缩的）

有些程序在下载的时候并没有设置 quarantine 标记，Gatekeeper 就不会检查，于是……（其实我觉得它不应该只检查从互联网上下载的应用，应该检查所有的应用才是正常的啊）

再说了，就算 Gatekeeper 提示了问题，也挡不住想死的人的步伐：可以直接关掉 Gatekeeper，可以右键打开（打开过后 Gatekeeper 就再也不会检查），还可以在终端里开……

### 检查数字签名

要检查应用的数字签名似乎只能在终端下。`codesign` 和 `spctl` 可以用来检查应用的数字签名。

#### `codesign`

`codesign` 可以来检查应用是否签名以及签名后是否被篡改。

如果一切正常，显示如下：

```
➜  /Applications  codesign -vv iTunes.app 
iTunes.app: valid on disk
iTunes.app: satisfies its Designated Requirement
```

如果应用被篡改过，显示如下：

```
➜  /Applications  codesign -vv VLC.app 
VLC.app: a sealed resource is missing or invalid
file added: /Applications/VLC.app/Contents/MacOS/plugins/plugins.dat
```

如果应用压根没有签名，显示如下：

```
➜  /Applications  codesign -vv OnyX.app 
OnyX.app: code object is not signed at all
In architecture: x86_64
```

#### `spctl`

`spctl` 可以用来看是谁给应用签名，当然也可以同时检查签名是否正常。

系统应用：

```
➜  /Applications  spctl -avv iTunes.app 
iTunes.app: accepted
source=Apple System
origin=Software Signing
```

Mac App Store 上下载的应用：

```
➜  /Applications  spctl -avv GeoGebra\ 5.app 
GeoGebra 5.app: accepted
source=Mac App Store
origin=Apple Mac OS Application Signing
```

其它开发者（就是 Gatekeeper 里面的「被认可的开发者」）授权获得的证书签名的应用：

```
➜  /Applications  spctl -avv NeteaseMusic.app 
NeteaseMusic.app: accepted
source=Developer ID
origin=Developer ID Application: NetEase (Hangzhou) Network Co., Ltd. (J669Y64Z9Y)
```

被篡改过的应用：

```
➜  /Applications  spctl -avv VLC.app 
VLC.app: a sealed resource is missing or invalid
```

没有签名的应用：

```
➜  /Applications  spctl -avv OnyX.app        
OnyX.app: rejected
source=no usable signature
```

如果说这个应用的签名者有问题（比如像 Windows 里面，从百度一不小心下载的 Chrome 安装包却是百度的签名）的话，那这个应用也是有问题的。

以上。
