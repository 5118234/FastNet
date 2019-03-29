# FastNet
基于 ASP.NET Core + EFCore + AdminLTE 开发出来的框架，源代码完全开源。内置后台基础常用功能。
其核心设计目标是开发迅速、代码量少、学习简单、功能强大、轻量级、易扩展，让Web开发更迅速、简单。

## 当前版本
* 基于.Net Core 2.2 开发；
* ORM 使用 EF core 
* SqlServer 数据库 项目含有 fastnet.sql数据生成文件

## 技术介绍
1、前端技术
* AdminLTE作为管理框架
* 数据表格：datatable
* 对话框：layer
* 下拉选择框：jQuery Select2

2、后端技术

* 核心框架：ASP.NET CORE、WEB API
* 持久层框架：EF CORE
* 缓存框架：微软自带Cache、Redis
* 日志管理：NLog、登录日志、操作日志

## 项目结构
![](https://github.com/lovachen/FastNet/raw/master/1553821813(1).jpg)
* Controllers 为Api层，为WebApi所用
* Pages 为页面文件 其中Admin 为后台管理页面，也是我们当前主要实现的页面
* Pages 其它为前台页面，自行实现项目
### 项目分层
* AiBao.Core 项目核心层 引用了 [cts.web.core 类库](https://github.com/lovachen/cts.web.core) ,这也是我封装的一个类库
* AiBao.Entities 数据库实体层，本系统才使用数据库优先的开发模式，对于一般系统来说，优先构建数据开发 通过使用[Scaffold-DbContext](https://docs.microsoft.com/en-us/ef/core/miscellaneous/cli/dotnet)来生成数据库实体
* AiBao.Mapping 数据实体映射。AiBao.Entities 作为数据库实体生成，常常在于数据改动时回重新生成，因此不对实体做任何改动，从而引入了实体映射通过[AutoMapper](https://www.nuget.org/packages/AutoMapper/) 将实体映射转换