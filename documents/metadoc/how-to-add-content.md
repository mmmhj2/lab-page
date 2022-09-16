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
其他内容可参见[Jekyll官方文档](https://jekyllrb.com/docs/front-matter/)。
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
