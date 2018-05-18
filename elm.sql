/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : elm

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-05-18 09:53:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `elm_authlist`
-- ----------------------------
DROP TABLE IF EXISTS `elm_authlist`;
CREATE TABLE `elm_authlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(255) NOT NULL,
  `auth_num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_authlist
-- ----------------------------
INSERT INTO elm_authlist VALUES ('1', '登录权限', '1');
INSERT INTO elm_authlist VALUES ('2', '用户权限', '2');
INSERT INTO elm_authlist VALUES ('3', '用户编辑权限', '3');
INSERT INTO elm_authlist VALUES ('4', '用户读取权限', '4');
INSERT INTO elm_authlist VALUES ('5', '设备读取权限', '5');
INSERT INTO elm_authlist VALUES ('6', '设备修改权限', '6');
INSERT INTO elm_authlist VALUES ('7', '财务管理', '7');
INSERT INTO elm_authlist VALUES ('8', '财务修改权限', '8');
INSERT INTO elm_authlist VALUES ('9', '财务读取权限', '9');
INSERT INTO elm_authlist VALUES ('10', '好的', '10');

-- ----------------------------
-- Table structure for `elm_bolg`
-- ----------------------------
DROP TABLE IF EXISTS `elm_bolg`;
CREATE TABLE `elm_bolg` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `anthorname` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_bolg
-- ----------------------------
INSERT INTO elm_bolg VALUES ('1', '2', '1', '1', '1', '2018-03-19 10:57:22');

-- ----------------------------
-- Table structure for `elm_chuqin`
-- ----------------------------
DROP TABLE IF EXISTS `elm_chuqin`;
CREATE TABLE `elm_chuqin` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_chuqin
-- ----------------------------
INSERT INTO elm_chuqin VALUES ('1', '1');

-- ----------------------------
-- Table structure for `elm_daka`
-- ----------------------------
DROP TABLE IF EXISTS `elm_daka`;
CREATE TABLE `elm_daka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `allNumber` int(11) NOT NULL,
  `shangDaka` varchar(255) NOT NULL,
  `xiaDaka` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_daka
-- ----------------------------
INSERT INTO elm_daka VALUES ('1', '小罗', '200', '是', '否');
INSERT INTO elm_daka VALUES ('2', '小明', '211', '是', '否');
INSERT INTO elm_daka VALUES ('3', '阳进', '219', '是', '否');
INSERT INTO elm_daka VALUES ('4', '艳萍', '211', '是', '否');
INSERT INTO elm_daka VALUES ('5', '小红', '199', '是', '否');

-- ----------------------------
-- Table structure for `elm_finger`
-- ----------------------------
DROP TABLE IF EXISTS `elm_finger`;
CREATE TABLE `elm_finger` (
  `id` int(11) NOT NULL,
  `name` varchar(220) DEFAULT NULL,
  `isFinger` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_finger
-- ----------------------------
INSERT INTO elm_finger VALUES ('1', '小罗', '已录入');
INSERT INTO elm_finger VALUES ('2', '小明', '已录入');

-- ----------------------------
-- Table structure for `elm_fingertx`
-- ----------------------------
DROP TABLE IF EXISTS `elm_fingertx`;
CREATE TABLE `elm_fingertx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `doSome` varchar(200) DEFAULT NULL,
  `car` varchar(200) DEFAULT NULL,
  `return` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_fingertx
-- ----------------------------
INSERT INTO elm_fingertx VALUES ('1', '小罗', '要发票', '宝马555', '已归还');

-- ----------------------------
-- Table structure for `elm_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `elm_invoice`;
CREATE TABLE `elm_invoice` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `useSite` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_invoice
-- ----------------------------
INSERT INTO elm_invoice VALUES ('1', '小罗', '发票', '广州', '234521', '2018-03-15 10:55:25');
INSERT INTO elm_invoice VALUES ('2', '小罗', '收据', '广州', '832753', '2018-03-07 11:07:27');
INSERT INTO elm_invoice VALUES ('3', '小明', '收据', '深圳', '375525', '2018-03-07 11:07:49');
INSERT INTO elm_invoice VALUES ('4', '小红', '发票', '深圳', '352382', '2018-03-15 11:08:18');
INSERT INTO elm_invoice VALUES ('5', '小韩', '发票', '广州', '235221', '2018-03-22 11:09:02');

-- ----------------------------
-- Table structure for `elm_locationcar`
-- ----------------------------
DROP TABLE IF EXISTS `elm_locationcar`;
CREATE TABLE `elm_locationcar` (
  `id` int(11) NOT NULL,
  `name` varchar(220) DEFAULT NULL,
  `useCar` varchar(220) DEFAULT NULL,
  `location` varchar(220) DEFAULT NULL,
  `CarNum` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_locationcar
-- ----------------------------
INSERT INTO elm_locationcar VALUES ('1', '小罗', '红旗222', '黄埔大道223号', '粤A·888888');

-- ----------------------------
-- Table structure for `elm_locationmanager`
-- ----------------------------
DROP TABLE IF EXISTS `elm_locationmanager`;
CREATE TABLE `elm_locationmanager` (
  `id` int(11) NOT NULL,
  `name` varchar(220) DEFAULT NULL,
  `location` varchar(220) DEFAULT NULL,
  `distance` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_locationmanager
-- ----------------------------
INSERT INTO elm_locationmanager VALUES ('1', '小罗', '珠江新城', '500米');

-- ----------------------------
-- Table structure for `elm_manager`
-- ----------------------------
DROP TABLE IF EXISTS `elm_manager`;
CREATE TABLE `elm_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userGroupid` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_manager
-- ----------------------------
INSERT INTO elm_manager VALUES ('1', 'admin', 'admin', '1,2,3,4,5,6,7,8,9,10', '2018-03-19 10:27:59');
INSERT INTO elm_manager VALUES ('2', '小罗', '1234', '1,2,3,4,5', '2018-04-24 10:27:32');
INSERT INTO elm_manager VALUES ('3', '阳进', '123', '1,2,4,6', '2018-03-21 10:28:22');
INSERT INTO elm_manager VALUES ('4', '艳萍', '123', '1,2,3,4', '2018-03-22 10:28:55');
INSERT INTO elm_manager VALUES ('5', '小明', '123', '1,2,3,4', '2018-03-13 10:29:31');

-- ----------------------------
-- Table structure for `elm_menjin`
-- ----------------------------
DROP TABLE IF EXISTS `elm_menjin`;
CREATE TABLE `elm_menjin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_menjin
-- ----------------------------
INSERT INTO elm_menjin VALUES ('1');

-- ----------------------------
-- Table structure for `elm_recordcar`
-- ----------------------------
DROP TABLE IF EXISTS `elm_recordcar`;
CREATE TABLE `elm_recordcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(220) DEFAULT NULL,
  `recordLocation` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_recordcar
-- ----------------------------
INSERT INTO elm_recordcar VALUES ('1', '小罗', '黄埔大道，珠江新城');
INSERT INTO elm_recordcar VALUES ('2', '小明', '元岗，岗顶，石牌桥');
INSERT INTO elm_recordcar VALUES ('3', '小兰', '海心沙，广州塔，客村');
INSERT INTO elm_recordcar VALUES ('4', '花花', '珠江新城，五羊');

-- ----------------------------
-- Table structure for `elm_renlian`
-- ----------------------------
DROP TABLE IF EXISTS `elm_renlian`;
CREATE TABLE `elm_renlian` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `siMate` varchar(255) NOT NULL,
  `isPass` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_renlian
-- ----------------------------
INSERT INTO elm_renlian VALUES ('1', '小罗', '95%', '是', '是', '2018-03-14 09:43:45');
INSERT INTO elm_renlian VALUES ('2', '小明', '90%', '是', '是', '2018-03-22 11:20:06');
INSERT INTO elm_renlian VALUES ('3', '小红', '94%', '是', '是', '2018-03-22 11:20:37');
INSERT INTO elm_renlian VALUES ('4', '小阳', '96%', '是', '是', '2018-03-22 11:20:58');
INSERT INTO elm_renlian VALUES ('5', '艳萍', '95%', '是', '是', '2018-03-22 11:21:18');

-- ----------------------------
-- Table structure for `elm_renyuan`
-- ----------------------------
DROP TABLE IF EXISTS `elm_renyuan`;
CREATE TABLE `elm_renyuan` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_renyuan
-- ----------------------------
INSERT INTO elm_renyuan VALUES ('1', '1', '2018-03-13 10:47:49');

-- ----------------------------
-- Table structure for `elm_rongqi`
-- ----------------------------
DROP TABLE IF EXISTS `elm_rongqi`;
CREATE TABLE `elm_rongqi` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zhuji` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `mingling` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_rongqi
-- ----------------------------
INSERT INTO elm_rongqi VALUES ('1', '笔记本1', '192.168.2.1', '打开', '2543', '2018-03-19 10:51:41');
INSERT INTO elm_rongqi VALUES ('2', '笔记本2', '192.163.1.3', '打开', '5323', '2018-03-30 10:58:28');
INSERT INTO elm_rongqi VALUES ('3', '主机1', '192.163.1.2', '打开', '6732', '2018-03-22 10:59:21');
INSERT INTO elm_rongqi VALUES ('4', '主机2', '192.168.3.1', '关闭', '3221', '2018-03-31 11:00:12');
INSERT INTO elm_rongqi VALUES ('5', '笔记本3', '192.168.1.9', '关闭', '3457', '2018-03-13 11:00:49');

-- ----------------------------
-- Table structure for `elm_shipin`
-- ----------------------------
DROP TABLE IF EXISTS `elm_shipin`;
CREATE TABLE `elm_shipin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `allUser` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `allTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_shipin
-- ----------------------------
INSERT INTO elm_shipin VALUES ('1', '腾讯赛事', '小罗，小明，小阳', '比赛', '2018-03-19 09:50:30', '30');
INSERT INTO elm_shipin VALUES ('2', '任务分布', '小罗，艳萍，小凡，小阳', '任务', '2018-03-29 11:24:42', '30');
INSERT INTO elm_shipin VALUES ('3', '项目分析', '小明，小红，小阳', '任务', '2018-03-21 11:25:26', '30');
INSERT INTO elm_shipin VALUES ('4', '任务发布', '小红，小凡，小阳', '任务', '2018-03-21 11:26:01', '30');

-- ----------------------------
-- Table structure for `elm_shoplist`
-- ----------------------------
DROP TABLE IF EXISTS `elm_shoplist`;
CREATE TABLE `elm_shoplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(255) NOT NULL,
  `shopstar` varchar(255) NOT NULL,
  `shopvolumn` varchar(255) NOT NULL,
  `jiage` varchar(255) NOT NULL,
  `wangka` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_shoplist
-- ----------------------------
INSERT INTO elm_shoplist VALUES ('1', '虚拟主机', '阿里云', 'U50332', '2099', '2');
INSERT INTO elm_shoplist VALUES ('2', '服务器1', '阿里云', 'ID435', '1992', '1');
INSERT INTO elm_shoplist VALUES ('3', '台式电脑2', '联想', 'T323', '8977', '2');
INSERT INTO elm_shoplist VALUES ('4', '服务器2', '阿里云', 'D554', '3234', '2');
INSERT INTO elm_shoplist VALUES ('5', '云计算1', '阿里云', 'E333', '7353', '1');

-- ----------------------------
-- Table structure for `elm_usecar`
-- ----------------------------
DROP TABLE IF EXISTS `elm_usecar`;
CREATE TABLE `elm_usecar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `useCar` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `isSuccess` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_usecar
-- ----------------------------
INSERT INTO elm_usecar VALUES ('1', '小罗', '奔驰666', '3天', '申请成功');
INSERT INTO elm_usecar VALUES ('2', '小明', '五菱荣光', '4天', '申请审核中');
INSERT INTO elm_usecar VALUES ('3', '小红', '宝马222', '2天', '申请成功');
INSERT INTO elm_usecar VALUES ('4', '小兰', '特拉斯', '3天', '申请成功');

-- ----------------------------
-- Table structure for `elm_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `elm_user_group`;
CREATE TABLE `elm_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `auth_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_user_group
-- ----------------------------
INSERT INTO elm_user_group VALUES ('1', '超级用户', '1,2,3,4,5,6,7,8,9,10');
INSERT INTO elm_user_group VALUES ('2', '博客用户', '1,5,6');
INSERT INTO elm_user_group VALUES ('3', '财务人员', '1,5,6,7');
INSERT INTO elm_user_group VALUES ('4', '安全管理人员', '1,8,9');
INSERT INTO elm_user_group VALUES ('5', '人力管理', '1,2,3,4');

-- ----------------------------
-- Table structure for `elm_xinzi`
-- ----------------------------
DROP TABLE IF EXISTS `elm_xinzi`;
CREATE TABLE `elm_xinzi` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `yuexin` varchar(255) NOT NULL,
  `faFang` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_xinzi
-- ----------------------------
INSERT INTO elm_xinzi VALUES ('1', '小罗', '5000', '否', '2018-03-23 10:46:09');
INSERT INTO elm_xinzi VALUES ('2', '小红', '3500', '否', '2018-03-22 10:53:49');
INSERT INTO elm_xinzi VALUES ('3', '阳进', '6000', '否', '2018-03-22 10:54:21');
INSERT INTO elm_xinzi VALUES ('4', '艳萍', '4000', '否', '2018-03-22 10:54:45');
INSERT INTO elm_xinzi VALUES ('5', '小明', '4000', '否', '2018-03-22 10:55:09');

-- ----------------------------
-- Table structure for `elm_zhiwen`
-- ----------------------------
DROP TABLE IF EXISTS `elm_zhiwen`;
CREATE TABLE `elm_zhiwen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `isImport` varchar(255) NOT NULL,
  `isQualifie` varchar(255) NOT NULL,
  `mate` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_zhiwen
-- ----------------------------
INSERT INTO elm_zhiwen VALUES ('1', '小罗', '已输入', '是', '90%', '2018-03-23 11:29:49');
INSERT INTO elm_zhiwen VALUES ('2', '小阳', '已输入', '是', '93%', '2018-03-21 11:32:10');
INSERT INTO elm_zhiwen VALUES ('3', '小明', '已输入', '是', '92%', '2018-03-20 11:32:33');
INSERT INTO elm_zhiwen VALUES ('4', '小凡', '已输入', '是', '93%', '2018-03-21 11:32:59');
INSERT INTO elm_zhiwen VALUES ('5', '艳萍', '已输入', '是', '92%', '2018-03-21 11:35:09');

-- ----------------------------
-- Table structure for `elm_zichan`
-- ----------------------------
DROP TABLE IF EXISTS `elm_zichan`;
CREATE TABLE `elm_zichan` (
  `id` int(11) NOT NULL,
  `guding` varchar(200) DEFAULT NULL,
  `liudong` varchar(200) DEFAULT NULL,
  `all` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elm_zichan
-- ----------------------------
INSERT INTO elm_zichan VALUES ('1', '235579RMB', '4358932RMB', '23545243RMB');
