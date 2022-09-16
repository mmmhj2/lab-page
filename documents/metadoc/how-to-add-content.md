---
layout: documentation
title: "如何向网站中添加内容"
date: 2022-09-16 18:00:00 +0800
author: 管理员
---

本文简述向本网站添加文章的流程。

## 在本地撰写文章

1. 将本网站 Git 库克隆（或拉取）至本地。
2. 在对应的目录下以 Markdown 或 HTML 撰写文章。
3. 在文章头部添加 Front Matter, 其最简格式如下：
```
---
layout: single
title: <标题>
---
```
其他内容可参见[Jekyll官方文档](https://jekyllcn.com/docs/frontmatter/)。
如果要撰写文档，则`layout`应为`documentation`，且推荐在其中加入`date`（修改时间）和`author`（作者）字段。
其中，时间的格式为`YYYY-MM-DD HH:MM:SS +0800`。
4. （可选）保存并在本地生成预览。
5. 将修改推送至远端。

请确保文本文件的编码为UTF-8且*不含BOM字符*，因此*不推荐*用Windows记事本编辑文件。

## 修改侧边栏导航

1. 找到欲添加文件的绝对路径。例如，本文件的路径为`/documents/metadoc/how-to-add-content`，注意不含拓展名。
2. 修改`_data/navigation.yml`文件。

```
docs: # 该侧边栏的内部名称，请勿修改
    - title: "元文档" # 类别名称
      children:
        - title: "如何添加内容"	 # 文章在侧边栏中的标题
          url: /documents/metadoc/how-to-add-content # 文章的路径
```

YAML和Python类似，使用空白字符和分行来分隔资料，因此请确保相同层次的条目缩进相同，且文件中只有空格（Space）而没有制表符（Tab）。


## 如何在本地编译网站

将修改推送至远端之后仍需要一段时间才能部署到托管平台上，因此在本地编译并预览网站可以节省许多等待时间。
本网站使用Jekyll构建，此系统在Linux下体验最佳。
本段以Windows Subsystem For Linux 2为例讲解Windows下的部署。
官方网站上也提供直接[在Windows下部署的解决方案](https://jekyllcn.com/docs/windows/#installation)。
在Linux和MacOS系统下的部署和Windows Subsystem For Linux 2下的大同小异。
本章中相当部分的内容翻译自Jekyll官方网站。

1. 安装WSL2，参见[Microsoft官方文档](https://docs.microsoft.com/zh-cn/windows/wsl/)。
注意可能需要更新Windows的Linux内核才能成功安装WSL2。
推荐的Linux发行版为Ubuntu。
2. 安装依赖环境。包括Ruby、RubyGems等。
```
sudo apt-get install ruby-full build-essential zlib1g-dev
```
安装RubyGems
```
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
安装Jekyll和Bundler
```
gem install jekyll bundler
```
3. 将目录切换至网站根目录。此目录下应有`_config.yml`文件。
执行编译命令。
```
bundle exec jekyll serve
```
4. 如果出现服务器地址，则编译成功。网站可在`http://127.0.0.1:4000`访问。

也可以使用Dockers进行网站的编译，此处不再赘述。
