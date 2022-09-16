---
layout: documentation
title: "Markdown 语法速查"
date: 2022-09-16 18:00:00 +0800
author: 管理员
---

本文简述该网站对Markdown语法的扩充。
详细语法教学参见[https://markdown.com.cn/basic-syntax/](https://markdown.com.cn/basic-syntax/)。

## 文字和图像对齐

在Markdown段落后插入`{: .text-left}`、`{: .text-center}`或`{: .text-right}`可使文字左对齐、中央对齐或右对齐。
```
中央对齐文本
{: .text-center}
```

在图像链接后插入`{: .align-left}`、`{: .align-center}`或`{: .align-right}`可使图像左侧浮动、中央浮动或右侧浮动。
插入`{: .full}`可使图像超出文章横向宽度。
```
![右对齐图像](/assets/image.jpg){: .align-right}
```

## 插入视频

在Markdown中插入以下代码以嵌入视频：
```
{% raw %}{% include video id="BVXXXXXXXXXX" provider="bilibili" danmaku="1" %}{% endraw %}
```

`provider`表示视频提供网站，目前支持Bilibili、YouTube、Vimeo和Google Drive。
`id`是视频的唯一标识符，对于B站即为BV号。
`danmaku`为`1`时启用B站的弹幕系统。
