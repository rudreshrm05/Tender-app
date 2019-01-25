-- MySQL dump 10.13  Distrib 5.5.16, for Win64 (x86)
--
-- Host: localhost    Database: tender
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid` (
  `bid_id` varchar(8) NOT NULL,
  `tender_id` varchar(6) DEFAULT NULL,
  `bidder_id` varchar(8) DEFAULT NULL,
  `bid_amount` int(11) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `bidder_id` (`bidder_id`),
  KEY `tender_id` (`tender_id`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`bidder_id`) REFERENCES `bidder` (`bidder_id`) ON DELETE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`tender_id`) REFERENCES `tender` (`tender_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger count_bids after insert on bid for each row
begin
update num_bids set count=count+1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bidder`
--

DROP TABLE IF EXISTS `bidder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidder` (
  `bidder_id` varchar(8) NOT NULL,
  `bidder_name` varchar(20) DEFAULT NULL,
  `bidder_phone` varchar(12) DEFAULT NULL,
  `bidder_email` varchar(30) DEFAULT NULL,
  `bidder_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bidder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidder`
--

LOCK TABLES `bidder` WRITE;
/*!40000 ALTER TABLE `bidder` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `done_deals`
--

DROP TABLE IF EXISTS `done_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `done_deals` (
  `deal_id` varchar(8) NOT NULL,
  `tender_id` varchar(6) DEFAULT NULL,
  `bid_id` varchar(8) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`deal_id`),
  KEY `tender_id` (`tender_id`),
  KEY `bid_id` (`bid_id`),
  CONSTRAINT `done_deals_ibfk_1` FOREIGN KEY (`tender_id`) REFERENCES `tender` (`tender_id`) ON DELETE CASCADE,
  CONSTRAINT `done_deals_ibfk_2` FOREIGN KEY (`bid_id`) REFERENCES `bid` (`bid_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `done_deals`
--

LOCK TABLES `done_deals` WRITE;
/*!40000 ALTER TABLE `done_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `done_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `num_bids`
--

DROP TABLE IF EXISTS `num_bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `num_bids` (
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `num_bids`
--

LOCK TABLES `num_bids` WRITE;
/*!40000 ALTER TABLE `num_bids` DISABLE KEYS */;
INSERT INTO `num_bids` VALUES (0);
/*!40000 ALTER TABLE `num_bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tender`
--

DROP TABLE IF EXISTS `tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tender` (
  `tender_id` varchar(6) NOT NULL,
  `tenderer_id` varchar(6) DEFAULT NULL,
  `tender_name` varchar(20) DEFAULT NULL,
  `tender_field` varchar(20) DEFAULT NULL,
  `tender_description` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tender_id`),
  KEY `tenderer_id` (`tenderer_id`),
  CONSTRAINT `tender_ibfk_1` FOREIGN KEY (`tenderer_id`) REFERENCES `tenderer` (`tenderer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tender`
--

LOCK TABLES `tender` WRITE;
/*!40000 ALTER TABLE `tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenderer`
--

DROP TABLE IF EXISTS `tenderer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenderer` (
  `tenderer_id` varchar(8) NOT NULL,
  `tenderer_name` varchar(20) DEFAULT NULL,
  `tenderer_phone` varchar(12) DEFAULT NULL,
  `tenderer_email` varchar(40) DEFAULT NULL,
  `tenderer_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tenderer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenderer`
--

LOCK TABLES `tenderer` WRITE;
/*!40000 ALTER TABLE `tenderer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenderer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-17 15:11:08
