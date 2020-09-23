CREATE DATABASE  IF NOT EXISTS `pms_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pms_dev`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: pms_dev
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVITYS` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TASK_ID` int unsigned DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASK_ID` (`TASK_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `activitys_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  CONSTRAINT `activitys_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `activitys_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITYS`
--

LOCK TABLES `ACTIVITYS` WRITE;
/*!40000 ALTER TABLE `ACTIVITYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTENDANCES`
--

DROP TABLE IF EXISTS `ATTENDANCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTENDANCES` (
  `PROJECT_ID` int unsigned NOT NULL,
  `USER_ID` int NOT NULL,
  `ISPM` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTENDANCES`
--

LOCK TABLES `ATTENDANCES` WRITE;
/*!40000 ALTER TABLE `ATTENDANCES` DISABLE KEYS */;
INSERT INTO `ATTENDANCES` VALUES (1,1,1),(2,1,1),(3,1,1),(5,1,1),(6,1,1);
/*!40000 ALTER TABLE `ATTENDANCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENT_NOTICES`
--

DROP TABLE IF EXISTS `COMMENT_NOTICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENT_NOTICES` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `NOTICE_ID` int unsigned DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NOTICE_ID` (`NOTICE_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `comment_notices_ibfk_1` FOREIGN KEY (`NOTICE_ID`) REFERENCES `NOTICES` (`ID`),
  CONSTRAINT `comment_notices_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `comment_notices_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENT_NOTICES`
--

LOCK TABLES `COMMENT_NOTICES` WRITE;
/*!40000 ALTER TABLE `COMMENT_NOTICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENT_NOTICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENTS_ACTIVITY`
--

DROP TABLE IF EXISTS `COMMENTS_ACTIVITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENTS_ACTIVITY` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVITY_ID` int unsigned DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACTIVITY_ID` (`ACTIVITY_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `comments_activity_ibfk_1` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `ACTIVITYS` (`ID`),
  CONSTRAINT `comments_activity_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `comments_activity_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENTS_JOB` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `JOB_ID` int unsigned DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `comments_job_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`ID`),
  CONSTRAINT `comments_job_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `comments_job_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENTS_TASK` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TASK_ID` int unsigned DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASK_ID` (`TASK_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `comments_task_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  CONSTRAINT `comments_task_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `comments_task_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENTS_TASK`
--

LOCK TABLES `COMMENTS_TASK` WRITE;
/*!40000 ALTER TABLE `COMMENTS_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMENTS_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE`
--

DROP TABLE IF EXISTS `FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FILE` (
  `TYPE` char(1) DEFAULT NULL,
  `SRC` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVITES` (
  `PROJECT_ID` int NOT NULL,
  `SEND_USER_ID` int NOT NULL,
  `RECV_USER_ID` int NOT NULL,
  `ISPM` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`,`SEND_USER_ID`,`RECV_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVITES`
--

LOCK TABLES `INVITES` WRITE;
/*!40000 ALTER TABLE `INVITES` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVITES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOBS`
--

DROP TABLE IF EXISTS `JOBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOBS` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int unsigned DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `NUM_TASKS` int DEFAULT NULL,
  `NUM_DONE_TASKS` int DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`),
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JOBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTICES`
--

DROP TABLE IF EXISTS `NOTICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTICES` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int unsigned DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` varchar(512) DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECTS` (`ID`),
  CONSTRAINT `notices_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `notices_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTICES`
--

LOCK TABLES `NOTICES` WRITE;
/*!40000 ALTER TABLE `NOTICES` DISABLE KEYS */;
INSERT INTO `NOTICES` VALUES (1,1,'첫번째 공지사항','첫 공지사항 입니다. TEST',1,'2020-09-09 14:19:50','2020-09-09 14:19:50',NULL);
/*!40000 ALTER TABLE `NOTICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECTS`
--

DROP TABLE IF EXISTS `PROJECTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECTS` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `CREATOR` varchar(30) DEFAULT NULL,
  `CREATOR_ID` int DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `END` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `NUM_TASKS` int DEFAULT NULL,
  `NUM_DONE_TASKS` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATUS` (`STATUS`),
  KEY `CREATOR_ID` (`CREATOR_ID`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`CREATOR_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTS`
--

LOCK TABLES `PROJECTS` WRITE;
/*!40000 ALTER TABLE `PROJECTS` DISABLE KEYS */;
INSERT INTO `PROJECTS` VALUES (1,'initial proj','정택용',1,'2020-09-02 00:00:00','2020-09-23 00:00:00','이게 뭐여',0,0,'2020-09-09 02:12:41','2020-09-09 02:12:41',-2),(2,'테스트 프로젝트2','john watson',1,'2020-09-01 09:00:00','2020-09-29 09:00:00','이게 뭐여2',0,0,'2020-09-09 11:39:25','2020-09-09 11:39:25',0),(3,'테스트 프로젝트3','정택용',1,'2020-09-08 09:00:00','2020-09-30 09:00:00','이게 뭐여3',0,0,'2020-09-09 11:50:02','2020-09-09 11:50:02',0),(5,'테스트 프로젝트5','테스트',1,'2020-09-01 09:00:00','2020-09-22 09:00:00','이게 뭐여41',0,0,'2020-09-09 14:23:00','2020-09-09 14:23:00',1),(6,'테스트 프로젝트46','테스트',1,'2020-09-01 09:00:00','2020-09-30 09:00:00','이게 뭐여41',0,0,'2020-09-09 14:24:08','2020-09-09 14:24:08',1),(7,'proj 7','정택용',1,'2020-09-21 09:00:00','2021-03-04 09:00:00','Project 7 for future',0,0,'2020-09-20 14:24:08','2020-09-20 14:24:08',0);
/*!40000 ALTER TABLE `PROJECTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUS_INFO`
--

DROP TABLE IF EXISTS `STATUS_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATUS_INFO` (
  `STATUS` int NOT NULL,
  `DESCRIPTION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUS_INFO`
--

LOCK TABLES `STATUS_INFO` WRITE;
/*!40000 ALTER TABLE `STATUS_INFO` DISABLE KEYS */;
INSERT INTO `STATUS_INFO` VALUES (-2,'DELAYED'),(-1,'CALCELED'),(0,'ONGOING'),(1,'COMPLETED');
/*!40000 ALTER TABLE `STATUS_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASKS`
--

DROP TABLE IF EXISTS `TASKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TASKS` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `JOB_ID` int unsigned DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `WRITER` int DEFAULT NULL,
  `WEIGHT` int DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `WRITER` (`WRITER`),
  KEY `STATUS` (`STATUS`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`ID`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`WRITER`) REFERENCES `USERS` (`ID`),
  CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `STATUS_INFO` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASKS`
--

LOCK TABLES `TASKS` WRITE;
/*!40000 ALTER TABLE `TASKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `ID` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,NULL,'srlim1121@gmail.com','김카오','010-4982-0994','042-341-5582','test comp.1123','부장','kakao','1466923498'),(4,'$2b$12$rNZTfFD6H/RBTKotVP/zVeI6M7eocxnJ7Zh3WMgTRPDVEQIIG1Wda','test@email.com','김철수','010-3184-5961','034-291-0592','test comp.','팀장','local',NULL),(5,NULL,'kkklim1121@naver.com','박네이버','010-3392-0050','041-972-1048','(주)roul.comp','팀장','naver','25786077');
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

-- Dump completed on 2020-09-23  9:54:02
