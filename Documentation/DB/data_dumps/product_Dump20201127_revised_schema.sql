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
-- Dumping data for table `ACTIVITYS`
--

LOCK TABLES `ACTIVITYS` WRITE;
/*!40000 ALTER TABLE `ACTIVITYS` DISABLE KEYS */;
INSERT INTO `ACTIVITYS` VALUES (1,4,'출발','2020-11-24 19:32:42','2020-11-24 19:32:42','',7,'신헌수','url',0,NULL);
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
INSERT INTO `ATTENDANCES` VALUES (1,1,1),(2,2,1),(2,3,0),(3,6,0),(3,7,1),(4,6,1),(5,6,1);
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
  `AUTHOR` varchar(20) DEFAULT NULL,
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
-- Table structure for table `COMMENTS_JOB`
--

DROP TABLE IF EXISTS `COMMENTS_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENTS_JOB` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `JOB_ID` int(11) unsigned DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENTS_JOB_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`ID`),
  CONSTRAINT `COMMENTS_JOB_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_JOB`
--

LOCK TABLES `COMMENTS_JOB` WRITE;
/*!40000 ALTER TABLE `COMMENTS_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTS_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTS_TASK`
--

DROP TABLE IF EXISTS `COMMENTS_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENTS_TASK` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) unsigned DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(20) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASK_ID` (`TASK_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENTS_TASK_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  CONSTRAINT `COMMENTS_TASK_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_TASK`
--

LOCK TABLES `COMMENTS_TASK` WRITE;
/*!40000 ALTER TABLE `COMMENTS_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTS_TASK` ENABLE KEYS */;
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
  `AUTHOR` varchar(20) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NOTICE_ID` (`NOTICE_ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  CONSTRAINT `COMMENT_NOTICES_ibfk_1` FOREIGN KEY (`NOTICE_ID`) REFERENCES `NOTICES` (`ID`),
  CONSTRAINT `COMMENT_NOTICES_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENT_NOTICES`
--

LOCK TABLES `COMMENT_NOTICES` WRITE;
/*!40000 ALTER TABLE `COMMENT_NOTICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENT_NOTICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE`
--

DROP TABLE IF EXISTS `FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FILE` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SRC_TYPE` int(5) DEFAULT NULL,
  `SRC_ID` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `PATH` varchar(500) DEFAULT NULL,
  'original_NAME' varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE`
--

LOCK TABLES `FILE` WRITE;
/*!40000 ALTER TABLE `FILE` DISABLE KEYS */;
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
INSERT INTO `INVITES` VALUES (1,1,2,NULL,0,'2020-11-20 13:22:51','2020-11-20 13:22:51'),(2,2,1,NULL,0,'2020-11-23 13:19:58','2020-11-23 13:19:58'),(2,2,3,NULL,1,'2020-11-23 13:19:58','2020-11-23 16:22:20'),(2,2,4,NULL,0,'2020-11-23 13:19:58','2020-11-23 13:19:58'),(2,2,5,NULL,0,'2020-11-23 13:19:58','2020-11-23 13:19:58'),(3,7,6,NULL,1,'2020-11-24 19:35:47','2020-11-24 19:43:41'),(3,7,9,NULL,0,'2020-11-24 19:35:33','2020-11-24 19:35:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
INSERT INTO `JOBS` VALUES (1,2,'자료 조사','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-23 13:20:29','2020-11-23 13:58:45','필요한 자료조사 생성함',2,'tester 02',3,1,NULL,NULL),(2,2,'계획 세우기','2020-11-25 09:00:00','2020-11-25 09:00:00','2020-11-23 13:21:11','2020-11-23 13:21:11','조사한 자료를 토대로 계획을 세웁니다.',2,'tester 02',0,0,NULL,NULL),(3,3,'업체방문','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-24 19:30:47','2020-11-24 19:34:48','김해 업체 방문',7,'신헌수',2,1,NULL,NULL),(4,3,'원가 계산 및 분석','2020-11-25 09:00:00','2020-11-27 09:00:00','2020-11-24 19:45:59','2020-11-24 19:45:59','단위 프로젝트 원가분석 후 제안 정리',6,'정태용',0,0,NULL,NULL),(5,4,'사업제안서 초안 작성 및 조정회의','2020-11-01 09:00:00','2020-12-05 09:00:00','2020-11-25 07:38:45','2020-11-25 07:44:25','산단대개조에 참여가능한 사업기획서를 작성하고 관계 기업과 조정회의 진행',6,'정태용',2,0,NULL,NULL),(6,4,'대구시 제안 브리핑','2020-12-03 09:00:00','2020-12-03 09:00:00','2020-11-25 07:39:38','2020-11-25 07:39:38','대구시 경제부시장께 제안 브리핑',6,'정태용',0,0,NULL,NULL),(7,5,'업무협약','2020-11-25 00:00:00','2020-11-25 00:00:00','2020-11-27 00:47:00','2020-11-27 00:48:22','업무협약',6,'정태용',1,1,NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTICES`
--

LOCK TABLES `NOTICES` WRITE;
/*!40000 ALTER TABLE `NOTICES` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_JOB`
--

LOCK TABLES `POST_JOB` WRITE;
/*!40000 ALTER TABLE `POST_JOB` DISABLE KEYS */;
INSERT INTO `POST_JOB` VALUES (1,5,'',6,'정태용','       ','2020-11-25 07:44:57','2020-11-25 07:44:57','url');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_TASK`
--

LOCK TABLES `POST_TASK` WRITE;
/*!40000 ALTER TABLE `POST_TASK` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTS`
--

LOCK TABLES `PROJECTS` WRITE;
/*!40000 ALTER TABLE `PROJECTS` DISABLE KEYS */;
INSERT INTO `PROJECTS` VALUES (1,'임석렬','tester 01',1,'2020-11-12 09:00:00','2020-11-20 09:00:00','안녕',0,0,'2020-11-20 13:22:51','2020-11-20 13:22:51',0),(2,'첫번째 프로젝트','tester 02',2,'2020-11-24 09:00:00','2020-11-27 09:00:00','테스트 프로젝트 1',3,1,'2020-11-23 13:19:58','2020-11-23 13:58:45',0),(3,'이지전자 제안','신헌수',7,'2020-11-24 09:00:00','2020-11-30 09:00:00','이지전자 제안프로젝트',2,1,'2020-11-24 19:30:12','2020-11-24 19:34:49',0),(4,'산단대개조 사업제안','정태용',6,'2020-11-01 09:00:00','2020-12-31 09:00:00','대구 산업단지의 디지털 전환 및 클라우드 기반 제조 빅데이터 댐 구성을 위한 대구시 정책제안 및 사업제안',2,0,'2020-11-25 07:35:40','2020-11-25 07:44:25',0),(5,'경북 빅 데이터 센터 MOU','정태용',6,'2020-11-20 00:00:00','2020-11-25 00:00:00','경북 빅데이터 센터 주관 스마트공장 활성화를 위한 MOU',1,1,'2020-11-27 00:45:13','2020-11-27 00:48:22',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASKS`
--

LOCK TABLES `TASKS` WRITE;
/*!40000 ALTER TABLE `TASKS` DISABLE KEYS */;
INSERT INTO `TASKS` VALUES (1,1,'task 1','2020-11-25 09:00:00','2020-11-26 09:00:00','2020-11-23 13:41:34','2020-11-23 13:58:25','testing task 1',2,'tester 02',0,1),(2,1,'task 2','2020-11-24 09:00:00','2020-11-26 09:00:00','2020-11-23 13:41:56','2020-11-23 13:58:45','test task 2',2,'tester 02',0,0),(3,1,'task 3','2020-11-26 09:00:00','2020-11-27 09:00:00','2020-11-23 13:42:21','2020-11-23 13:42:21','test task 3',2,'tester 02',0,0),(4,3,'회사소개자료 준비','2020-11-24 09:00:00','2020-11-24 09:00:00','2020-11-24 19:31:42','2020-11-24 19:34:48','회사소개자료 준비\r\n팜플렛, 소식지',7,'신헌수',0,1),(5,3,'진단보고서 작성','2020-11-25 09:00:00','2020-11-25 09:00:00','2020-11-24 19:32:11','2020-11-24 19:32:11','진단보고서 작성',7,'신헌수',0,0),(6,5,'사업기획서 작성을 위한 기초자료 수집','2020-11-01 09:00:00','2020-11-30 09:00:00','2020-11-25 07:42:10','2020-11-25 07:42:10','산단대개조 사업기획을 위한 기초자료 수집',6,'정태용',0,0),(7,5,'사업기획서 자체 조정회의','2020-11-01 09:00:00','2020-12-01 09:00:00','2020-11-25 07:44:25','2020-11-25 07:44:25','사업기획서 자체 조정회의를 통한 기획서 완성도 높임',6,'정태용',0,0),(8,7,'업무협약 체결','2020-11-25 00:00:00','2020-11-25 00:00:00','2020-11-27 00:48:08','2020-11-27 00:48:22','업무협약 체결',6,'정태용',0,1);
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'$2b$12$q2gJAF9L0mTX6/S.dC4JXeibZRxSug/ZwhuHmqdpUGrcGL5GETm0K','test01@test.com','tester 01','010-0000-0000','054-000-0000','test 01 company','tester 01 position','local',NULL),(2,'$2b$12$dPdwuJO42b.qozem3CKeGOl3PGqUGgjHi3zTBGpHBIwa1LRDNox9W','test02@test.com','tester 02','010-0000-0000','054-000-0000','test 02 company','tester 02 position','local',NULL),(3,'$2b$12$iz6PSY3cftS2a9UCJHTY6.iJKivLz7E6Rn33fPQZDh/SNxqqHSvIe','test03@test.com','tester 03','010-0000-0000','054-000-0000','test 03 company','tester 03 position','local',NULL),(4,'$2b$12$o3MStwRNUF/Po9QyxmqF0eQb0LoPDTK0cKG9aHmo3EZj84hd2MsZ6','test04@test.com','tester 04','010-0000-0000','054-000-0000','test 04 company','tester 04 position','local',NULL),(5,'$2b$12$q90/1u4fYehiH5W3IajEpOQWFsgFd8lu9b.Mg9Ci8VtCP/pNjU54O','test05@test.com','tester 05','010-0000-0000','054-000-0000','test 05 company','tester 05 position','local',NULL),(6,'$2b$12$RXoON14Cf6rxy/fb73K4U.dXzr.Tmeu5XZI6uLqvXb5ifaM6WUQGG','jty@nexabg.com','정태용','010-3817-2627','053-657-7233','(주)넥사','대표','local',NULL),(7,'$2b$12$rj63aUWJZpPHQdv1Nqu2FO/cKBrE4S9fjWj84wTrwzleaGaVKBNiC','shs@nexabg.com','신헌수','010-0000-0000','054-000-0000','(주)넥사','수석','local',NULL),(8,'$2b$12$4sSdZWTmlv49NtgGYLmHkutMEceRXtA.V2j9KlXAA8JrY1Fgun3Rq','sgh@nexabg.com','사공현','010-0000-0000','054-000-0000','(주)넥사','팀장','local',NULL),(9,'$2b$12$YaJnpCBnZAN/iaPBdP2ztOvZOKRKTw2WjdeG5alCnxtnS1x4U7Mea','lwj@nexabg.com','이화진','010-0000-0000','054-000-0000','(주)넥사','팀장','local',NULL),(10,'$2b$12$J6s2JWlZroMRIaxxVh.MzeUD94C25Gn7oEF4zC1fUtUw4QF0w93TS','jsa@nexabg.com','정선애','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL),(11,'$2b$12$Tt0eyaINsbmMVRvWuKN7OuQ9HfnmqiE2DKYSm5VmxO/aendOaJoEq','khm@nexabg.com','김혜미','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL),(12,'$2b$12$c.sUxhB8CmCj2hg0ox.LL.pGdmeYxAN2DiwO6w2oeot4fGnH8JBxO','csw@nexabg.com','최수완','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL),(13,'$2b$12$BbVmdfl.JZgmru09lwBYc.0G04ki3QMFP9AMUVQRQlKhyd4tNRdBe','kea@nexabg.com','고은애','010-0000-0000','054-000-0000','(주)넥사','사원','local',NULL);
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

-- Dump completed on 2020-11-27 10:08:45
