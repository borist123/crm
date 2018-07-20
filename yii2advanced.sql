/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : yii2advanced

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-01-03 14:00:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('普通管理员', '4', null);
INSERT INTO `auth_assignment` VALUES ('普通管理员', '6', '1483423097');
INSERT INTO `auth_assignment` VALUES ('超级管理员', '1', '1460687522');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('item/create', '2', null, 'item/create', null, '1483422367', '1483422367');
INSERT INTO `auth_item` VALUES ('item/index', '2', '创建了[item/index]权限', null, null, '1459243859', '1459243859');
INSERT INTO `auth_item` VALUES ('item/manage', '2', '创建了[item/manage]权限', null, null, '1459243859', '1459243859');
INSERT INTO `auth_item` VALUES ('item/permission', '2', '创建了[item/permission]权限', null, null, '1482892694', '1482892694');
INSERT INTO `auth_item` VALUES ('item/set', '2', '创建了[item/set]权限', null, null, '1482892019', '1482892019');
INSERT INTO `auth_item` VALUES ('menu/create', '2', '创建了[menu/create]权限', null, null, '1482831038', '1482831038');
INSERT INTO `auth_item` VALUES ('menu/delete', '2', '创建了[menu/delete]权限', null, null, '1482896483', '1482896483');
INSERT INTO `auth_item` VALUES ('menu/index', '2', null, null, null, null, null);
INSERT INTO `auth_item` VALUES ('menu/manage', '2', '创建了[menu/index]权限', null, null, '1459244264', '1459244264');
INSERT INTO `auth_item` VALUES ('menu/update', '2', '创建了[menu/update]权限', null, null, '1482892616', '1482892616');
INSERT INTO `auth_item` VALUES ('system/manage', '2', '创建了[item/manage]权限', null, null, '1459243859', '1459243859');
INSERT INTO `auth_item` VALUES ('test/index', '2', null, 'test/index', null, '1483089854', '1483089854');
INSERT INTO `auth_item` VALUES ('user/create', '2', null, null, null, null, null);
INSERT INTO `auth_item` VALUES ('user/delete', '2', null, 'user/delete', null, '1483421739', '1483421739');
INSERT INTO `auth_item` VALUES ('user/list', '2', '创建了[user/list]权限', null, null, '1482905245', '1482905245');
INSERT INTO `auth_item` VALUES ('user/manage', '2', '创建了[test/index]权限', null, null, '1460715690', '1460715690');
INSERT INTO `auth_item` VALUES ('user/update', '2', null, 'user/update', null, '1483421739', '1483421739');
INSERT INTO `auth_item` VALUES ('普通用户', '1', '创建[普通用户]角色', null, null, '1459502750', '1459502750');
INSERT INTO `auth_item` VALUES ('普通管理员', '1', '拥有后台管理权限', null, null, '1458195329', '1458195329');
INSERT INTO `auth_item` VALUES ('网站编辑', '1', '拥有编辑权限', null, null, '1458195363', '1458195363');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', '拥有网站所有权限', null, null, '1458195294', '1458195294');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'item/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/create');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'item/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/index');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'item/manage');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/manage');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'item/permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/permission');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'item/set');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'item/set');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'menu/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/create');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'menu/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/delete');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'menu/manage');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/manage');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'menu/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/update');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'system/manage');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'system/manage');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'test/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'test/index');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'user/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/delete');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'user/list');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/list');
INSERT INTO `auth_item_child` VALUES ('普通管理员', 'user/manage');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/manage');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'user/update');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('item/create', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"item/create\";s:9:\"createdAt\";i:1483422367;s:9:\"updatedAt\";i:1483422367;}', '1483422367', '1483422367');
INSERT INTO `auth_rule` VALUES ('item/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"item/index\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('item/manage', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"item/manage\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('item/permission', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:15:\"item/permission\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('item/set', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:8:\"item/set\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('menu/create', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"menu/create\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('menu/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"menu/delete\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('menu/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"menu/index\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('menu/manage', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"menu/manage\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('menu/update', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"menu/update\";s:9:\"createdAt\";i:1483089704;s:9:\"updatedAt\";i:1483089704;}', '1483089704', '1483089704');
INSERT INTO `auth_rule` VALUES ('system/manage', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:13:\"system/manage\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('test/index', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:10:\"test/index\";s:9:\"createdAt\";i:1483089740;s:9:\"updatedAt\";i:1483089740;}', '1483089740', '1483089740');
INSERT INTO `auth_rule` VALUES ('user/create', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/create\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('user/delete', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/delete\";s:9:\"createdAt\";i:1483421739;s:9:\"updatedAt\";i:1483421739;}', '1483421739', '1483421739');
INSERT INTO `auth_rule` VALUES ('user/list', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:9:\"user/list\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('user/manage', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/manage\";s:9:\"createdAt\";i:1483089703;s:9:\"updatedAt\";i:1483089703;}', '1483089703', '1483089703');
INSERT INTO `auth_rule` VALUES ('user/update', 'O:21:\"common\\core\\rbac\\Rule\":3:{s:4:\"name\";s:11:\"user/update\";s:9:\"createdAt\";i:1483421739;s:9:\"updatedAt\";i:1483421739;}', '1483421739', '1483421739');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('AU', 'Australia', '18886000');
INSERT INTO `country` VALUES ('BR', 'Brazil', '170115000');
INSERT INTO `country` VALUES ('CA', 'Canada', '1147000');
INSERT INTO `country` VALUES ('CN', 'China', '1277558000');
INSERT INTO `country` VALUES ('DE', 'Germany', '82164700');
INSERT INTO `country` VALUES ('FR', 'France', '59225700');
INSERT INTO `country` VALUES ('GB', 'United Kingdom', '59623400');
INSERT INTO `country` VALUES ('IN', 'India', '1013662000');
INSERT INTO `country` VALUES ('RU', 'Russia', '146934000');
INSERT INTO `country` VALUES ('US', 'United States', '278357000');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `data` varchar(64) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'lzkong1029', '127.0.0.1', '', '1460439851');
INSERT INTO `log` VALUES ('2', 'lzkong1029', '127.0.0.1', '', '1460441344');
INSERT INTO `log` VALUES ('3', 'test', '127.0.0.1', '', '1460441372');
INSERT INTO `log` VALUES ('4', 'lzkong1029', '127.0.0.1', '', '1460441448');
INSERT INTO `log` VALUES ('5', 'lzkong1029', '127.0.0.1', '', '1460443092');
INSERT INTO `log` VALUES ('6', 'test', '127.0.0.1', '', '1460510935');
INSERT INTO `log` VALUES ('7', 'lzkong1029', '127.0.0.1', '', '1460511022');
INSERT INTO `log` VALUES ('8', 'lzkong1029', '127.0.0.1', '', '1460511099');
INSERT INTO `log` VALUES ('9', 'test', '127.0.0.1', '', '1460511126');
INSERT INTO `log` VALUES ('10', 'lzkong1029', '127.0.0.1', '', '1460518525');
INSERT INTO `log` VALUES ('11', 'test', '127.0.0.1', '', '1460529644');
INSERT INTO `log` VALUES ('12', 'lzkong1029', '127.0.0.1', '', '1460683222');
INSERT INTO `log` VALUES ('13', 'test', '127.0.0.1', '', '1460687319');
INSERT INTO `log` VALUES ('14', 'lzkong1029', '127.0.0.1', '', '1460687331');
INSERT INTO `log` VALUES ('15', 'admin', '127.0.0.1', '', '1460687467');
INSERT INTO `log` VALUES ('16', 'admin', '127.0.0.1', '', '1460713859');
INSERT INTO `log` VALUES ('17', 'admin', '127.0.0.1', '', '1466130336');
INSERT INTO `log` VALUES ('18', 'admin', '127.0.0.1', '', '1481181682');
INSERT INTO `log` VALUES ('19', 'admin', '127.0.0.1', '', '1482823318');
INSERT INTO `log` VALUES ('20', 'admin', '127.0.0.1', '', '1483422295');
INSERT INTO `log` VALUES ('21', 'test123', '127.0.0.1', '', '1483423113');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `sort` varchar(11) DEFAULT NULL,
  `data` text,
  `status` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `name` (`name`),
  KEY `route` (`route`(255)),
  KEY `order` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2', '系统管理', '0', 'system/manage', '2', '', '1');
INSERT INTO `menu` VALUES ('16', '用户管理', '2', 'user/manage', null, '', '1');
INSERT INTO `menu` VALUES ('19', '角色管理', '2', 'item/manage', null, '', '1');
INSERT INTO `menu` VALUES ('21', '菜单管理', '2', 'menu/manage', null, '', '1');
INSERT INTO `menu` VALUES ('40', '新增菜单', '21', 'menu/create', '', '', '0');
INSERT INTO `menu` VALUES ('41', '配置权限', '19', 'item/set', '', '', '0');
INSERT INTO `menu` VALUES ('42', '编辑菜单', '21', 'menu/update', '', '', '0');
INSERT INTO `menu` VALUES ('43', '权限列表', '19', 'item/permission', '', '', '0');
INSERT INTO `menu` VALUES ('44', '新增用户', '16', 'user/create', '', '', '0');
INSERT INTO `menu` VALUES ('45', '菜单列表', '21', 'menu/index', '', '', '1');
INSERT INTO `menu` VALUES ('47', '删除菜单', '21', 'menu/delete', '', '', '0');
INSERT INTO `menu` VALUES ('48', '角色列表', '19', 'item/index', '', '', '1');
INSERT INTO `menu` VALUES ('49', '用户列表', '16', 'user/list', '', '', '1');
INSERT INTO `menu` VALUES ('50', '测试', '0', 'test/index', '', '', '1');
INSERT INTO `menu` VALUES ('51', '更新用户', '16', 'user/update', '', '', '0');
INSERT INTO `menu` VALUES ('52', '删除用户', '16', 'user/delete', '', '', '0');
INSERT INTO `menu` VALUES ('53', '新建角色', '19', 'item/create', '', '', '0');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1452736387');

-- ----------------------------
-- Table structure for offer
-- ----------------------------
DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jobs` varchar(200) DEFAULT NULL,
  `job` varchar(200) DEFAULT NULL,
  `jobContent` text,
  `address` varchar(500) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `formalSalary` varchar(16) DEFAULT NULL,
  `acceptTime` varchar(16) DEFAULT NULL,
  `reportTime` varchar(16) DEFAULT NULL,
  `sendTime` varchar(16) DEFAULT NULL,
  `creatTime` varchar(16) DEFAULT NULL,
  `status` int(4) DEFAULT '0',
  `hrName` varchar(20) DEFAULT NULL,
  `hrEmail` varchar(1000) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `disagreeReason` varchar(2000) DEFAULT NULL,
  `bonus` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fdId` varchar(32) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `click` int(2) DEFAULT '5',
  `sendStatus` int(2) DEFAULT '0',
  `rankBonus1` varchar(4) DEFAULT NULL,
  `rankBonus2` varchar(4) DEFAULT NULL,
  `familyBonus` varchar(8) DEFAULT NULL,
  `haveFamilyBonus` varchar(4) DEFAULT NULL,
  `familyBonusMonth` varchar(16) DEFAULT NULL,
  `familyBonusTime` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offer
-- ----------------------------
INSERT INTO `offer` VALUES ('89', 'offer20151205024411', '胡蕾', 'hulei_125@163.com', '智能家居业务-硬件产品部总监', 'YJCP00_硬件产品部总监', '1、负责公司智能家居产品规划及设计，硬件产品部门的统筹管理；<BR>2、在硬件产品的整个生命周期内对产品的性能、质量以及竞争力进行管理；', '深圳及其控股公司、子公司所在地', '32000.00', '35000 元/月', '1450195200', '1450022400', '1449297849', null, '0', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（3）个月工资', '18666665212', '151700e9b8d35d4e173fca947c0a1403', '4ac5f4d5b0c546ebab793778e6bf5f80c8651e9c50194321bb39ccc4e5e7e27fab793778', '3', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('90', 'offer20151205024610', '潘明波', '271147091@qq.com', '智能家居业务-硬件研发部副经理', 'YJYF00_硬件研发部副经理', '1、负责带领团队完成IPC产品开发、系统集成、客户端相关软件开发，对外平台接入等工作；<BR>2、解决项目开发与量产中的出现的关键问题和技术难题；<BR>3、负责IPC产品线代码维护，bug跟踪处理，团队的部门建设工作；<BR>4、负责相机产品线长远产品规划和功能迭代升级；<BR>5、负责视频解决方案预研，产品解决方案，成本维护及产品周期管理；', '深圳及其控股公司、子公司所在地', '28000.00', '30000 元/月', '1449936000', '1449676800', '1449297969', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（2）个月工资', '18666665212', '1516c62cc6a1c67d60ee9514f509eaa2', '2590f933610a464cba905efc5484e7a9a6c35754cf044391affe887ef3d69a2bba905efc', '-1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('95', 'offer20151208115942', '王新意', 'wangtshc@aliyun.com', '智能家居业务-嵌入式开发工程师', 'YJYF02_嵌入式软件开发工程师', '1、负责zigbee终端产品开发；<BR>2、负责zigbee终端产品用例规划，建立测试标准；<BR>3、负责zigbee终端产品bug修复；', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1452096000', '1452096000', '1449547182', null, '1', '苏雯', 'suwen@wondershare.cn;pengpy@wondershare.cn', '210.75.16.194', null, '（1）个月工资', '18666665212', '1517afed6ca55355a859e33475382f7f', 'e817f7c592e543f3bb6d4611916f48045a4f60cf95b14232b4dfd3754682f644bb6d4611', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('96', 'offer20151208020304', '马建坤', 'majiankun@foxmail.com	', '智能家居业务-高级嵌入式软件开发工程师', 'YJYF02_高级嵌入式软件开发工程师', '1、负责无线路由产品开源OPENWRT系统开发，对路由固件系统进行定制、优化，添加新的硬件平台支持<BR>2、负责无线路由器底层开发，网络编程及相关网络协议，<BR>3、负责修改定制UBOOT及OPENWRT固件，Linux内核配置、IPTable工具、QoS实现、网卡驱动；<BR>4、负责wifidog开发，luci定制；', '深圳及其控股公司、子公司所在地', '17000.00', '18000 元/月', '1450627200', '1450627200', '1449554583', null, '1', '苏雯', 'suwen@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1517f250e7bfbc732d3a21d4142abf7a', '251565c7a41f4c2f9ce3a1563ba0450c436bc90370ba423ebf29b633e17356df9ce3a156', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('97', 'offer20151208045624', '胡夷琛', 'chyiuen@126.com', '智能家居业务-高级市场营销经理', 'GNSC11_高级市场营销经理', '1、根据公司品牌与产品的市场目标，制定清晰、可行的线上/线下营销策略与计划；<BR>2、通过有效的线上/线下营销手段，提高媒体及用户关注度，促进新用户增长和提升用户活跃度，树立品牌与产品的良好口碑；<BR>3、对具体的线上/线下营销项目提出营销创意、完成活动策划并执行落实；<BR>4、跟踪线上/线下活动效果，分析数据、总结经验，并积极反馈与分享；<BR>5、维护线上推广渠道，包括微博，微信，论坛，QQ群等；<BR>6、落实执行线下推广活动，包括市场物料的准备和派发、与外部合作伙伴谈判与合作等。', '深圳及其控股公司、子公司所在地', '22000.00', '视试用期表现待定', '1452614400', '1452182400', '1449564984', null, '1', '苏雯', 'suwen@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1517f5ca17f00e699e20b7943f2bba1a', 'e696eeea927c4a708cbb66a35aeb2f95acc7fdf07a6a444ab84de12203d9397b8cbb66a3', '3', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('98', 'offer20151208071350', '陈马华', 'cmhitsuna@163.com', '消费软件业务-商务专员', 'ZXSC00_商务专员(海外)', '1.负责挖掘、开拓新的合作伙伴并维护重点合作伙伴关系，建立有效的运营推广渠道（包括但不限于合作平台、代理商、合作商、合作站点等）;<br>2.制定合作方案、协调资源，推动项目的执行，确保相应指标的完成；<br>3.定期整理、收集与挖掘客户需求，及时反馈，提出针对性的改进意见；<br>4.组织实施对目标群体和合作伙伴的各类培训、宣讲；<br>5.分析所负责渠道的销售情况，确保目标达成，并对销售数据异常情况进行深入分析和妥善处理；<br>6.相关业务流程优化与沉淀，积极交流与分享经验，撰写经验文档。', '深圳及其控股公司、子公司所在地', '7000.00', '与试用期一致', '1450022400', '1450108800', '1449573231', null, '0', '刘义坤', 'liuyk@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18664398306', '15180d3722b8397ac9e20174c81ae7a6', '6f01fc9f1a2b4fa4b33fdc1b8a4540c8a18c20f4488e40b88e0b89d60607e95bb33fdc1b', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('99', 'offer20151208071402', '陈马华', 'cmhitsuna@163.com1', '消费软件业务-商务专员', 'ZXSC00_商务专员(海外)', '1.负责挖掘、开拓新的合作伙伴并维护重点合作伙伴关系，建立有效的运营推广渠道（包括但不限于合作平台、代理商、合作商、合作站点等）;<br>2.制定合作方案、协调资源，推动项目的执行，确保相应指标的完成；<br>3.定期整理、收集与挖掘客户需求，及时反馈，提出针对性的改进意见；<br>4.组织实施对目标群体和合作伙伴的各类培训、宣讲；<br>5.分析所负责渠道的销售情况，确保目标达成，并对销售数据异常情况进行深入分析和妥善处理；<br>6.相关业务流程优化与沉淀，积极交流与分享经验，撰写经验文档。', '深圳及其控股公司、子公司所在地', '7000.00', '与试用期一致', '1450022400', '1450108800', '1449573242', null, '1', '刘义坤', 'liuyk@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18664398306', '15180d3722b8397ac9e20174c81ae7a6', '09417054f35644ee8ccc764e765cd746fb31604fa43f4fea9b727bf1a463bdc48ccc764e', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('106', 'offer20151209100522', '潘长涛', 'eager7@163.com', '智能家居业务-嵌入式软件开发工程师', 'YJYF02_嵌入式软件开发工程师', '1、负责zigbee终端产品开发；<br>2、负责zigbee终端产品用例规划，建立测试标准；<br>3、负责zigbee终端产品bug修复。', '深圳及其控股公司、子公司所在地', '12000.00', '13000 元/月', '1449763200', '1452441600', '1449626723', null, '-1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '127.0.0.1', '原公司诚意挽留，选择不离职了', '（1）个月工资', '13923799790', '151804efbbdac7192bc13ef455aa1071', 'c143d3e3dd1842718e8f61a7941e32f69f30681e4cd54a679299e7e5225c74238e8f61a7', '4', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('115', 'offer20151209023025', '王乐乐', 'wangraku@126.com', '消费软件业务-在线广告专员', 'YXFW02_在线广告专员', '1、负责日本的亚马逊、乐天等商城的运营，学习公司具体软件产品，同时学习GoogleAdwords/YahooPPC广告海外投放管理；<BR>2、优化广告帐户，提高广告转换率；<BR>3、通过广告优化对账户进行调整和延展，扩大账户规模提升广告效果；<BR>4、与PPC营销团队通力协作，共同提高；<BR>5、对广告带来的销售净额负责。', '深圳及其控股公司、子公司所在地', '6500.00', '7500 元/月', '1450022400', '1450022400', '1449642622', null, '1', '刘义坤', 'liuyk@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18664398306', '1518450acb3bf898467012a4d1d8e3e2', '9c6c47c74a444dfcb7768d79438f1bec7d48153b7f05482685fef900364676f2b7768d79', '3', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('118', 'offer20151209052731', '张慧', '359124069@qq.com', '消费软件业务-网站运营专员', 'YXRY04_网站运营专员', '1、根据日语营销部推广策略，进行JP网站推广，提高网站流量，实现销售目标；<BR>2、分析产品市场，根据用户需求，撰写文章，搭建内容；<BR>3、对公司所拍视频进行推广，从不同渠道进行传播，对视频的效果进行跟踪，维护，以提升公司品牌知名度、粉丝量、用户浏览量和购买转化率；<BR>4、负责外部联系合作，通过与各大博客主、门户网站、行业站点进行产品宣传和促销活动，获得高质量外链的同时，最终提高整体产品销售。', '深圳及其控股公司、子公司所在地', '6500.00', '7500 元/月', '1450022400', '1450195200', '1449653248', null, '1', '刘义坤', 'liuyk@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18664398306', '151857917177be6c2d5e1f14a199e88e', '0c3a88ada6ba4dcd8e380a409ffe9abada0ba17f02fc4500aa9fd10c91dc196d8e380a40', '3', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('145', 'offer20151210042926', '王辉', 'whhn80@126.com', '智能家居业务-高级客服经理', 'KHFW02_高级客服经理', '1、为用户提供咨询服务及售前技术支持；<br>2、受理客户售后抱怨和投诉，分析并识别客户问题，提供解决方案，督办解决或反馈处理结果；<br>3、客户和产品档案管理；<br>4、客户互动、存量用户线上二次销售。', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1450022400', '1450627200', '1449736167', null, '1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13923799790', '1518a5ee034ff620d55d22940a4ac588', '1c914a7935164ba2ba0598ee93b7447058d946fc738f45ee948cfb017a333a23ba0598ee', '1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('146', 'offer20151210052742', '於忆', 'flora.yue@hotmail.com', '消费软件业务-商务专员（海外）', 'ZXSC00_商务专员(海外)', '1.负责挖掘、开拓新的合作伙伴并维护重点合作伙伴关系，建立有效的运营推广渠道（包括但不限于合作平台、代理商、合作商、合作站点等）;<BR>2.制定合作方案、协调资源，推动项目的执行，确保相应指标的完成；<BR>3.定期整理、收集与挖掘客户需求，及时反馈，提出针对性的改进意见；<BR>4.组织实施对目标群体和合作伙伴的各类培训、宣讲；<BR>5.分析所负责渠道的销售情况，确保目标达成，并对销售数据异常情况进行深入分析和妥善处理；<BR>6.相关业务流程优化与沉淀，积极交流与分享经验，撰写经验文档。', '深圳及其控股公司、子公司所在地', '10000.00', '视试用期表现待定', '1449849600', '1450022400', '1449739662', null, '1', '何珊', 'heshan@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '15189c9e657e57b86ebb1e2472b8c6e7', '71188ec50af543179ce5c86847f33575e667aa7160214c6998abae50f5a63dc29ce5c868', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('147', 'offer20151210053412', '欧阳利军', '187314586@qq.com', '智能家居业务-高级商务合作经理', 'GNSC12_高级商务合作经理', '1、线下活动的商圈周边异业BD合作规划与洽谈；<BR>2、社会行业类（如运动、建材）异业结盟的合作；<BR>3、协助线下营销活动落地执行；', '深圳及其控股公司、子公司所在地', '18000.00', '视试用期表现待定', '1449849600', '1450022400', '1449740052', null, '1', '何珊', 'heshan@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '15189ef4ae48248c29006274d60b6caa', '30e9c01b8e244bc5882601fa91d42f21ba84b81c1670499a920b909afe3bd8f0882601fa', '1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('148', 'offer20151210054639', '何丽莎', '399412626@qq.com', '智能家居业务-网络营销策划专员', 'GNSC11_网络营销策划专员', '1、根据公司品牌与产品的市场目标，制定清晰、可行的线上/线下营销策略与计划；<BR>2、通过有效的线上/线下营销手段，提高媒体及用户关注度，促进新用户增长和提升用户活跃度，树立品牌与产品的良好口碑；<BR>3、对具体的线上/线下营销项目提出营销创意、完成活动策划并执行落实；<BR>4、跟踪线上/线下活动效果，分析数据、总结经验，并积极反馈与分享；<BR>5、维护线上推广渠道，包括微博，微信，论坛，QQ群等；<BR>6、落实执行线下推广活动，包括市场物料的准备和派发、与外部合作伙伴谈判与合作等。', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1449849600', '1450022400', '1449740799', null, '1', '何珊', 'heshan@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '15189fe959dc830cfbb67dc40b8ac8b8', '3d3c8418ff6f48c0b6399a09c6ce19cc92e68b3c0fb1437a9e06c980b99d018db6399a09', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('215', 'offer20151212015819', '黄金敏', 'hjm201@126.com ', '智能家居业务-高级前端开发工程师', 'PTYD00_高级前端开发工程师', '1.负责产品前端部分的开发；<br>2.配合产品和设计师实现产品UI和交互方面的开发需求；<br>3.配合后端开发人员实现产品界面和功能。', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1450108800', '1450281600', '1449899900', null, '-1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', '已选择其他工作机会，对方提供的岗位/发展空间/薪酬待遇更有吸引力', '（1）个月工资', '13923799790', '1518fde7429fdb39a2928b34a5483dba', 'ea4851618b954903809d4c3efbb137ad2dbeb48ee4754e178c8cfc7259aa87ab809d4c3e', '4', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('216', 'offer20151212020132', '方昳', 'hatidie@163.com', '智能家居业务-新媒体运营经理', 'GNSC11_新媒体运营经理', '1、负责统筹官方自媒整体运作工作，公司官方微博/微信的日常运营管理，包括负责微博/微信的内容撰写与发布、话题制造、活动策划和执行；<BR>2、建立有效运营手段提升微博/微信用户活跃度，增加粉丝数，提高关注度；<BR>3、能够快速响应社会、行业热点话题，及时规划品牌活动和事件的新媒体传播；<BR>4、跟踪微信微博推广效果，分析用户数据并及时反馈。<BR>5、完成上级领导交给的其它工作。', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1450022400', '1450195200', '1449900093', null, '1', '何珊', 'heshan@wondershare.cn;pengpy@wondershare.cn', '183.17.163.163', null, '（1）个月工资', '13418602101', '15194114a7be27c71fe946b4688a9055', 'e307f4f460914af79d40c487e51a36b766f43330700942b58d6f6a6eb08880a49d40c487', '1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('226', 'offer20151215090632', '王国壮', '619153099@qq.com', '智能家居业务-测试工程师', 'YJYF06_测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<br>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<br>3.提交软件缺陷报告并跟踪处理流程；<br>4.进行测试需求分析、测试结果分析报告；组织定版评审会议', '深圳及其控股公司、子公司所在地', '8000.00', '9000 元/月', '1450281600', '1450627200', '1450141594', null, '1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '183.60.35.94', null, '（1）个月工资', '13923799790', '1519e1e4f8004f2324f882a450f8849b', '245551958ace4c00ad503598831187f6a4b0c6ee3a4f47cb96902ec807a6ec57ad503598', '0', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('227', 'offer20151215115315', '蒋金雄', '348248135@qq.com', '智能家居业务-高级嵌入式软件开发工程师', 'YJYF06_高级嵌入式软件开发工程师', '1、负责IPC不同技术方案的嵌入式软件视频模块开发；<br>2、IPC升级模块优化以及产品问题响应处理；<br>3、负责嵌入式linux系统下的IPC驱动程序优化；<br>4、IPC功能定制化开发架构搭建；<br>5、统一负责发布IPC软件测试版本到相关测试人员。', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1450281600', '1450627200', '1450151597', null, '1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '163.125.40.213', null, '（1）个月工资', '13923799790', '1519e49b434eda4861cb1a342a7a9eb9', '2ac8c518af4d4610837a9107b54aca97163df7ce11b647ed9a4fd0168e1c503a837a9107', '-1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('246', 'offer20151218091548', '万芊芊', '314054172@qq.com', '智能家居业务-客服经理', 'KHFW02_客服经理', '1、为用户提供咨询服务及售前技术支持；<br>2、受理客户售后抱怨和投诉，分析并识别客户问题，提供解决方案，督办解决或反馈处理结果；<br>3、客户和产品档案管理；<br>4、客户互动、存量用户线上二次销售', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1450627200', '1450627200', '1450401349', null, '1', '符慧', 'fuhui@wondershare.cn;pengpy@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13923799790', '151adf074a9640328bade684a8d8149a', '50aa8345af7240f08078ec3a36f3a3b3a8df9479516040bc98580848bbbe79538078ec3a', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('247', 'offer20151218093250', '米萌', 'neatflin@163.com', '消费软件业务-海外产品运营', 'WSVS06_网站运营专员', '、对产品进行功能和用户需求分析,了解用户需求和挖掘产品市场空间；<br>2、基于产品的内容专题整体规划，包括内容需求挖掘、内容专题策划、内容结构策划与设计的跟进、页面编辑与发布上线；<br>3、使用内容外包平台，寻找性价比高的英文本地写手，完成高质量本地化英语内容建设。包括过程监控、跟进实施、效果分析等；<br>4、采集与产品相关的行业热点信息，快速制作专题并及时发布至网站；<br>5、负责网站相关频道内容采编策划、网站设计跟进和页面编辑、核实；<br>6、负责网站栏目信息的采集、整理和发布；<br>7、对网站进行日常更新和维护，保证网站健康质量。', '深圳及其控股公司、子公司所在地', '11000.00', '13000 元/月', '1450627200', '1450627200', '1450402370', null, '1', '郭哲', 'guozhe@wondershare.cn;pengpy@wondershare.cn', '218.18.248.128', null, '（1）个月工资', '18589046466', '151af1ca85064cdbb1f4f644be0b7b55', '8049935965a54c62872f92ac61eb959caeecfe88c0f04e7ebfd8b818e24b2bb5872f92ac', '3', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('254', 'offer20151218040632', '付广广', '1683431978@qq.com', '消费软件业务-网站运营专员', 'WSYX05_网站运营专员', '1、负责产品的内容运营工作，能根据产品市场需求与既定运营指标制定内容运营计划并实施上线。<BR>2、联系海外媒体，博主等各种推广资源进行产品评测促销合作，达成产品曝光，促进销售。<BR>3、运用各种SEO营销工具，分析用户行为和页面转化率，不断优化网站内容，提升网站质量促进产品线目标达成。', '深圳及其控股公司、子公司所在地', '6000.00', '7000 元/月', '1450627200', '1450627200', '1450425988', null, '1', '徐赛红', 'xush@wondershare.cn;pengpy@wondershare.cn', '14.16.132.74', null, '（1）个月工资', '18682386616', '151b396737bd48ac42d6f0b4e3f9b525', 'dfd8d3c390dd4a53aa945709b7082e143336ad90a45d49b3884d67013077b6b1aa945709', '-1', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('255', 'offer20151218041815', '陈寿松', '65476904@qq.com', '消费软件业务-Win软件开发工程师(C#)', 'MGYF14_高级Win软件开发工程师(C#)', '1、负责Win平台下新技术方案研究，完成相关技术点预研与实现；<BR>2、根据产品需求，完成Win平台下的产品的设计与实现；<BR>3、对已有产品的进行维护升级，协助客服快速解决用户问题等。', '深圳及其控股公司、子公司所在地', '18000.00', '与试用期一致', '1450627200', '1450627200', '1450426692', null, '1', '徐赛红', 'xush@wondershare.cn;pengpy@wondershare.cn', '117.136.40.212', null, '（1）个月工资', '18682386616', '151b3c8011bf633fdd19def4769a5b51', 'a77ae194a8a24d0d8badd255bfa6dd00caee4a939f454cc691256f0178cf3f408badd255', '2', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('259', 'offer20151222100110', '梁斐良', 'frank_liang22@163.com', '消费软件业务-Win软件开发工程师(Python)', 'MGYF14_Win软件开发工程师(Python)', '1、参与下载产品底层的方案设计、开发与维护；<BR>2、分析各音视频站点结构和媒体协议，确保音视频资源能正确下载；<BR>3、负责下载成功率数据监测、问题跟踪并及时解决；<BR>4、负责工作室其他相关应用模块开发（C++）。', '深圳及其控股公司、子公司所在地', '8500.00', '9500 元/月', '1450886400', '1452441600', '1450749669', null, '0', '徐赛红', 'xush@wondershare.cn', '183.37.240.174', null, '（1）个月工资', '18682386616', '151c3ae14ad3b5b517cd2944cda89ea8', 'c5abd2a6606545db8b7684cbf485bbe6e8c17c96eb5440c6902b9d77119f87238b7684cb', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('260', 'offer20151222041509', '彭汉斌', '104568699@qq.com ', '消费软件业务-海外网站运营', 'WSVS06_网站运营专员', '1、对产品进行功能和用户需求分析,了解用户需求和挖掘产品市场空间；<br>2、基于产品的内容专题整体规划，包括内容需求挖掘、内容专题策划、内容结构策划与设计的跟进、页面编辑与发布上线；<br>3、使用内容外包平台，寻找性价比高的英文本地写手，完成高质量本地化英语内容建设。包括过程监控、跟进实施、效果分析等；<br>4、采集与产品相关的行业热点信息，快速制作专题并及时发布至网站；<br>5、负责网站相关频道内容采编策划、网站设计跟进和页面编辑、核实；<br>6、负责网站栏目信息的采集、整理和发布；<br>7、对网站进行日常更新和维护，保证网站健康质量。', '深圳及其控股公司、子公司所在地', '11000.00', '13000 元/月', '1450886400', '1451232000', '1450772109', null, '1', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '151c7c8c2921ece68cab9514fe28fb42', '850bfe0399b2457a9974334f8ce6299157a1a5b645034398b04784ec2cea58699974334f', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('261', 'offer20151223020538', '姚永杰', '692471453@qq.com', '消费软件业务-高级Win软件开发（C++)', 'WSVS04_高级Win软件开发工程师(C++)', '1.音视频框架<br>2.非线性编辑', '深圳及其控股公司、子公司所在地', '20000.00', '22000 元/月', '1451232000', '1453046400', '1450850738', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '151c94fc84f19fba6d615b64f2bb1f5e', '2bf406e1029348b1b779c9b5570a6b5df45bfd91790944d1935850d6a3b9897bb779c9b5', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('262', 'offer20151225110334', '王栋生', 'wds813@139.com', '智能家居业务-客户服务部总监助理', '', '协助客服体系搭建、售前售后咨询服务管理、客户运营管理；', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1451145600', '1451232000', '1451012615', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（2）个月工资', '18666665212', '151d2a0418823fb0f7c2f0d484d98b89', 'a3d6fc8d447147df9ce86931dbe37104cddc4987fd2a427184f097c9bd9b11bb9ce86931', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('263', 'offer20151225020755', '周长川', '490318420@qq.com ', '消费软件业务-资深IOS开发', 'PTAP00_资深iOS软件开发工程师', '1、制定项目阶段开发计划<br><br>2、针对技术难点进行规划、预研，输出技术预研分析报告，形成技术对比方案及发展规划分析<br><br>3、从整体进行系统设计，包括系统架构、模块、接口、集成等设计，形成系统设计说明书<br><br>4、编写代码，实现模块功能，并完成各模块集成。', '深圳及其控股公司、子公司所在地', '23000.00', '26000 元/月', '1451232000', '1453046400', '1451023675', null, '0', '郭哲', 'guozhe@wondershare.cn', '157.55.39.136', null, '（1）个月工资', '18589046466', '151c94aece9064befd47d30473399c23', '3bbbcb6506384f4d8dba1091458dd389562e57f1d27c49adb5d856d738e3fad48dba1091', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('264', 'offer20151228124407', '王洪述', 'davl.2008@163.com ', '智能家居业务-品质工程师', 'YJCP05_品质工程师', '1、深度管理ODM/OEM合作项目现场过程品质，积极参与合作方评估、筛选、监控及改进；<br>2、与工厂合作进行必要的技术改进，以满足公司的产品质量要求；<br>3、负责产品品质控制计划，对制程各环节品质实施监管，并对成品交付前进行放行确认；<br>4、在产品开发期间提供生产过程品质建议，在大规模生产之前，分析和总结有关产品的设计、材料和结构风险；<br>5、参与试产跟踪，组织ODM/OEM输出试产问题清单并推动解决，对量产、出货节点的成熟度做品质整体评估。<br>7．跟进线体认证、跟进首批出货OQC检查结果,保证项目达到量产的成熟状态。<br>8．出货后，参与市场线上线下的退机率改善，并对项目品质总结和复盘。', '深圳及其控股公司、子公司所在地', '12000.00', '14000 元/月', '1451404800', '1451836800', '1451277849', null, '1', '符慧', 'fuhui@wondershare.cn', '115.174.81.140', null, '（1）个月工资', '13923799790', '151d71eaf30f5565874930844709df32', '1780d8ffb7bc4b6fb33055dd558e5430fcce0f47a3c14b98964dee8e43b23cd5b33055dd', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('265', 'offer20151231050730', '谭明华', 'tmh919@126.com', '智能家居业务-高级网络营销经理', '', '面向C的线上推广，包括SEM、SEO、网站策划、新媒体运营及传播<BR>电子商务的站内推广、店铺运营及销售成交', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1451750400', '1451923200', '1451552849', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '151f6920ef8c575b07754a44cb4a1476', '18bc0a42bd1b47afa2b6a2ec15344fea8f4e3f5094f94f8285b7c4dcc35b38dea2b6a2ec', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('266', 'offer20151231052404', '郑奇博', '465806@qq.com', '智能家居业务-媒介经理', '', '品牌行业露出，媒体投放；<BR>品牌VIS管理维护；<BR>协助部分面向C端的媒体PR工作，如产品评测、媒体曝光等。', '深圳及其控股公司、子公司所在地', '24000.00', '25000 元/月', '1452182400', '1452441600', '1451553842', null, '0', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '151f6976131a2f67db398c1444cb114a', '12cff29ffe7c441dae0f8e5bb88eba41636da22287a5431fae463026033efc09ae0f8e5b', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('267', 'offer20160104043241', '潘昊', 'panhao9997@163.com', '智能家居业务-市场推广经理', '', '1、根据公司整体市场规划，结合产品营销，制定区域市场推广策略；<BR>2、负责公司展会活动的策划、执行、督导，公司品牌宣传推广及项目策划管理；<BR>3、负责市场竞争调研分析、信息搜集与反馈，把握市场趋势；<BR>4、负责公司商务合作、对外宣传活动及公司品牌形象的策划；', '深圳及其控股公司、子公司所在地', '12000.00', '视试用期表现待定', '1451923200', '1452009600', '1451896363', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '151f6d81b45bca04183491642059472c', 'dfb6a943fb20496ca5d1786d22693529ebd03df04b68488087de662cb41b71f5a5d1786d', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('268', 'offer20160108060731', '陈惠云', '12770098@qq.com', '智能家居业务-线下运营部总监', '', '面向C的线下推广，包括线下广告策划及实施、基于线下的各种商务合作、地面引流活动<BR>区域复制扩张', '深圳及其控股公司、子公司所在地', '30000.00', '视试用期表现待定', '1453392000', '1453651200', '1452247651', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（3）个月工资', '18666665212', '1521f38ca14552332e5d7af4e739639e', '82b6538388574ae1ba5bca9026fea0521d2a9a9d1cef476ca5bf8359ac951613ba5bca90', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('270', 'offer20160111052332', '于仁龙', 'yurenlong@126.com', '消费软件业务-高级Win软件开发（C#)', 'VS03_高级Win软件开发工程师(C#)', '1、制定项目阶段开发计划<br>2、针对技术难点进行规划、预研，输出技术预研分析报告，形成技术对比方案及发展规划分析<br>3、从整体进行系统设计，包括系统架构、模块、接口、集成等设计，形成系统设计说明书<br>4、编写代码，实现模块功能，并完成各模块集成；', '深圳及其控股公司、子公司所在地', '20000.00', '视试用期表现待定', '1452700800', '1454256000', '1452504212', null, '1', '郭哲', 'guozhe@wondershare.cn', '183.54.74.99', null, '（1）个月工资', '18589046466', '1522f66e56a53d720d4f4704ce8864bc', '6de249b912364b47b65e9a0fac070ddae2ba31b74b05405387a6cc6ff09510bcb65e9a0f', '4', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('271', 'offer20160112090316', '林文杰', 'lin.wenjie@163.com', '智能家居业务-嵌入式软件开发工程师', 'YJYF02_嵌入式软件开发工程师', '1、负责zigbee终端产品开发；<br>2、负责zigbee终端产品用例规划，建立测试标准；<br>3、负责zigbee终端产品bug修复', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1452614400', '1452614400', '1452560598', null, '1', '符慧', 'fuhui@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13923799790', '1522f915f6eb59497f6b55d4431ac678', 'a4ba2f7e41864ec38971e5baa147ccbff0cb912efc784cc0bb5fec8a5a6bba088971e5ba', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('272', 'offer20160112090445', '陈智', 'happychenzhi@163.com', '智能家居业务-硬件开发工程师', 'SPZD00_硬件开发工程师', '1、负责方案及物料选型，管理维护开发物料库；<br>2、完成相应产品硬件设计、开发任务；<br>3、编写与设计开发相关的文档（主要包括：电原理图、关键元器件清单、BOM>nbsp;清单、特殊工艺要求、试制总结报告等）；<br>4、负责编制及维护BOM清单，并对产品进行完善，以及对产品进行升级换代；<br>5、原型样机制作、调试、严格控制产品设计质量、成本；<br>6、完成EMC、EMI等认证测试；<br>7、协助完成新产品导入，解决试验、生产过程中与研发相关的技术问题；', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1452700800', '1455552000', '1452560688', null, '1', '符慧', 'fuhui@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13923799790', '1522f96e9996ea2d8526799482ba8e8b', '16888786e5a649f5a57d88a515db3e41ffa3f2a1704b4f31b03a6d066fba543ca57d88a5', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('273', 'offer20160112090446', '王婷', '1098458620@qq.com', '智能家居业务-品牌策划专员', null, '1. 分析市场需求，收集市场热点，提供有创意的策划方案；<br>\r\n2. 各类对外宣传稿件的撰写，负责公司官方网站、微博、微信、专业论坛及其他对外宣传所用软文撰写及更新，确保品牌传播的及时性与有效性；<br>\r\n3. 协助公司对活动策划方案的执行（日常营销活动、节日营销、公司级促销活动）；\r\n拉动用户活跃，唤醒潜在用户，提高产品知名度；负责品牌营销方案的策划、创意、推广。', '深圳及其控股公司、子公司所在地', '7500.00', '9000 元/月', '1452470400', '1452556800', '1452504212', null, '0', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1522ed1eb403dcc34cd58e6486392541', 'a4ba2f7e41864ec38971e5baa147ccbff0cb912efc784cc0bb5fec8a5a6bba088971e5aa', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('274', 'offer20160218041540', '郑楚芬', '13570546744@163.com', '职能平台-行政兼前台文员', 'WSXZ10_前台文员', '1、前台接待：来访、面试的接待，来电的接听/转接等。<BR>2、出入管理：外来人员进出办公区域的管理等，为员工人身资产安全提供保障。<BR>3、制度监督：员工行为监督，员工工牌佩戴情况，员工是否在上班时间外出等。<BR>4、环境卫生检查：监督保洁人员日常工作，保证办公区域清洁卫生干净整洁。<BR>5、会议室管理：会议室预订系统的后台权限调整业务，确保高效使用、合理调配。<BR>6、行政库房管理：物品的入库、出库、保管、盘点等，确保物品的安全统一以及使用率。<BR>7、需求收集处理：每月办公用品、晚餐券补贴需求收集并协助发放；<BR>8、其他日常事务：如邮件快递的收发，确保信件安全及时收发到位；如保持前台、会议室清洁卫生，展示良好形象等。', '深圳及其控股公司、子公司所在地', '4500.00', '视试用期表现待定', '1455724800', '1455811200', '1455783338', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '152f30ea56d9a9c028e72b244e8bb57f', 'da97a7f8d0be40b3b3ee20b7e65222933353155b042d45aaa858dc612efc1126b3ee20b7', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('275', 'offer20160227094450', '胡杏妮', '371332614@qq.com', '智能家居业务-电商坐席', 'YXFW16_电商坐席', '1、网店销售产品上架、分类以及产品信息的及时调整<BR>2、对在线客户的咨询进行及时解答，向客户提供迅速、准确、周到的服务<BR>3、妥善处理交易中出现的售后问题，包括售后退换货、快递查询等，耐心沟通，为客人提出合理的解决方案。<BR>4、通过客户的沟通，分析客户的需求，实现在线销售和服务，提高客户满意度<BR>5、服务中发现的产品问题或客户建议及时的记录并反馈给相关同事，积极提出意见和建议协助沟通、解决客户遇到的问题；<BR>6、与各部门保持良好的沟通，做好支持与配合工作。', '深圳及其控股公司、子公司所在地', '5000.00', '5500 元/月', '1456588800', '1456675200', '1456537485', null, '0', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1531b33ce467f92fa7109ad4666a2506', 'da1c68d55d414777b001756efa6a483ed3d762f4091a4cec93a761c50ad94b6db001756e', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('276', 'offer20160227095049', '洪少选', '18620366649@163.com', '智能家居业务-高级Android软件开发工程师', 'MG010_高级Android软件开发工程师', '1、Android设备上产品开发包括:模块设计、开发实现、界面应用<BR>2、知识总结分享包括：分享工作、学习成果，促进部门知识建设，定期提交总结文档<BR>3、技术支持服务：为产品、测试、客服提供技术支持', '深圳及其控股公司、子公司所在地', '17000.00', '18000 元/月', '1456588800', '1456761600', '1456537844', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1531b588239b899b2db486a41938920e', '60136603c4124bf48c7ca6438b3b64f0023ee73236eb4efcad48b17d402482978c7ca643', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('277', 'offer20160229021215', '邓仁义', '476913554@qq.com', '消费软件业务-高级Win软件开发工程师(C#)', 'MG016_高级Win软件开发工程师(C#)', '1、负责Win平台下新技术方案研究，完成相关技术点预研与实现；<BR>2、根据产品需求，完成Win平台下的产品的设计与实现；<BR>3、对已有产品的进行维护升级，协助客服快速解决用户问题等。', '深圳及其控股公司、子公司所在地', '16000.00', '视试用期表现待定', '1456761600', '1459094400', '1456726334', null, '0', '徐赛红', 'xush@wondershare.cn', '40.77.167.50', null, '（1）个月工资', '18682386616', '1531d60e1dfcfe1fd33e42e49d4a428a', '246b8ea6d88b4c67a6e064fa266340625b8633a0cf1e4a248e6ba15d1763b4a4a6e064fa', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('278', 'offer20160229085959', '陈俊华', 'bjxkwh@126.com', '智能家居业务-仓库管理员', 'YZGY00_仓库管理员', '1．及时、准确维护库存管理，确保仓库物品的帐、卡、物三者一致，仓库区域划分明确，物料标识清楚，存卡记录连续、字迹清晰；<BR>2．做好仓库物料的收发存管理，严格按流程要求收发物料，并及时跟踪作业物料的发送；<BR>3.对物料管理的有序性、安全性、完整性及有效性负责；<BR>4.做好仓库各种原始单证的传递、保管、归档工作；', '深圳及其控股公司、子公司所在地', '4500.00', '5000 元/月', '1456876800', '1456934400', '1456750799', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1532bcb0bda4a560f93225140c4a3ed6', 'e07bbc15529e4fad972d4c8961b9318fa8c00e423a2a48be8a174b6249f001a2972d4c89', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('279', 'offer20160301100308', '李志勇', 'lzy198402@126.com', '智能家居业务-高级产品经理', 'MG012_高级产品经理', '1.负责对智能硬件相关产品项目的全流程管理，调研产品需求，优选硬件方案；<BR>2.完成产品相关文档，监督项目进度和成本，推进转产和上市过程；<BR>3.对产品上市后做技术支持和推广。', '深圳及其控股公司、子公司所在地', '22000.00', '25000 元/月', '1456934400', '1460908800', '1456797786', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1532be74837f832e483f9834c938fbfe', 'ad2189f0c99742b8ac8a0cae8e4ee37060584f0495004b9495e363f7053a6364ac8a0cae', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('282', 'offer20160301101146', '彭波', '2627949785@qq.com', '智能家居业务-架构设计师', 'PTXT00_架构设计师', '1.负责公司物联网家居安全系统的架构设计、研发工作；<BR>2.承担从业务向技术转换的桥梁作用；<BR>3.负责组织技术研究和攻关工作；<BR>4.负责组织及带领公司内部员工研究与项目相关的新技术；', '深圳及其控股公司、子公司所在地', '25000.00', '30000 元/月', '1456934400', '1458489600', '1456798304', null, '1', '何珊', 'heshan@wondershare.cn', '14.17.34.182', null, '（1）个月工资', '13418602101', '1532beef33b8807aaeba3b34ef6bc448', '1cac651323e84d2fa5cc7a44f42f8a20874f0da5bd70432187530fca0ffe7ee0a5cc7a44', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('283', 'offer20160301101416', '汪云', 'zxwangyun@126.com', '智能家居业务-高级嵌入式软件开发工程师', 'SPZD00_高级嵌入式软件开发工程师', '1、嵌入式linux驱动和内核开发<BR>2、负责相关代码编写，bug的修改，文档的维护等<BR>3、熟悉不同平台下Linux的系统构建，运行环境搭建，以及运行环境优化。<BR>4、负责IPCSDK接口开发，负责平台协议对接；<BR>5、负责公司其它协议对接模块开发。', '深圳及其控股公司、子公司所在地', '22000.00', '视试用期表现待定', '1456934400', '1457366400', '1456798455', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1532c0a5060b89d3475c56f46b6af2e3', '6bbf0ac56e60459d9ccf1a74a56fbcaff2b1fcead69d4471a2b82c19c4cb21839ccf1a74', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('289', 'offer20160302030744', '蒋挺辉', '58576018@qq.com', '智能家居业务-研发总监', '', '1、参与整体产品规划，主导设计整体产品架构；<BR>2、主导高效有序的承接整体产品定义、导入、实现，建立符合未来智能家居需求的物联网云操作系统和极具人性的APP应用，提供智能家居整体解决方案；<BR>3、产品研发团队搭建与管理。', '深圳及其控股公司、子公司所在地', '42000.00', '视试用期表现待定', '1456848000', '1456934400', '1456902468', null, '0', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（3）个月工资', '13714136047', '153354efa3e3760b77530cf4378862d4', 'a52fc3d5a8f1433dbe48daf63e06a23140f6ae3e78d14a90b02c04199f8b0900be48daf6', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('290', 'offer20160302030921', '蒋挺辉', '58576018@qq.com', '智能家居业务-研发总监', 'WZC001_总裁助理', '1、参与整体产品规划，主导设计整体产品架构；<BR>2、主导高效有序的承接整体产品定义、导入、实现，建立符合未来智能家居需求的物联网云操作系统和极具人性的APP应用，提供智能家居整体解决方案；<BR>3、产品研发团队搭建与管理。', '深圳及其控股公司、子公司所在地', '42000.00', '视试用期表现待定', '1456848000', '1456934400', '1456902564', null, '0', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（3）个月工资', '13714136047', '153354efa3e3760b77530cf4378862d4', '27d1fa7de289406db7da8e20b89e8e04a408beb6161f416cb0b744593ca0326eb7da8e20', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('292', 'offer20160304024748', '刘涛', 'lt700@vip.qq.com', '智能家居业务-区域经理', 'YXFW17_区域经理', '1、承担公司在所辖区域市场的全面拓展，组织实施营销推广计划，完成区域的销售目标和利润目标。<BR>2、行业渠道建设，渠道管理和渠道关系维护等工作。<BR>3、管理当地区域代理商经销商，确保经销商经营管理符合规范<BR>4、对区域代理商经销商的销售人员进行培训，提升经销商运营能力<BR>5、制定当地的市场推广计划及方案。并组织实施', '深圳及其控股公司、子公司所在地', '13500.00', '视试用期表现待定', '1457193600', '1457280000', '1457074061', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '15337182cf5696ef1b86c16404798e44', 'd8267c7975384bfdadafbe825c73e8961d094f26cc8f4df0ac36d7618b2465f6adafbe82', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('293', 'offer20160305093432', '姜澎', 'jiangperry@126.com', '智能家居业务-高级产品经理', 'PTAP00_高级产品经理', '1、负责公司物联网家居安全系统的产品设计、产品规划；<br>2、负责产品项目中团队的沟通协调及推动。', '深圳及其控股公司、子公司所在地', '27000.00', '28000 元/月', '1457366400', '1457884800', '1457141672', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '1533f9f6c4bb56b1ba572bc480eb70d3', 'f90b3b73dd364e168b2bb3b301cd428f1c1cbe4f30374299b1972eef152946658b2bb3b3', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('294', 'offer20160307074041', '王智', '46700042@qq.com', '智能家居业务-资深开发工程师', 'PTXT00_资深后台开发工程师', '1.负责linux环境下智能家居后台系统开发，以及基础服务组件开发;<BR>2、负责对物联网行业及智能家居行业的前沿技术研究；<BR>3、负责对系统的核心技术研发和攻关；', '深圳及其控股公司、子公司所在地', '25000.00', '30000 元/月', '1459699200', '1459699200', '1457350839', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1534058d503e4acd674a267499bb9442', '22d220a8974945a0b23a40ba1669ea763a1fda173b63445f9885c159ed5dc676b23a40ba', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('295', 'offer20160307075206', '黄华良', 'huang_hualiang@163.com', '消费软件业务-高级安卓开发工程师', 'MG010_高级Android软件开发工程师', '1、负责公司现有及未来新移动AndroidAPP研发与功能维护；<br>2、业务相关的技术积累和创新。', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1457539200', '1459785600', '1457351525', null, '1', '郭哲', 'guozhe@wondershare.cn', '101.105.15.74', null, '（1）个月工资', '18589046466', '153403598812c932fdef3e445afb813e', 'd498e222c77840308cd749c259f2468a7df4c09ac07349fb9180dca147d4a9fd8cd749c2', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('296', 'offer20160309052130', '欧伟霞', 'ouyuling08@126.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.根据产品需求和系统设计，负责APP端、云端的测试用例开发、产品测试；<BR>2.能进行单元测试代码检测，开发自动化测试工具；', '深圳及其控股公司、子公司所在地', '11000.00', '12000 元/月', '1457625600', '1458489600', '1457515285', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '153555fed4714e2ff9e3aaa415d96691', 'ac8df50c033f46208c634df5191170afbd3537dd628d4321b3eeb350cdbbdd468c634df5', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('297', 'offer20160309075106', '陈旭', 'envy.chen·me.com', '消费软件业务-资深Ios软件开发', 'PTAP00_资深iOS软件开发工程师', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '30000.00', '33000 元/月', '1457625600', '1457884800', '1457524263', null, '0', '郭哲', 'guozhe@wondershare.cn', null, null, '（1）个月工资', '18589046466', '15358d3dec03732bb7c17704855a636d', 'b866f1a2beb24839860b538feb7484497e20c66020c543d2af14c25251dc41b8860b538f', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('298', 'offer20160309075135', '陈旭', 'envy.chen·me.com', '消费软件业务-资深Ios软件开发', 'PTAP00_资深iOS软件开发工程师', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '30000.00', '33000 元/月', '1457625600', '1457884800', '1457524295', null, '0', '郭哲', 'guozhe@wondershare.cn', null, null, '（1）个月工资', '18589046466', '15358d3dec03732bb7c17704855a636d', '25d771e80c524ebabdd7e8683e6ff632f4e876f71a3e42728eb3a98020bf4aadbdd7e868', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('299', 'offer20160309075220', '陈旭', 'envy.chen@me.com', '消费软件业务-资深Ios软件开发', 'PTAP00_资深iOS软件开发工程师', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '30000.00', '33000 元/月', '1457625600', '1457884800', '1457524340', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '15358d3dec03732bb7c17704855a636d', '1190df46211243caabc1d089f815803b3cf6cfb17b11411399837b31ed94602eabc1d089', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('300', 'offer20160309075719', '张辉艺', '396962243@qq.com', '消费软件业务-高级C++开发', 'VS008_高级Win软件开发工程师(C++)', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '18000.00', '20000 元/月', '1457625600', '1459785600', '1457524639', null, '1', '郭哲', 'guozhe@wondershare.cn', '171.109.140.174', null, '（1）个月工资', '18589046466', '15358d71fd7e225ec160d7945c0a29ee', 'bb2f70efe07748248f9fb50c2797d200f3b95c16294b4797b0905c59eac40c5d8f9fb50c', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('301', 'offer20160310091744', '黄姣', '517089706@qq.com', '消费软件业务-网站运营专员', 'MG022_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<br>2、负责对网站内容工作的整体规划；内容设计、策划、监控与实施；负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<br>3、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '11000.00', '13000 元/月', '1459267200', '1459180800', '1457572663', null, '0', '郭哲', 'guozhe@wondershare.cn', null, null, '（1）个月工资', '18589046466', '15359f669bafe666b76483d41458e798', '1bc37ce0fcc64e85a23a7b7f75d475e9cde4e166ac3949e5adc7aec75e56ebeca23a7b7f', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('302', 'offer20160310091758', '黄姣', '517089706@qq.com', '消费软件业务-网站运营专员', 'MG022_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<br>2、负责对网站内容工作的整体规划；内容设计、策划、监控与实施；负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<br>3、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '11000.00', '13000 元/月', '1459267200', '1459180800', '1457572677', null, '1', '郭哲', 'guozhe@wondershare.cn', '207.46.13.49', null, '（1）个月工资', '18589046466', '15359f669bafe666b76483d41458e798', '07aefe7b005f444b9268791abcbd8778f96a4137dfa3413c9ad3322ff16125d39268791a', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('303', 'offer20160310093128', '秦丹琳', 'freezing.dp@qq.com', '智能家居业务-品牌推广经理', 'GNPP00_品牌推广经理', '1.制定年度推广策略，有大型主题活动策划经验（包括：营销活动策划、品牌合作等）；<BR>2.具体创新能力，有针对性的调整推广策略；<BR>3.积极寻求市场推广资源，寻找合作切入点，拓展合作渠道；<BR>4.组织推广团队高效完成相关推广活动的策划并组织实施并对执行结果负责。', '深圳及其控股公司、子公司所在地', '8000.00', '10000 元/月', '1457884800', '1457971200', '1457573486', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1535aa2553877f0e8b5a2db4e9fbd94a', 'ca4ff42020c14659806e81ecce39e116e8df48af64574f62941ed1f8b9b76390806e81ec', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('304', 'offer20160310034108', '李思源', 'siyuanli@163.com', '智能家居业务-电商运营经理', 'YXFW15_电商运营经理', '1、制定整体运营策略，通过各种营销手段提升销量，对整体销售业绩负责。<BR>2、负责京东/淘宝等电商网站项目的整体规划、营销、推广、客户关系管理等系统经营性工作。<BR>3、负责网站活动制定、管理及接入的店铺的营销推广。<BR>4、监控及分析数据：营销数据、交易数据、商品管理、顾客管理等及时发现问题并加以调整。', '深圳及其控股公司、子公司所在地', '15000.00', '16000 元/月', '1458144000', '1458835200', '1457595660', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1535920d0ee094a672434c7455e93bbe', 'cb22398083ba4c6db6a68f9067b9c96b3468f7731cae4bb1aab5fdd5a4f6ac1fb6a68f90', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('305', 'offer20160310040518', '张元博', '252151782@qq.com ', '消费软件业务-网站运营专员', 'MG023_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<BR>2、组织对网站内容工作的整体规划；内容设计、策划、监控与实施；<BR>3、负责相关频道内容采编策划、网站设设计和页面编辑、核实；<BR>4、负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<BR>5、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；<BR>6、根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '8000.00', '9000 元/月', '1457625600', '1457625600', '1457597116', null, '1', '徐赛红', 'xush@wondershare.cn', '14.17.29.92', null, '（1）个月工资', '18682386616', '1535a52ee46939bd6c07048463b9003d', '2c6280a119334d709871d7756890bf0b376bd961b0ac45edbc71dfb3dbd910829871d775', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('306', 'offer20160310063057', '向碧仙', '15986821483@163.com', '消费软件业务-高级C#开发', 'VS02_高级Win软件开发工程师(C#)', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '15000.00', '16000 元/月', '1457625600', '1458576000', '1457605856', null, '1', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '15358d732cbff9f51a8b41b42078149b', '484b47a0a3a5495d86067644be21c2e3f9ef3338c3bf4bf0aaf367b5121d549286067644', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('307', 'offer20160311114359', '陈浩', '396959495@qq.com', '智能家居业务-电商运营经理', 'YXFW15_电商运营经理', '1、制定整体运营策略，通过各种营销手段提升销量，对整体销售业绩负责。<BR>2、负责京东/淘宝等电商网站项目的整体规划、营销、推广、客户关系管理等系统经营性工作。<BR>3、负责网站活动制定、管理及接入的店铺的营销推广。<BR>4、监控及分析数据：营销数据、交易数据、商品管理、顾客管理等及时发现问题并加以调整。', '深圳及其控股公司、子公司所在地', '15000.00', '视试用期表现待定', '1457884800', '1457884800', '1457667831', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1535e28a5e6e7861577680742a5a73f0', 'a3312db7ff3245e9afe661756f5519546c2ffd1c71b14149b6692b15066635fdafe66175', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('308', 'offer20160311120411', '阳晓慧', 'yxhjiayou99@126.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<BR>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<BR>3.提交软件缺陷报告并跟踪处理流程；<BR>4.进行测试需求分析、测试结果分析报告；组织定版评审会议；', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1457884800', '1459094400', '1457669043', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1535fd8ec59066a7ae2934c44378810c', 'a47a0b4b6a6842e69909014a37b996d02374c36988c94408892b1113ef08e00c9909014a', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('309', 'offer20160314014542', '眭灵慧', '422359859@qq.com', '职能平台-人力资源部总监', '', '1、规划、指导、协调公司的人力资源管理与组织建设，最大限度地开发人力资源，促进公司经营目标的实现和长远发展；<BR>2、全面统筹规划公司的人力资源战略，向公司高层决策者提供有关人力资源战略、组织建设等方面的建议，并致力于提高公司的综合管理水平；<BR>3、组织制定公司人力资源发展的各种规划，并监督各项计划的实施；<BR>4、及时处理公司管理过程中的重大人力资源问题。', '深圳及其控股公司、子公司所在地', '45000.00', '与试用期一致', '1457971200', '1467216000', '1457934342', null, '0', '刘莉莉', 'liull@wondershare.cn', '40.77.167.65', null, '（4）个月工资', '13714136047', '153653282e845d2b4fa824d4849956af', 'fe441b23d6f34034a835ddd7e3ee529d59cd1183f41c45e49f389dc974baddafa835ddd7', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('310', 'offer20160314030106', '陈笑生', '349866381@qq.com ', '智能家居业务-高级后台开发工程师', 'EZPT02_高级后台开发工程师C++', '负责linux环境下智能家居后台系统开发，以及基础服务组件开发', '深圳及其控股公司、子公司所在地', '17000.00', '视试用期表现待定', '1458057600', '1458057600', '1457938863', null, '1', '苏雯', 'suwen@wondershare.cn', '117.136.79.147', null, '（1）个月工资', '18666665212', '153650f0febda4509d2cb9947e9af7a1', '3b07ac13d82e4ccda8e2a2365e3792cfb06afdc5a33448d5a5f7c78f747ed1c3a8e2a236', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('311', 'offer20160314030225', '肖洪锦', 'treepool_3000@qq.com', '智能家居业务-高级后台开发工程师', 'PTAP00_高级后台开发工程师', '1.负责linux环境下智能家居后台系统开发，以及基础服务组件开发;<BR>2、负责对物联网行业及智能家居行业的前沿技术研究；<BR>3、负责对系统的核心技术研发和攻关；', '深圳及其控股公司、子公司所在地', '24000.00', '25000 元/月', '1457971200', '1457971200', '1457938945', null, '-1', '何珊', 'heshan@wondershare.cn', '223.104.1.52', '已选择其他工作机会，对方提供的岗位/发展空间/薪酬待遇更有吸引力', '（1）个月工资', '13418602101', '15365137739d0681e0727f3498ca27fb', 'cad02198775941518a51268ac2acbf3ef7d8cb5be72e4165b4ba71664b010d1e8a51268a', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('312', 'offer20160314031035', '罗玲燕', '2057765282@qq.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<BR>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<BR>3.提交软件缺陷报告并跟踪处理流程；<BR>4.进行测试需求分析、测试结果分析报告；组织定版评审会议；', '深圳及其控股公司、子公司所在地', '12000.00', '13000 元/月', '1458144000', '1458144000', '1457939434', null, '0', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1536516667a44ea6a8e38664c8d86261', 'd183659c9fb845e0b9b104b021d8f589ca21a8ba9847424db32cccd22998bd4db9b104b0', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('313', 'offer20160315103849', '黄文妍', 'laddertoanita@126.com', '消费软件业务-海外网站运营专员', 'MG022_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<BR>2、组织对网站内容工作的整体规划；内容设计、策划、监控与实施；<BR>3、负责相关频道内容采编策划、网站设计和页面编辑、核实；<BR>4、负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<BR>5、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；<BR>6、根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '9500.00', '10000 元/月', '1458230400', '1459094400', '1458009523', null, '1', '徐赛红', 'xush@wondershare.cn', '207.46.13.63', null, '（1）个月工资', '18682386616', '15373ba55de5c30f679936242e99972d', '3589a1967f4b49a281d40b5d58e3defbb711b1d8e2e049c88d362529e31e51cb81d40b5d', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('314', 'offer20160316022702', '于美婷', '997386792@qq.com', '消费软件业务-网页设计师', 'MG026_网页设计师', '1、根据网站体系规划和网站定位，负责公司大型网站的设计工作，并能对网站风格和设计方向进行把握，提升网站整体的设计质量；<BR>2、对网站交互设计有很好的理解，能够结合项目行业特色，重视用户体验；<BR>3、具备良好的沟通能力，理解策划意图，并具备客户导向的设计思路；<BR>4、能够主动与前端或技术人员进行协调，协助其完成网站制作要求；<BR>5、关注并研究行业设计发展趋势，并进行总结分享及应用，不断提升所负责项目的设计质量。', '深圳及其控股公司、子公司所在地', '9500.00', '10000 元/月', '1458230400', '1458489600', '1458109615', null, '1', '徐赛红', 'xush@wondershare.cn', '183.38.70.250', null, '（1）个月工资', '18682386616', '15374fd79398809a5b0e232455d99078', '62f63be550fe4d2ea6686aa88087531c4e10f506322546c69e0875320ee4fbfba6686aa8', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('315', 'offer20160317090810', '林蔚', '243682856@qq.com', '消费软件业务-网站运营专员', 'PE05_网站运营专员', '1、负责公司网站品牌和产品的网络推广；<br>2、根据公司总体市场战略及网站特点，确定网站推广目标和推广方案；<br>3、与各部门沟通，细化确认需求，按时保质完成网站推广任务；', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1458230400', '1458489600', '1458176890', null, '0', '郭哲', 'guozhe@wondershare.cn', '116.25.228.118', null, '（1）个月工资', '18589046466', '1537d00e2219b9b41792eb54c849dc4e', '08a0ee41acda436094e799c891031c80e74a032e0ed44bf983bb9cc43a2f5d3494e799c8', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('316', 'offer20160317091128', '林蔚', 'kiki1437@hotmail.com', '消费软件业务-网站运营专员', 'PE05_网站运营专员', '1、负责公司网站品牌和产品的网络推广；<br>2、根据公司总体市场战略及网站特点，确定网站推广目标和推广方案；<br>3、与各部门沟通，细化确认需求，按时保质完成网站推广任务；', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1458230400', '1458489600', '1458177088', null, '1', '郭哲', 'guozhe@wondershare.cn', '157.55.39.136', null, '（1）个月工资', '18589046466', '1537d00e2219b9b41792eb54c849dc4e', 'cf8735ad531d40e1a4cf226e7cec839dfbce20f8817e4bc4933ced88621f82efa4cf226e', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('317', 'offer20160317091230', '杨嘉丽', '243682856@qq.com', '消费软件业务-网站运营专员', 'MG027_网站运营专员', '1、负责公司网站品牌和产品的网络推广；<br>2、根据公司总体市场战略及网站特点，确定网站推广目标和推广方案；<br>3、与各部门沟通，细化确认需求，按时保质完成网站推广任务；', '深圳及其控股公司、子公司所在地', '10000.00', '12000 元/月', '1458230400', '1458489600', '1458177150', null, '1', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '1537cfb5cb8fc9968ce77c74712b199f', 'efa712178ce4446f94313765545914d0567946e23d144685bec04e7087fdeb9394313765', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('318', 'offer20160317091436', '刘丹霞', 'dandanmp3@126.com', '消费软件业务-高级网站运营专员', 'VS011_高级网站运营专员', '1、负责公司网站品牌和产品的网络推广；<br>2、根据公司总体市场战略及网站特点，确定网站推广目标和推广方案；<br>3、与各部门沟通，细化确认需求，按时保质完成网站推广任务；', '深圳及其控股公司、子公司所在地', '17000.00', '视试用期表现待定', '1458230400', '1458489600', '1458177276', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '1537cfdab949c945c70e0114fa5b8b98', '941e8dacc5e642b6ad036c0cd511dca91c1cf3a4e39f409eab2cf59234b3e8bdad036c0c', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('319', 'offer20160317031726', '龙小华', '757833468@qq.com', '智能家居业务-文案策划', 'YXFW14_文案策划', '1、负责公司相关产品营销包装、宣传推广的文案策划及撰写相应说明及文案，包括但不限于产品定位、卖点挖掘、产品文案撰写等；<BR>2、负责公司整体业务相关的文案策划，企业宣传册等宣传资料的策划、编辑工作；<BR>3、结合产品、用户需求、节日、热点事件等需求活动类文案的撰写、产品的相关文案，软文，广告语的优化包装；<BR>4、进行市场调查，收集相关行业市场信息，并整理、分析，形成报告；', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1458403200', '1458489600', '1458199054', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '15378f5b7665757612c2aa1484abc276', '23e08c13786547f0bfe1d77d56711f81ef9597f12c97439599f871cd84bacc1dbfe1d77d', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('320', 'offer20160317035728', '章婧', 'zhangjing6060@126.com', '职能平台-HRBP经理', 'HRZP01_高级HRBP', '1.协助部门制定人员规划,及时提供用人建议；>nbsp;<br>2建立有效的招聘渠道，具备招聘渠道挖掘及分析能力；<br>3与业务线合作进行开展HRBP相关工作。', '深圳及其控股公司、子公司所在地', '19000.00', '21000 元/月', '1458403200', '1458662400', '1458201448', null, '1', '郭哲', 'guozhe@wondershare.cn', '157.55.39.99', null, '（1）个月工资', '18589046466', '15378d6de99d2c1261af569474a89a0d', '82b9933d16ad4d7faa982fc006507d6968cfc2d3d33f42fbb985eba33ee8b9a0aa982fc0', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('321', 'offer20160317035915', '陈浩鹏', 'huntcool001@gmail.com', '消费软件业务-网站运营专员', 'MG023_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<br>2、负责对网站内容工作的整体规划；内容设计、策划、监控与实施；负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<br>3、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '8000.00', '9000 元/月', '1458403200', '1458057600', '1458201555', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '15373d4e8ff8084ae1c53b84b88b2c79', 'd1a80c2135fa479f96a35aa102fb21ea1826278ba0884324be787fcf786045e796a35aa1', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('322', 'offer20160317040804', '张秋婧', 'zhangqj0809@126.com', '消费软件业务-日语网站运营', 'VS011_网站运营专员', '1.根据日语营销部推广策略，进行网站推广，提高网站流量，实现销售目标；<br>2.分析产品市场，根据用户需求，撰写产品文案和产品相关文章写作；通过分析关键字销售数据等，进行关键字优化和文章优化；<br>3.负责外部联系合作，通过与博客主、门户网站、行业站点进行产品宣传和促销活动，获得高质量外链的同时，最终提高整体产品销售。', '深圳及其控股公司、子公司所在地', '12000.00', '13000 元/月', '1458403200', '1459785600', '1458202084', null, '1', '郭哲', 'guozhe@wondershare.cn', '183.37.108.22', null, '（1）个月工资', '18589046466', '15372dcc5fa43f131fe64c74b9cbad26', '6ca9b96739aa4249ab3f7bf3993f785dc7a335796b2544b78a9d3e328dc3eb51ab3f7bf3', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('323', 'offer20160317050928', '吴重霖', '15099945145@163.com', '消费软件业务-外联专员', 'XZWL00_外联专员', '1、组织政府项目、奖励项目的申报、跟踪、验收。<BR>2、组织企业与产品资质的申请与年审。<BR>3、完成公司对外统计报表填写报送。<BR>4、联络与相关政府部门的关系。', '深圳及其控股公司、子公司所在地', '7600.00', '8200 元/月', '1458489600', '1458662400', '1458205760', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '15375025ab5447dac798c064234a6b21', '77830de072d343ff94dbd6d6d555ff25e24ac906e541420480b76e90eadc7e5b94dbd6d6', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('324', 'offer20160317051307', '李晓楠', 'lixiaonanapp@163.com', '消费软件业务-海外网站运营专员', 'MG027_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<BR>2、组织对网站内容工作的整体规划；内容设计、策划、监控与实施；<BR>3、负责相关频道内容采编策划、网站设计和页面编辑、核实；<BR>4、负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<BR>5、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；<BR>6、根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '7500.00', '8000 元/月', '1458489600', '1459440000', '1458205979', null, '1', '徐赛红', 'xush@wondershare.cn', '59.40.244.59', null, '（1）个月工资', '18682386616', '15373ac68486fc51d490efe4f27a6bba', '6b825c2330f64a14af0a25a69c757bd329b4966380f347deb9183e3b49348216af0a25a6', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('325', 'offer20160317054402', '李逸波', 'musidecha2007@163.com', '智能家居业务-产品经理', 'YJCP01_产品经理', '1.负责产品线规划管理：通过市场竞争分析以及公司销售目标制定产品线的短期，中期以及长期规划，产品的生命周期的管理，价格体系以及策略，产品的上市和退市管理', '深圳及其控股公司、子公司所在地', '16000.00', '18000 元/月', '1459440000', '1459699200', '1458207838', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1538388febe366478719f7c49098f577', '08972a94237242a198f57021ecd8c6a4e0805cadd4514a83ac6fb4193a38d6a998f57021', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('326', 'offer20160317081503', '阳景', 'sos360@foxmail.com', '智能家居业务-高级文案策划', 'GNPP00_高级文案专员', '1、负责公司相关产品营销包装、宣传推广的文案策划及撰写相应说明及文案，包括但不限于产品定位、卖点挖掘、产品文案撰写等；<BR>2、负责公司整体业务相关的文案策划，企业宣传册等宣传资料的策划、编辑工作；<BR>3、结合产品、用户需求、节日、热点事件等需求活动类文案的撰写、产品的相关文案，软文，广告语的优化包装；<BR>4、进行市场调查，收集相关行业市场信息，并整理、分析，形成报告；', '深圳及其控股公司、子公司所在地', '17000.00', '18000 元/月', '1458576000', '1458835200', '1458216911', null, '1', '何珊', 'heshan@wondershare.cn', '183.232.120.54', null, '（1）个月工资', '13418602101', '1538380d41ea8eaf3465624401997416', 'd0071d790eeb4363a7cef016663671d72e8da79502d64f018cc0352de2e14a31a7cef016', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('327', 'offer20160318092426', '瞿敬勇', '64924374@qq.com', '智能家居业务-高级嵌入式开发工程师', 'SPZD00_高级嵌入式软件开发工程师', '1、负责zigbee终端产品开发；<BR>2、负责zigbee终端产品用例规划，建立测试标准；<BR>3、负责zigbee终端产品bug修复；', '深圳及其控股公司、子公司所在地', '16000.00', '19000 元/月', '1459440000', '1460908800', '1458264263', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '153838d159b252806c9ef99468198d71', '3b71646471a54bc3898fb76cd728029922d5ddfe3a744c8abe86c0cac3ebc1e1898fb76c', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('328', 'offer20160318114246', '周宏波', '50406166@qq.com', '消费软件业务-高级C++开发', 'VS009_高级Win软件开发工程师(C++)', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '20000.00', '22000 元/月', '1458403200', '1458489600', '1458272566', null, '1', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '1538279d703bfc24d329348465b9bf7f', 'b00da0b92d414439aec78e4adefcfcf5e18f1595a33d4945bd1007f613e97d59aec78e4a', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('329', 'offer20160318114353', '张玉双', 'yushuang.zhang@foxmail.com', '消费软件业务-图像算法', 'VS008_资深Win软件开发工程师(算法)', '1.研发人脸检测算法，或者使用第三方SDK，满足当前对图像和视频里人脸检测的产品需求；<br>2.针对视频流的智能分析算法，包括：场景检测、运动检测、图像增强等算法；<br>3.各种图像滤镜算法实现，包括：模糊滤镜、颜色滤镜等算法。', '深圳及其控股公司、子公司所在地', '27000.00', '视试用期表现待定', '1458403200', '1458489600', '1458272633', null, '0', '郭哲', 'guozhe@wondershare.cn', '117.136.40.217', null, '（1）个月工资', '18589046466', '15382452eb1d2a05729780e449e8693b', '5aa62522606747ad939e825df3baf2c8b5a4d0d069d34c7582298a099f2a1902939e825d', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('330', 'offer20160318114553', '林娟', '595903849@qq.com', '智能家居业务-网络推广专员', 'YXFW14_网络推广专员', '1.负责网站内容、结构和搜索引擎及用户体验的优化工作，提高以Baidu和Google为主的搜索引擎自然排名以及PR值；<BR>2.完成每日、每周、每月的相关数据报表，并能从数据报表中发掘问题所在；<BR>3.利用互联网资源，通过门户网站、搜索引擎、微博、SNS、论坛、博客、邮件等渠道推广网站；<BR>4.监控网站关键词排名，负责网络广告投放、资源互换、友情链接等网络营销渠道的开拓与维护', '深圳及其控股公司、子公司所在地', '8000.00', '9000 元/月', '1458403200', '1458489600', '1458272761', null, '0', '何珊', 'heshan@wondershare.cn', '183.37.28.159', null, '（1）个月工资', '13418602101', '15383767c07b701fff0a7cf4ffebda60', '2fb9337ba83745029e47fe7dee3691279b6bba2d6eec4b96b77d3f3646e46b209e47fe7d', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('331', 'offer20160321085527', '王永鹏', 'wyp87116@163.com', '消费软件业务-资深Ios软件开发', 'VS01_资深iOS软件开发工程师', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审', '深圳及其控股公司、子公司所在地', '24000.00', '26000 元/月', '1458748800', '1460304000', '1458521727', null, '0', '郭哲', 'guozhe@wondershare.cn', '120.24.231.38', null, '（1）个月工资', '18589046466', '153879b383aafabd9be54e2431a85e8e', '56ae262209e3478fb175dce1da3ad0b00f74596d298d495aa15c2d584192701db175dce1', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('332', 'offer20160321023137', '黄晓文', 'huangxiaowen33@126.com', '智能家居业务-高级嵌入式开发工程师', '', '1、负责无线路由产品开源OPENWRT系统开发，对路由固件系统进行定制、优化，添加新的硬件平台支持<BR>2、负责无线路由器底层开发，网络编程及相关网络协议，<BR>3、负责修改定制UBOOT及OPENWRT固件，Linux内核配置、IPTable工具、QoS实现、网卡驱动；<BR>4、负责wifidog开发，luci定制；', '深圳及其控股公司、子公司所在地', '15000.00', '17000 元/月', '1459958400', '1460304000', '1458541894', null, '1', '苏雯', 'suwen@wondershare.cn', '157.55.39.245', null, '（1）个月工资', '18666665212', '1538ccbab79bdf97e739a5945b49ae4b', 'd36f7be81cdc433ca533d1c7a620b48c61509f0cebeb410f8c0db6cc4d1b775ca533d1c7', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('333', 'offer20160321023139', '黄桉棋', '1079255145@qq.com', '智能家居业务-高级前端开发工程师', 'PTYD00_高级前端开发工程师', '1.根据市场需求及设计师需求，完成网站、推广活动等的前端网页开发，HTML5相关富有表现力动画制作；<BR>2.根据产品需求，完成产品的前端网页开发，前端组件库设计与开发，配合后端开发人员实现产品界面和功能；', '深圳及其控股公司、子公司所在地', '15000.00', '16000 元/月', '1458576000', '1458576000', '1458541898', null, '1', '何珊', 'heshan@wondershare.cn', '183.15.162.16', null, '（1）个月工资', '13418602101', '1538cc350096a5fb35e7b0f4f55bf1fd', '7da67eeb5c1a4dcfaf6a8bc1ab41db70f40498c9b87e46b6a9d4eb44c0f43f92af6a8bc1', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('334', 'offer20160322085408', '朱陈彪', 'zcbill@126.com', '消费软件业务-网站运营专员', 'MG022_网站运营专员', '1、对产品进行市场分析,确定产品用户市场和用户特征；<br>2、负责对网站内容工作的整体规划；内容设计、策划、监控与实施；负责网站栏目信息的采集、整理和发布；对网站进行日常更新和维护；<br>3、策划推进及组织协调网站重大运营计划、进行发展跟踪和策略调整；根据公司拟开展、参与的线上线下活动，进行专题策划与制作。', '深圳及其控股公司、子公司所在地', '8000.00', '9000 元/月', '1458835200', '1458662400', '1458608048', null, '1', '郭哲', 'guozhe@wondershare.cn', '111.202.15.47', null, '（1）个月工资', '18589046466', '153888f5aae441922cde64542b2b1ab7', '731fb9a74e35442aa816ae2dfbe3b30fba592eae8f444feaacf0c158c4e66fa7a816ae2d', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('335', 'offer20160322022530', '邹旭', 'zouxulucky@163.com', '消费软件业务-网站策划运营', 'VS011_高级网站运营专员', '1、负责公司网站品牌和产品的网络推广；<br>2、根据公司总体市场战略及网站特点，确定网站推广目标和推广方案；<br>3、与各部门沟通，细化确认需求，按时保质完成网站推广任务；', '深圳及其控股公司、子公司所在地', '17000.00', '20000 元/月', '1458835200', '1460304000', '1458627929', null, '0', '郭哲', 'guozhe@wondershare.cn', '183.39.238.5', null, '（1）个月工资', '18589046466', '153981d0958ae1f63d254b3434fa3c70', '6782982f9cd844c5b46e7e69664bb4d91434c320c9cb41bea9a1a27ec3e1bee6b46e7e69', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('336', 'offer20160322050649', '王思然', 'wangsiran0726@163.com', '消费软件业务-海外网站运营专员', 'MG028_网站运营专员', '1、分析与挖掘产品市场需求,完成产品关键字文章内容结构撰写，并通过外包的方式完成内容撰写；<BR>2、对文章进行审核，对文章进行关键字部署；<BR>3、添加文章到网站内容发布系统，并进行发布；<BR>4、配合组织策划推广活动，并参与执行。', '深圳及其控股公司、子公司所在地', '10000.00', '视试用期表现待定', '1458835200', '1459267200', '1458637607', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153985fac84b14f73e70f98452a925c8', '5ea039868ebf4e9b915b1d469f6be2b52ac30a3d05e74d45be884ce98c7bfabb915b1d46', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('337', 'offer20160322065357', '林小玉', '13925200610@163.com', '职能平台-制度流程专员', 'ITLC00_制度流程专员', '1、流程建设；<BR>2、流程体系推行及维护；<BR>3、流程宣导。', '深圳及其控股公司、子公司所在地', '9500.00', '11000 元/月', '1458748800', '1459440000', '1458644035', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '15398ac71b9ff41555acf8444d4afa0e', 'dd9f99e3c35d4a599cd1c949b7cf3b8ce34c6f5d898c4afdab75042dce8dad1f9cd1c949', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('338', 'offer20160322065557', '林小玉', '13925200610@163.com', '职能平台-制度流程专员', 'ITLC00_制度流程专员', '1、流程建设；<BR>2、流程体系推行及维护；<BR>3、流程宣导。', '深圳及其控股公司、子公司所在地', '9500.00', '11000 元/月', '1458748800', '1459440000', '1458644156', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '15398ac71b9ff41555acf8444d4afa0e', '09e72b2bd74a45bab65fad10dbecc0bd8acb1cd694854f4c9ff949730e39bbb5b65fad10', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('339', 'offer20160322065640', '林小玉', '13925200610@163.com', '职能平台-制度流程专员', 'ITLC00_制度流程专员', '1、流程建设；<BR>2、流程体系推行及维护；<BR>3、流程宣导。', '深圳及其控股公司、子公司所在地', '9500.00', '11000 元/月', '1458748800', '1461168000', '1458644198', null, '1', '徐赛红', 'xush@wondershare.cn', '117.136.79.166, 14.152.68.61', null, '（1）个月工资', '18682386616', '15398ac71b9ff41555acf8444d4afa0e', '7a8487754b4843c4bd4d816c493592376849fb72f9724991a953127e900485fbbd4d816c', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('340', 'offer20160323090159', '王林', 'yulin.1298@163.com', '智能家居业务-系统架构师', '', '1.负责公司物联网家居安全系统的架构设计、研发工作；<BR>2.承担现有系统架构的交流学习、风险评估、优化建议；<BR>3.承担系统架构分层分小系统设计、层级内业务架构设计、从业务流向技术转换的桥梁设计工作；<BR>4.对研发团队进行架构设计培训，确保项目架构的正确实行，并持续优化；', '深圳及其控股公司、子公司所在地', '39000.00', '与试用期一致', '1458748800', '1460649600', '1458694921', null, '0', '刘莉莉', 'liull@wondershare.cn', '113.87.231.216', null, '（1）个月工资', '13714136047', '1539d9cbe0ccbba90e307c84cd484219', '244f3cacb1dd48c6be37d30cc3403442bc0b31f8c68e4e59aabd38872e23371fbe37d30c', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('341', 'offer20160323100127', '李雪妮', 'lixuenisnow@126.com', '消费软件业务-高级PHP开发', 'WSYY03_高级前端开发工程师(PHP)', '1.根据产品需求和系统规划，负责云端系统框架设计与开发；<br>2.日常项目管理，结合新需求进行优化和快速迭代开发。', '深圳及其控股公司、子公司所在地', '17000.00', '19000 元/月', '1458835200', '1460908800', '1458698487', null, '1', '郭哲', 'guozhe@wondershare.cn', '183.17.218.142', null, '（1）个月工资', '18589046466', '1539d096985a60681def70740afb67dc', 'b92e438c9cf14960a54cf2c6364a2b154c033ee483a24c3aaf414b4afcdae4eaa54cf2c6', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('342', 'offer20160323113008', '肖瑶', '1509150682@qq.com', '消费软件业务-在线广告', 'VS012_在线广告专员', '1、操作公司的SEMPPC广告账户，通过各种广告渠道销售公司软件产品，对最终的广告销售额及ROI负责。<br>2、广告渠道不限，精通GoogleAdWords或其他如Bing、Yahoo、Youtube者同样考虑。<br>3、广告形式有：Search/Display/Shopping/Remarketing/Youtube/DSA等等', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1458835200', '1459785600', '1458703808', null, '0', '郭哲', 'guozhe@wondershare.cn', '117.136.40.245', null, '（1）个月工资', '18589046466', '1539d0bffec24311a29963e4b05bfd90', '52b5df7a50f246418d76de608b91a127d92869c7527c4de8900d824c276a482e8d76de60', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('343', 'offer20160323021236', '张玉双', 'yushuang.zhang@foxmail.com', '消费软件业务-图像算法', 'VS008_资深Win软件开发工程师(算法)', '1.研发人脸检测算法，或者使用第三方SDK，满足当前对图像和视频里人脸检测的产品需求；<br>2.针对视频流的智能分析算法，包括：场景检测、运动检测、图像增强等算法；<br>3.各种图像滤镜算法实现，包括：模糊滤镜、颜色滤镜等算法。', '深圳及其控股公司、子公司所在地', '27000.00', '28000 元/月', '1458403200', '1458489600', '1458713556', null, '0', '郭哲', 'guozhe@wondershare.cn', '117.136.79.141', null, '（1）个月工资', '18589046466', '15382452eb1d2a05729780e449e8693b', 'abc5dcc2f41b45ff935d26e61c7bc97bb95a5b7b59b64106bf57248d3870e0c9935d26e6', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('344', 'offer20160323043155', '于仁龙', 'yurenlong@126.com', '消费软件业务-高级C#开发', 'PE02_高级Win软件开发工程师（C#）', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '22000.00', '24000 元/月', '1458835200', '1457884800', '1458721915', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '153983aacf03ef197fd0adf44f29bfc9', '0da24f2bfcc2486f8df85280bd6d69ace2c758cc20fb4019a0354f6b4ddd24e78df85280', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('345', 'offer20160323043504', '祝剑', 'zhujian@wondershare.cn', '消费软件业务-高级Mac软件开发', 'VS01_高级MAC软件开发工程师', '1、根据产品架构设计，对所负责的模块进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；<br>3、负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '18000.00', '18000 元/月', '1458835200', '1457884800', '1458722104', null, '0', '郭哲', 'guozhe@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18589046466', '1539837a36c728c3cebd5d34a07b48e9', '025989c7c94040ccb96633b238a6b6dc94542cb4328e46dc91727c5c3bd3ccf2b96633b2', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('346', 'offer20160324095357', '潜晟', 'qiansheng870601@163.com', '消费软件业务-高级C++开发', 'PE02_Win软件开发工程师（C++）', '1、技术预研及产品功能实现，负责Pdf底层的框架设计、模块设计、接口设计负责Pdf底层的关键技术项研究与编码实现参与Pdf底层的维护升级；<br>2、知识总结与分享：针对工作成果进行总结分享，针对技术积累进行技术讨论分享，针对个人优秀实践进行交流分享<br>3、技术支持服务：为产品提供技术选型和可行性参考，为测试、客服团队提供所需的技术指导', '深圳及其控股公司、子公司所在地', '15000.00', '视试用期表现待定', '1459008000', '1458835200', '1458784437', null, '0', '刘莉莉', 'liull@wondershare.cn', null, null, '（1）个月工资', '13714136047 ', '153a2146b8f6ea73d05a42c427991eaf', 'a25bd16c2a164642a12814e3635c8299323c79655c914ddb88a37dc3a7223a9da12814e3', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('347', 'offer20160324095412', '潜晟', 'qiansheng870601@163.com', '消费软件业务-高级C++开发', 'PE02_Win软件开发工程师（C++）', '1、技术预研及产品功能实现，负责Pdf底层的框架设计、模块设计、接口设计负责Pdf底层的关键技术项研究与编码实现参与Pdf底层的维护升级；<br>2、知识总结与分享：针对工作成果进行总结分享，针对技术积累进行技术讨论分享，针对个人优秀实践进行交流分享<br>3、技术支持服务：为产品提供技术选型和可行性参考，为测试、客服团队提供所需的技术指导', '深圳及其控股公司、子公司所在地', '15000.00', '视试用期表现待定', '1459008000', '1460304000', '1458784453', null, '1', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13714136047 ', '153a2146b8f6ea73d05a42c427991eaf', 'f70228cbe64c45a98bc0969ac3dc18bbe7e852f6a54045dd94746ede5e4670258bc0969a', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('348', 'offer20160324095616', '陈巍巍', 'tskmcious@163.com', '消费软件业务-产品经理', 'PE04_产品经理', '1、新市场机会的挖掘与新产品的调研分析工作；主导所负责产品线的市场调研和策略制定；<br>2、根据已有用户数据和反馈分析并改进产品，确保在行业内有充足的竞争力；<br>3、跟进产品项目过程，确保最终产品符合需求；为产品市场营销方案提供建议。', '深圳及其控股公司、子公司所在地', '23000.00', '25000 元/月', '1458921600', '1459785600', '1458784576', null, '0', '刘莉莉', 'liull@wondershare.cn', null, null, '（1）个月工资', '13714136047 ', '153a18a62be32f93063e3f8448ea315c', '2eb8094979074b03a2cf21a582355365d020d41c0d7d4091abe50f25f317e776a2cf21a5', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('349', 'offer20160324095624', '陈巍巍', 'tskmcious@163.com', '消费软件业务-产品经理', 'PE04_产品经理', '1、新市场机会的挖掘与新产品的调研分析工作；主导所负责产品线的市场调研和策略制定；<br>2、根据已有用户数据和反馈分析并改进产品，确保在行业内有充足的竞争力；<br>3、跟进产品项目过程，确保最终产品符合需求；为产品市场营销方案提供建议。', '深圳及其控股公司、子公司所在地', '23000.00', '25000 元/月', '1458921600', '1459094400', '1458784584', null, '1', '刘莉莉', 'liull@wondershare.cn', '14.145.97.236', null, '（1）个月工资', '13714136047 ', '153a18a62be32f93063e3f8448ea315c', '9fe6aeb8e381457ea56a6cbd26540c609cc384f14c90494aaca72a090e35e174a56a6cbd', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('350', 'offer20160324095740', '陈龙', '511611169@qq.com', '消费软件业务-产品经理', 'MG009_产品经理', '1、新市场机会的挖掘与新产品的调研分析工作；主导所负责产品线的市场调研和策略制定；<br>2、根据已有用户数据和反馈分析并改进产品，确保在行业内有充足的竞争力；<br>3、完成产品需求文档及界面原型设计；跟进产品项目过程，确保最终产品符合需求', '深圳及其控股公司、子公司所在地', '20000.00', '22000 元/月', '1459008000', '1460908800', '1458784660', null, '1', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13714136047 ', '153a18864588b273fa9693e49e5a94b5', 'd64799862ebc49518e3dd5d7e7314a7dffd974d3c3ef475fbfa2997fb21564278e3dd5d7', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('351', 'offer20160324021259', '周凯旋', 'kxuan_z@163.com', '消费软件业务-C#开发', 'PE02_Win软件开发工程师（C#）', '1、根据产品架构设计，对所负责的产品进行详细设计；根据产品需求，完成关键技术点的研究与实现；<br>2、编写代码，实现模块功能，并完成各模块集成；负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1458921600', '1459094400', '1458799979', null, '1', '刘莉莉', 'liull@wondershare.cn', '183.17.148.251', null, '（1）个月工资', '13714136047', '153a2968da2a58090af874f42eaa922b', 'c4707508ded2411f8cf8206d586cd6a9ddac637fd5f446b889911a2e41fd52b28cf8206d', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('352', 'offer20160324031341', '张道平', '289694745@qq.com', '消费软件业务-高级MAC软件开发工程师', 'MG016_高级MAC软件开发工程师', '1、负责客服端产品（Mac）平台架构设计，技术难点攻关；<BR>2、承担Mac平台下项目的模块架构设计及需求实现；<BR>3、Mac平台技术交流及知识分享。', '深圳及其控股公司、子公司所在地', '17000.00', '与试用期一致', '1458835200', '1459094400', '1458803617', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153a31e37fcdb6418f8b7e241f1a3c81', '0ecc4c3bd18444f4aee1f44e322ad9a2f9b23ceced21414786e90f6c5bf67926aee1f44e', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('353', 'offer20160325025816', '余洋', 'baiduguoyun@163.com', '智能家居业务-测试工程师', 'MG011_软件测试工程师', '1、编写IPC功能测试用例<BR>2、搭建测试环境，对IPC的整体功能进行测试<BR>3、完成测试输出测试报告，跟踪Bug生命周期', '深圳及其控股公司、子公司所在地', '14000.00', '16000 元/月', '1459008000', '1459094400', '1458889096', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '153a7705801217122c875ca4cf1acee1', 'e40b7c7c43ea447bae4f3dc444d704f9a8b9ef13e5fe422590fe929e99b82bedae4f3dc4', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('354', 'offer20160325033539', '李琴', 'lean19892007@163.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<BR>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<BR>3.提交软件缺陷报告并跟踪处理流程；<BR>4.进行测试需求分析、测试结果分析报告；组织定版评审会议；', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1459094400', '1461168000', '1458891339', null, '1', '苏雯', 'suwen@wondershare.cn', '116.30.168.148', null, '（1）个月工资', '18666665212', '153a67758944e91a64ddb284480874bb', '49b3bb4c6a914c4b917475baa7db18e7e6c1b4ddfbc743a9955f4713e9914c1d917475ba', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('355', 'offer20160325054507', '张凌霄', '15002089729@139.com  ', '智能家居业务-产品经理', 'SPZD00_产品经理', '1.负责主导智能家居产品软件的产品规划、产品需求、交互原型制作;<br>2.负责产品相关的市场分析、竞品分析、用户分析，并对产品方案的策划、规划、研发过程负责;<br>3.负责线上产品的用户分析、数据分析、产品分析以及新产品的需求和规划;<br>4.负责以产品为主导的项目研发，协调研发、设计团队高效率的执行产品研发计划，推出有市场竞争力的产品;<br>5.协助公司战略层制定智能家居产品战略方案。', '深圳及其控股公司、子公司所在地', '22000.00', '视试用期表现待定', '1459094400', '1459872000', '1458899111', null, '1', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13714136047', '153ab5d39f4f080c51d780347979dfe6', '4b778150171549e38705723c676fa316c263a51bd7024e828cce4383291a2f288705723c', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('356', 'offer20160328093112', '钟林', 'xyy_zhong@163.com', '智能家居业务-高级硬件开发工程师', '', '编写与设计开发相关的文档（主要包括：电原理图、关键元器件清单、BOM>nbsp;清单、特殊工艺要求、试制总结报告等）；', '深圳及其控股公司、子公司所在地', '18000.00', '19000 元/月', '1459440000', '1459785600', '1459128667', null, '1', '苏雯', 'suwen@wondershare.cn', '40.77.167.92', null, '（1）个月工资', '18666665212', '153a83940e9a7970ab3436648b1aff8e', '50afd21b01e24c869babdd9c063b97bfa6cbf30143f04703a45aa193d6d4ae7a9babdd9c', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('357', 'offer20160329090623', '龙仁平', '346421561@qq.com', '智能家居业务-电商运营经理', 'DSYY01_电商运营经理', '1、负责公司相关产品营销包装、宣传推广的文案策划及撰写相应说明及文案，包括但不限于产品定位、卖点挖掘、产品文案撰写等；<BR>2、负责公司整体业务相关的文案策划，企业宣传册等宣传资料的策划、编辑工作；<BR>3、结合产品、用户需求、节日、热点事件等需求活动类文案的撰写、产品的相关文案，软文，广告语的优化包装；', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1459267200', '1459267200', '1459213585', null, '1', '何珊', 'heshan@wondershare.cn', '157.55.39.185', null, '（1）个月工资', '13418602101', '153bbd9ab34ad344a41752744b2b7c3c', 'f60f229841374b29a9d566918dc2d73b612a2868360249bf8df06f62d91c29bca9d56691', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('358', 'offer20160329090838', '黄丹', '872756293@qq.com', '智能家居业务-平面设计师', 'WZC001_平面设计师', '1、各平台（包括但不仅限于京东、天猫、淘宝等）中基于活动主题的主视觉创意以及视觉页面表现；<BR>2、电商全部页面（首页、二级页、专题活动页、详情页等）的设计工作跟进及设计督导；<BR>3、电商相关类其他设计工作（如视频、摄影）跟进及设计督导；', '深圳及其控股公司、子公司所在地', '11000.00', '12000 元/月', '1459267200', '1459267200', '1459213720', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '153bbd399a2eefabf9c927843fab8787', '208545bb7ef94a0ba33830b33f613bff2921bdc1a19a40dd9dcae8bd5dfab682a33830b3', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('359', 'offer20160329050858', '朱国欣', 'gxzhu29@163.com', '职能平台-高级管理会计', 'WSCW01_高级管理会计', '1、负责财务费用事前控制，防范财税风险；<br>2、负责为业务部门提供高质量的全过程财务管理与服务，提高业务部门财务效益；<br>3、负责结合业务发展梳理及优化财务流程制度', '深圳及其控股公司、子公司所在地', '16000.00', '视试用期表现待定', '1459353600', '1459872000', '1459242540', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153adcb360571d785aabc704c96a2180', '44ae31c83ab042ff98c25d62b5903550f4e84762af7b470b8eb01aaddb240edb98c25d62', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('360', 'offer20160329071022', '李云生', 'leeyunce@163.com', '消费软件业务-高级Win软件开发工程师（C++）', 'PE02_高级Win软件开发工程师（C++）', '1、技术预研及产品功能实现；<br>2、工作成果及个人优秀实践进行总结分享；<br>3、为产品、测试、客服团队提供技术支持服务。', '深圳及其控股公司、子公司所在地', '17000.00', '20000 元/月', '1459267200', '1460304000', '1459249824', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153bbddb49ae970025271da4508a4ea0', '1bf1c78bee0f4965939c556aaca50e0f83fa629d0aae43ad80a39adc73b1be56939c556a', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('361', 'offer20160330042329', '范雪', '1215479164@qq.com', '职能平台-人力资源部副总监', '', '1、参与、协助人力资源总监进行人力资源管理与组织建设，最大限度地开发人力资源，促进公司经营目标的实现和长远发展；<br>2、统筹完善人力资源管理体系，研究、设计人力资源管理模式（包含招聘、绩效、培训、薪酬及员工发展等体系的全面建设），制定和完善人力资源管理制度；<br>3、及时处理公司管理过程中的重大人力资源问题。', '深圳及其控股公司、子公司所在地', '30600.00', '36000 元/月', '1459440000', '1462291200', '1459326211', null, '1', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（3）个月工资', '13714136047', '153c14bd9a6e88e6368e7e14f3c995b9', '01d4090b1b554af9aa36239ecdc64dff803f837f33a94de4a2a98e26ba71478faa36239e', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('362', 'offer20160331062609', '吴伟铭', 'wwm2049@163.com', '智能家居业务-嵌入式软件开发工程师', 'SPZD00_嵌入式软件开发工程师', '1.负责嵌入式软件业务层应用的代码开发与各种硬件技术方案的底层驱动软件开发>nbsp;<BR>2.负责产品代码bug优化，文档维护与输出，搭建不同嵌入式环境下的开发环境以及运行优化<BR>3.负责驱动代码规范性文档输出与整理', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1459612800', '1461081600', '1459419970', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '153c67e22d826531bd17c2e42229dfc3', 'ce133c446c084da5979fea46d10db732068aeddf58cc4093a73cf92f70e1a90b979fea46', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('363', 'offer20160401055853', '黄钺峰', '2972767831@qq.com  ', '智能家居业务-高级产品经理', 'YJCP01_高级产品经理', '负责公司物联网家居安全整体系统的产品规划、竞品分析、调研数据分析，为产品决策提供支持。', '深圳及其控股公司、子公司所在地', '25000.00', '视试用期表现待定', '1460304000', '1460908800', '1459504727', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '153cf7e9d016fff16285fd04834bb08e', '6459497f90b94adb8cf158988f85b56255472700e34542769c9f625579f67a798cf15898', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('364', 'offer20160405091727', '李潇', 'leric268@126.com', '消费软件业务-高级网站运营专员', 'VS015_高级网站运营专员', '1、负责日本市场调研分析,挖掘目标市场用户需求、确定公司产品目标用户群及特征并结合搜索引擎关键词分析，制定市场营销方案、网站内容运营策略等；<br>2、根据营销策略进行内容策划与活动策划，落实活动方案，并进行效果跟踪分析和优化调整；<br>3、开拓媒体、第三方渠道、社交红人进行产品评测、促销等合作，提高产品曝光度，达成流量和销售目标。', '深圳及其控股公司、子公司所在地', '13000.00', '15000 元/月', '1459958400', '1461168000', '1459819047', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153cfad71f557ca23e2220c43059e2ff', 'ad6b74a511934f88886bbd636fc6f28997e72dcfddff4b11bd3268fd34a44fce886bbd63', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('365', 'offer20160405121005', '林大海', 'lindahai0512@gmail.com', '消费软件业务-高级Mac软件开发工程师', 'VS02_高级Mac软件开发工程师', '1、根据产品架构设计，对所负责的模块进行详细设计；<br>2、根据产品需求，完成关键技术点的研究与实现；<br>3、编写代码，实现模块功能，并完成各模块集成；<br>4、负责单元测试和自测，参与代码走读和代码评审。', '深圳及其控股公司、子公司所在地', '16000.00', '18000 元/月', '1459958400', '1462377600', '1459829406', null, '1', '徐赛红', 'xush@wondershare.cn', '112.97.61.21', null, '（1）个月工资', '18682386616', '153d1922f929079b7a846ad451eab861', '696d0c3a139648ebb2a51ce9eece4be6b7393a4f60544ae38a3261197272d0a5b2a51ce9', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('366', 'offer20160405121303', '粟刚', 'gang.skye@gmail.com', '消费软件业务-前端开发工程师(PHP)', 'WSYZ01_前端开发工程师(PHP)', '主要负责公司内部管理运营系统的开发与维护。', '深圳及其控股公司、子公司所在地', '16000.00', '与试用期一致', '1459872000', '1459872000', '1459829583', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153d067444064572747530a4f7a8dd01', '578a0e9153b24edb9c4246fce560bc4febe904e7a953441b81478757fc360d0b9c4246fc', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('368', 'offer20160406042151', '王顺凯', '964470627@qq.com', '智能家居业务-网络推广经理', '', '1.负责网站内容、结构和搜索引擎及用户体验的优化工作，提高以Baidu和Google为主的搜索引擎自然排名以及PR值；<BR>2.利用互联网资源，通过门户网站、搜索引擎、微博、SNS、论坛、博客、邮件等渠道推广网站；<BR>3.监控网站关键词排名，负责网络广告投放、资源互换、友情链接等网络营销渠道的开拓与维护；', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1459958400', '1459958400', '1459930912', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '153e5df56880642c55037d64db5ad5d9', '017652af27094704bbe8ac52a96ef505ea1796429e6940278562693e4ca4c1d6bbe8ac52', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('369', 'offer20160407093035', '龚强', '330402711@qq.com', '消费软件业务-级Win软件开发工程师（ROOT）', 'MG019_高级Win软件开发工程师（ROOT）', '1、负责相关软件的逆向分析工作，分析指定功能的实现原理，并能够还原技术方案；<br>2、负责CVE漏洞分析，提升公司产品Root成功率；<br>3、负责对公司产品技术预研，技术难点攻关，提供公司产品保护方案。', '深圳及其控股公司、子公司所在地', '23000.00', '25000 元/月', '1460131200', '1462809600', '1459992637', null, '0', '徐赛红', 'xush@wondershare.cn', '118.194.236.50', null, '（1）个月工资', '18682386616', '153e58f7839e2f8b475b01a468883304', 'b0bb55412b074a5f98a58c92cbe13e565b5c212d16484cba8de9441c18c3797698a58c92', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('370', 'offer20160408054351', '张超', 'e@izhangchao.com', '消费软件业务-高级后台开发工程师（PHP）', 'PE02_高级后台开发工程师（PHP）', '1、负责PE产品线云端搭建工作；<br>2、负责文档存储，协同，分发后台管理系统开发；<br>3、负责多平台跨端无缝对接。', '深圳及其控股公司、子公司所在地', '20000.00', '视试用期表现待定', '1460304000', '1460649600', '1460108635', null, '0', '徐赛红', 'xush@wondershare.cn', null, null, '（1）个月工资', '18682386616', '153f3913992efc3e333edd149ca9de97', '015d8690140c4430bb5c005e366e9277b140642fd80847d3a4e11e8084039a87bb5c005e', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('371', 'offer20160408054406', '张超', 'e@izhangchao.com', '消费软件业务-高级后台开发工程师（PHP）', 'PE02_高级后台开发工程师（PHP）', '1、负责PE产品线云端搭建工作；<br>2、负责文档存储，协同，分发后台管理系统开发；<br>3、负责多平台跨端无缝对接。', '深圳及其控股公司、子公司所在地', '20000.00', '视试用期表现待定', '1460304000', '1460649600', '1460108650', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153f3913992efc3e333edd149ca9de97', '62429bc74bfd409da44552cddba5eb0b7ef3b3cd8af042f7be7040868ad21688a44552cd', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('372', 'offer20160408060333', '严宇雅', '907839561@qq.com', '消费软件业务-在线广告专员', 'VS012_在线广告专员', '操作公司的外语SEMPPC广告账户（非中文），通过各种广告渠道销售公司软件产品，对最终的广告销售额及ROI负责。', '深圳及其控股公司、子公司所在地', '11000.00', '12000 元/月', '1460304000', '1460908800', '1460109817', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153f06753f0ab78d83b4b404682bec68', '858a299ddb7c4eb09b264363bab688c5e23dfc2cf8d64dc0a8831f1d84f2fc269b264363', '5', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('373', 'offer20160408061917', '张佳慧', '861141055@qq.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<BR>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<BR>3.提交软件缺陷报告并跟踪处理流程；<BR>4.进行测试需求分析、测试结果分析报告；组织定版评审会议；', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1460217600', '1460304000', '1460110758', null, '1', '何珊', 'heshan@wondershare.cn', '157.55.39.27', null, '（1）个月工资', '13418602101', '153f3a073022d14aeca85dd4483afe90', 'a215561191304d668467ba8d953a04375ea817a56a8c4e34bc87630028fd08fb8467ba8d', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('374', 'offer20160410092753', '李国华', 'wumingzhe@163.com', '职能平台-高级信息安全工程师', 'XXAQ001_信息安全工程师', '1、通过IT技术及配套制度，构建完善的公司信息安全保障体系，确保公司核心资产的安全；<br>2、负责公司网络、服务器、信息系统、数据库等系统的安全，并定期巡检、评估、报告，提出安全加固技术建议，并确保已知安全漏洞、隐患的及时修复或有效预防；', '深圳及其控股公司、子公司所在地', '18000.00', '与试用期一致', '1460390400', '1460476800', '1460294881', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153f0df6d7e7786cd774e4d4b4983907', '59301129256a441380efa19d36a3b00acf44a803af4f4c50a20bb8aab67a7b2180efa19d', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('375', 'offer20160410101143', '李恒', ' 475701783@qq.com', '消费软件业务-网站运营专员', 'VS011_网站运营专员', '负责北美市场调研分析，确定公司产品目标用户群及特征，制定市场营销方案，并实施落地，提高产品曝光度，达成网站流量和销售目标', '深圳及其控股公司、子公司所在地', '9000.00', '10000 元/月', '1460390400', '1460476800', '1460297511', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153f06dfa01e1769f3f167e436abe80b', 'e1d61ab2f4394cbd8f4590f0f2f1c19d96e5db08f0464de4b844ae62e142488c8f4590f0', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('376', 'offer20160411014713', '赵宏波', 'boshen0411@126.com', '职能平台-前端开发工程师(PHP)', 'XT002_前端开发工程师（PHP）', '主要负责公司内部管理运营系统的开发与维护。', '深圳及其控股公司、子公司所在地', '11000.00', '12000 元/月', '1460390400', '1460390400', '1460353639', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '153f501dd0aeece4c2a314648a7bd027', '09cd105fc4a84b86b2991ba684b3b5cc68383741dbee4457822e1be40e00d89db2991ba6', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('377', 'offer20160411015056', '焦寒梅', ' jiaohanmei@hotmail.com', '消费软件业务-网站运营专员', 'VS011_网站运营专员', '负责西语市场调研分析,确定公司产品目标用户群及特征，制定西语市场营销方案，并推动落地实施，以提高产品曝光度，并达成流量和销售目标。', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1460563200', '1461168000', '1460353862', null, '0', '徐赛红', 'xush@wondershare.cn', '61.158.152.205', null, '（1）个月工资', '18682386616', '153f4cefbaa9de092c02b1d45bdb1597', '0f19486fd5f74f82a18427e2709b0ee2c03b1fd860f64573bc6cf41d76dc2587a18427e2', '-1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('378', 'offer20160411015134', '焦寒梅', ' jiaohanmei@hotmail.com', '消费软件业务-网站运营专员', 'VS011_网站运营专员', '负责西语市场调研分析,确定公司产品目标用户群及特征，制定西语市场营销方案，并推动落地实施，以提高产品曝光度，并达成流量和销售目标。', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1460563200', '1461168000', '1460353900', null, '0', '徐赛红', 'xush@wondershare.cn', null, null, '（1）个月工资', '18682386616', '153f4cefbaa9de092c02b1d45bdb1597', '26ee469741da43119bb0015cf83ce699cb5d948b7fe24b67bec301a7c146cdd99bb0015c', '5', '0', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('379', 'offer20160412034142', '曾小明', 'jeffzxm@163.com', '智能家居业务-iOS开发工程师', 'PTAP00_iOS软件开发工程师', '负责iOS平台下的应用开发，智能家居产品iOS客户端应用开发。', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1460390400', '1460476800', '1460446899', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '154080cc3ea62f4cf6bc3534f97a6483', '31d470f6db8045b7895ac1250cd34794939f625977b54249afd8919db01a051c895ac125', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('380', 'offer20160412043006', '余丽芬', 'yulifen225@qq.com', '智能家居业务-软件测试工程师', 'MG011_软件测试工程师', '1.负责制定测试计划、测试用例，组建测试流程、方案，搭建自动化测试系统；<BR>2.参与需求讨论和审核，根据系统需求设计测试用例并保证对需求的覆盖；<BR>3.进行测试需求分析、测试结果分析报告；组织定版评审会议；', '深圳及其控股公司、子公司所在地', '10000.00', '12000 元/月', '1460476800', '1460476800', '1460449809', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '154053894a0d4a93c24916243f7ad355', '082c0241c03e44fb9c431550c57d409c4d4a9a91456f4cdeb5ef3f13d65c755f9c431550', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('381', 'offer20160413092313', '郭鹏', '18938033550@163.com', '智能家居业务-高级区域经理', 'XXYX03_区域经理', '负责辖区经销网络的拓展、建设和维护<BR>负责总部的销售政策的落实、各项制度的贯彻执行，<BR>负责制定辖区市场推广计划及方案。并组织实施', '深圳及其控股公司、子公司所在地', '18000.00', '视试用期表现待定', '1460476800', '1460563200', '1460510589', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '154099a00744045ff6a3b984a90b486e', '8c41e198bc244984b87195706b5b55202c9b0e96d08c4cfb96e5af0c6f093165b8719570', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('382', 'offer20160414035559', '冉君', 'xexexe@aliyun.com', '消费软件业务-高级IOS软件开发工程师', 'VS01_高级iOS软件开发工程师', '1、制定项目阶段开发计划，并针对技术难点进行规划、预研，输出技术预研分析报告，形成技术对比方案及发展规划分析；<BR>2、从整体进行系统设计，包括系统架构、模块、接口、集成等设计，形成系统设计说明书；<BR>3、编写代码，实现模块功能，并完成各模块集成。', '深圳及其控股公司、子公司所在地', '20000.00', '21990 元/月', '1460908800', '1460908800', '1460620562', null, '1', '徐赛红', 'xush@wondershare.cn', '183.12.204.50', null, '（1）个月工资', '18682386616', '1540e689a8568de8a45fb24496da7316', '75bc68a907bd470db56eef6a2e981515d6052ecd1c77446a9c365c7b26631da5b56eef6a', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('383', 'offer20160414035848', '代悄', '157621610@qq.com', '消费软件业务-高级IOS软件开发工程师', 'VS01_高级iOS软件开发工程师', '1、制定项目阶段开发计划，并针对技术难点进行规划、预研，输出技术预研分析报告，形成技术对比方案及发展规划分析；<BR>2、从整体进行系统设计，包括系统架构、模块、接口、集成等设计，形成系统设计说明书；<BR>3、编写代码，实现模块功能，并完成各模块集成。', '深圳及其控股公司、子公司所在地', '19000.00', '21990 元/月', '1460908800', '1460908800', '1460620731', null, '1', '徐赛红', 'xush@wondershare.cn', '112.97.57.231', null, '（1）个月工资', '18682386616', '1540e5f200d860ace3cb06b4d20932b9', '86a12b3191f44ee4b4bc7db9536be3aa86ffdff351a04c9280043e57d8024205b4bc7db9', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('384', 'offer20160415053622', '毕传鹏', 'brawy@qq.com', '消费软件业务-Win软件开发工程师（C#）', 'PE02_Win软件开发工程师（C#）', '1、产品实现：根据产品需求，完成关键技术点的研究与实现、实现软件模块功能，并完成各模块集成等；<br>2、知识总结与分享：及时分享工作、学习成果，促进部门知识建设，定期提交总结文档<br>3、技术支持服务：为产品、测试、客服提供技术支持', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1460908800', '1460908800', '1460712987', null, '1', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18682386616', '1541785c48699cd96e19d784cdf9d734', '0f5e11415ff84472b54bb83c0d560c74d5e440a438c74bb592efcda482900d5cb54bb83c', '2', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('385', 'offer20160416021215', '魏海伦', 'luck.wylie@outlook.com', '职能平台-高级审计专员', 'WSNS002_高级审计专员', '1、组织并开展各类审计业务，对审计工作中发现的问题，提出相关管理和完善建议，并独立完成审计报告；<br>2、跟进各类审计报告的处理落实，并对审计过程中发生的各种文件、会计凭证等资料进行收集、整理、归档，及时跟踪落实结果；<br>3、对审计报告的各项事项进行定期跟进并推动整改；', '深圳及其控股公司、子公司所在地', '15000.00', '16000 元/月', '1460995200', '1461254400', '1460787140', null, '0', '徐赛红', 'xush@wondershare.cn', '218.14.88.130', null, '（1）个月工资', '18682386616', '1541875c3a7a5404629a1814ae2a47d6', '7bb98c9dfa2241a29e2cddb6b3261b1cc5a1507cdc4d4473afbb0c01f9d1d8519e2cddb6', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('386', 'offer20160418051326', '卢杨', '52308696@qq.com', '职能平台-HRBP', 'HRZP01_HRBP', '1、负责与各业务经理共同及时了解员工与业务发展之间的动态适配性，及时应对、取相应措施，如招聘、培养、晋升或是优化等，同时营造和谐的劳工关系；<br>2、负责公司的人力资源管理政策、方案、制度、流程等在各业务单元的推行落实，并协助业务经理更好的理解与使用人力资源管理制度与工具；<br>3、负责主导人力资源管理工作在各业务单元落地，如人才盘点、编制制定与优化、招聘实施、挖掘培训需求、员工异动管理、绩效管理、团队建设等。', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1461168000', '1462204800', '1460970806', null, '1', '刘莉莉', 'liull@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13714136047', '15428226ab36839837c3b5e42c390303', '650cb0c699014468a8c442fea7f90eae8813b4debbe64652a23a24c772d128eba8c442fe', '1', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('387', 'offer20160420100851', '杨华', 'yanghua6230@163.com', '智能家居业务-项目经理', '', '1、根据项目范围、质量、时间与成本的综合因素的考虑，进行项目的总体规划与阶段计划。<BR>2、有效掌控项目开发的各个环节，协助、指导项目组成员的工作，及时发现并处理项目中存在的问题，并对项目组成员的工作进行合理的评价。<BR>3、领导项目的计划、组织和控制工作，以实现项目目标。', '深圳及其控股公司、子公司所在地', '22000.00', '23000 元/月', '1461340800', '1461513600', '1461118129', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1542c38384eae549960eafe4d6980b0d', '68b8c4dca08f41ecb1e74acaf5463f0ad190d45450774f769daf0bf344d304f3b1e74aca', '4', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('388', 'offer20160420101945', '杨鹏', '825811209@qq.com', '智能家居业务-项目经理', '', '1、根据项目范围、质量、时间与成本的综合因素的考虑，进行项目的总体规划与阶段计划。<BR>2、有效掌控项目开发的各个环节，协助、指导项目组成员的工作，及时发现并处理项目中存在的问题，并对项目组成员的工作进行合理的评价。<BR>3、领导项目的计划、组织和控制工作，以实现项目目标。', '深圳及其控股公司、子公司所在地', '10000.00', '11000 元/月', '1461340800', '1462204800', '1461118783', null, '1', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '13418602101', '1542821faa289c886c8194d4952819be', '70b97e2778ef47859bf4d0b2c3adb629aac2c8cb0eeb40fd87802ba1ae646eac9bf4d0b2', '3', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('391', 'offer20160420062138', '龚国伟', 'luanyong@wondershare.cn', '后台开发工程师(C++)', '后台开发工程师test', '1.负责员工之家系统的维护；2.……', '深圳及其控股公司、子公司所在地', '1000.00', '1200', '1447171200', '1447286400', '1447286400', null, '0', 'test', '', null, null, '（2）个月工资', '13878888', '151804efbbdac7192bc13ef455aa1071', '42beabde20794614bc2785e169dc7feb863ae1524fbc4c22b6bc83e875194d60bc2785e1', '5', '0', '0.5', '3', '2', '1', null, null);
INSERT INTO `offer` VALUES ('393', 'offer20160420074953', 'test', 'zhongzm@wondershare.cn', '智能家居业务-test', 'XT002_系统实施工程师', 'test', '深圳及其控股公司、子公司所在地', '1005.00', '视试用期表现待定', '1461859200', '1461340800', '1461152994', null, '0', '栾勇', 'luanyong@wondershare.cn', '121.15.134.202', null, '(1.5)个月工资', '1', '154332346c11794ed3ab9c34437a371f', '3cfcaab9f34e401ca8bfdc9d25b131030f23d04bc5384b22b6d1af5353a61479a8bfdc9d', '5', '0', '0.5', '5', '1', '0', null, null);
INSERT INTO `offer` VALUES ('394', 'offer20160420075633', '施小娜', '419583298@qq.com ', '智能家居业务-高级UI工程师', 'PTAP00_高级GUI设计师', '主要负责公司品牌产品GUI界面设计，会涉及到交互；', '深圳及其控股公司、子公司所在地', '18000.00', '18990 元/月', '1461168000', '1461513600', '1461153392', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '（1）个月工资', '18666665212', '1543196062d784279be572d43cda98d5', 'daf269f1bf78428bb5038ae52e44c297cb984f410f8c404fa2b180e339b381bab5038ae5', '0', '1', null, null, null, null, null, null);
INSERT INTO `offer` VALUES ('395', 'offer20160420081254', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461513600', '1461859200', '1461154370', null, '0', '栾勇', 'luangyong@wondershare.cn', '121.15.134.202', null, '4', '1', '154338ec38b1e6715a55833442ba8279', '2da7feb8b09944cca99fdf56335e51141403f1fc6f074409bbbbe54f59f6a56ea99fdf56', '5', '0', '2', '10', '0', '0', null, null);
INSERT INTO `offer` VALUES ('396', 'offer20160420082853', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461513600', '1461859200', '1461155328', null, '0', '钟志明', 'zhongzm@wondershare.cn', '121.15.134.202', null, '4', '1', '154338ec38b1e6715a55833442ba8279', '35d76a79f2fa41c38270e1d95cc7469038b5986f46f844d7869b3b83d66bea7a8270e1d9', '5', '0', '2', '10', '0', '0', null, null);
INSERT INTO `offer` VALUES ('397', 'offer20160420083341', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461513600', '1461859200', '1461155616', null, '0', '钟志明', 'zhongzm@wondershare.cn', '121.15.134.202', null, '4', '1', '154338ec38b1e6715a55833442ba8279', '48fa7b22f0904ac292697846ee5e4bec7dd2c7edceab481b9c47482f04d557ee92697846', '5', '0', '2', '10', '0', '1', null, null);
INSERT INTO `offer` VALUES ('398', 'offer20160420083603', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461513600', '1461859200', '1461155759', null, '0', '钟志明', 'zhongzm@wondershare.cn', '121.15.134.202', null, '4', '1', '154338ec38b1e6715a55833442ba8279', '7ae95ccc064e4eb38f8bfe8de871c2e382f8b35b0ca7417a9071e5b0c1bb68658f8bfe8d', '5', '1', '2', '10', '8', '0', null, null);
INSERT INTO `offer` VALUES ('399', 'offer20160420084414', '42224', 'longqin@wondershare.cn', '智能家居业务-11111', '', '98645654654654', '深圳及其控股公司、子公司所在地', '10000.00', '视试用期表现待定', '1461686400', '1461859200', '1461156263', null, '0', '罗湘娟', 'luoxj@wondershare.cn', '121.15.134.202', null, '4', '123566', '15433ab7ade3068252d6627466ea0b42', '8400efa2d5f0418fa73ee67231f036ec24d89c9aa4624e449ddc16afa352994ca73ee672', '4', '1', '2', '10', '20000', '1', null, null);
INSERT INTO `offer` VALUES ('400', 'offer20160421092945', 'test', 'zhongzm@wondershare.cn', '智能家居业务-test', 'XT002_系统实施工程师', 'test', '深圳及其控股公司、子公司所在地', '1005.00', '视试用期表现待定', '1461686400', '1461340800', '1461152425', null, '0', '栾勇', 'luanyong@wondershare.cn', null, null, '(1.5)个月工资', '1', '154332346c11794ed3ab9c34437a371f', '812a6fd63a1749afad4bdbc83fc4788ef9d1606072e942e6947ef9aa74d61b79ad4bdbc8', '5', '0', '0.5', '5', '1', '0', '0', '0');
INSERT INTO `offer` VALUES ('401', 'offer20160421093305', 'test', 'zhongzm@wondershare.cn', '智能家居业务-test', 'XT002_系统实施工程师', 'test', '深圳及其控股公司、子公司所在地', '1005.00', '视试用期表现待定', '1461859200', '1461340800', '1461202386', null, '0', '栾勇', 'zhongzm@wondershare.cn', '121.15.134.202', null, '1.5', '1', '154332346c11794ed3ab9c34437a371f', 'e66c3e49c966445e80ff017898209b5434d4446e28be4635bbd421eeb51024ad80ff0178', '5', '0', '0.5', '5', '1', '1', '1', '2');
INSERT INTO `offer` VALUES ('402', 'offer20160421093336', '111', 'yuhz@wondershare.cn', '消费软件业务-1', 'XT002_系统实施工程师', '1111111111', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461168000', '1461202411', null, '0', '栾勇', 'luangyong@wondershare.cn', '121.15.134.202', null, '2', '1', '154366f7bdd2fc07bf730ad4fa3a2f38', 'c886ed46b718439bae0b24f8db1cbaf57575e961eb8b4aa08c23bcecb31e3cc0ae0b24f8', '5', '0', '0.5', '6', '0', '1', '0', '1');
INSERT INTO `offer` VALUES ('403', 'offer20160421094430', '111', 'yuhz@wondershare.cn', '消费软件业务-1', 'XT002_系统实施工程师', '1111111111', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461168000', '1461203064', null, '0', '栾勇', 'luangyong@wondershare.cn', '121.15.134.202', null, '2', '11', '154366f7bdd2fc07bf730ad4fa3a2f38', 'b5e9208098c8424db37d910544c9f9d6000ac7941bb247ccad11828d9b892ad5b37d9105', '5', '0', '0.5', '6', '0', '1', '', '');
INSERT INTO `offer` VALUES ('404', 'offer20160421094615', '111', 'yuhz@wondershare.cn', '消费软件业务-1', 'XT002_系统实施工程师', '1111111111', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461513600', '1461168000', '1461203169', null, '0', '钟志明', 'zhongzm@wondershare.cn', '121.15.134.202', null, '2', '11', '154366f7bdd2fc07bf730ad4fa3a2f38', '36e698112b874c6987063db53b384f01e62f15fc0ffe4c76b7252c8bccd68ff487063db5', '5', '0', '0.5', '6', '10', '1', '12个月', '第2季度择期发放');
INSERT INTO `offer` VALUES ('405', 'offer20160421095327', '123233', 'longqin@wondershare.cn', '智能家居业务-2165654645', '', '32232233', '深圳及其控股公司、子公司所在地', '16800.00', '视试用期表现待定', '1461600000', '1461772800', '1461203617', null, '0', '罗湘娟', 'luoxj@wondershare.cn', '121.15.134.202', null, '4', '45645654654', '15436804173cb21d9ca538c46588fb93', 'd348ce5451464fed83b500f4b6f8a2a8a97e8c76065e4d60b426bbebbe1fbb6c83b500f4', '5', '1', '2', '10', '3', '1', '6个月', '第3季度择期发放');
INSERT INTO `offer` VALUES ('406', 'offer20160421100306', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461168000', '1461204180', null, '0', '钟志明', 'zhongzm@wondershare.cn', '121.15.134.202', null, '2', '1', '1543686f6786cd9f1299b454d13bd9b4', 'e2fea485f9d54250aacac8d01e3c9cf5ee17ee8e75e443a99d59784feca033a5aacac8d0', '5', '1', '0.5', '6', '1', '1', '12个月', '第1季度择期发放');
INSERT INTO `offer` VALUES ('407', 'offer20160421101045', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461168000', '1461204639', null, '0', '钟志明', '272067516@qq.com', '183.39.139.140', null, '2', '1', '1543686f6786cd9f1299b454d13bd9b4', '1bf45e97392041379b598ce69c82ef3b20870a61e8e14d15bb57f386dab775339b598ce6', '5', '1', '0.5', '6', '1', '1', '12个月', '第1季度择期发放');
INSERT INTO `offer` VALUES ('408', 'offer20160421101402', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461600000', '1461204836', null, '1', '钟志明', '272067516@qq.com', '121.15.134.202', null, '2', '1', '1543686f6786cd9f1299b454d13bd9b4', '43187cda4dec4a1dbf245a45c4d93bdff928db2153b049418c846001dc956a9abf245a45', '5', '1', '0.5', '6', '1', '1', '12个月', '第1季度择期发放');
INSERT INTO `offer` VALUES ('409', 'offer20160421101557', '546645465645', 'longqin@wondershare.cn', '智能家居业务-32113232', '', '215165654', '深圳及其控股公司、子公司所在地', '17300.00', '视试用期表现待定', '1461600000', '1461686400', '1461204967', null, '0', '罗湘娟', 'luoxj@wondershare.cn', '121.15.134.202', null, '3', '26655665', '15436952ec9794d850b562d4e0ea49de', '53daccc0b93f480287d36c86142d6aaf2674e4b9610a43418311b3d84290429887d36c86', '5', '1', '1', '8', '3', '1', '6个月', '第3季度择期发放');
INSERT INTO `offer` VALUES ('410', 'offer20160421103355', '1', 'yuhz@wondershare.cn', '智能家居业务-1', 'XT002_系统实施工程师', '1', '深圳及其控股公司、子公司所在地', '6.00', '视试用期表现待定', '1461600000', '1461600000', '1461206029', null, '0', '钟志明', '272067516@qq.com', null, null, '2', '1', '1543686f6786cd9f1299b454d13bd9b4', 'a3ac1e3ef41749eab8a916fbc40b3ea76893cf02ba234d64bbadeaef417ff31eb8a916fb', '5', '0', '0.5', '6', '1', '1', '12个月', '第1季度择期发放');
INSERT INTO `offer` VALUES ('411', 'offer20160421104337', '111', 'yuhz@wondershare.cn', '消费软件业务-111', 'XT002_系统实施工程师', '11111', '深圳及其控股公司、子公司所在地', '1005.00', '视试用期表现待定', '1461600000', '1461600000', '1461206611', null, '-1', '钟志明', '272067516@qq.com', '183.39.139.140', '已选择其他工作机会，对方提供的岗位/发展空间/薪酬待遇更有吸引力', '2', '111', '15436b0fb8e783228479e1f4abfba5aa', '019f659bdc9148599891b4622f8d807bf8eb13be79f84b268029684fe7a939929891b462', '5', '1', '0.5', '6', '11', '1', '12个月', '第2季度择期发放');
INSERT INTO `offer` VALUES ('412', 'offer20160421104920', '111', 'yuhz@wondershare.cn', '消费软件业务-111', 'XT002_系统实施工程师', '11111', '深圳及其控股公司、子公司所在地', '1005.00', '视试用期表现待定', '1461600000', '1461600000', '1461206954', null, '0', '钟志明', '272067516@qq.com', '121.15.134.202', null, '2', '111', '15436b0fb8e783228479e1f4abfba5aa', '8e98e453a707415780e7ac4608e632b2a13f08db87fe417c9a936c727d9ce97880e7ac46', '5', '1', '0.5', '6', '11', '0', '12个月', '第2季度择期发放');
INSERT INTO `offer` VALUES ('413', 'offer20160421111236', '张三', 'pengpy@wondershare.cn', '智能家居业务-架构工程师', '', '111111111111111111111111111111111111<BR>2222222222222222222222<BR>3333333333333333333333333333333', '深圳及其控股公司、子公司所在地', '45000.00', '与试用期一致', '1461513600', '1462291200', '1461208362', null, '0', '龙琴', 'longqin@wondershare.cn', '121.15.134.202', null, '4', '15602954313', '15436c0478f5bb23cb67cd144d7b5032', 'd4d0f9cdcde14624961466379e5f6762543a2227bb8c433ab7c4176f18c40c8996146637', '5', '1', '2', '10', '10', '1', '6个月', '第3季度择期发放');
INSERT INTO `offer` VALUES ('414', 'offer20160421034004', '马功文', 'barry220@163.com', '智能家居业务-线上营销部总监助理', '', '1、制定整体运营策略，通过各种营销手段提升销量，对整体销售业绩负责。<BR>2、负责电商平台拓展、站内运营及电商产品选型。', '深圳及其控股公司、子公司所在地', '25000.00', '视试用期表现待定', '1461254400', '1461513600', '1461224403', null, '1', '苏雯', 'suwen@wondershare.cn', '121.15.134.202', null, '2.5', '18666665212', '15436f8184e202cbbe0d522419391596', '12150152661247edacebc9edea964d17a556c693c14d404898bc6e8293675b45acebc9ed', '1', '1', '1.5', '6', '5', '1', '6个月', '随年终奖发放');
INSERT INTO `offer` VALUES ('415', 'offer20160421034531', '张伟', '839302935@qq.com', '智能家居业务-高级架构设计师', '', '1.负责公司物联网家居安全系统的架构设计、研发工作；<BR>2.承担从业务向技术转换的桥梁作用；', '深圳及其控股公司、子公司所在地', '45000.00', '与试用期一致', '1462118400', '1462723200', '1461224730', null, '0', '苏雯', 'suwen@wondershare.cn', '157.55.39.106', null, '4', '18666665212', '1543701aa6c2389cf511cd04f53bd30b', 'c39bc97269d049968f4817525df2fc2df922f37687804e9aa7af96717dbb0e398f481752', '0', '1', '2', '10', '5', '1', '6个月', '随年终奖发放');
INSERT INTO `offer` VALUES ('416', 'offer20160422024645', '陈舒挺', 'cst1718@126.com', '消费软件业务-Andriod软件开发工程师', '', '1、根据项目需求开发范围，从整体对需求的功能及特性进行梳理和识别，完成需求分析、制定项目阶段开发计划等；<BR>2、参与研究项目的关键技术点，并根据产品架构设计，按项目计划参与项目的局部模块设计，参与设计成果的评审；<BR>3、按项目计划承担局部模块的编码实现，并完成各模块集成；', '深圳及其控股公司、子公司所在地', '12000.00', '13000 元/月', '1461513600', '1461513600', '1461307609', null, '1', '徐赛红', 'xush@wondershare.cn', '117.136.79.171', null, '1.5', '18682386616', '15437fa7c1fe52c78946cbc4d27b7795', '0833d238ff3e40c6b75732ffd5d96426295d5b2b3c5c4e709f319e76e0227ffab75732ff', '3', '1', '0.5', '5', '', '0', '', '');
INSERT INTO `offer` VALUES ('417', 'offer20160422060246', '周凤君', 'zfjldj_888@163.com ', '智能家居业务-大客户经理', '', '1、根据公司及部门战略规划，制定客户年度工作目标和实施策略；<BR>2、负责所在区域的大客户开发工作；通过与大客户进行商务洽谈，签署合同，达成合作关系。<BR>3、负责大客户的关系维护工作，与客户建立良好的业务关系，挖掘大客户的需求，灵活有效地完全销售任务；', '深圳及其控股公司、子公司所在地', '14000.00', '15000 元/月', '1461513600', '1462204800', '1461319364', null, '1', '苏雯', 'suwen@wondershare.cn', '117.136.40.219, 14.17.37.72', null, '2', '18666665212', '1543bf81fc900710c84898e446c9d09e', 'c6a67dc71456412585b80d64f9983084c7fdef49a8b94746a6dd94ade598348785b80d64', '1', '1', '0.5', '6', '', '0', '', '');
INSERT INTO `offer` VALUES ('418', 'offer20160426081609', '马舒铃', 'Masuruia@qq.com', '智能家居业务-电商坐席', 'DSZX01_电商坐席', '1、妥善处理交易中出现的售后问题，包括售后退换货、快递查询等，耐心沟通，为客人提出合理的解决方案。<BR>2、通过客户的沟通，分析客户的需求，实现在线销售和服务，提高客户满意度<BR>3、网店销售产品上架、分类以及产品信息的及时调整', '深圳及其控股公司、子公司所在地', '5000.00', '6000 元/月', '1461772800', '1461686400', '1461672969', null, '0', '何珊', 'heshan@wondershare.cn', '121.15.134.202', null, '1', '13418602101', '1544c5a0a888c1eb89940da49889d2fe', '307daf30d62e4de6966ca20df060174e649b2501f4de479c83d83e18184417d2966ca20d', '5', '1', '0.5', '3', '', '0', '', '');
INSERT INTO `offer` VALUES ('419', 'offer20160427091118', '陈祥祯', '479442145@qq.com', '消费软件业务-网站运营专员', 'MG028_网站运营专员', '1、分析与挖掘产品市场需求,提炼产品功能亮点，制定运营计划；<br>2、结合关键字制定产品文章内容结构，撰写发布文案；<br>3、制定外部推广计划，通过各种推广渠道推广和曝光产品，达成销售。', '深圳及其控股公司、子公司所在地', '7000.00', '视试用期表现待定', '1461772800', '1461772800', '1461719480', null, '0', '徐赛红', 'xush@wondershare.cn', '121.15.134.202', null, '1.5', '18682386616', '1544bf6c87733d0c42a5f6844518c589', '62d9d99e9bed457b899387a46cb5cf0c326f8eced2c94fff87b860e0c5b31428899387a4', '3', '1', '0.5', '5', '', '0', '', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
    -- Table structure for customer
    -- ----------------------------
DROP TABLE IF EXISTS
    `customer`;
CREATE TABLE `customer`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `cus_name` VARCHAR(32),
    `cus_sex` CHAR(2),
    `cus_phone1` VARCHAR(60),
    `cus_phone2` VARCHAR(60),
    `insert_time` INT(11) NOT NULL,
    `update_time` INT(11) NOT NULL,
    `client_resume` VARCHAR(255),
    `user_id` INT(11),
    PRIMARY KEY(`id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `customer_fk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'C5f5K1Kg8tL-IutYAom4-s7RMh_xMk_l', '$2y$13$zUhKPW6Y69gn.DDWjSI.kOp9OXZWSuMDTq5JRZvw6yK9dr2QK43qu', null, '272067517@qq.com', '10', '1467626063', '1467626063');
INSERT INTO `user` VALUES ('4', 'test', '0EnLHzmdFPf4WpEO7o-CUc1ahYpsvLv2', '$2y$13$0YedVUlB8TthlCC5rTGZyeEQQzw3FqwknlrQwm/9hPQu1v5lYY/He', null, '272067517@qq.com', '10', '1482905655', '0');
INSERT INTO `user` VALUES ('6', 'test123', 'AEaEXJaXirQJSggbHNY72SNLejVoeuUQ', '$2y$13$DQSwXPD.2SpCj.TV25Pp2.zmPCLAeZ8Z1tmI1/XuquydF9er6frie', null, 'qqww@qq.com', '10', '1483423097', '0');

-- ----------------------------
-- Procedure structure for test1
-- ----------------------------
DROP PROCEDURE IF EXISTS `test1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1`()
begin
declare v_cnt decimal (10)  default 0 ;
dd:loop 
          insert  into usertb values
        (null,'用户1','2010-01-01 00:00:00',20),
        (null,'用户2','2010-01-01 00:00:00',20),
        (null,'用户3','2010-01-01 00:00:00',20),
        (null,'用户4','2010-01-01 00:00:00',20),
        (null,'用户5','2011-01-01 00:00:00',20),
        (null,'用户6','2011-01-01 00:00:00',20),
        (null,'用户7','2011-01-01 00:00:00',20),
        (null,'用户8','2012-01-01 00:00:00',20),
        (null,'用户9','2012-01-01 00:00:00',20),
        (null,'用户0','2012-01-01 00:00:00',20)
            ;
                  commit;
                    set v_cnt = v_cnt+10 ;
                           if  v_cnt = 10000000 then leave dd;
                          end if;
         end loop dd ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test2
-- ----------------------------
DROP PROCEDURE IF EXISTS `test2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test2`()
begin
declare v_cnt decimal (10)  default 0 ;
dd:loop 
          insert  into usertb values
        (null,'用户1','2010-01-01 00:00:00',20),
        (null,'用户2','2010-01-01 00:00:00',20),
        (null,'用户3','2010-01-01 00:00:00',20),
        (null,'用户4','2010-01-01 00:00:00',20),
        (null,'用户5','2011-01-01 00:00:00',20),
        (null,'用户6','2011-01-01 00:00:00',20),
        (null,'用户7','2011-01-01 00:00:00',20),
        (null,'用户8','2012-01-01 00:00:00',20),
        (null,'用户9','2012-01-01 00:00:00',20),
        (null,'用户0','2012-01-01 00:00:00',20)
            ;
                  commit;
                    set v_cnt = v_cnt+10 ;
                           if  v_cnt = 10 then leave dd;
                          end if;
         end loop dd ;
end
;;
DELIMITER ;
