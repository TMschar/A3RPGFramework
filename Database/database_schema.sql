-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gw_existence_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(17) NOT NULL,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ranks` text NOT NULL,
  `money` text NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '0',
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `body_stats` text NOT NULL,
  `playtime` text NOT NULL,
  `experience` text NOT NULL,
  `licenses` text NOT NULL,
  `jail_time` int(10) NOT NULL DEFAULT '0',
  `jail` text NOT NULL,
  `admin_rank` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `playerid_UNIQUE` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deaths`
--

DROP TABLE IF EXISTS `deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(17) NOT NULL,
  `physical_inventory` text NOT NULL,
  `virtual_inventory` text NOT NULL,
  `cash` int(100) NOT NULL,
  `killer_playerid` varchar(17) NOT NULL,
  `killer_weapon` varchar(17) NOT NULL,
  `killer_distance` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_box`
--

DROP TABLE IF EXISTS `deposit_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(17) NOT NULL,
  `reason` varchar(64) NOT NULL DEFAULT 'N/A',
  `amount` int(64) NOT NULL DEFAULT '0',
  `case_url` text NOT NULL,
  `deposit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deposit_box_id_uindex` (`id`),
  KEY `deposit_box_players_playerid_fk` (`player_id`),
  CONSTRAINT `deposit_box_players_playerid_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_tag` varchar(45) NOT NULL,
  `org_ownerid` varchar(17) NOT NULL,
  `org_name` varchar(45) NOT NULL,
  `org_datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `org_lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `org_bank` int(64) NOT NULL DEFAULT '0',
  `org_points` int(64) NOT NULL DEFAULT '0',
  `org_members` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_ownerid_UNIQUE` (`org_ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` varchar(15) NOT NULL,
  `property_type` tinyint(1) NOT NULL,
  `property_classname` varchar(45) NOT NULL,
  `property_owner` varchar(45) NOT NULL,
  `property_location` varchar(64) NOT NULL,
  `property_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `container_count` int(11) NOT NULL DEFAULT '0',
  `container_equipment` text NOT NULL,
  `container_virtualitems` text NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_price` int(100) NOT NULL,
  `world` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `property_id_UNIQUE` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(17) NOT NULL,
  `vehicleid` varchar(15) NOT NULL,
  `vehicletype` varchar(20) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `playerside` varchar(20) NOT NULL,
  `textureid` varchar(256) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicleid_UNIQUE` (`vehicleid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warrants`
--

DROP TABLE IF EXISTS `warrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(17) NOT NULL,
  `crime_id` int(11) NOT NULL,
  `insert_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `warrants_id_uindex` (`id`),
  KEY `warrants_players_playerid_fk` (`player_id`),
  CONSTRAINT `warrants_players_playerid_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'gw_existence_db'
--

--
-- Dumping routines for database 'gw_existence_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `GW_Arma_ResetAliveStates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GW_Arma_ResetAliveStates`()
BEGIN

	UPDATE players SET alive = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GW_Arma_ResetVehicleStates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GW_Arma_ResetVehicleStates`()
BEGIN

	UPDATE vehicles SET active = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-06  3:03:38
