/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : crowdsourcing

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2020-03-30 15:51:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `administrator`
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `administrator` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` tinyint(20) DEFAULT NULL COMMENT '1 系统管理员\r\n2 项目管理员\r\n3 用户管理员\r\n4 客户服务',
  `telephone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', 'system', '123', '系统管理员', '1', '17750597523', '17750597523@163.com', '管理整个系统', '2018-04-20 18:44:25', '2018-04-20 18:44:28');
INSERT INTO `administrator` VALUES ('2', 'project', '123', '项目管理员', '2', '17750597523', '17750597523@163.com', '维护众包平台的所有项目', '2018-04-20 19:31:00', '2018-04-20 19:31:03');
INSERT INTO `administrator` VALUES ('3', 'user', '123', '用户管理员', '3', '17750597523', '17750597523@163.com', '维护众包平台的注册用户、开发者、需求方信息', '2018-04-20 19:31:43', '2018-04-20 19:31:47');
INSERT INTO `administrator` VALUES ('4', 'customer', '123', '客户服务', '4', '17750597523', '17750597523@163.com', '客服人员', '2018-04-20 19:32:51', '2018-04-20 19:32:56');

-- ----------------------------
-- Table structure for `apptype`
-- ----------------------------
DROP TABLE IF EXISTS `apptype`;
CREATE TABLE `apptype` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `appType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of apptype
-- ----------------------------
INSERT INTO `apptype` VALUES ('0001', 'Web');
INSERT INTO `apptype` VALUES ('0002', '小程序');
INSERT INTO `apptype` VALUES ('0003', 'Python');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('0001', '厦门');
INSERT INTO `city` VALUES ('0002', '北京');
INSERT INTO `city` VALUES ('0003', '上海');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `collectionType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collectionId` int(11) DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('11', '8', 'project', '2', '2018-05-11 06:57:44', null);
INSERT INTO `collection` VALUES ('12', '8', 'project', '3', '2018-05-11 07:00:17', null);
INSERT INTO `collection` VALUES ('14', '8', 'project', '2', '2018-05-11 10:41:29', null);
INSERT INTO `collection` VALUES ('18', '14', 'user', '3', '2018-05-12 07:34:49', null);
INSERT INTO `collection` VALUES ('19', '14', 'project', '3', '2018-05-12 07:35:26', null);
INSERT INTO `collection` VALUES ('21', '8', 'user', '1', '2018-05-12 07:48:18', null);
INSERT INTO `collection` VALUES ('22', '8', 'project', '2', '2018-05-15 10:50:40', null);

-- ----------------------------
-- Table structure for `developer`
-- ----------------------------
DROP TABLE IF EXISTS `developer`;
CREATE TABLE `developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `realName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workingExperience` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projectExperience` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expectionWork` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of developer
-- ----------------------------
INSERT INTO `developer` VALUES ('1', '4', '陈炜', '男', '厦门', 'summary1', null, null, null, 'Java/PHP/Delphi', '启用', null, null);
INSERT INTO `developer` VALUES ('3', '8', 'chenwei', '男', '宁德', '简介1', '工作经验1', '项目经验', 'Web应用', 'Python', '启用', null, null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fromUserId` int(11) DEFAULT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('2', '测试内容111', '未读', '任务信', '8', '2', '2018-03-25 22:52:29', '2018-03-25 22:47:39');
INSERT INTO `news` VALUES ('3', '测试内容', '已读', '站内信', '8', '2', '2018-03-25 22:52:29', '2018-05-08 23:48:17');
INSERT INTO `news` VALUES ('4', '来自id：2用户', '未读', '站内信', '2', '8', '2018-05-09 00:03:39', null);
INSERT INTO `news` VALUES ('5', 'hello， world。', '已读', '站内信', '8', '1', '2018-05-11 11:49:17', null);

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cycle` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requirement` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isSettled` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requirementDoc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requestorId` int(11) DEFAULT NULL,
  `developerId` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewNumber` int(11) DEFAULT NULL,
  `enlistNumber` int(11) DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('2', 'Update test', '5000', null, null, null, null, 'C#', null, 'Amoy', null, null, '2', null, '待审核', null, null, null, null);
INSERT INTO `project` VALUES ('3', 'Web商城', '2000', '网站', null, null, null, 'Java', null, null, null, null, '2', null, '进行中', null, null, '2018-04-22 18:20:42', '2018-04-22 18:20:45');

-- ----------------------------
-- Table structure for `skill`
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `skill` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES ('0001', 'Java');
INSERT INTO `skill` VALUES ('0002', 'C#');
INSERT INTO `skill` VALUES ('0003', 'Python');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码找回问题',
  `answer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码找回答案',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', '用户123', null, '禁用', '普通用户&需求方', '123', '456', null, null);
INSERT INTO `user` VALUES ('2', 'requestor', '123', '用户-需求方', null, '启用', '普通用户&需求方', null, null, null, null);
INSERT INTO `user` VALUES ('3', 'developer', '123', '用户-开发者', null, '启用', '普通用户&开发者', null, null, null, null);
INSERT INTO `user` VALUES ('5', 'user', '123', 'test', null, '启用', '普通用户', null, null, null, null);
INSERT INTO `user` VALUES ('8', 'chenwei', '123456', '陈炜', null, '启用', '普通用户&需求方&开发者', '123', '456', '2018-04-22 06:02:34', '2018-04-22 06:02:34');
INSERT INTO `user` VALUES ('9', 'test1', '123', 'test1', null, '启用', '普通用户', null, null, null, null);
INSERT INTO `user` VALUES ('10', 'test2', '123', 'test2', null, '启用', '普通用户', 'question', 'answer', null, null);
INSERT INTO `user` VALUES ('11', 'test3', '123', 'test3', null, '启用', '普通用户', 'question', 'answer', null, null);
INSERT INTO `user` VALUES ('12', 'abc', '123', '123', null, '启用', '普通用户', '123', '123', '2018-05-10 06:20:27', '2018-05-10 06:20:27');
INSERT INTO `user` VALUES ('13', 'dev', '321', '开发者注册测试', null, '启用', '普通用户', '123', '456', '2018-05-12 01:44:10', '2018-05-12 01:44:10');
INSERT INTO `user` VALUES ('14', 'liuping', '123', 'liuping', null, '启用', '普通用户', '123', '456', '2018-05-12 07:30:51', '2018-05-12 07:30:51');
INSERT INTO `user` VALUES ('15', '321', '321', '321', null, '启用', '普通用户', '321', '321', '2018-05-15 03:13:16', '2018-05-15 03:13:16');

-- ----------------------------
-- Table structure for `userprojectrelate`
-- ----------------------------
DROP TABLE IF EXISTS `userprojectrelate`;
CREATE TABLE `userprojectrelate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userprojectrelate
-- ----------------------------
INSERT INTO `userprojectrelate` VALUES ('1', '3', '3', '2018-04-22 23:43:43', '2018-04-22 23:43:46');
