-- MySQL dump 10.10
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.0.19-nt

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
-- Table structure for table `group_contact`
--

DROP TABLE IF EXISTS `group_contact`;
CREATE TABLE `group_contact` (
  `group_id` bigint(20) default NULL,
  `contact_id` bigint(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_contact`
--


/*!40000 ALTER TABLE `group_contact` DISABLE KEYS */;
LOCK TABLES `group_contact` WRITE;
INSERT INTO `group_contact` VALUES (1,1),(4,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `group_contact` ENABLE KEYS */;

--
-- Table structure for table `t_contact`
--

DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact` (
  `id` bigint(20) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_contact`
--


/*!40000 ALTER TABLE `t_contact` DISABLE KEYS */;
LOCK TABLES `t_contact` WRITE;
INSERT INTO `t_contact` VALUES (1,'wang','xuwei'),(3,'wang','xuwei1'),(4,'tonny','parker'),(5,'Tracy','McGrady'),(6,'test','test1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_contact` ENABLE KEYS */;

--
-- Table structure for table `t_group`
--

DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_group`
--


/*!40000 ALTER TABLE `t_group` DISABLE KEYS */;
LOCK TABLES `t_group` WRITE;
INSERT INTO `t_group` VALUES (1,'Family'),(2,'Friends'),(3,'CoWorkers'),(4,'conLeadGen'),(5,'conPartners'),(6,'group1'),(7,'group2'),(10,'group3'),(11,'group4'),(12,'My Family');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_group` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

