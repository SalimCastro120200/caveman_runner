CREATE DATABASE  IF NOT EXISTS `caveman_runner_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `caveman_runner_db`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: caveman_runner_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `tb_character`
--

DROP TABLE IF EXISTS `tb_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_character` (
  `id_character` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `character` varchar(45) NOT NULL,
  PRIMARY KEY (`id_character`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `character_UNIQUE` (`character`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_character`
--

LOCK TABLES `tb_character` WRITE;
/*!40000 ALTER TABLE `tb_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_game`
--

DROP TABLE IF EXISTS `tb_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_game` (
  `id_game` int unsigned NOT NULL AUTO_INCREMENT,
  `score` int unsigned NOT NULL DEFAULT '1',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `coins` int NOT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table contains data of game played.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_game`
--

LOCK TABLES `tb_game` WRITE;
/*!40000 ALTER TABLE `tb_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_player`
--

DROP TABLE IF EXISTS `tb_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_player` (
  `id_player` int unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `birthday` date NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`id_player`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='This table contains data of player.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_player`
--

LOCK TABLES `tb_player` WRITE;
/*!40000 ALTER TABLE `tb_player` DISABLE KEYS */;
INSERT INTO `tb_player` VALUES (1,'Clemen','Salim','Castro','2000-09-09','2022-10-23 00:00:00',22),(2,'Wicho','Luis','Gómez','2001-08-28','2022-10-23 00:00:00',21),(3,'Quintero','Felipe','Paredes','2001-06-03','2022-10-23 00:00:00',21);
/*!40000 ALTER TABLE `tb_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_highscore`
--

DROP TABLE IF EXISTS `tbr_highscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_highscore` (
  `game` int unsigned NOT NULL,
  `player` int unsigned NOT NULL,
  `ranking` int NOT NULL,
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`game`,`player`),
  KEY `fkp1_idx` (`player`),
  CONSTRAINT `fkg1` FOREIGN KEY (`game`) REFERENCES `tb_game` (`id_game`),
  CONSTRAINT `fkp1` FOREIGN KEY (`player`) REFERENCES `tb_player` (`id_player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relation between player and game; show best score from game.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_highscore`
--

LOCK TABLES `tbr_highscore` WRITE;
/*!40000 ALTER TABLE `tbr_highscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_highscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_player_character`
--

DROP TABLE IF EXISTS `tbr_player_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_player_character` (
  `player` int unsigned NOT NULL,
  `character` int unsigned NOT NULL,
  `total` int unsigned DEFAULT NULL,
  PRIMARY KEY (`player`,`character`),
  KEY `fkch_1_idx` (`character`),
  CONSTRAINT `fkch_1` FOREIGN KEY (`character`) REFERENCES `tb_character` (`id_character`),
  CONSTRAINT `fkp_2` FOREIGN KEY (`player`) REFERENCES `tb_player` (`id_player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_player_character`
--

LOCK TABLES `tbr_player_character` WRITE;
/*!40000 ALTER TABLE `tbr_player_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_player_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'caveman_runner_db'
--
/*!50003 DROP FUNCTION IF EXISTS `edad_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad_usuario`(u_edad DATE) RETURNS int
    DETERMINISTIC
BEGIN

RETURN FLOOR(DATEDIFF(now(),u_edad)/365.25);
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

-- Dump completed on 2022-10-23 21:02:54
