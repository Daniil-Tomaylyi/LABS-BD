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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising`
--

LOCK TABLES `advertising` WRITE;
/*!40000 ALTER TABLE `advertising` DISABLE KEYS */;
INSERT INTO `advertising` VALUES (1,'Coca-cola','00:02:00',40000),(2,'Lays','00:03:00',50000),(3,'Fortnite','00:01:00',60000),(4,'Тинькофф банк','00:02:00',70000),(5,'Кинопоиск HD','00:01:00',40000),(6,'Тинькофф банк','00:02:00',30000),(7,'Milka','00:02:00',30000),(8,'Dove','00:01:30',25000),(9,'Old spice','00:03:30',45000),(10,'Rexona','00:02:00',15000);
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
  `year_of_creation` int NOT NULL,
  PRIMARY KEY (`id_broadcast`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast`
--

LOCK TABLES `broadcast` WRITE;
/*!40000 ALTER TABLE `broadcast` DISABLE KEYS */;
INSERT INTO `broadcast` VALUES (1,'Вдудь','интернет-шоу в формате интервью',2017),(2,'Вести','новостная передача',1990),(3,'Вечерний Ургант','вечернее развлекательное шоу',2012),(4,'Друзья','американский комедийный телесериал',1994),(5,'Stand up','российское юмористическое телешоу',2013),(6,'Галилео','Телевизионная познавательная программа об устройстве мира',2007),(7,'А поговорить?','Разговорное шоу, в котором ведущая Ирина Шихман берёт эксклюзивные интервью у самых неожиданных гостей',2017),(8,'Comedy Club','российское юмористическое шоу производства Comedy Club Production, выходящее на телеканале ТНТ',2005),(9,'Что было дальше?','русскоязычное юмористическое интернет-шоу, выходящее на YouTube-канале LABELCOM',2019),(10,'Comment Out','российское юмористическое Youtube-шоу на канале «Чикен Карри».',2020);
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
INSERT INTO `broadcast_to_genre` VALUES (1,1),(7,1),(2,2),(3,3),(4,4),(5,5),(8,5),(9,5),(10,5),(6,6);
/*!40000 ALTER TABLE `broadcast_to_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `id_equipment` int NOT NULL,
  `resolution` varchar(10) DEFAULT NULL,
  `integrated_memory` int NOT NULL,
  `shooting_speed` varchar(50) NOT NULL,
  PRIMARY KEY (`id_equipment`),
  CONSTRAINT `camera_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
INSERT INTO `camera` VALUES (1,'HD',16,'30 кадров/с'),(3,'Full HD',16,'50 кадров/с'),(4,'4K UHD',64,'25 кадров/с'),(7,'Full HD',16,'50 кадров/с'),(8,'Full HD',16,'30 кадров/с'),(11,'4K UHD',16,'60 кадров/с'),(12,'8K UHD',16,'30 кадров/с'),(13,'Full HD',16,'30 кадров/с'),(14,'4K UHD',16,'30 кадров/с'),(15,'Full HD',16,'30 кадров/с');
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
  `Brand` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipment`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'2020-03-03',60000,'Samsung SMX-F54'),(2,'2020-10-12',9300,'Sennheiser ME 2-US'),(3,'2017-05-17',75000,'Panasonic HC-V800'),(4,'2014-12-18',80000,'Sony FDR-AXP55 '),(5,'2017-02-13',12600,'Raylab RL-LED 176'),(6,'2020-09-05',30640,'Elgato Key Light Air'),(7,'2019-05-17',63000,'Canon LEGRIA HF G26'),(8,'2018-04-21',51000,'Blackmagic Design Pocket Cinema Camera'),(9,'2020-01-15',2250,'	Boya BY-M1'),(10,'2019-12-12',17450,'Rode LAVALIER'),(11,'2019-12-12',45000,'JVC GY-HC550E'),(12,'2018-04-21',54000,'Insta360 Pro 2 '),(13,'2020-09-05',30000,'Zoom Q8 '),(14,'2019-05-17',130000,'Sony FDR-AX700'),(15,'2018-04-21',22000,'Panasonic HC-W580'),(16,'2017-02-13',5500,'	Sennheiser ME 4-N'),(17,'2019-05-17',2810,'	MIPRO MU-53L'),(18,'2019-05-17',5695,'Rode SmartLav+'),(19,'2019-12-12',3450,'	SARAMONIC SR-LMX1+'),(20,'2017-02-13',1290,'	BOYA BY-LM20'),(21,'2019-05-17',8370,'	AKG C417PP'),(22,'2020-10-12',2120,'	Audio-Technica ATR3350'),(23,'2020-03-03',18050,' FST-006 KIT\n'),(24,'2020-10-12',6370,'Fancier PS02 fluorescent kit\n'),(25,'2018-04-21',9500,'FST ET-402 Kit'),(26,'2018-04-21',13450,'FST-001 Kit'),(27,'2019-05-17',16250,'Fotokvant FL-13 KIT'),(28,'2020-01-15',23000,'Falcon Eyes Qlbk-500'),(29,'2019-05-17',48390,'Grifon Creative SSS 1000 KIT'),(30,'2020-09-05',25000,'FST Studio Kit\n');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Интервью'),(2,'Новости'),(3,'Реалити-шоу'),(4,'Телесериал'),(5,'Ток-шоу'),(6,'Познавательный'),(7,'Мини-сериал'),(8,'Сатира'),(9,'Теленовелла'),(10,'Триллер');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leading`
--

DROP TABLE IF EXISTS `leading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leading` (
  `id_leading` int NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_leading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leading`
--

LOCK TABLES `leading` WRITE;
/*!40000 ALTER TABLE `leading` DISABLE KEYS */;
INSERT INTO `leading` VALUES (1,'Дудь Ю.А.',35,340000,'1987-10-11','8(3105)638-55-69'),(2,'Киселев Д.К.',67,220000,'1955-04-26','8(85)068-48-89'),(3,'Ургант И.А.',43,170000,'1979-04-16','8(433)800-36-50'),(5,'Белый Р.В.',42,180000,'1980-12-28','8(8667)129-52-85'),(6,'Пушной А.Б.',46,80000,'1976-03-16','8(22)219-00-90'),(7,'Шихман И.Ю.',37,120000,'1984-05-17','8(2548)554-95-82'),(8,'Воля П.А.',43,200000,'1979-03-14','8(8679)060-57-25'),(9,'Сабуров Н.А.',30,350000,'1991-12-22','8(9201)266-10-26'),(10,'Маркони В.',39,200000,'1982-12-02','8(123)910-61-56');
/*!40000 ALTER TABLE `leading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light`
--

DROP TABLE IF EXISTS `light`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `light` (
  `id_equipment` int NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipment`),
  CONSTRAINT `light_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light`
--

LOCK TABLES `light` WRITE;
/*!40000 ALTER TABLE `light` DISABLE KEYS */;
INSERT INTO `light` VALUES (5,'светодиодные лампы'),(6,'Осветитель'),(23,'лампы'),(24,'лампы'),(25,'лампы'),(26,'лампы'),(27,'лампы'),(28,'лампы'),(29,'лампы'),(30,'лампы');
/*!40000 ALTER TABLE `light` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microphone`
--

DROP TABLE IF EXISTS `microphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microphone` (
  `id_equipment` int NOT NULL,
  `frequency` int NOT NULL,
  `noise_level` int NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipment`),
  CONSTRAINT `microphone_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microphone`
--

LOCK TABLES `microphone` WRITE;
/*!40000 ALTER TABLE `microphone` DISABLE KEYS */;
INSERT INTO `microphone` VALUES (2,50,130,'петличный'),(9,65,74,'петличный'),(10,20,110,'петличный'),(16,20,110,'петличный'),(17,40,138,'петличный'),(18,20,110,'петличный'),(19,20,110,'петличный'),(20,35,74,'петличный'),(21,20,126,'петличный'),(22,50,54,'петличный');
/*!40000 ALTER TABLE `microphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator` (
  `id_operator` int NOT NULL,
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
INSERT INTO `operator` VALUES (1,'Андреев Н.Ф.',44,30000,'1978-03-25','8(95)590-94-01'),(2,'Федоров А.С.',33,40000,'1989-12-15','8(0229)508-35-30'),(3,'Николаев Н.А',43,30000,'1979-02-18','8(646)670-81-25'),(4,'Петров С.В.',33,25000,'1989-01-03','8(045)862-71-23'),(5,'Максимов В.Н.',47,60000,'1975-04-05','8(32)432-45-54'),(6,'Максимов В.А.',37,60000,'1985-04-05','8(32)442-55-44'),(7,'Никитин Н. Г.',43,45000,'1979-02-22','8(5257)379-38-16'),(8,'Максимов Д. А.',37,35000,'1985-10-25','8(876)413-64-76'),(9,'Тимофеев А. А.',35,30000,'1987-05-11','8(837)059-20-60'),(10,'Николаев И. Е.',47,45000,'1975-07-15','8(40)223-80-04');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Зверев А. М.',42,80000,'1980-03-22','8(990)818-65-96'),(2,'Киселев Е.А.',65,80000,'1957-06-15','8(990)818-65-96'),(3,'Иванов М. М.',54,120000,'1968-02-13','8(37)296-83-06'),(4,'Быков А. Д.',23,30000,'1999-11-14','8(84)974-32-32'),(5,'Новиков Р.',41,170000,'1981-04-03','8(61)580-44-07'),(6,'Прохоров К. Д.',47,70000,'1975-08-22','8(61)580-44-07'),(7,'Потапов А. Ф.',39,340000,'1983-07-22','8(55)293-85-22'),(8,'Джанибекян А.О.',46,450000,'1976-02-29','8(62)558-25-16'),(9,'Дусмухаметов В.З.',43,400000,'1978-04-27','8(414)347-07-71'),(10,'Гудков А.В.',39,300000,'1983-02-24','8(18)657-46-51');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release`
--

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
INSERT INTO `release` VALUES (1,'MORGENSHTERN – главный шоумен России-2020','Рэп',1,1),(2,'Новости','Политика',2,2),(3,'Выступление - Slawa Marlow','Музыка',3,3),(4,'Эпизод, где Моника берёт новую соседку','Юмор',4,4),(5,'Выпуск 14','Юмор',5,5),(6,'Эксперименты','Свечка',6,6),(7,'BadComedian о предложении Кате Клэп, блокировках YouTube, Чернобыле, Козловском и Пивоварове','Кино',7,7),(8,'Сезон №11 Выпуск №39','Юмор',8,8),(9,'Гарик Харламов × Мигель','Юмор',9,9),(10,'Comment Out #11','Ольга Бузова х Фёдор Смолов',10,10);
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
INSERT INTO `release_to_advertising` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
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
INSERT INTO `release_to_equipment` VALUES (1,1,20),(2,2,15),(3,3,13),(4,4,10),(5,5,11),(6,6,12),(7,7,5),(8,8,6),(9,9,5),(10,10,8);
/*!40000 ALTER TABLE `release_to_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_leading`
--

DROP TABLE IF EXISTS `release_to_leading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_leading` (
  `id_release` int NOT NULL,
  `id_leading` int NOT NULL,
  PRIMARY KEY (`id_release`,`id_leading`),
  KEY `id_leading` (`id_leading`),
  CONSTRAINT `release_to_leading_ibfk_1` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`),
  CONSTRAINT `release_to_leading_ibfk_2` FOREIGN KEY (`id_leading`) REFERENCES `leading` (`id_leading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_leading`
--

LOCK TABLES `release_to_leading` WRITE;
/*!40000 ALTER TABLE `release_to_leading` DISABLE KEYS */;
INSERT INTO `release_to_leading` VALUES (1,1),(2,2),(3,3),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `release_to_leading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_to_operator`
--

DROP TABLE IF EXISTS `release_to_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_to_operator` (
  `id_release` int NOT NULL,
  `id_operator` int NOT NULL,
  PRIMARY KEY (`id_release`,`id_operator`),
  KEY `id_operator` (`id_operator`),
  CONSTRAINT `release_to_operator_ibfk_1` FOREIGN KEY (`id_release`) REFERENCES `release` (`idrelease`),
  CONSTRAINT `release_to_operator_ibfk_2` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_to_operator`
--

LOCK TABLES `release_to_operator` WRITE;
/*!40000 ALTER TABLE `release_to_operator` DISABLE KEYS */;
INSERT INTO `release_to_operator` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
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
INSERT INTO `release_to_user` VALUES (1,1,3),(1,7,10),(2,2,5),(3,3,12),(4,4,10),(5,5,7),(5,6,10),(6,9,1),(8,8,5),(10,10,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'13:03:00','2022-02-21',1),(2,'21:00:00','2022-01-22',2),(3,'20:30:00','2022-03-13',3),(4,'15:20:00','2022-04-01',4),(5,'17:30:00','2022-06-07',5),(6,'12:30:00','2021-06-22',6),(11,'19:00:00','2021-10-10',7),(12,'21:00:00','2015-09-15',8),(13,'20:00:00','2019-04-25',9),(14,'17:00:00','2019-07-16',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Андрей','and2107r','and2107r@gmail.com',';juj78580-0','8(904)723-41-13'),(2,'Николай','nikola228','nikola228@mail.ru','yuuhj07675','8(904)212-77-83'),(3,'Александр','alex1703','alex1703@yandex.ru','yuoyhjh877yt','8(909)212-45-11'),(4,'Владимир','vladr1232','vladr1232@rambler.ru','123456789','8(904)123-43-12'),(5,'Алексей','Alex213','Alex213@gmail.com','90987jkjkjnjg','8(987)175-12-44'),(6,'Вячеслав','vyach123','vyach@gmail.com','nikqfidoskv','8(652)935-28-90'),(7,'Василий','mdamore121','mdamore@harvey.com','W5HnmZ','219(21)329-34-97'),(8,'Кирилл','margret.koss','margret.koss@hotmail.com','VsZGMa','240(718)013-06-94'),(9,'Василиса','makenzie30','makenzie30@daniel.info','ZWZdR2','26(488)200-55-03'),(10,'Ксения','breanna.hoppe','breanna.hoppe@yahoo.com','MwKTrA','28(656)965-37-22');
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

-- Dump completed on 2022-04-14  1:28:07
