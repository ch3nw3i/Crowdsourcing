# 基于J2EE的软件众包平台的设计与实现



## 运行环境

- 操作系统：Windows 7 x64
- IDE：MyEclipse 7.0
- JDK：1.6.0
- 数据库：MySQL
- 数据库客户端：Navicat 8 for MySQL
- Web服务器：Tomcat 6.0
- 后端语言：Java
- 后端框架：Struts2、Hibernate
- 前端：HTML、CSS、JavaScript
- 前端框架：Bootstrap、jQuery



## 项目部署

将源代码文件复制到myeclipse workspace文件夹，用myeclipse打开，在tomcat服务器中部署。

在数据库中创建数据库crowdsourcing，运行sql文件夹下的sql转储文件。



## 项目结构解析

- src/com/action：处理请求

- src/com/dao：定义数据库操作的接口

- src/com/impl：数据库操作接口的实现类
- src/com/entity：java后缀的是实体类，hbm.xml后缀的是实体类与数据库表的映射关系配置文件
- src/com/utils：工具类
- src/hibernate.cfg.xml：hiberna配置文件，配置数据库驱动、用户名、密码、mysql方言以及实体类与数据库表映射文件的位置
- src/struts.properties：配置struts的参数，如i18n编码格式
- src/struts.xml：struts2框架的配置文件，配置前端请求与action的映射关系
- WebRoot/admin：后台管理系统的JSP页面
- WebRoot/app：软件众包平台的JSP页面
- WebRoot/META-INF：程序入口相关信息
- WebRoot/public：admin和app的公共文件，如js、css、image、font
- WebRoot/WEB-INF/lib：第三方库jar包
- WebRoot/WEB-INF/web.xml：web项目配置文件，配置拦截器和使用的控制层框架
- WebRoot/admin.jsp：后台入口JSP
- WebRoot/index.jsp：前台入口JSP
- hibernate.reveng.xml：配置hibernate反转引擎根据数据库表生成实体类



## 请求处理流程

1. 浏览器发出请求
2. 服务器根据struts.xml文件，调用对应的action
3. 在action内调用dao层的功能，处理请求，返回结果
4. action根据处理结果和struts.xml定义的内容，返回结果到指定的页面
5. jsp页面处理得到的结果，并将结果展示在jsp页面中



## 项目结构

- Crowdsourcing
  - src
    - com
      - action
      - dao
      - entity
      - impl
      - utils
    - hibernate.cfg.xml
    - struts.properties
    - struts.xml
  - WebRoot
    - admin
    - app
    - META-INF
    - public
    - WEB-INF
    - admin.jsp
    - index.jsp
  - hibernate.reveng.xml
  
  