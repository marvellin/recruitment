/*
Navicat MySQL Data Transfer

Source Server         : recruitmentTest
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : recruitmenttest

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-03-22 02:11:54
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历附件';

-- ----------------------------
-- Records of attachmentresume
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司用户';

-- ----------------------------
-- Records of company
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司基本信息';

-- ----------------------------
-- Records of companydetail
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司图标';

-- ----------------------------
-- Records of companyimg
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司标签';

-- ----------------------------
-- Records of companylabel
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司负责人';

-- ----------------------------
-- Records of companymember
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司产品';

-- ----------------------------
-- Records of companyproduct
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司报道';

-- ----------------------------
-- Records of companyreport
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='融资情况';

-- ----------------------------
-- Records of companystage
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='默认简历';

-- ----------------------------
-- Records of defaultresume
-- ----------------------------

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `deliveryId` int(10) NOT NULL AUTO_INCREMENT COMMENT '投递记录主键',
  `positionId` int(10) DEFAULT NULL COMMENT '职位id',
  `resumeId` int(10) DEFAULT NULL COMMENT '简历id',
  `deliveryTime` varchar(20) NOT NULL COMMENT '投递时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '投递状态',
  PRIMARY KEY (`deliveryId`),
  KEY `delivery_fk_1` (`positionId`),
  KEY `delivery_fk_2` (`resumeId`),
  CONSTRAINT `delivery_fk_1` FOREIGN KEY (`positionId`) REFERENCES `position` (`positionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_fk_2` FOREIGN KEY (`resumeId`) REFERENCES `resume` (`resumeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投递记录';

-- ----------------------------
-- Records of delivery
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教育背景';

-- ----------------------------
-- Records of education
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期望工作';

-- ----------------------------
-- Records of expectjob
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈细节';

-- ----------------------------
-- Records of feedbackdetail
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司负责人照片';

-- ----------------------------
-- Records of memberimg
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='oss文件';

-- ----------------------------
-- Records of ossfile
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户';

-- ----------------------------
-- Records of person
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人基本信息';

-- ----------------------------
-- Records of persondetail
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人照片';

-- ----------------------------
-- Records of personimg
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位';

-- ----------------------------
-- Records of position
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图片';

-- ----------------------------
-- Records of productimg
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目经验';

-- ----------------------------
-- Records of projectexperience
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历';

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `email` varchar(30) NOT NULL COMMENT '登陆邮箱',
  `password` varchar(255) NOT NULL COMMENT '登陆密码',
  `role` enum('company','person') NOT NULL DEFAULT 'person' COMMENT '用户角色',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作经验';

-- ----------------------------
-- Records of workexperience
-- ----------------------------
