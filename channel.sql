-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: channel
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `advertising`
--

DROP TABLE IF EXISTS `advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertising` (
  `id_advertising` int NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) NOT NULL,
  `duration` time NOT NULL,
  `profit` int NOT NULL,
  PRIMARY KEY (`id_advertising`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising`
--

LOCK TABLES `advertising` WRITE;
/*!40000 ALTER TABLE `advertising` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast` (
  `id_broadcast` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `year_of_creation` date NOT NULL,
  PRIMARY KEY (`id_broadcast`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `broadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcast_to_genre`
--

DROP TABLE IF EXISTS `broadcast_to_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_to_genre` (
  `id_broadcast` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_broadcast`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `broadcast_to_genre_ibfk_1` FOREIGN KEY (`id_broadcast`) REFERENCES `broadcast` (`id_broadcast`),
  CONSTRAINT `broadcast_to_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast_to_genre`
--

LOCK TABLES `broadcast_to_genre` WRITE;
/*!40000 ALTER TABLE `broadcast_to_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `broadcast_to_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `resolution` varchar(10) NOT NULL,
  `integrated_memory` int NOT NULL,
  `shooting_speed` varchar(50) NOT NULL,
  `id_equipment` int NOT NULL,
  KEY `id_equipment` (`id_equipment`),
  CONSTRAINT `camera_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id_equipment` int NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leading`
--

DROP TABLE IF EXISTS `leading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leading` (
  `id_leading` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `salary` int NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id_leading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leading`
--

LOCK TABLES `leading` WRITE;
/*!40000 ALTER TABLE `leading` DISABLE KEYS */;
/*!40000 ALTER TABLE `leading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light`
--

DROP TABLE IF EXISTS `light`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `light` (
  `type` varchar(100) NOT NULL,
  `id_equipment` int NOT NULL,
  KEY `id_equipment` (`id_equipment`),
  CONSTRAINT `light_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light`
--

LOCK TABLES `light` WRITE;
/*!40000 ALTER TABLE `light` DISABLE KEYS */;
/*!40000 ALTER TABLE `light` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microphone`
--

DROP TABLE IF EXISTS `microphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microphone` (
  `frequency` int NOT NULL,
  `noise_level` int NOT NULL,
  `type` varchar(100) NOT NULL,
  `id_equipment` int NOT NULL,
  KEY `id_equipment` (`id_equipment`),
  CONSTRAINT `microphone_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microphone`
--

LOCK TABLES `microphone` WRITE;
/*!40000 ALTER TABLE `microphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `microphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator` (
  `id_operator` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `salary` int NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id_operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator`
--

LOCK TABLES `operator` WRITE;
/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id_producer` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `salary` int NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id_producer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release` (
  `idrelease` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `theme` varchar(100) NOT NULL,
  `id_producer` int NOT NULL,
  `id_broadcast` int NOT NULL,
  PRIMARY KEY (`idrelease`),
  KEY `id_producer` (`id_producer`),
  KEY `id_broadcast` (`id_broadcast`),
  CONSTRAINT `release_ibfk_1` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id_producer`),
  CONSTRAINT `release_ibfk_2` FOREIGN KEY (`id_broadcast`) REFERENCES `broadcast` (`id_broadcast`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release`
--

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
/*!40000 ALTER TABLE `release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_advertising`
--

DROP TABLE IF EXISTS `release_to_advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_advertising` (
  `id_advertising` int NOT NULL,
  `id_release` int NOT NULL,
  PRIMARY KEY (`id_advertising`,`id_release`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `release_to_advertising_ibfk_1` FOREIGN KEY (`id_advertising`) REFERENCES `advertising` (`id_advertising`),
  CONSTRAINT `release_to_advertising_ibfk_2` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_advertising`
--

LOCK TABLES `release_to_advertising` WRITE;
/*!40000 ALTER TABLE `release_to_advertising` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_to_advertising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_equipment`
--

DROP TABLE IF EXISTS `release_to_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_equipment` (
  `id_equipment` int NOT NULL,
  `id_release` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id_equipment`,`id_release`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `release_to_equipment_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`),
  CONSTRAINT `release_to_equipment_ibfk_2` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_equipment`
--

LOCK TABLES `release_to_equipment` WRITE;
/*!40000 ALTER TABLE `release_to_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_to_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_leading`
--

DROP TABLE IF EXISTS `release_to_leading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_leading` (
  `id_leading` int NOT NULL,
  `id_release` int NOT NULL,
  PRIMARY KEY (`id_leading`,`id_release`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `release_to_leading_ibfk_1` FOREIGN KEY (`id_leading`) REFERENCES `leading` (`id_leading`),
  CONSTRAINT `release_to_leading_ibfk_2` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_leading`
--

LOCK TABLES `release_to_leading` WRITE;
/*!40000 ALTER TABLE `release_to_leading` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_to_leading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_operator`
--

DROP TABLE IF EXISTS `release_to_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_operator` (
  `id_operator` int NOT NULL,
  `id_release` int NOT NULL,
  PRIMARY KEY (`id_operator`,`id_release`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `release_to_operator_ibfk_1` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`),
  CONSTRAINT `release_to_operator_ibfk_2` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_operator`
--

LOCK TABLES `release_to_operator` WRITE;
/*!40000 ALTER TABLE `release_to_operator` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_to_operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_user`
--

DROP TABLE IF EXISTS `release_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_user` (
  `id_user` int NOT NULL,
  `id_release` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_release`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `release_to_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `release_to_user_ibfk_2` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_user`
--

LOCK TABLES `release_to_user` WRITE;
/*!40000 ALTER TABLE `release_to_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_to_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id_schedule` int NOT NULL AUTO_INCREMENT,
  `broadcast_time` time NOT NULL,
  `broadcast_date` date NOT NULL,
  `id_release` int NOT NULL,
  PRIMARY KEY (`id_schedule`),
  KEY `id_release` (`id_release`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 16:58:16
