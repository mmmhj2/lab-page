---
layout: documentation
title: "Git 工作流程简明教学"
date: 2022-09-20 18:00:00 +0800
author: 管理员
---

本文简述此网站所托管的Git有关操作。

本网站的Markdown源代码通过基于SSH协议的Git版本控制服务托管在远端服务器上。
欲修改本网站内容，请向管理员索要SSH密钥，并在本地设置好Git客户端的用户名、电子邮箱和私钥。
本文以 TortoiseGit 为例介绍其工作流程，并假设您已经安装好该软件。

## 克隆远端库

1. 在欲克隆至的目录单击右键，选择“Git克隆”。
2. 在URL中输入`git@<主机名>:/git/website.git`。
![TortoiseGit克隆](/assets/doc/metadoc/git-clone.png){: .align-center}
3. 勾选加载Putty密钥，并选择分发给您的密钥文件。其拓展名通常为`.ppk`。
4. 确认并克隆。

现在您可以修改本地文件并提交的本地的库中了。

## 提交并推送至远端

1. 保存好修改或新建的文件或目录之后，在本地库的工作目录（即含有`.git`的那个目录）下单击右键。
2. 选择“Git提交”，输入日志信息，推荐添加“Signed-off-by”。
3. 在下方勾选需要提交的文件，单击提交。
4. 提交完毕后，在该目录下右键单击，并选择“Git推送”。
5. 勾选“自动加载 Putty 密钥”并确认。
6. 如果发生冲突，则需要手动解决冲突。
为了避免发生冲突，也可以先拉取、合并再提交。

## 关于服务器的运行与维护

本服务器托管在某运营商的虚拟服务器上，主要由三个组件构成，即：Git服务器、Jekyll构建器和Apache2 HTTP服务器。
Git服务器负责网页原始内容的储存与同步；
Jekyll构建器负责将Markdown文件渲染为HTML网页；
Apache服务器则提供HTTP访问。

Git服务器使用SSH方式登录，权限为`git`用户组下的`git`用户。
出于安全原因考虑，该用户不能使用SHELL终端，也不能进行SSH转发。
关于Git服务器的搭建，参见[Git官方文档](https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server)。

利用Linux的crontab服务，Jekyll每隔五分钟就将网页编译一次，由`git`用户组下的`jekyll`用户执行。
其具体包括以下步骤：
1. 设置环境变量。
2. 从本地克隆网站Git库的主分支（`master`）。
3. 执行Jekyll构建。
4. 将输出复制到与`/var/www/html`符号链接的目录下。
5. 删除克隆的本地库。

脚本文件可见网站根目录下的[`update.sh`](/update.sh)

