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



## 项目结构

- Crowdsourcing
  - src
    - com.action
      - AdminAction.java
      - CollectionAction.java
      - DeveloperAction.java
      - NewsAction.java
      - ProjectAction.java
      - UserAction.java
    - com.dao
      - AdministratorDAO.java
      - AppTypeDAO.java
      - CityDAO.java
      - CollectionDAO.java
      - DeveloperDAO.java
      - NewsDAO.java
      - ProjectDAO.java
      - SkillDAO.java
      - UserDAO.java
      - UserProjectRelateDAO.java
    - com.entity
      - Administrator.hbm.xml
      - Administrator.java
      - AppType.hbm.xml
      - AppType.java
      - City.hbm.xml
      - City.java
      - Collection.hbm.xml
      - Collection.java
      - Developer.hbm.xml
      - Developer.java
      - HibernateUtil.java
      - News.hbm.xml
      - News.java
      - Project.hbm.xml
      - Project.java
      - Skill.hbm.xml
      - Skill.java
      - User.hbm.xml
      - User.java
      - UserProjectRelate.hbm.xml
      - UserProjectRelate.java
    - con.impl
      - AdministratorDAOImpl.java
      - AppTypeDAOImpl.java
      - CityDAOImpl.java
      - CollectionDAOImpl.java
      - DeveloperDAOImpl.java
      - NewsDAOImpl.java
      - ProjectDAOImpl.java
      - SkillDAOImpl.java
      - UserDAOImpl.java
      - UserProjectRelateDAOImpl.java
    - com.utils
      - DateFormat.java
      - MD5.java
      - StringDeal.java
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



