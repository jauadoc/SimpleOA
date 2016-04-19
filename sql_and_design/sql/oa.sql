-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: oa
-- ------------------------------------------------------
-- Server version	5.6.14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `o_advise`
--

DROP TABLE IF EXISTS `o_advise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_advise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '意见id',
  `name` varchar(45) NOT NULL COMMENT '意见标题',
  `content` varchar(255) NOT NULL COMMENT '意见内容',
  `did` int(11) NOT NULL COMMENT '涉及部门',
  `advise_date` date NOT NULL COMMENT '创建日期',
  `uid` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_advise`
--

LOCK TABLES `o_advise` WRITE;
/*!40000 ALTER TABLE `o_advise` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_advise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_announcement`
--

DROP TABLE IF EXISTS `o_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `name` varchar(45) NOT NULL COMMENT '公告标题',
  `content` varchar(255) NOT NULL COMMENT '公告内容',
  `kind` int(11) NOT NULL COMMENT '公告类型（全公司|部门）',
  `did` int(11) DEFAULT NULL COMMENT '部门id',
  `announcement_date` date NOT NULL COMMENT '发布日期',
  `is_show` int(11) NOT NULL COMMENT '是否显示',
  `expiration` date NOT NULL,
  `href` varchar(100) DEFAULT NULL COMMENT '公告详情页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_announcement`
--

LOCK TABLES `o_announcement` WRITE;
/*!40000 ALTER TABLE `o_announcement` DISABLE KEYS */;
INSERT INTO `o_announcement` VALUES (1,'今天天气不错','今天天气确实不错啊，真的挺好的',1001,1100,'2016-04-13',101,'2016-04-15',NULL),(2,'确实不错','嗯。',1002,1100,'2016-04-13',102,'2016-04-17',NULL),(3,'确实不错','嗯。',1001,1100,'2016-04-13',101,'2016-04-14',NULL),(4,'特洒脱','忐忑瓦特啊',1002,1101,'2016-04-13',101,'2016-04-13',NULL),(5,'t2','eawtawe',1002,1101,'2016-04-13',101,'2016-04-13',NULL),(6,'t1','tawetwaet',1002,1100,'2016-04-13',101,'2016-04-13',NULL),(7,'t3','c3',1001,1101,'2016-04-13',101,'2016-04-13',NULL);
/*!40000 ALTER TABLE `o_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_apply`
--

DROP TABLE IF EXISTS `o_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `name` varchar(20) NOT NULL COMMENT '申请名',
  `description` varchar(255) NOT NULL COMMENT '申请描述',
  `apply` int(11) NOT NULL COMMENT '申请人',
  `up_date` date NOT NULL COMMENT '申请提交日期',
  `apply_date` date NOT NULL COMMENT '申请日期',
  `status` int(11) NOT NULL COMMENT '申请状态（批准|驳回|未读）',
  `kind` int(11) NOT NULL COMMENT '申请类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_apply`
--

LOCK TABLES `o_apply` WRITE;
/*!40000 ALTER TABLE `o_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_attendance`
--

DROP TABLE IF EXISTS `o_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '归属用户',
  `work_start` datetime DEFAULT NULL COMMENT '上班打卡时间',
  `work_end` datetime DEFAULT NULL COMMENT '下班打卡时间',
  `work_time` varchar(4) DEFAULT NULL COMMENT '工作时长',
  `attendance_date` date NOT NULL COMMENT '日期',
  `is_rest` int(11) DEFAULT NULL COMMENT '是否请假休息',
  `is_absent` int(11) DEFAULT NULL COMMENT '是否旷工',
  `is_compensated` int(11) DEFAULT NULL COMMENT '是否调休',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_attendance`
--

LOCK TABLES `o_attendance` WRITE;
/*!40000 ALTER TABLE `o_attendance` DISABLE KEYS */;
INSERT INTO `o_attendance` VALUES (1,1,'2016-04-17 00:00:00','2016-04-17 00:00:00','10','2016-04-17',102,102,101),(2,1,'2016-04-15 00:00:00','2016-04-15 00:00:00','10','2016-04-15',101,102,102),(3,1,'2016-04-05 00:00:00','2016-04-05 00:00:00','10','2016-04-05',102,101,102),(4,1,'2016-04-01 00:00:00','2016-04-01 00:00:00','10','2016-04-01',101,102,102),(5,1,'2016-04-11 00:00:00','2016-04-11 00:00:00','10','2016-04-11',102,101,102),(6,1,'2016-04-03 00:00:00','2016-04-03 00:00:00','10','2016-04-03',102,102,102),(8,1,'2016-04-04 00:00:00','2016-04-04 00:00:00','10','2016-04-04',102,102,102);
/*!40000 ALTER TABLE `o_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_calendar`
--

DROP TABLE IF EXISTS `o_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程id',
  `calender_date` date NOT NULL COMMENT '日期',
  `matter` varchar(255) NOT NULL COMMENT '该日事项',
  `uid` int(11) NOT NULL COMMENT '归属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_calendar`
--

LOCK TABLES `o_calendar` WRITE;
/*!40000 ALTER TABLE `o_calendar` DISABLE KEYS */;
INSERT INTO `o_calendar` VALUES (1,'2016-04-17','今天没啥事',1);
/*!40000 ALTER TABLE `o_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_department`
--

DROP TABLE IF EXISTS `o_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(20) NOT NULL COMMENT '部门名',
  `description` varchar(45) NOT NULL COMMENT '部门描述',
  `manager` int(11) NOT NULL COMMENT '管理者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_department`
--

LOCK TABLES `o_department` WRITE;
/*!40000 ALTER TABLE `o_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_directory`
--

DROP TABLE IF EXISTS `o_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `img` varchar(255) NOT NULL,
  `href` varchar(45) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_directory`
--

LOCK TABLES `o_directory` WRITE;
/*!40000 ALTER TABLE `o_directory` DISABLE KEYS */;
INSERT INTO `o_directory` VALUES (1,'首页','jics/images/home.png','index',1),(2,'联系人','jics/images/friend.png','friend',4),(3,'工作','jics/images/work.png','work',3),(4,'消息','jics/images/msg.png','message',2),(5,'test','jics/images/test.png','test',5);
/*!40000 ALTER TABLE `o_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_document`
--

DROP TABLE IF EXISTS `o_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(45) NOT NULL COMMENT '文件名',
  `kind` varchar(255) NOT NULL COMMENT '文件类型',
  `authorization` int(11) NOT NULL COMMENT '查阅权限（全公司|部门）',
  `size` varchar(20) NOT NULL COMMENT '文件大小',
  `location` varchar(100) NOT NULL COMMENT '文件地址',
  `did` int(11) DEFAULT NULL COMMENT '部门id',
  `document_date` date NOT NULL COMMENT '创建日期',
  `uid` int(11) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_document`
--

LOCK TABLES `o_document` WRITE;
/*!40000 ALTER TABLE `o_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_file`
--

DROP TABLE IF EXISTS `o_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '档案id',
  `name` varchar(18) NOT NULL COMMENT '姓名',
  `gender` int(11) NOT NULL COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `mobile_phone` varchar(20) NOT NULL COMMENT '移动电话',
  `QQ` varchar(20) NOT NULL COMMENT '分机号',
  `birthday` date NOT NULL COMMENT '出生日期',
  `marry_status` int(11) NOT NULL COMMENT '婚姻状态',
  `native_place` varchar(45) NOT NULL COMMENT '籍贯',
  `domicile` varchar(45) NOT NULL COMMENT '户口所在地',
  `politics` int(11) NOT NULL COMMENT '政治面貌',
  `IDcard` varchar(18) NOT NULL COMMENT '身份证号',
  `health` int(11) NOT NULL COMMENT '健康状况',
  `blood_type` int(11) NOT NULL COMMENT '血型',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `graduation` varchar(45) NOT NULL COMMENT '毕业院校',
  `discipline` varchar(45) NOT NULL COMMENT '专业',
  `study_level` int(11) NOT NULL COMMENT '学历',
  `degree` int(11) NOT NULL COMMENT '学位',
  `language` int(11) NOT NULL COMMENT '语种',
  `language_level` varchar(20) NOT NULL COMMENT '外语水平',
  `certificate` varchar(255) NOT NULL COMMENT '证书',
  `file_location` varchar(45) NOT NULL COMMENT '档案所在地',
  `work_length` int(11) NOT NULL COMMENT '工作经验（时间）',
  `join_date` date NOT NULL COMMENT '入职日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_file`
--

LOCK TABLES `o_file` WRITE;
/*!40000 ALTER TABLE `o_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_function`
--

DROP TABLE IF EXISTS `o_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `name` varchar(45) NOT NULL COMMENT '功能名',
  `href` varchar(100) NOT NULL COMMENT '功能对应页面地址',
  `obey` int(11) DEFAULT NULL COMMENT '功能所属模块（功能）',
  `icon` varchar(100) DEFAULT NULL,
  `did` int(11) NOT NULL,
  `power` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_function`
--

LOCK TABLES `o_function` WRITE;
/*!40000 ALTER TABLE `o_function` DISABLE KEYS */;
INSERT INTO `o_function` VALUES (1,'首页','index',NULL,'',1100,0),(2,'消息','message',NULL,'',1100,0),(3,'工作','work',NULL,'',1100,0),(4,'联系人','friend',NULL,'',1100,0),(5,'管理页面','manage',NULL,NULL,1199,999),(6,'测试功能','test',NULL,'jics/images/msg.png',1101,1),(7,'测试功能2','t2',NULL,'jics/images/msg.png',1101,10),(8,'test3','t3',NULL,'jics/images/msg.png',1101,2),(9,'测试功能5','test5',NULL,'jics/images/msg.png',1101,4),(10,'测试功能','test',NULL,'jics/images/msg.png',1101,1),(11,'测试功能2','t2',NULL,'jics/images/msg.png',1101,10),(12,'test3','t3',NULL,'jics/images/msg.png',1101,2),(13,'测试功能5','test5',NULL,'jics/images/msg.png',1101,4),(14,'测试功能','test',NULL,'jics/images/msg.png',1101,1),(15,'测试功能2','t2',NULL,'jics/images/msg.png',1101,10),(16,'test3','t3',NULL,'jics/images/msg.png',1101,2),(17,'测试功能5','test5',NULL,'jics/images/msg.png',1101,4);
/*!40000 ALTER TABLE `o_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_job`
--

DROP TABLE IF EXISTS `o_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `name` varchar(20) NOT NULL COMMENT '职位名',
  `description` varchar(45) NOT NULL COMMENT '职位描述',
  `obey_department` int(11) NOT NULL COMMENT '所属部门（id）',
  `authorization` int(11) NOT NULL COMMENT '权限等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_job`
--

LOCK TABLES `o_job` WRITE;
/*!40000 ALTER TABLE `o_job` DISABLE KEYS */;
INSERT INTO `o_job` VALUES (1,'c艹软件工程师','软件工程师',1101,9);
/*!40000 ALTER TABLE `o_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_kind`
--

DROP TABLE IF EXISTS `o_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` int(4) NOT NULL COMMENT '类别名（4位数字）',
  `description` varchar(45) NOT NULL COMMENT '类别描述（对应含义）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_kind`
--

LOCK TABLES `o_kind` WRITE;
/*!40000 ALTER TABLE `o_kind` DISABLE KEYS */;
INSERT INTO `o_kind` VALUES (1,1001,'新闻'),(2,1002,'公告'),(3,101,'是'),(4,102,'否'),(5,1101,'技术部'),(6,1100,'公司');
/*!40000 ALTER TABLE `o_kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_message`
--

DROP TABLE IF EXISTS `o_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `title` varchar(100) NOT NULL COMMENT '消息标题',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `sender` int(11) NOT NULL COMMENT '消息发送人',
  `date` date NOT NULL COMMENT '发送日期',
  `is_read` int(11) NOT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_message`
--

LOCK TABLES `o_message` WRITE;
/*!40000 ALTER TABLE `o_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_mission`
--

DROP TABLE IF EXISTS `o_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `name` varchar(20) NOT NULL COMMENT '任务名',
  `description` varchar(45) NOT NULL COMMENT '任务描述',
  `executor` int(11) NOT NULL COMMENT '执行人员',
  `publisher` int(11) NOT NULL COMMENT '发布人员',
  `start_date` date NOT NULL COMMENT '任务开始日期',
  `end_date` date NOT NULL COMMENT '任务结束日期',
  `is_end` int(11) NOT NULL COMMENT '任务是否完成',
  `is_overdate` int(11) NOT NULL COMMENT '是否过期作废',
  `is_delay` int(11) NOT NULL COMMENT '是否延迟完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_mission`
--

LOCK TABLES `o_mission` WRITE;
/*!40000 ALTER TABLE `o_mission` DISABLE KEYS */;
INSERT INTO `o_mission` VALUES (1,'开车','今日开车',1,1,'2016-04-04','2016-04-19',102,102,102);
/*!40000 ALTER TABLE `o_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_phonebook`
--

DROP TABLE IF EXISTS `o_phonebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_phonebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '归属用户id',
  `cid` int(11) NOT NULL COMMENT '联系人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_phonebook`
--

LOCK TABLES `o_phonebook` WRITE;
/*!40000 ALTER TABLE `o_phonebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_phonebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_process`
--

DROP TABLE IF EXISTS `o_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请类别id',
  `name` varchar(20) NOT NULL COMMENT '申请类别名',
  `description` varchar(255) NOT NULL COMMENT '申请类别描述',
  `obey_department` int(11) NOT NULL COMMENT '所属部门',
  `approve_level` int(11) NOT NULL COMMENT '申请级别（一级|二级）',
  `approve_one` int(11) NOT NULL COMMENT '一级审批人职位',
  `approve_two` int(11) NOT NULL COMMENT '二级审批人职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_process`
--

LOCK TABLES `o_process` WRITE;
/*!40000 ALTER TABLE `o_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_quickuse`
--

DROP TABLE IF EXISTS `o_quickuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_quickuse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快捷方式id',
  `fid` int(11) NOT NULL COMMENT '对应功能id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_quickuse`
--

LOCK TABLES `o_quickuse` WRITE;
/*!40000 ALTER TABLE `o_quickuse` DISABLE KEYS */;
INSERT INTO `o_quickuse` VALUES (88,6,1),(89,8,1),(90,9,1),(91,10,1),(92,12,1),(93,13,1),(94,14,1),(95,16,1),(96,17,1);
/*!40000 ALTER TABLE `o_quickuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_user`
--

DROP TABLE IF EXISTS `o_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(18) NOT NULL COMMENT '用户名',
  `pwd` varchar(32) NOT NULL COMMENT '用户密码',
  `name` varchar(45) DEFAULT NULL COMMENT '用户姓名',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '分机号',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `status` varchar(45) DEFAULT NULL COMMENT '状态（类似个人签名）',
  `head` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `job` int(11) DEFAULT NULL COMMENT '职位',
  `department` int(11) DEFAULT NULL COMMENT '所属部门',
  `position_status` varchar(45) DEFAULT NULL COMMENT '在职状态',
  `gender` int(11) DEFAULT NULL,
  `o_usercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_user`
--

LOCK TABLES `o_user` WRITE;
/*!40000 ALTER TABLE `o_user` DISABLE KEYS */;
INSERT INTO `o_user` VALUES (1,'sun','202cb962ac59075b964b07152d234b70','sunxin',NULL,NULL,NULL,NULL,NULL,'jics/images/uerhead/1.png',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `o_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-19 20:22:31
