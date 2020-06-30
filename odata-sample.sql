CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a`
--

DROP TABLE IF EXISTS `a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `a` (
  `numericalorder` bigint(20) NOT NULL,
  `aname` varchar(256) NOT NULL,
  PRIMARY KEY (`numericalorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a`
--

LOCK TABLES `a` WRITE;
/*!40000 ALTER TABLE `a` DISABLE KEYS */;
INSERT INTO `a` VALUES (1,'test'),(2,'abc');
/*!40000 ALTER TABLE `a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b`
--

DROP TABLE IF EXISTS `b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `b` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`recordid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b`
--

LOCK TABLES `b` WRITE;
/*!40000 ALTER TABLE `b` DISABLE KEYS */;
INSERT INTO `b` VALUES (1,1,201),(2,2,201),(3,2,202);
/*!40000 ALTER TABLE `b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c`
--

DROP TABLE IF EXISTS `c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `c` (
  `sortid` bigint(20) NOT NULL,
  `cname` varchar(500) NOT NULL,
  PRIMARY KEY (`sortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c`
--

LOCK TABLES `c` WRITE;
/*!40000 ALTER TABLE `c` DISABLE KEYS */;
INSERT INTO `c` VALUES (201,'c-name1'),(202,'c-name2');
/*!40000 ALTER TABLE `c` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-30 13:44:00
