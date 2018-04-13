---
layout: post
title:  "搭建博客遇到的问题"
date:   2018-04-12
categories: Jekyll
tags: Jekyll
---
1、使用jekyll-paginate插件，无法正常工作

保证Gemfile中声明[jekyll-paginate][jekyll-paginate-url]及_config.yml中定义[paginate][paginate-url]

<br />

2、关于github pages无法使用jekyll插件

所有Pages通过 --safe选项禁用了插件，若你的网站部署在Github Pages，那么你的插件不会工作。不过仍有办法发布到Github Pages，只需要将本地编译好的文件上传到Github就可以了：
* 编译生成 _site 目录：jekyll build --safe
* 将 _site 目录下文件上传至master/gh-pages分支（可参考脚本 [deployed.sh][deployed.sh-url]）

[jekyll-paginate-url]: https://github.com/squcir/squcir.github.io/blob/dev/Gemfile#L23
[paginate-url]: https://github.com/squcir/squcir.github.io/blob/dev/_config.yml#L24
[deployed.sh-url]: https://github.com/squcir/squcir.github.io/blob/dev/deployed.sh