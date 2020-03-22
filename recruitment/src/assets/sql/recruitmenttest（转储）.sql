/*
Navicat MySQL Data Transfer

Source Server         : recruitmentTest
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : recruitmenttest

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-03-23 01:09:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attachmentresume`
-- ----------------------------
DROP TABLE IF EXISTS `attachmentresume`;
CREATE TABLE `attachmentresume` (
  `attachmentResumeId` int(10) NOT NULL AUTO_INCREMENT COMMENT '简历附件主键',
  `personId` int(10) DEFAULT NULL COMMENT '个人用户id',
  `ossId` int(10) DEFAULT NULL COMMENT 'oss文件id',
  `name` text NOT NULL COMMENT '文件原名',
  PRIMARY KEY (`attachmentResumeId`),
  UNIQUE KEY `ossId` (`ossId`),
  KEY `attachmentResume_fk_1` (`personId`),
  CONSTRAINT `attachmentResume_fk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attachmentResume_fk_2` FOREIGN KEY (`ossId`) REFERENCES `ossfile` (`ossId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='简历附件';

-- ----------------------------
-- Records of attachmentresume
-- ----------------------------
INSERT INTO `attachmentresume` VALUES ('1', '1', '1', 'test1.png');
INSERT INTO `attachmentresume` VALUES ('2', '2', '2', 'test2.png');
INSERT INTO `attachmentresume` VALUES ('3', '3', '3', 'test3.png');
INSERT INTO `attachmentresume` VALUES ('4', '4', '4', 'test4.png');
INSERT INTO `attachmentresume` VALUES ('5', '5', '5', 'test5.png');
INSERT INTO `attachmentresume` VALUES ('6', '6', '6', 'test6.png');
INSERT INTO `attachmentresume` VALUES ('7', '7', '7', 'test7.png');
INSERT INTO `attachmentresume` VALUES ('8', '8', '8', 'test8.png');
INSERT INTO `attachmentresume` VALUES ('9', '9', '9', 'test9.png');
INSERT INTO `attachmentresume` VALUES ('10', '10', '10', 'test10.png');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司用户主键',
  `userId` int(10) DEFAULT NULL COMMENT '公司用户外键',
  `intro` text NOT NULL,
  PRIMARY KEY (`companyId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `company_fk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司用户';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '11', '这是公司介绍1');
INSERT INTO `company` VALUES ('2', '12', '这是公司介绍1');
INSERT INTO `company` VALUES ('3', '13', '这是公司介绍1');
INSERT INTO `company` VALUES ('4', '14', '这是公司介绍1');
INSERT INTO `company` VALUES ('5', '15', '这是公司介绍1');
INSERT INTO `company` VALUES ('6', '16', '这是公司介绍1');
INSERT INTO `company` VALUES ('7', '17', '这是公司介绍1');
INSERT INTO `company` VALUES ('8', '18', '这是公司介绍1');
INSERT INTO `company` VALUES ('9', '19', '这是公司介绍1');
INSERT INTO `company` VALUES ('10', '20', '这是公司介绍1');

-- ----------------------------
-- Table structure for `companydetail`
-- ----------------------------
DROP TABLE IF EXISTS `companydetail`;
CREATE TABLE `companydetail` (
  `companyDetailId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司基本信息主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `fullName` varchar(20) NOT NULL COMMENT '公司全称',
  `shortName` varchar(20) NOT NULL COMMENT '公司简称',
  `feature` text NOT NULL COMMENT '一句话描述',
  `city` varchar(20) NOT NULL COMMENT '所在城市',
  `field` varchar(20) NOT NULL COMMENT '所在领域',
  `scale` varchar(20) NOT NULL COMMENT '公司规模',
  `comurl` text NOT NULL COMMENT '公司官网',
  PRIMARY KEY (`companyDetailId`),
  UNIQUE KEY `fullName` (`fullName`),
  UNIQUE KEY `shortName` (`shortName`),
  UNIQUE KEY `companyId` (`companyId`),
  CONSTRAINT `companyDetail_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司基本信息';

-- ----------------------------
-- Records of companydetail
-- ----------------------------
INSERT INTO `companydetail` VALUES ('1', '1', '阳江豆豉1厂', '豆豉1厂', '免费吃豆豉1', '阳江', '食品', '200-500人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('2', '2', '阳江豆豉2厂', '豆豉2厂', '免费吃豆豉2', '上海', '食品', '100-400人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('3', '3', '阳江豆豉3厂', '豆豉3厂', '免费吃豆豉3', '上海', '食品', '200-500人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('4', '4', '阳江豆豉4厂', '豆豉4厂', '免费吃豆豉4', '阳江', '食品', '300-600人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('5', '5', '阳江豆豉5厂', '豆豉5厂', '免费吃豆豉5', '北京', '食品', '400-700人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('6', '6', '阳江豆豉6厂', '豆豉6厂', '免费吃豆豉6', '北京', '食品', '500-800人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('7', '7', '阳江豆豉7厂', '豆豉7厂', '免费吃豆豉7', '阳江', '食品', '600-900人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('8', '8', '阳江豆豉8厂', '豆豉8厂', '免费吃豆豉8', '广州', '食品', '200-500人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('9', '9', '阳江豆豉9厂', '豆豉9厂', '免费吃豆豉9', '广州', '食品', '200-500人', 'https://alibaba.com');
INSERT INTO `companydetail` VALUES ('10', '10', '阳江豆豉10厂', '豆豉10厂', '免费吃豆豉', '阳江', '食品', '200-500人', 'https://alibaba.com');

-- ----------------------------
-- Table structure for `companyimg`
-- ----------------------------
DROP TABLE IF EXISTS `companyimg`;
CREATE TABLE `companyimg` (
  `companyImgId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司图标主键',
  `companyDetailId` int(10) DEFAULT NULL COMMENT '公司基本信息id',
  `ossId` int(10) DEFAULT NULL COMMENT 'oss文件id',
  PRIMARY KEY (`companyImgId`),
  UNIQUE KEY `companyDetailId` (`companyDetailId`),
  UNIQUE KEY `ossId` (`ossId`),
  CONSTRAINT `companyImg_fk_1` FOREIGN KEY (`companyDetailId`) REFERENCES `companydetail` (`companyDetailId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companyImg_fk_2` FOREIGN KEY (`ossId`) REFERENCES `ossfile` (`ossId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司图标';

-- ----------------------------
-- Records of companyimg
-- ----------------------------
INSERT INTO `companyimg` VALUES ('1', '1', '1');
INSERT INTO `companyimg` VALUES ('2', '2', '2');
INSERT INTO `companyimg` VALUES ('3', '3', '3');
INSERT INTO `companyimg` VALUES ('4', '4', '4');
INSERT INTO `companyimg` VALUES ('5', '5', '5');
INSERT INTO `companyimg` VALUES ('6', '6', '6');
INSERT INTO `companyimg` VALUES ('7', '7', '7');
INSERT INTO `companyimg` VALUES ('8', '8', '8');
INSERT INTO `companyimg` VALUES ('9', '9', '9');
INSERT INTO `companyimg` VALUES ('10', '10', '10');

-- ----------------------------
-- Table structure for `companylabel`
-- ----------------------------
DROP TABLE IF EXISTS `companylabel`;
CREATE TABLE `companylabel` (
  `companyLabelId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司标签主键',
  `companyDetailId` int(10) DEFAULT NULL COMMENT '公司基本信息id',
  `label` varchar(20) NOT NULL COMMENT '公司标签内容',
  PRIMARY KEY (`companyLabelId`),
  KEY `companyLabel_fk_1` (`companyDetailId`),
  CONSTRAINT `companyLabel_fk_1` FOREIGN KEY (`companyDetailId`) REFERENCES `companydetail` (`companyDetailId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司标签';

-- ----------------------------
-- Records of companylabel
-- ----------------------------
INSERT INTO `companylabel` VALUES ('1', '1', '标签1');
INSERT INTO `companylabel` VALUES ('2', '2', '标签2');
INSERT INTO `companylabel` VALUES ('3', '3', '标签3');
INSERT INTO `companylabel` VALUES ('4', '4', '标签4');
INSERT INTO `companylabel` VALUES ('5', '5', '标签5');
INSERT INTO `companylabel` VALUES ('6', '6', '标签6');
INSERT INTO `companylabel` VALUES ('7', '7', '标签7');
INSERT INTO `companylabel` VALUES ('8', '8', '标签8');
INSERT INTO `companylabel` VALUES ('9', '9', '标签9');
INSERT INTO `companylabel` VALUES ('10', '10', '标签10');

-- ----------------------------
-- Table structure for `companymember`
-- ----------------------------
DROP TABLE IF EXISTS `companymember`;
CREATE TABLE `companymember` (
  `companyMemberId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司负责人主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `name` varchar(20) NOT NULL COMMENT '公司负责人姓名',
  `post` varchar(20) NOT NULL COMMENT '公司负责人职位',
  `intro` text NOT NULL COMMENT '公司负责人介绍',
  PRIMARY KEY (`companyMemberId`),
  UNIQUE KEY `companyId` (`companyId`),
  CONSTRAINT `companyMember_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司负责人';

-- ----------------------------
-- Records of companymember
-- ----------------------------
INSERT INTO `companymember` VALUES ('1', '1', '负责人1', '职位1', '负责人介绍1');
INSERT INTO `companymember` VALUES ('2', '2', '负责人2', '职位2', '负责人介绍2');
INSERT INTO `companymember` VALUES ('3', '3', '负责人3', '职位3', '负责人介绍3');
INSERT INTO `companymember` VALUES ('4', '4', '负责人4', '职位4', '负责人介绍4');
INSERT INTO `companymember` VALUES ('5', '5', '负责人5', '职位5', '负责人介绍5');
INSERT INTO `companymember` VALUES ('6', '6', '负责人6', '职位6', '负责人介绍6');
INSERT INTO `companymember` VALUES ('7', '7', '负责人7', '职位7', '负责人介绍7');
INSERT INTO `companymember` VALUES ('8', '8', '负责人8', '职位8', '负责人介绍8');
INSERT INTO `companymember` VALUES ('9', '9', '负责人9', '职位9', '负责人介绍9');
INSERT INTO `companymember` VALUES ('10', '10', '负责人10', '职位10', '负责人介绍10');

-- ----------------------------
-- Table structure for `companyproduct`
-- ----------------------------
DROP TABLE IF EXISTS `companyproduct`;
CREATE TABLE `companyproduct` (
  `companyProductId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司产品主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `info` text NOT NULL COMMENT '产品信息',
  PRIMARY KEY (`companyProductId`),
  KEY `companyProduct_fk_1` (`companyId`),
  CONSTRAINT `companyProduct_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司产品';

-- ----------------------------
-- Records of companyproduct
-- ----------------------------
INSERT INTO `companyproduct` VALUES ('1', '1', '产品名称1', '产品介绍1');
INSERT INTO `companyproduct` VALUES ('2', '2', '产品名称2', '产品介绍2');
INSERT INTO `companyproduct` VALUES ('3', '3', '产品名称3', '产品介绍3');
INSERT INTO `companyproduct` VALUES ('4', '4', '产品名称4', '产品介绍4');
INSERT INTO `companyproduct` VALUES ('5', '5', '产品名称5', '产品介绍5');
INSERT INTO `companyproduct` VALUES ('6', '6', '产品名称6', '产品介绍6');
INSERT INTO `companyproduct` VALUES ('7', '7', '产品名称7', '产品介绍7');
INSERT INTO `companyproduct` VALUES ('8', '8', '产品名称8', '产品介绍8');
INSERT INTO `companyproduct` VALUES ('9', '9', '产品名称9', '产品介绍9');
INSERT INTO `companyproduct` VALUES ('10', '10', '产品名称10', '产品介绍10');

-- ----------------------------
-- Table structure for `companyreport`
-- ----------------------------
DROP TABLE IF EXISTS `companyreport`;
CREATE TABLE `companyreport` (
  `companyReportId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司报道主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `repotitle` varchar(20) NOT NULL COMMENT '公司报道标题',
  `repolink` text NOT NULL COMMENT '公司报道链接',
  PRIMARY KEY (`companyReportId`),
  KEY `companyReport_fk_1` (`companyId`),
  CONSTRAINT `companyReport_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司报道';

-- ----------------------------
-- Records of companyreport
-- ----------------------------
INSERT INTO `companyreport` VALUES ('1', '1', '新闻报道标题1', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('2', '2', '新闻报道标题2', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('3', '3', '新闻报道标题3', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('4', '4', '新闻报道标题4', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('5', '5', '新闻报道标题5', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('6', '6', '新闻报道标题6', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('7', '7', '新闻报道标题7', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('8', '8', '新闻报道标题8', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('9', '9', '新闻报道标题9', 'https://baidu.com');
INSERT INTO `companyreport` VALUES ('10', '10', '新闻报道标题10', 'https://baidu.com');

-- ----------------------------
-- Table structure for `companystage`
-- ----------------------------
DROP TABLE IF EXISTS `companystage`;
CREATE TABLE `companystage` (
  `companyStageId` int(10) NOT NULL AUTO_INCREMENT COMMENT '融资情况主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `currentStage` varchar(20) NOT NULL COMMENT '目前融资阶段',
  `org` varchar(20) DEFAULT NULL COMMENT '投资机构',
  PRIMARY KEY (`companyStageId`),
  UNIQUE KEY `companyId` (`companyId`),
  CONSTRAINT `companyStage_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='融资情况';

-- ----------------------------
-- Records of companystage
-- ----------------------------
INSERT INTO `companystage` VALUES ('1', '1', '未融资', null);
INSERT INTO `companystage` VALUES ('2', '2', 'B轮', '真格基金');
INSERT INTO `companystage` VALUES ('3', '3', '未融资', null);
INSERT INTO `companystage` VALUES ('4', '4', 'C轮', '红杉资本');
INSERT INTO `companystage` VALUES ('5', '5', '未融资', null);
INSERT INTO `companystage` VALUES ('6', '6', 'D轮', '阿里巴巴');
INSERT INTO `companystage` VALUES ('7', '7', '未融资', null);
INSERT INTO `companystage` VALUES ('8', '8', '上市', '无');
INSERT INTO `companystage` VALUES ('9', '9', '未融资', null);
INSERT INTO `companystage` VALUES ('10', '10', '未融资', null);

-- ----------------------------
-- Table structure for `defaultresume`
-- ----------------------------
DROP TABLE IF EXISTS `defaultresume`;
CREATE TABLE `defaultresume` (
  `defaultResumeId` int(10) NOT NULL AUTO_INCREMENT COMMENT '默认简历主键',
  `personId` int(10) DEFAULT NULL COMMENT '个人用户id',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `attachmentResumeId` int(10) DEFAULT NULL COMMENT '简历附件id',
  PRIMARY KEY (`defaultResumeId`),
  UNIQUE KEY `personId` (`personId`),
  UNIQUE KEY `resumeId` (`resumeId`),
  UNIQUE KEY `attachmentResumeId` (`attachmentResumeId`),
  CONSTRAINT `defaultResume_fk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultResume_fk_2` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `defaultResume_fk_3` FOREIGN KEY (`attachmentResumeId`) REFERENCES `attachmentresume` (`attachmentResumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='默认简历';

-- ----------------------------
-- Records of defaultresume
-- ----------------------------
INSERT INTO `defaultresume` VALUES ('1', '1', '1', null);
INSERT INTO `defaultresume` VALUES ('2', '2', null, '2');
INSERT INTO `defaultresume` VALUES ('3', '3', '3', null);
INSERT INTO `defaultresume` VALUES ('4', '4', null, '4');
INSERT INTO `defaultresume` VALUES ('5', '5', '5', null);
INSERT INTO `defaultresume` VALUES ('6', '6', null, '6');
INSERT INTO `defaultresume` VALUES ('7', '7', '7', null);
INSERT INTO `defaultresume` VALUES ('8', '8', null, '8');
INSERT INTO `defaultresume` VALUES ('9', '9', '9', null);
INSERT INTO `defaultresume` VALUES ('10', '10', null, '10');

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `deliveryId` int(10) NOT NULL AUTO_INCREMENT COMMENT '投递记录主键',
  `positionId` int(10) DEFAULT NULL COMMENT '职位id',
  `personId` int(10) DEFAULT NULL COMMENT '个人用户id',
  `deliveryTime` varchar(20) NOT NULL COMMENT '投递时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '投递状态',
  PRIMARY KEY (`deliveryId`),
  KEY `delivery_fk_1` (`positionId`),
  KEY `delivery_fk_2` (`personId`),
  CONSTRAINT `delivery_fk_1` FOREIGN KEY (`positionId`) REFERENCES `position` (`positionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_fk_2` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='投递记录';

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('1', '1', '1', '2019-10-01 01:00', '1');
INSERT INTO `delivery` VALUES ('2', '2', '2', '2019-10-02 02:00', '1');
INSERT INTO `delivery` VALUES ('3', '3', '3', '2019-10-03 03:00', '1');
INSERT INTO `delivery` VALUES ('4', '4', '4', '2019-10-04 04:00', '1');
INSERT INTO `delivery` VALUES ('5', '5', '5', '2019-10-05 05:00', '1');
INSERT INTO `delivery` VALUES ('6', '6', '6', '2019-10-06 06:00', '1');
INSERT INTO `delivery` VALUES ('7', '7', '7', '2019-10-07 07:00', '1');
INSERT INTO `delivery` VALUES ('8', '8', '8', '2019-10-08 08:00', '1');
INSERT INTO `delivery` VALUES ('9', '9', '9', '2019-10-09 09:00', '1');
INSERT INTO `delivery` VALUES ('10', '10', '10', '2019-10-10 10:00', '1');

-- ----------------------------
-- Table structure for `education`
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
  `educationId` int(10) NOT NULL AUTO_INCREMENT COMMENT '教育背景主键',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `schoole` varchar(20) NOT NULL COMMENT '学校',
  `degree` varchar(20) NOT NULL COMMENT '学历',
  `profession` varchar(20) NOT NULL COMMENT '专业',
  `startYear` varchar(20) NOT NULL COMMENT '开始年份',
  `endYear` varchar(20) NOT NULL COMMENT '结束年份',
  `rank` varchar(20) NOT NULL COMMENT '成绩排名',
  PRIMARY KEY (`educationId`),
  KEY `education_fk_1` (`resumeId`),
  CONSTRAINT `education_fk_1` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='教育背景';

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES ('1', '1', '华南大学1', '本科', '专业1', '2016', '2020', '11%');
INSERT INTO `education` VALUES ('2', '2', '华南大学2', '本科', '专业2', '2010', '2021', '12%');
INSERT INTO `education` VALUES ('3', '3', '华南大学3', '本科', '专业3', '2011', '2022', '13%');
INSERT INTO `education` VALUES ('4', '4', '华南大学4', '本科', '专业4', '2012', '2023', '14%');
INSERT INTO `education` VALUES ('5', '5', '华南大学5', '本科', '专业5', '2013', '2024', '15%');
INSERT INTO `education` VALUES ('6', '6', '华南大学6', '本科', '专业6', '2014', '2025', '16%');
INSERT INTO `education` VALUES ('7', '7', '华南大学7', '本科', '专业7', '2015', '2026', '17%');
INSERT INTO `education` VALUES ('8', '8', '华南大学8', '本科', '专业8', '2016', '2027', '18%');
INSERT INTO `education` VALUES ('9', '9', '华南大学9', '本科', '专业9', '2017', '2028', '19%');
INSERT INTO `education` VALUES ('10', '10', '华南大学10', '本科', '专业10', '2016', '2020', '20%');

-- ----------------------------
-- Table structure for `expectjob`
-- ----------------------------
DROP TABLE IF EXISTS `expectjob`;
CREATE TABLE `expectjob` (
  `expectJobId` int(10) NOT NULL AUTO_INCREMENT COMMENT '期望工作主键',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `city` varchar(20) NOT NULL COMMENT '期望工作城市',
  `type` enum('全职','兼职','实习') NOT NULL DEFAULT '全职' COMMENT '工作类型',
  `post` varchar(20) NOT NULL COMMENT '职位名称',
  `salary` varchar(20) NOT NULL COMMENT '工资',
  PRIMARY KEY (`expectJobId`),
  UNIQUE KEY `resumeId` (`resumeId`),
  CONSTRAINT `expectJob_fk_1` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='期望工作';

-- ----------------------------
-- Records of expectjob
-- ----------------------------
INSERT INTO `expectjob` VALUES ('1', '1', '上海', '实习', '后台开发工程师', '2K-5K');
INSERT INTO `expectjob` VALUES ('2', '2', '北京', '实习', '网络工程师', '2K-5K');
INSERT INTO `expectjob` VALUES ('3', '3', '北京', '全职', '后台开发工程师', '3K-5K');
INSERT INTO `expectjob` VALUES ('4', '4', '北京', '兼职', '前台开发工程师', '4K-6K');
INSERT INTO `expectjob` VALUES ('5', '5', '上海', '兼职', '后台开发工程师', '5K-7K');
INSERT INTO `expectjob` VALUES ('6', '6', '上海', '兼职', '后台开发工程师', '6K-8K');
INSERT INTO `expectjob` VALUES ('7', '7', '深圳', '兼职', '需求工程师', '7K-9K');
INSERT INTO `expectjob` VALUES ('8', '8', '深圳', '全职', '后台开发工程师', '2K-5K');
INSERT INTO `expectjob` VALUES ('9', '9', '上海', '全职', '会计', '2K-5K');
INSERT INTO `expectjob` VALUES ('10', '10', '上海', '全职', '后台开发工程师', '2K-5K');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedBackId` int(10) NOT NULL AUTO_INCREMENT COMMENT '反馈主键',
  `deliveryId` int(10) DEFAULT NULL COMMENT '投递记录id',
  `feedBackTime` varchar(20) NOT NULL COMMENT '反馈时间',
  `feedback` enum('不合适','邀请面试') NOT NULL DEFAULT '不合适' COMMENT '反馈结果',
  PRIMARY KEY (`feedBackId`),
  UNIQUE KEY `deliveryId` (`deliveryId`),
  CONSTRAINT `feedBack_fk_1` FOREIGN KEY (`deliveryId`) REFERENCES `delivery` (`deliveryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '1', '2019-10-02 03:00', '不合适');
INSERT INTO `feedback` VALUES ('2', '2', '2019-10-03 04:00', '不合适');
INSERT INTO `feedback` VALUES ('3', '3', '2019-10-04 05:00', '不合适');
INSERT INTO `feedback` VALUES ('4', '4', '2019-10-05 06:00', '不合适');
INSERT INTO `feedback` VALUES ('5', '5', '2019-10-06 07:00', '不合适');
INSERT INTO `feedback` VALUES ('6', '6', '2019-10-07 08:00', '不合适');
INSERT INTO `feedback` VALUES ('7', '7', '2019-10-08 09:00', '不合适');
INSERT INTO `feedback` VALUES ('8', '8', '2019-10-09 10:00', '不合适');
INSERT INTO `feedback` VALUES ('9', '9', '2019-10-10 11:00', '不合适');
INSERT INTO `feedback` VALUES ('10', '10', '2019-10-11 12:00', '不合适');

-- ----------------------------
-- Table structure for `feedbackdetail`
-- ----------------------------
DROP TABLE IF EXISTS `feedbackdetail`;
CREATE TABLE `feedbackdetail` (
  `feedBackDetailId` int(10) NOT NULL AUTO_INCREMENT COMMENT '反馈细节主键',
  `feedBackId` int(10) DEFAULT NULL COMMENT '反馈id',
  `address` text NOT NULL COMMENT '面试地点',
  `time` varchar(20) NOT NULL COMMENT '面试时间',
  `tel` char(11) NOT NULL COMMENT 'HR联系方式',
  PRIMARY KEY (`feedBackDetailId`),
  UNIQUE KEY `feedBackId` (`feedBackId`),
  CONSTRAINT `feedBackDetail_fk_1` FOREIGN KEY (`feedBackId`) REFERENCES `feedback` (`feedBackId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='反馈细节';

-- ----------------------------
-- Records of feedbackdetail
-- ----------------------------
INSERT INTO `feedbackdetail` VALUES ('1', '1', '面试地址1', '2019-10-07 14:00', '15813359110');
INSERT INTO `feedbackdetail` VALUES ('2', '2', '面试地址2', '2019-10-08 15:00', '15813359111');
INSERT INTO `feedbackdetail` VALUES ('3', '3', '面试地址3', '2019-10-09 16:00', '15813359112');
INSERT INTO `feedbackdetail` VALUES ('4', '4', '面试地址4', '2019-10-10 17:00', '15813359113');
INSERT INTO `feedbackdetail` VALUES ('5', '5', '面试地址5', '2019-10-11 18:00', '15813359114');
INSERT INTO `feedbackdetail` VALUES ('6', '6', '面试地址6', '2019-10-12 19:00', '15813359115');
INSERT INTO `feedbackdetail` VALUES ('7', '7', '面试地址7', '2019-10-13 20:00', '15813359116');
INSERT INTO `feedbackdetail` VALUES ('8', '8', '面试地址8', '2019-10-14 21:00', '15813359117');
INSERT INTO `feedbackdetail` VALUES ('9', '9', '面试地址9', '2019-10-15 22:00', '15813359118');

-- ----------------------------
-- Table structure for `memberimg`
-- ----------------------------
DROP TABLE IF EXISTS `memberimg`;
CREATE TABLE `memberimg` (
  `memberImgId` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司负责人照片主键',
  `companyMemberId` int(10) DEFAULT NULL COMMENT '公司负责人id',
  `ossId` int(10) DEFAULT NULL COMMENT 'oss文件id',
  PRIMARY KEY (`memberImgId`),
  UNIQUE KEY `companyMemberId` (`companyMemberId`),
  UNIQUE KEY `ossId` (`ossId`),
  CONSTRAINT `memberImg_fk_1` FOREIGN KEY (`companyMemberId`) REFERENCES `companymember` (`companyMemberId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `memberImg_fk_2` FOREIGN KEY (`ossId`) REFERENCES `ossfile` (`ossId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='公司负责人照片';

-- ----------------------------
-- Records of memberimg
-- ----------------------------
INSERT INTO `memberimg` VALUES ('1', '1', '1');
INSERT INTO `memberimg` VALUES ('2', '2', '2');
INSERT INTO `memberimg` VALUES ('3', '3', '3');
INSERT INTO `memberimg` VALUES ('4', '4', '4');
INSERT INTO `memberimg` VALUES ('5', '5', '5');
INSERT INTO `memberimg` VALUES ('6', '6', '6');
INSERT INTO `memberimg` VALUES ('7', '7', '7');
INSERT INTO `memberimg` VALUES ('8', '8', '8');
INSERT INTO `memberimg` VALUES ('9', '9', '9');
INSERT INTO `memberimg` VALUES ('10', '10', '10');

-- ----------------------------
-- Table structure for `ossfile`
-- ----------------------------
DROP TABLE IF EXISTS `ossfile`;
CREATE TABLE `ossfile` (
  `ossId` int(10) NOT NULL AUTO_INCREMENT COMMENT 'oss文件主键',
  `fileSize` int(11) NOT NULL COMMENT 'oss文件大小',
  `fileUrl` varchar(255) NOT NULL COMMENT 'oss文件访问路径',
  `suffix` varchar(20) NOT NULL COMMENT 'oss文件后缀',
  `bucket` varchar(20) NOT NULL COMMENT 'oss文件篮子',
  `filename` text NOT NULL COMMENT 'oss文件原名',
  PRIMARY KEY (`ossId`),
  UNIQUE KEY `fileUrl` (`fileUrl`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='oss文件';

-- ----------------------------
-- Records of ossfile
-- ----------------------------
INSERT INTO `ossfile` VALUES ('1', '1000', '/marvellin/recruitment/test1.png', 'png', 'marvellin', 'test1.png');
INSERT INTO `ossfile` VALUES ('2', '1000', '/marvellin/recruitment/test2.png', 'png', 'marvellin', 'test2.png');
INSERT INTO `ossfile` VALUES ('3', '1000', '/marvellin/recruitment/test3.png', 'png', 'marvellin', 'test3.png');
INSERT INTO `ossfile` VALUES ('4', '1000', '/marvellin/recruitment/test4.png', 'png', 'marvellin', 'test4.png');
INSERT INTO `ossfile` VALUES ('5', '1000', '/marvellin/recruitment/test5.png', 'png', 'marvellin', 'test5.png');
INSERT INTO `ossfile` VALUES ('6', '1000', '/marvellin/recruitment/test6.png', 'png', 'marvellin', 'test6.png');
INSERT INTO `ossfile` VALUES ('7', '1000', '/marvellin/recruitment/test7.png', 'png', 'marvellin', 'test7.png');
INSERT INTO `ossfile` VALUES ('8', '1000', '/marvellin/recruitment/test8.png', 'png', 'marvellin', 'test8.png');
INSERT INTO `ossfile` VALUES ('9', '1000', '/marvellin/recruitment/test9.png', 'png', 'marvellin', 'test9.png');
INSERT INTO `ossfile` VALUES ('10', '1000', '/marvellin/recruitment/test10.png', 'png', 'marvellin', 'test10.png');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `personId` int(10) NOT NULL AUTO_INCREMENT COMMENT '个人用户主键',
  `userId` int(10) DEFAULT NULL COMMENT '个人用户外键',
  PRIMARY KEY (`personId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `person_fk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='个人用户';

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1');
INSERT INTO `person` VALUES ('2', '2');
INSERT INTO `person` VALUES ('3', '3');
INSERT INTO `person` VALUES ('4', '4');
INSERT INTO `person` VALUES ('5', '5');
INSERT INTO `person` VALUES ('6', '6');
INSERT INTO `person` VALUES ('7', '7');
INSERT INTO `person` VALUES ('8', '8');
INSERT INTO `person` VALUES ('9', '9');
INSERT INTO `person` VALUES ('10', '10');

-- ----------------------------
-- Table structure for `persondetail`
-- ----------------------------
DROP TABLE IF EXISTS `persondetail`;
CREATE TABLE `persondetail` (
  `personDetailId` int(10) NOT NULL AUTO_INCREMENT COMMENT '个人基本信息主键',
  `personId` int(10) DEFAULT NULL COMMENT '个人用户id',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `userName` varchar(20) NOT NULL COMMENT '个人用户名称',
  `tel` char(11) NOT NULL COMMENT '电话',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `degree` varchar(20) NOT NULL COMMENT '最高学历',
  `workYear` varchar(20) NOT NULL COMMENT '工作经验',
  `currentState` varchar(20) NOT NULL COMMENT '目前状态',
  PRIMARY KEY (`personDetailId`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `personId` (`personId`),
  UNIQUE KEY `resumeId` (`resumeId`),
  CONSTRAINT `personDetail_fk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personDetail_fk_2` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='个人基本信息';

-- ----------------------------
-- Records of persondetail
-- ----------------------------
INSERT INTO `persondetail` VALUES ('1', '1', '1', '林彬1', '15813359210', '1021478610@qq.com', '男', '本科', '应届毕业生', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('2', '2', '2', '林彬2', '15813359211', '1021478611@qq.com', '男', '本科', '应届毕业生', '目前在职，考虑其他机会');
INSERT INTO `persondetail` VALUES ('3', '3', '3', '林彬3', '15813359212', '1021478612@qq.com', '男', '硕士', '应届毕业生', '目前在职，考虑其他机会');
INSERT INTO `persondetail` VALUES ('4', '4', '4', '林彬4', '15813359213', '1021478613@qq.com', '男', '硕士', '3年工作经验', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('5', '5', '5', '林彬5', '15813359214', '1021478614@qq.com', '男', '硕士', '3年工作经验', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('6', '6', '6', '林彬6', '15813359215', '1021478615@qq.com', '女', '硕士', '3年工作经验', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('7', '7', '7', '林彬7', '15813359216', '1021478616@qq.com', '女', '硕士', '3年工作经验', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('8', '8', '8', '林彬8', '15813359217', '1021478617@qq.com', '女', '本科', '应届毕业生', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('9', '9', '9', '林彬9', '15813359218', '1021478618@qq.com', '女', '本科', '应届毕业生', '我是应届毕业生');
INSERT INTO `persondetail` VALUES ('10', '10', '10', '林彬10', '15813359219', '1021478619@qq.com', '女', '本科', '应届毕业生', '我是应届毕业生');

-- ----------------------------
-- Table structure for `personimg`
-- ----------------------------
DROP TABLE IF EXISTS `personimg`;
CREATE TABLE `personimg` (
  `personImgId` int(10) NOT NULL AUTO_INCREMENT COMMENT '个人照片主键',
  `personDetailId` int(10) DEFAULT NULL COMMENT '个人基本信息id',
  `ossId` int(10) DEFAULT NULL COMMENT 'oss文件id',
  PRIMARY KEY (`personImgId`),
  UNIQUE KEY `personDetailId` (`personDetailId`),
  UNIQUE KEY `ossId` (`ossId`),
  CONSTRAINT `personImg_fk_1` FOREIGN KEY (`personDetailId`) REFERENCES `persondetail` (`personDetailId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personImg_fk_2` FOREIGN KEY (`ossId`) REFERENCES `ossfile` (`ossId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='个人照片';

-- ----------------------------
-- Records of personimg
-- ----------------------------
INSERT INTO `personimg` VALUES ('1', '1', '1');
INSERT INTO `personimg` VALUES ('2', '2', '2');
INSERT INTO `personimg` VALUES ('3', '3', '3');
INSERT INTO `personimg` VALUES ('4', '4', '4');
INSERT INTO `personimg` VALUES ('5', '5', '5');
INSERT INTO `personimg` VALUES ('6', '6', '6');
INSERT INTO `personimg` VALUES ('7', '7', '7');
INSERT INTO `personimg` VALUES ('8', '8', '8');
INSERT INTO `personimg` VALUES ('9', '9', '9');
INSERT INTO `personimg` VALUES ('10', '10', '10');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `positionId` int(10) NOT NULL AUTO_INCREMENT COMMENT '职位主键',
  `companyId` int(10) DEFAULT NULL COMMENT '公司用户id',
  `post` varchar(20) NOT NULL COMMENT '职位类别',
  `name` varchar(20) NOT NULL COMMENT '职位名称',
  `type` enum('全职','兼职','实习') NOT NULL DEFAULT '全职' COMMENT '职位类型',
  `department` varchar(20) NOT NULL COMMENT '职位部门',
  `salaryMin` int(11) NOT NULL COMMENT '职位最低工资',
  `salaryMax` int(11) NOT NULL COMMENT '职位最高工资',
  `city` varchar(20) NOT NULL COMMENT '职位所在城市',
  `experience` varchar(20) NOT NULL COMMENT '职位要求经验',
  `degree` varchar(20) NOT NULL COMMENT '职位要求学历',
  `advantage` text NOT NULL COMMENT '职位诱惑',
  `detail` text NOT NULL COMMENT '职位描述',
  `address` text NOT NULL COMMENT '职位所在具体地址',
  PRIMARY KEY (`positionId`),
  KEY `position_fk_1` (`companyId`),
  CONSTRAINT `position_fk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='职位';

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '1', '后台开发1', '软件工程师1', '全职', '技术部1', '1', '2', '深圳1', '不限1', '不限1', '诱惑1', '细节1', '地址1');
INSERT INTO `position` VALUES ('2', '2', '后台开发2', '软件工程师2', '全职', '技术部2', '2', '3', '深圳2', '不限2', '不限2', '诱惑2', '细节2', '地址2');
INSERT INTO `position` VALUES ('3', '3', '后台开发3', '软件工程师3', '全职', '技术部3', '3', '4', '深圳3', '不限3', '不限3', '诱惑3', '细节3', '地址3');
INSERT INTO `position` VALUES ('4', '4', '后台开发4', '软件工程师4', '全职', '技术部4', '4', '5', '深圳4', '不限4', '不限4', '诱惑4', '细节4', '地址4');
INSERT INTO `position` VALUES ('5', '5', '后台开发5', '软件工程师5', '全职', '技术部5', '5', '6', '深圳5', '不限5', '不限5', '诱惑5', '细节5', '地址5');
INSERT INTO `position` VALUES ('6', '6', '后台开发6', '软件工程师6', '全职', '技术部6', '6', '7', '深圳6', '不限6', '不限6', '诱惑6', '细节6', '地址6');
INSERT INTO `position` VALUES ('7', '7', '后台开发7', '软件工程师7', '全职', '技术部7', '7', '8', '深圳7', '不限7', '不限7', '诱惑7', '细节7', '地址7');
INSERT INTO `position` VALUES ('8', '8', '后台开发8', '软件工程师8', '全职', '技术部8', '8', '9', '深圳8', '不限8', '不限8', '诱惑8', '细节8', '地址8');
INSERT INTO `position` VALUES ('9', '9', '后台开发9', '软件工程师9', '全职', '技术部9', '9', '10', '深圳9', '不限9', '不限9', '诱惑9', '细节9', '地址9');
INSERT INTO `position` VALUES ('10', '10', '后台开发10', '软件工程师10', '全职', '技术部10', '10', '12', '深圳10', '不限10', '不限10', '诱惑10', '细节10', '地址10');

-- ----------------------------
-- Table structure for `productimg`
-- ----------------------------
DROP TABLE IF EXISTS `productimg`;
CREATE TABLE `productimg` (
  `productImgId` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品图片主键',
  `companyProductId` int(10) DEFAULT NULL COMMENT '公司产品id',
  `ossId` int(10) DEFAULT NULL COMMENT 'oss文件id',
  PRIMARY KEY (`productImgId`),
  UNIQUE KEY `companyProductId` (`companyProductId`),
  UNIQUE KEY `ossId` (`ossId`),
  CONSTRAINT `productImg_fk_1` FOREIGN KEY (`companyProductId`) REFERENCES `companyproduct` (`companyProductId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productImg_fk_2` FOREIGN KEY (`ossId`) REFERENCES `ossfile` (`ossId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品图片';

-- ----------------------------
-- Records of productimg
-- ----------------------------
INSERT INTO `productimg` VALUES ('1', '1', '1');
INSERT INTO `productimg` VALUES ('2', '2', '2');
INSERT INTO `productimg` VALUES ('3', '3', '3');
INSERT INTO `productimg` VALUES ('4', '4', '4');
INSERT INTO `productimg` VALUES ('5', '5', '5');
INSERT INTO `productimg` VALUES ('6', '6', '6');
INSERT INTO `productimg` VALUES ('7', '7', '7');
INSERT INTO `productimg` VALUES ('8', '8', '8');
INSERT INTO `productimg` VALUES ('9', '9', '9');
INSERT INTO `productimg` VALUES ('10', '10', '10');

-- ----------------------------
-- Table structure for `projectexperience`
-- ----------------------------
DROP TABLE IF EXISTS `projectexperience`;
CREATE TABLE `projectexperience` (
  `projectExperienceId` int(10) NOT NULL AUTO_INCREMENT COMMENT '项目经验主键',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `proName` varchar(20) NOT NULL COMMENT '项目名称',
  `post` varchar(20) NOT NULL COMMENT '担任职位',
  `startYm` varchar(20) NOT NULL COMMENT '开始年月',
  `endYm` varchar(20) NOT NULL COMMENT '结束年月',
  `intro` text NOT NULL COMMENT '项目介绍',
  PRIMARY KEY (`projectExperienceId`),
  KEY `projectExperience_fk_1` (`resumeId`),
  CONSTRAINT `projectExperience_fk_1` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='项目经验';

-- ----------------------------
-- Records of projectexperience
-- ----------------------------
INSERT INTO `projectexperience` VALUES ('1', '1', '后台开发项目1', '副组长1', '2016-10', '2018-02', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('2', '2', '后台开发项目2', '副组长2', '2016-02', '2018-03', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('3', '3', '后台开发项目3', '副组长3', '2016-03', '2018-04', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('4', '4', '后台开发项目4', '副组长4', '2016-04', '2018-05', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('5', '5', '后台开发项目5', '副组长5', '2016-05', '2018-06', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('6', '6', '后台开发项目6', '副组长6', '2016-06', '2018-07', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('7', '7', '后台开发项目7', '副组长7', '2016-07', '2018-08', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('8', '8', '后台开发项目8', '副组长8', '2016-08', '2018-09', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('9', '9', '后台开发项目9', '副组长9', '2016-09', '2018-10', '项目介绍1');
INSERT INTO `projectexperience` VALUES ('10', '10', '后台开发项目10', '副组长10', '2016-10', '2018-02', '项目介绍10');

-- ----------------------------
-- Table structure for `resume`
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `resumeId` int(10) NOT NULL AUTO_INCREMENT COMMENT '简历主键',
  `personId` int(10) DEFAULT NULL COMMENT '个人用户id',
  `resumeName` varchar(20) NOT NULL COMMENT '简历名称',
  `selfDescription` text NOT NULL COMMENT '个人用户自我介绍',
  PRIMARY KEY (`resumeId`),
  UNIQUE KEY `personId` (`personId`),
  CONSTRAINT `resume_fk_1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='简历';

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '1', '简历名1', '自我介绍1');
INSERT INTO `resume` VALUES ('2', '2', '简历名2', '自我介绍2');
INSERT INTO `resume` VALUES ('3', '3', '简历名3', '自我介绍3');
INSERT INTO `resume` VALUES ('4', '4', '简历名4', '自我介绍4');
INSERT INTO `resume` VALUES ('5', '5', '简历名5', '自我介绍5');
INSERT INTO `resume` VALUES ('6', '6', '简历名6', '自我介绍6');
INSERT INTO `resume` VALUES ('7', '7', '简历名7', '自我介绍7');
INSERT INTO `resume` VALUES ('8', '8', '简历名8', '自我介绍8');
INSERT INTO `resume` VALUES ('9', '9', '简历名9', '自我介绍9');
INSERT INTO `resume` VALUES ('10', '10', '简历名10', '自我介绍10');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `email` varchar(30) NOT NULL COMMENT '登陆邮箱',
  `password` varchar(255) NOT NULL COMMENT '登陆密码',
  `role` enum('company','person','admin') NOT NULL DEFAULT 'person' COMMENT '用户角色',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1021478610@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('2', '1021478611@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('3', '1021478612@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('4', '1021478613@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('5', '1021478614@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('6', '1021478615@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('7', '1021478616@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('8', '1021478617@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('9', '1021478618@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('10', '1021478619@qq.com', 'root', 'person');
INSERT INTO `user` VALUES ('11', '1021478620@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('12', '1021478621@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('13', '1021478622@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('14', '1021478623@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('15', '1021478624@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('16', '1021478625@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('17', '1021478626@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('18', '1021478627@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('19', '1021478628@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('20', '1021478629@qq.com', 'root', 'company');
INSERT INTO `user` VALUES ('21', '1021478630@qq.com', 'root', 'admin');

-- ----------------------------
-- Table structure for `workexperience`
-- ----------------------------
DROP TABLE IF EXISTS `workexperience`;
CREATE TABLE `workexperience` (
  `workExperienceId` int(10) NOT NULL AUTO_INCREMENT COMMENT '工作经验主键',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `comName` varchar(20) NOT NULL COMMENT '公司名称',
  `post` varchar(20) NOT NULL COMMENT '工作岗位',
  `startYm` varchar(20) NOT NULL COMMENT '开始年月',
  `endYm` varchar(20) NOT NULL COMMENT '结束年月',
  PRIMARY KEY (`workExperienceId`),
  KEY `workExperience_fk_1` (`resumeId`),
  CONSTRAINT `workExperience_fk_1` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='工作经验';

-- ----------------------------
-- Records of workexperience
-- ----------------------------
INSERT INTO `workexperience` VALUES ('1', '1', '阳江豆豉1厂', '副厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('2', '2', '阳江豆豉2厂', '副厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('3', '3', '阳江豆豉3厂', '厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('4', '4', '阳江豆豉4厂', '副厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('5', '5', '阳江豆豉5厂', '会计', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('6', '6', '阳江豆豉6厂', '副厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('7', '7', '阳江豆豉7厂', '组长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('8', '8', '阳江豆豉8厂', '副厂长', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('9', '9', '阳江豆豉9厂', '食品工程师', '2010-02', '2019-12');
INSERT INTO `workexperience` VALUES ('10', '10', '阳江豆豉14厂', '副厂长', '2010-02', '2019-12');
