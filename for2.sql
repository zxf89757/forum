/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : for2

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-09-05 21:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `threadCount` int(11) DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for courseuser
-- ----------------------------
DROP TABLE IF EXISTS `courseuser`;
CREATE TABLE `courseuser` (
  `cuid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cuid`),
  KEY `cid3` (`cid`),
  KEY `uid3` (`uid`),
  CONSTRAINT `cid3` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid3` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for floorreply
-- ----------------------------
DROP TABLE IF EXISTS `floorreply`;
CREATE TABLE `floorreply` (
  `ruid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`ruid`),
  KEY `uid4` (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `reply` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid4` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `did` (`did`),
  CONSTRAINT `did` FOREIGN KEY (`did`) REFERENCES `department` (`did`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for majorcourse
-- ----------------------------
DROP TABLE IF EXISTS `majorcourse`;
CREATE TABLE `majorcourse` (
  `cmid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmid`),
  KEY `cid` (`cid`),
  KEY `mid` (`mid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(510) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `floorReplyCount` int(11) DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `tid` (`tid`),
  KEY `uid2` (`uid`),
  KEY `FK67612EA4DB5A192` (`tid`),
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `thread` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for thread
-- ----------------------------
DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(510) DEFAULT NULL,
  `hit` int(11) DEFAULT '0',
  `replyCount` int(11) DEFAULT '0',
  `topped` int(11) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `cid2` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `cid2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dateLastActived` datetime DEFAULT NULL,
  `ipCreated` varchar(255) DEFAULT NULL,
  `ipLastActived` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
DROP TRIGGER IF EXISTS `replyFloorCountadd`;
DELIMITER ;;
CREATE TRIGGER `replyFloorCountadd` BEFORE INSERT ON `floorreply` FOR EACH ROW update reply set reply.floorReplyCount = reply.floorReplyCount+ 1 where reply.rid = new.rid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `replyFloorCountdel`;
DELIMITER ;;
CREATE TRIGGER `replyFloorCountdel` AFTER DELETE ON `floorreply` FOR EACH ROW update reply set reply.floorReplyCount = reply.floorReplyCount- 1 where reply.rid = old.rid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `threadreplyCountadd`;
DELIMITER ;;
CREATE TRIGGER `threadreplyCountadd` BEFORE INSERT ON `reply` FOR EACH ROW update thread set thread.replyCount = thread.replyCount+ 1 where thread.tid = new.tid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `threadreplyCountdet`;
DELIMITER ;;
CREATE TRIGGER `threadreplyCountdet` AFTER DELETE ON `reply` FOR EACH ROW update thread set thread.replyCount = thread.replyCount - 1 where thread.tid = old.tid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `threadcountadd`;
DELIMITER ;;
CREATE TRIGGER `threadcountadd` BEFORE INSERT ON `thread` FOR EACH ROW update course set course.threadCount = course.threadCount+ 1 where course.cid = new.cid
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `threadcountdet`;
DELIMITER ;;
CREATE TRIGGER `threadcountdet` AFTER DELETE ON `thread` FOR EACH ROW update course set course.threadCount = course.threadCount- 1 where course.cid = old.cid
;;
DELIMITER ;
