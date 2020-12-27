-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pms_dev
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACTIVITYS`
--

DROP TABLE IF EXISTS `ACTIVITYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACTIVITYS` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `CONTENTS` text DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `FILES` int(5) DEFAULT 0,
  `STATUS` int(1) DEFAULT 0,
  `TAG` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASK_ID` (`TASK_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `ACTIVITYS_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  CONSTRAINT `ACTIVITYS_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITYS`
--

LOCK TABLES `ACTIVITYS` WRITE;
/*!40000 ALTER TABLE `ACTIVITYS` DISABLE KEYS */;
INSERT INTO `ACTIVITYS` VALUES (1,4,'출발','2020-11-24 19:32:42','2020-11-24 19:32:42','',7,'신헌수',0,0,NULL),(2,2,'file upload test','2020-11-28 20:57:01','2020-11-28 20:57:01','upload file test',2,'tester 02',0,0,NULL),(3,9,'제안서초안','2020-12-01 08:12:21','2020-12-01 08:12:21','제안서초안',7,'신헌수',0,0,NULL),(4,6,'제안자료 초안','2020-12-04 12:08:10','2020-12-04 12:08:10','제안자료 초안',6,'정태용',0,0,NULL),(5,6,'자료수집 분석을 위한 회의진행','2020-12-04 12:09:25','2020-12-04 12:09:25','회의',6,'정태용',0,0,NULL),(6,11,'마케팅 전략수립을 위한 정책자료 수집','2020-12-22 11:37:34','2020-12-22 11:37:34','마케팅 전략수립용 정책자료 수집(산단대개조)',17,'정태용',0,0,NULL),(7,12,'일정계획표 작성','2020-12-25 09:58:00','2020-12-25 09:58:00','추진 오너가 일정계획표 작성하여 협의함',17,'정태용',0,0,NULL);
/*!40000 ALTER TABLE `ACTIVITYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTENDANCES`
--

DROP TABLE IF EXISTS `ATTENDANCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTENDANCES` (
  `PROJECT_ID` int(11) unsigned NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ISPM` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `ATTENDANCES_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `ATTENDANCES_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTENDANCES`
--

LOCK TABLES `ATTENDANCES` WRITE;
/*!40000 ALTER TABLE `ATTENDANCES` DISABLE KEYS */;
INSERT INTO `ATTENDANCES` VALUES (1,1,1),(2,1,0),(2,2,1),(2,3,0),(3,6,0),(3,7,1),(4,6,1),(5,6,1),(6,17,1),(7,10,1),(7,17,0);
/*!40000 ALTER TABLE `ATTENDANCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTS_ACTIVITY`
--

DROP TABLE IF EXISTS `COMMENTS_ACTIVITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENTS_ACTIVITY` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVITY_ID` int(11) unsigned DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACTIVITY_ID` (`ACTIVITY_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENTS_ACTIVITY_ibfk_1` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `ACTIVITYS` (`ID`),
  CONSTRAINT `COMMENTS_ACTIVITY_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_ACTIVITY`
--

LOCK TABLES `COMMENTS_ACTIVITY` WRITE;
/*!40000 ALTER TABLE `COMMENTS_ACTIVITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTS_ACTIVITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTS_JOB_POST`
--

DROP TABLE IF EXISTS `COMMENTS_JOB_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENTS_JOB_POST` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `POST_ID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `POST_ID` (`POST_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENTS_JOB_POST_ibfk_1` FOREIGN KEY (`POST_ID`) REFERENCES `POST_JOB` (`ID`),
  CONSTRAINT `COMMENTS_JOB_POST_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_JOB_POST`
--

LOCK TABLES `COMMENTS_JOB_POST` WRITE;
/*!40000 ALTER TABLE `COMMENTS_JOB_POST` DISABLE KEYS */;
INSERT INTO `COMMENTS_JOB_POST` VALUES (1,1,'hello','2020-12-24 17:13:19','2020-12-24 17:13:19',3);
/*!40000 ALTER TABLE `COMMENTS_JOB_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTS_TASK_POST`
--

DROP TABLE IF EXISTS `COMMENTS_TASK_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENTS_TASK_POST` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) unsigned DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `POST_ID` (`POST_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENTS_TASK_ibfk_1` FOREIGN KEY (`POST_ID`) REFERENCES `POST_TASKS` (`ID`),
  CONSTRAINT `COMMENTS_TASK_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_TASK_POST`
--

LOCK TABLES `COMMENTS_TASK_POST` WRITE;
/*!40000 ALTER TABLE `COMMENTS_TASK_POST` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTS_TASK_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENT_NOTICES`
--

DROP TABLE IF EXISTS `COMMENT_NOTICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENT_NOTICES` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NOTICE_ID` int(11) unsigned DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NOTICE_ID` (`NOTICE_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENT_NOTICES_ibfk_1` FOREIGN KEY (`NOTICE_ID`) REFERENCES `NOTICES` (`ID`),
  CONSTRAINT `COMMENT_NOTICES_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENT_NOTICES`
--

LOCK TABLES `COMMENT_NOTICES` WRITE;
/*!40000 ALTER TABLE `COMMENT_NOTICES` DISABLE KEYS */;
INSERT INTO `COMMENT_NOTICES` VALUES (1,3,1,'hello','2020-12-09 15:16:04','2020-12-09 15:16:04'),(2,2,2,'hello test','2020-12-09 15:16:49','2020-12-09 15:16:49'),(3,2,1,'hello','2020-12-09 15:21:43','2020-12-09 15:21:43'),(4,1,1,'comment test','2020-12-09 15:23:01','2020-12-09 15:23:01'),(5,2,1,'안녕하세요','2020-12-10 16:24:22','2020-12-10 16:24:22');
/*!40000 ALTER TABLE `COMMENT_NOTICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE`
--

DROP TABLE IF EXISTS `FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SRC_TYPE` int(11) DEFAULT NULL,
  `SRC_ID` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `PATH` varchar(500) DEFAULT NULL,
  `original_NAME` varchar(100) DEFAULT NULL,
  `server_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE`
--

LOCK TABLES `FILE` WRITE;
/*!40000 ALTER TABLE `FILE` DISABLE KEYS */;
INSERT INTO `FILE` VALUES (1,1,3,'2020-11-28 20:56:02','2020-11-28 20:56:02',NULL,'uploads/test file-post job1606564561917.png','test file-post job.png','test file-post job1606564561917.png'),(2,2,1,'2020-11-28 20:56:31','2020-11-28 20:56:31',NULL,'uploads/test file-post activity1606564591077.png','test file-post activity.png','test file-post activity1606564591077.png'),(3,2,2,'2020-11-28 20:57:01','2020-11-28 20:57:01',NULL,'uploads/test file-post activity1606564621407.png','test file-post activity.png','test file-post activity1606564621407.png'),(4,2,2,'2020-11-28 20:57:01','2020-11-28 20:57:01',NULL,'uploads/test file1606564621634.png','test file.png','test file1606564621634.png'),(5,0,1,'2020-11-28 20:57:29','2020-11-28 20:57:29',NULL,'uploads/test file-notice1606564649658.png','test file-notice.png','test file-notice1606564649658.png'),(6,2,3,'2020-12-01 08:12:21','2020-12-01 08:12:21',NULL,'uploads/이지전자_ 스마트공장 구축 제안서(201130)_rev.11606777941122.pdf','이지전자_ 스마트공장 구축 제안서(201130)_rev.1.pdf','이지전자_ 스마트공장 구축 제안서(201130)_rev.11606777941122.pdf'),(7,0,2,'2020-12-03 19:12:42','2020-12-03 19:12:42',NULL,'uploads/2020년 힐링프로그램1606990353231.pdf','2020년 힐링프로그램.pdf','2020년 힐링프로그램1606990353231.pdf'),(8,0,2,'2020-12-03 19:12:42','2020-12-03 19:12:42',NULL,'uploads/사용자 인증에 대해서1606990362671.pages','사용자 인증에 대해서.pages','사용자 인증에 대해서1606990362671.pages'),(9,0,2,'2020-12-03 19:12:42','2020-12-03 19:12:42',NULL,'uploads/test file1606990362691.png','test file.png','test file1606990362691.png'),(10,2,4,'2020-12-04 12:08:10','2020-12-04 12:08:10',NULL,'uploads/클라우드기반제조빅데이터댐구축_design_v1.61607051289724.pptx','클라우드기반제조빅데이터댐구축_design_v1.6.pptx','클라우드기반제조빅데이터댐구축_design_v1.61607051289724.pptx'),(11,2,5,'2020-12-04 12:09:25','2020-12-04 12:09:25',NULL,'uploads/★0825_산단대개조PPT_대개조사업세부내역포함-1607051365328.pdf','★0825_산단대개조PPT_대개조사업세부내역포함-.pdf','★0825_산단대개조PPT_대개조사업세부내역포함-1607051365328.pdf'),(12,0,3,'2020-12-09 15:15:52','2020-12-09 15:15:52',NULL,'uploads/common1607494552592.jpeg','common.jpeg','common1607494552592.jpeg'),(13,3,6,'2020-12-22 11:37:34','2020-12-22 11:37:34',NULL,'uploads/클라우드기반제조빅데이터댐구축(1120) - NEXA1608604654151.pptx','클라우드기반제조빅데이터댐구축(1120) - NEXA.pptx','클라우드기반제조빅데이터댐구축(1120) - NEXA1608604654151.pptx');
/*!40000 ALTER TABLE `FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVITES`
--

DROP TABLE IF EXISTS `INVITES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVITES` (
  `PROJECT_ID` int(11) NOT NULL,
  `SEND_USER_ID` int(11) NOT NULL,
  `RECV_USER_ID` int(11) NOT NULL,
  `ISPM` tinyint(1) DEFAULT NULL,
  `STATUS` int(1) DEFAULT 0,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`,`SEND_USER_ID`,`RECV_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVITES`
--

LOCK TABLES `INVITES` WRITE;
/*!40000 ALTER TABLE `INVITES` DISABLE KEYS */;
INSERT INTO `INVITES` VALUES (1,1,2,NULL,0,'2020-11-20 13:22:51','2020-11-20 13:22:51'),(2,1,14,NULL,0,'2020-12-24 11:55:55','2020-12-24 11:55:55'),(2,1,15,NULL,0,'2020-12-24 11:55:55','2020-12-24 11:55:55'),(2,2,1,NULL,1,'2020-11-23 13:19:58','2020-12-09 15:20:58'),(2,2,3,NULL,1,'2020-11-23 13:19:58','2020-11-23 16:22:20'),(2,2,4,NULL,0,'2020-11-23 13:19:58','2020-11-23 13:19:58'),(2,2,5,NULL,0,'2020-11-23 13:19:58','2020-11-23 13:19:58'),(3,7,6,NULL,1,'2020-11-24 19:35:47','2020-11-24 19:43:41'),(3,7,9,NULL,0,'2020-11-24 19:35:33','2020-11-24 19:35:33'),(6,17,7,NULL,0,'2020-12-22 11:12:05','2020-12-22 11:12:05'),(6,17,9,NULL,0,'2020-12-22 11:12:05','2020-12-22 11:12:05'),(6,17,10,NULL,0,'2020-12-22 11:12:05','2020-12-22 11:12:05'),(6,17,12,NULL,0,'2020-12-22 11:12:05','2020-12-22 11:12:05'),(7,10,12,NULL,0,'2020-12-22 16:53:52','2020-12-22 16:53:52'),(7,10,17,NULL,1,'2020-12-22 16:53:52','2020-12-25 09:41:00');
/*!40000 ALTER TABLE `INVITES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOBS`
--

DROP TABLE IF EXISTS `JOBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JOBS` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(2500) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `NUM_TASKS` int(10) DEFAULT NULL,
  `NUM_DONE_TASKS` int(10) DEFAULT NULL,
  `WEIGHT` int(10) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `JOBS_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`),
  CONSTRAINT `JOBS_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
INSERT INTO `JOBS` VALUES (1,2,'자료 조사','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-23 13:20:29','2020-12-15 16:21:06','필요한 자료조사 생성함',2,'tester 02',3,3,NULL,NULL),(2,2,'계획 세우기','2020-11-25 09:00:00','2020-11-25 09:00:00','2020-11-23 13:21:11','2020-11-23 13:21:11','조사한 자료를 토대로 계획을 세웁니다.',2,'tester 02',0,0,NULL,NULL),(3,3,'업체방문','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-24 19:30:47','2020-12-01 08:12:45','김해 업체 방문',7,'신헌수',2,2,NULL,NULL),(4,3,'원가 계산 및 분석','2020-11-25 09:00:00','2020-11-27 09:00:00','2020-11-24 19:45:59','2020-11-24 19:45:59','단위 프로젝트 원가분석 후 제안 정리',6,'정태용',0,0,NULL,NULL),(5,4,'사업제안서 초안 작성 및 조정회의','2020-11-01 09:00:00','2020-12-05 09:00:00','2020-11-25 07:38:45','2020-12-04 12:13:35','산단대개조에 참여가능한 사업기획서를 작성하고 관계 기업과 조정회의 진행',6,'정태용',2,2,NULL,NULL),(6,4,'대구시 제안 브리핑','2020-12-03 09:00:00','2020-12-03 09:00:00','2020-11-25 07:39:38','2020-11-25 07:39:38','대구시 경제부시장께 제안 브리핑',6,'정태용',0,0,NULL,NULL),(7,5,'업무협약','2020-11-25 00:00:00','2020-11-25 00:00:00','2020-11-27 00:47:00','2020-11-27 00:48:22','업무협약',6,'정태용',1,1,NULL,NULL),(8,3,'제안서 작성','2020-11-30 09:00:00','2020-12-01 09:00:00','2020-12-01 08:11:08','2020-12-01 08:12:28','검사장비 제외한 제안서 작성',7,'신헌수',1,1,NULL,NULL),(9,6,'마케팅 전략수립을 위한 기초자료 수집','2020-12-21 00:00:00','2020-12-24 00:00:00','2020-12-22 11:24:07','2020-12-22 11:37:40','',17,'정태용',2,1,NULL,NULL),(10,6,'마케팅 전략수립 1차 회의','2020-12-21 00:00:00','2020-12-21 00:00:00','2020-12-22 11:25:01','2020-12-22 11:25:01','마케팅 전략수립에 대한 기본적인 컨셉 논의',17,'정태용',0,0,NULL,NULL),(11,7,'계획수립','2020-11-01 09:00:00','2020-11-20 09:00:00','2020-12-25 09:46:13','2020-12-25 09:54:12','계획수립',17,'정태용',2,0,NULL,NULL),(12,7,'추진 스케쥴 정리, 확정','2020-11-01 09:00:00','2020-11-13 09:00:00','2020-12-25 09:51:20','2020-12-25 09:51:20','일정, 참여자, 프로세스 정리 확정',17,'정태용',0,0,NULL,NULL);
/*!40000 ALTER TABLE `JOBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOG`
--

DROP TABLE IF EXISTS `LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOG` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(20) DEFAULT NULL,
  `OBJECT` varchar(100) DEFAULT NULL,
  `OBJECT_NAME` varchar(200) DEFAULT NULL,
  `ACTION` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `LOG_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG`
--

LOCK TABLES `LOG` WRITE;
/*!40000 ALTER TABLE `LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTICES`
--

DROP TABLE IF EXISTS `NOTICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTICES` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENT` text DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `FILES` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `NOTICES_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`),
  CONSTRAINT `NOTICES_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTICES`
--

LOCK TABLES `NOTICES` WRITE;
/*!40000 ALTER TABLE `NOTICES` DISABLE KEYS */;
INSERT INTO `NOTICES` VALUES (1,2,'file upload test','notice file upload',2,'tester 02','2020-11-28 20:57:29','2020-11-28 20:57:29',1),(2,2,'파일 첨부 테스트 2','파일 첨부를 테스트 합니다.',2,'tester 02','2020-12-03 19:12:42','2020-12-03 19:12:42',3),(3,1,'new notice','The claim that Eskimos have about a trillion words for snow may be a false one — actually, Eskimo languages have about as many synonyms for snasdfasdfasdfasdfasdfasdfasdfa sfadsfas1d6f4as8e64fqw5e32r1as5df3wea1fow as English does — but it remains true that the language of a culture can be fascinating and illustrative. It makes sense that Italians, whose meals typically last longer than American’s, would have a word for the ring of condensation that appears around a glass that’s been sitting on a table. \r\n\r\nThe following foreign words aren’t impossible to translate, they just describe phenomena that would take a sentence or two to describe in English. Some, like the Japanese koi no yokan, a more pragmatic version of love at first sight, are certainly worth adopting. \r\n\r\nHere are 23 words with no direct English translations:\r\n\r\nSchadenfreude\r\n\r\nLanguage: German\r\n\r\nMeaning: A feeling of enjoyment that comes from seeing or hearing about the troubles of other people\r\n\r\nLagom\r\n\r\nLanguage: Swedish\r\n\r\nMeaning: Associated with moderation, the word means not too much, not too little, but just the right amount. It typically refers to the etiquette of taking your share. \r\n\r\nMencomot\r\n\r\nLanguage: Indonesian\r\n\r\nMeaning: Stealing things of small value, mostly for fun rather than out of necessity.\r\n\r\nHygge\r\n\r\nLanguage: Danish\r\n\r\nMeaning: The act of relaxing with loved ones and good friends, usually while enjoying food and drink; the word is associated with coziness. \r\n\r\nperfect family\r\n\r\nShouganai\r\n\r\nLanguage: Japanese\r\n\r\nMeaning: Connected to the idea of fate, this word means that something can’t be helped, so why worry about it? \r\n\r\nFargin\r\n\r\nLanguage: Yiddish\r\n\r\nMeaning: To wholeheartedly appreciate the successes of others.\r\n\r\nSaudade\r\n\r\nLanguage: Portuguese\r\n\r\nMeaning: Melancholic longing or nostalgia for a person, place or thing that is far away from you.\r\n\r\nKomorebi\r\n\r\nLanguage: Japanese\r\n\r\nMeaning: The interplay between light and leaves when sunlight shines through trees.\r\n\r\nsequoias\r\n\r\nLitost\r\n\r\nLanguage: Czech\r\n\r\nMeaning: A feeling that synthesizes grief, sympathy, remorse and longing.\r\n\r\nHan\r\n\r\nLanguage: Korean\r\n\r\nMeaning: A collective feeling of oppression and isolation. As Los Angeles Times put it in 2011, “it’s as amorphous a notion as love or hate: intensely personal, yet carried around collectively, a national torch, a badge of suffering tempered by a sense of resiliency.”\r\n\r\nTampo\r\n\r\nLanguage: Filipino \r\n\r\nMeaning: Withdrawing affection from a person when one’s feelings have been hurt.\r\n\r\nCulaccino\r\n\r\nLanguage: Italian\r\n\r\nMeaning: The stain left on a table from a cold glass of water.\r\n\r\nwater\r\n\r\nPena ajenafffffffffasdfasdf\r\n\r\nLanguage: Spanish\r\n\r\nMeaning: The feeling of being embarrassed for another person.\r\n\r\nWaldeinsamkeit\r\n\r\nLanguage: German\r\n\r\nMeaning: The feeling experienced while alone in the woods, connecting with nature.\r\nasdfasdfasdfasdfasdf\r\nPsithurismasdf asdfasdf asdf asdfas \r\n\r\nLanguage: Greek\r\n\r\nMeaning: The sound of leaves rustling in the wind.\r\n\r\nSubscribe to The Morning Email.\r\nWake up to the day\'s most important news.\r\naddress@email.com\r\nKoi No Yokan\r\n\r\nLanguage: Japanese\r\n\r\nMeaning: The feeling upon meeting someone that falling in love with him or her is inevitable. \r\n\r\nflirt\r\n\r\nadsfasdf\r\n\r\n\r\nlion photo',1,'tester 01','2020-12-09 15:15:52','2020-12-09 15:15:52',1);
/*!40000 ALTER TABLE `NOTICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST_JOB`
--

DROP TABLE IF EXISTS `POST_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST_JOB` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `JOB_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `CONTENT` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `FILES` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `POST_JOB_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`ID`),
  CONSTRAINT `POST_JOB_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_JOB`
--

LOCK TABLES `POST_JOB` WRITE;
/*!40000 ALTER TABLE `POST_JOB` DISABLE KEYS */;
INSERT INTO `POST_JOB` VALUES (1,5,'',6,'정태용','       ','2020-11-25 07:44:57','2020-11-25 07:44:57',0),(2,1,'post job test',2,'tester 02','no file upload       ','2020-11-28 20:54:19','2020-11-28 20:54:19',0),(3,1,'file upload test',2,'tester 02','upload single file       ','2020-11-28 20:56:02','2020-11-28 20:56:02',1);
/*!40000 ALTER TABLE `POST_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST_TASK`
--

DROP TABLE IF EXISTS `POST_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST_TASK` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `CONTENT` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `FILES` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `TASK_ID` (`TASK_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `POST_TASK_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  CONSTRAINT `POST_TASK_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_TASK`
--

LOCK TABLES `POST_TASK` WRITE;
/*!40000 ALTER TABLE `POST_TASK` DISABLE KEYS */;
INSERT INTO `POST_TASK` VALUES (1,2,'file upload test',2,'tester 02','upload file test       ','2020-11-28 20:56:31','2020-11-28 20:56:31',0);
/*!40000 ALTER TABLE `POST_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECTS`
--

DROP TABLE IF EXISTS `PROJECTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECTS` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `CREATOR` varchar(30) DEFAULT NULL,
  `CREATOR_ID` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(2500) DEFAULT NULL,
  `NUM_TASKS` int(10) DEFAULT NULL,
  `NUM_DONE_TASKS` int(10) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATUS` (`STATUS`),
  KEY `CREATOR_ID` (`CREATOR_ID`),
  CONSTRAINT `PROJECTS_ibfk_1` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`),
  CONSTRAINT `PROJECTS_ibfk_2` FOREIGN KEY (`CREATOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTS`
--

LOCK TABLES `PROJECTS` WRITE;
/*!40000 ALTER TABLE `PROJECTS` DISABLE KEYS */;
INSERT INTO `PROJECTS` VALUES (1,'임석렬','tester 01',1,'2020-11-12 09:00:00','2020-11-20 09:00:00','안녕',0,0,'2020-11-20 13:22:51','2020-11-20 13:22:51',0),(2,'첫 프로젝트 테스트','tester 02',2,'2020-11-24 09:00:00','2020-12-12 09:00:00','테스트 프로젝트 1',3,3,'2020-11-23 13:19:58','2020-12-15 16:21:06',0),(3,'이지전자 제안','신헌수',7,'2020-11-24 09:00:00','2020-11-30 09:00:00','이지전자 제안프로젝트',3,3,'2020-11-24 19:30:12','2020-12-01 08:12:45',0),(4,'산단대개조 사업제안','정태용',6,'2020-11-01 09:00:00','2020-12-31 09:00:00','대구 산업단지의 디지털 전환 및 클라우드 기반 제조 빅데이터 댐 구성을 위한 대구시 정책제안 및 사업제안',2,2,'2020-11-25 07:35:40','2020-12-04 12:13:35',0),(5,'경북 빅 데이터 센터 MOU','정태용',6,'2020-11-20 00:00:00','2020-11-25 00:00:00','경북 빅데이터 센터 주관 스마트공장 활성화를 위한 MOU',1,1,'2020-11-27 00:45:13','2020-11-27 00:48:22',0),(6,'2021년 마케팅 전략수립','정태용',17,'2020-12-21 09:00:00','2021-01-25 09:00:00','2021년도 넥사의 전반적인 마케팅 전략수립을 위한 프로젝트',2,1,'2020-12-22 11:12:05','2020-12-22 11:37:40',0),(7,'넥사 홈페이지 제작','정선애',10,'2020-12-01 09:00:00','2021-02-28 09:00:00','스마트공장/경영컨설팅 홈페이지 제작',2,0,'2020-12-22 16:53:52','2020-12-25 09:54:12',0);
/*!40000 ALTER TABLE `PROJECTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUS_INFO`
--

DROP TABLE IF EXISTS `STATUS_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATUS_INFO` (
  `STATUS` int(1) NOT NULL,
  `DESCRIPTION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUS_INFO`
--

LOCK TABLES `STATUS_INFO` WRITE;
/*!40000 ALTER TABLE `STATUS_INFO` DISABLE KEYS */;
INSERT INTO `STATUS_INFO` VALUES (-2,'CANCELED'),(-1,'DELAYED'),(0,'ONGOING'),(1,'COMPLETED');
/*!40000 ALTER TABLE `STATUS_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASKS`
--

DROP TABLE IF EXISTS `TASKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASKS` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `JOB_ID` int(11) unsigned DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(2500) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `WEIGHT` int(10) DEFAULT NULL,
  `STATUS` int(1) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `TASKS_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`ID`),
  CONSTRAINT `TASKS_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASKS`
--

LOCK TABLES `TASKS` WRITE;
/*!40000 ALTER TABLE `TASKS` DISABLE KEYS */;
INSERT INTO `TASKS` VALUES (1,1,'task 1','2020-11-25 09:00:00','2020-11-26 09:00:00','2020-11-23 13:41:34','2020-11-23 13:58:25','testing task 1',2,'tester 02',0,1),(2,1,'task 2','2020-11-24 09:00:00','2020-11-26 09:00:00','2020-11-23 13:41:56','2020-12-15 16:21:06','test task 2',2,'tester 02',0,1),(3,1,'task 3','2020-11-26 09:00:00','2020-11-27 09:00:00','2020-11-23 13:42:21','2020-12-01 09:15:50','test task 3',2,'tester 02',0,1),(4,3,'회사소개자료 준비','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-24 19:31:42','2020-11-24 19:34:48','회사소개자료 준비\r\n팜플렛, 소식지',7,'신헌수',0,1),(5,3,'진단보고서 작성','2020-11-25 09:00:00','2020-11-25 09:00:00','2020-11-24 19:32:11','2020-12-01 08:12:45','진단보고서 작성',7,'신헌수',0,1),(6,5,'사업기획서 작성을 위한 기초자료 수집','2020-11-01 09:00:00','2020-11-30 09:00:00','2020-11-25 07:42:10','2020-12-04 12:08:34','산단대개조 사업기획을 위한 기초자료 수집',6,'정태용',0,1),(7,5,'사업기획서 자체 조정회의','2020-11-01 09:00:00','2020-12-01 09:00:00','2020-11-25 07:44:25','2020-12-04 12:13:35','사업기획서 자체 조정회의를 통한 기획서 완성도 높임',6,'정태용',0,1),(8,7,'업무협약 체결','2020-11-25 00:00:00','2020-11-25 00:00:00','2020-11-27 00:48:08','2020-11-27 00:48:22','업무협약 체결',6,'정태용',0,1),(9,8,'제안서 초안','2020-12-01 09:00:00','2020-12-01 09:00:00','2020-12-01 08:11:51','2020-12-01 08:12:28','제안서 초안',7,'신헌수',0,1),(10,9,'마케팅 전략수립을 위한 홍보자료정리','2020-12-21 00:00:00','2020-12-24 00:00:00','2020-12-22 11:33:53','2020-12-22 11:33:53','',17,'정태용',0,0),(11,9,'마케팅 전략수립을 위한 정책자료 정리','2020-12-21 00:00:00','2020-12-24 00:00:00','2020-12-22 11:35:49','2020-12-22 11:37:40','',17,'정태용',0,1),(12,11,'추진마스터 플랜수립','2020-11-01 09:00:00','2020-11-13 09:00:00','2020-12-25 09:52:48','2020-12-25 09:52:48','일정 역할 순서',17,'정태용',0,0),(13,11,'기초자료수집','2020-11-15 09:00:00','2020-11-30 09:00:00','2020-12-25 09:54:12','2020-12-25 09:54:12','과거 자료, 개발업체, 벤치마킹',17,'정태용',0,0);
/*!40000 ALTER TABLE `TASKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(512) DEFAULT NULL,
  `EMAIL` varchar(80) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PHONENUMBER` varchar(50) DEFAULT NULL,
  `COMPANYNUMBER` varchar(50) DEFAULT NULL,
  `COMPANY` varchar(50) DEFAULT NULL,
  `POSITION` varchar(50) DEFAULT NULL,
  `PROVIDER` varchar(20) DEFAULT 'local',
  `SNSID` varchar(30) DEFAULT NULL,
  `prof_img_url` varchar(200) NOT NULL DEFAULT '../../assets/img/default_prof.png',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'$2b$12$q2gJAF9L0mTX6/S.dC4JXeibZRxSug/ZwhuHmqdpUGrcGL5GETm0K','test01@test.com','tester 01','010-0000-0000','054-000-0000','test 01 company','tester 01 position','local',NULL,'/assets/img/prof/profile_image_user1.jpeg'),(2,'$2b$12$dPdwuJO42b.qozem3CKeGOl3PGqUGgjHi3zTBGpHBIwa1LRDNox9W','test02@test.com','tester 02','010-0000-0000','054-000-0000','test 02 company','tester 02 position','local',NULL,'/assets/img/default_prof.png'),(3,'$2b$12$iz6PSY3cftS2a9UCJHTY6.iJKivLz7E6Rn33fPQZDh/SNxqqHSvIe','test03@test.com','tester 03','010-0000-0000','054-000-0000','test 03 company','tester 03 position','local',NULL,'/assets/img/default_prof.png'),(4,'$2b$12$o3MStwRNUF/Po9QyxmqF0eQb0LoPDTK0cKG9aHmo3EZj84hd2MsZ6','test04@test.com','tester 04','010-0000-0000','054-000-0000','test 04 company','tester 04 position','local',NULL,'/assets/img/default_prof.png'),(5,'$2b$12$q90/1u4fYehiH5W3IajEpOQWFsgFd8lu9b.Mg9Ci8VtCP/pNjU54O','test05@test.com','tester 05','010-0000-0000','054-000-0000','test 05 company','tester 05 position','local',NULL,'/assets/img/default_prof.png'),(6,'$2b$12$RXoON14Cf6rxy/fb73K4U.dXzr.Tmeu5XZI6uLqvXb5ifaM6WUQGG','jty@nexabg.com','정태용','010-3817-2627','053-657-7233','(주)넥사','대표','local',NULL,'/assets/img/default_prof.png'),(7,'$2b$12$rj63aUWJZpPHQdv1Nqu2FO/cKBrE4S9fjWj84wTrwzleaGaVKBNiC','shs@nexabg.com','신헌수','010-0000-0000','054-000-0000','(주)넥사','수석','local',NULL,'/assets/img/default_prof.png'),(8,'$2b$12$4sSdZWTmlv49NtgGYLmHkutMEceRXtA.V2j9KlXAA8JrY1Fgun3Rq','sgh@nexabg.com','사공현','010-0000-0000','054-000-0000','(주)넥사','팀장','local',NULL,'/assets/img/default_prof.png'),(9,'$2b$12$YaJnpCBnZAN/iaPBdP2ztOvZOKRKTw2WjdeG5alCnxtnS1x4U7Mea','lwj@nexabg.com','이화진','010-0000-0000','054-000-0000','(주)넥사','팀장','local',NULL,'/assets/img/default_prof.png'),(10,'$2b$12$J6s2JWlZroMRIaxxVh.MzeUD94C25Gn7oEF4zC1fUtUw4QF0w93TS','jsa@nexabg.com','정선애','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL,'/assets/img/default_prof.png'),(11,'$2b$12$Tt0eyaINsbmMVRvWuKN7OuQ9HfnmqiE2DKYSm5VmxO/aendOaJoEq','khm@nexabg.com','김혜미','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL,'/assets/img/default_prof.png'),(12,'$2b$12$c.sUxhB8CmCj2hg0ox.LL.pGdmeYxAN2DiwO6w2oeot4fGnH8JBxO','csw@nexabg.com','최수완','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL,'/assets/img/default_prof.png'),(13,'$2b$12$BbVmdfl.JZgmru09lwBYc.0G04ki3QMFP9AMUVQRQlKhyd4tNRdBe','kea@nexabg.com','고은애','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL,'/assets/img/default_prof.png'),(14,NULL,'srlim1121@gmail.com','Ryan Kim','010-7021-3780','09-62-3148','kakao inc.','CTO','kakao','1466923498','/assets/img/default_prof.png'),(15,NULL,'kkklim1121@naver.com','Naver Lim','010-2716-7710','024-652-9844','Naver','CTO','naver','25786077','/assets/img/default_prof.png'),(16,NULL,'nv_tkwjsrjatn1@naver.com','adfadf','asf','asf','adfa','adf','naver','173768404','/assets/img/default_prof.png'),(17,NULL,'ceo@nexabg.com','정태용','01038172627','0536577233','(주)넥사','대표이사','kakao','1551140719','/assets/img/default_prof.png');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-28  2:40:08
