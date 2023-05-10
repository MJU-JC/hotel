-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `cardNumber` varchar(30)  NOT NULL COMMENT '���֤��',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_roomType` (
  `roomTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `roomTypeName` varchar(20)  NOT NULL COMMENT '��������',
  `price` float NOT NULL COMMENT '�۸�(ÿ��)',
  PRIMARY KEY (`roomTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_room` (
  `roomNo` varchar(20)  NOT NULL COMMENT 'roomNo',
  `roomTypeObj` int(11) NOT NULL COMMENT '��������',
  `roomPhoto` varchar(60)  NOT NULL COMMENT '����ͼƬ',
  `roomPrice` float NOT NULL COMMENT '�۸�(ÿ��)',
  `floorNum` varchar(20)  NOT NULL COMMENT '¥��',
  `roomState` varchar(20)  NOT NULL COMMENT 'ռ��״̬',
  `roomDesc` varchar(5000)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`roomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_bookOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `roomObj` varchar(20)  NOT NULL COMMENT 'Ԥ������',
  `roomTypeObj` int(11) NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT 'Ԥ����',
  `liveDate` varchar(20)  NULL COMMENT '��ס����',
  `days` int(11) NOT NULL COMMENT 'Ԥ������',
  `totalMoney` float NOT NULL COMMENT '�ܼ�',
  `orderMemo` varchar(500)  NULL COMMENT '������ע',
  `orderState` varchar(20)  NOT NULL COMMENT '����״̬',
  `orderTime` varchar(20)  NULL COMMENT 'Ԥ��ʱ��',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '���Ա���',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '������',
  `leaveTime` varchar(20)  NULL COMMENT '����ʱ��',
  `replyContent` varchar(1000)  NULL COMMENT '����ظ�',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `hitNum` int(11) NOT NULL COMMENT '�����',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_room ADD CONSTRAINT FOREIGN KEY (roomTypeObj) REFERENCES t_roomType(roomTypeId);
ALTER TABLE t_bookOrder ADD CONSTRAINT FOREIGN KEY (roomObj) REFERENCES t_room(roomNo);
ALTER TABLE t_bookOrder ADD CONSTRAINT FOREIGN KEY (roomTypeObj) REFERENCES t_roomType(roomTypeId);
ALTER TABLE t_bookOrder ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


