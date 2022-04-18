-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinema
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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Том Холланд',25);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `number_of_halls` int NOT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Mori Cinema','ул. им. Землячки, 110Б',7,4.5);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_to_employee`
--

DROP TABLE IF EXISTS `cinema_to_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_to_employee` (
  `id_cinema` int NOT NULL,
  `id_employee` int NOT NULL,
  PRIMARY KEY (`id_cinema`,`id_employee`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `cinema_to_employee_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`),
  CONSTRAINT `cinema_to_employee_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_to_employee`
--

LOCK TABLES `cinema_to_employee` WRITE;
/*!40000 ALTER TABLE `cinema_to_employee` DISABLE KEYS */;
INSERT INTO `cinema_to_employee` VALUES (1,1);
/*!40000 ALTER TABLE `cinema_to_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Даниил','+79041232211','dan@mail.ru');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dubbing_actor`
--

DROP TABLE IF EXISTS `dubbing_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dubbing_actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Birthplace` varchar(100) NOT NULL,
  `Number_of_movies` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_dubbing_actor` (`first_name`),
  KEY `Number_of_movies` (`Number_of_movies`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `dubbing_actor_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dubbing_actor`
--

LOCK TABLES `dubbing_actor` WRITE;
/*!40000 ALTER TABLE `dubbing_actor` DISABLE KEYS */;
INSERT INTO `dubbing_actor` VALUES (1,'Иван Чабан','1997-08-23','Санкт-Петербург',292,1);
/*!40000 ALTER TABLE `dubbing_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dubbing_actor_to_genre`
--

DROP TABLE IF EXISTS `dubbing_actor_to_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dubbing_actor_to_genre` (
  `id_dubbing_actor` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_dubbing_actor`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `dubbing_actor_to_genre_ibfk_1` FOREIGN KEY (`id_dubbing_actor`) REFERENCES `dubbing_actor` (`id`),
  CONSTRAINT `dubbing_actor_to_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dubbing_actor_to_genre`
--

LOCK TABLES `dubbing_actor_to_genre` WRITE;
/*!40000 ALTER TABLE `dubbing_actor_to_genre` DISABLE KEYS */;
INSERT INTO `dubbing_actor_to_genre` VALUES (1,1);
/*!40000 ALTER TABLE `dubbing_actor_to_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `number_of_halls` int NOT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Николай','ул. им. Землячки, 31',1,3.5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_producer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producer` (`id_producer`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Человек-паук: Нет пути домой',1);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_to_dubbing_actor`
--

DROP TABLE IF EXISTS `film_to_dubbing_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_to_dubbing_actor` (
  `id_film` int NOT NULL,
  `id_dubbing_actor` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_dubbing_actor`),
  KEY `id_dubbing_actor` (`id_dubbing_actor`),
  CONSTRAINT `film_to_dubbing_actor_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  CONSTRAINT `film_to_dubbing_actor_ibfk_2` FOREIGN KEY (`id_dubbing_actor`) REFERENCES `dubbing_actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_to_dubbing_actor`
--

LOCK TABLES `film_to_dubbing_actor` WRITE;
/*!40000 ALTER TABLE `film_to_dubbing_actor` DISABLE KEYS */;
INSERT INTO `film_to_dubbing_actor` VALUES (1,1);
/*!40000 ALTER TABLE `film_to_dubbing_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`id`) REFERENCES `film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Фантастика');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Джон Уоттс',40);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` int NOT NULL DEFAULT '5',
  `comment` varchar(10000) NOT NULL,
  `id_film` int NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `review_chk_1` CHECK (((`grade` > 0) and (`grade` < 10)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,8,'За прошедшие двадцать лет, с того момента, как на экранах стали появляться фильмы про Человека-паука, наверно у каждого зрителя был свой любимый исполнитель указанной роли. \nДля кого-то им был Тоби Магуайр, для кого-то перезапущенный “Удивительный Человек-паук” и именно Эндрю Гарфилд, да и нынешний Том Холланд уже уверенно собрал немалую фанатскую базу вокруг себя.\n А что же на счёт злодеев всей киновселенной Человека-паука? За прошедшую серию фильмов их было достаточно, и наверняка у каждого зрителя найдётся именно тот антагонист, что впечатлил именно его.\n А как вам идея того, что нынешний Марвел полностью слетит с катушек, и объединит это всё в одном фильме? Вот и мне подобное казалось нереальным ещё каких-то пару или тройку лет назад. \n Но постепенно по мере производства “Нет пути домой” стали вырисовываться крайне интригующие детали будущего фильма, которые из разряда слухов перешли в разряд фактов, \n и по идее, должны были подарить зрителю один из самых амбициозных фильмов про Человека-паука.\nСюжет “Нет пути домой” стартует сразу же после событий предыдущего фильма, в финале которого, буквально весь мир благодаря Мистерио узнал о том, что Человеком-пауком является Питер Паркер. \nС этого момент жизнь Питера и близких ему друзей меняется просто кардинально. Их везде преследуют репортёры, любознательные зеваки, безумные фанаты, и даже ненавистники. \nВсё в буквальном смысле рушится, а в полицейский участок Питер с друзьями ходит чуть-ли не как на учёбу. Возжелав прекратить это всё, \nПаркер идёт за помощью к своему соратнику по Мстителям - Доктору Стрэйнджу, который даже соглашается помочь в проблеме молодого человека. \nТолько в дальнейшем это решение окажется слишком легкомысленным, не только для Питера, но и конечно же для самого Стрэйнджа, ведь они оба открывают двери в мультивселенную... \nГоворя немного выше о том, что “Нет пути домой” является амбициозным проектом, я немного слукавил, так как на деле, это самый стандартный кинокомикс от Марвел и Дисней. \nДа, он по-своему масштабный, где-то даже захватывающий, и явно лучше совершенно позорных “Капитана Марвел” или “Чёрной вдовы”. \nХотя, по правде сказать, он лучше очень многих сольников в киновселенной. И тем не менее, после всей этой масштабной и помпезной рекламной компании, которая сулила нечто невероятное, \nкартина постепенно приземляет тебя с небес на землю, и ты понимаешь, что завязка в общем-то немного хромает, \nа сюжет не может предложить даже вменяемого объяснения некоторых событий и поступков главных героев, что просто выступают обычным двигателем. \nНо в то же время, фильм, как и раньше, наполнен добротным экшеном, сражениями с основными противниками Человека-паука, которые ещё и вернулись в буквальном смысле из далёкого прошлого.\nНостальгия безусловно является очень сильной вещью, и конкретно здесь создатели надавили на неё на всё 156 процентов, местами вернув меня в начало нулевых. \nДа, персонажей очень много, и далеко не все из них получили столько экранного времени, сколько хотелось бы, \nно за два с половиной часа создатели постарались уделить им максимально доступное количество хронометража картины. \nИ самое главное состоит в том, что они смогли по новой закончить историю каждого из так называемых “визитёров”,\n словно бы этакое исправление ошибок прошлого для каждого из задействованных персонажей. Хорошо это, или плохо, судить наверно каждому зрителю, \n но лично я одобряю подобный подход, ведь иной финал для каждого из них мы уже видели. “Нет пути домой” безусловно является важным винтиком для нынешней фазы киновселенной Марвел,\n и по сути открывает для Дисней и её киноподразделения просто невероятные просторы для использования в буквальном смысле всей интеллектуальной собственности её',1,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_film` int NOT NULL,
  `id_actor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Питер Паркер',1,1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hall's_number` int NOT NULL,
  `time_and_date` datetime NOT NULL,
  `id_cinema` int NOT NULL,
  `id_film` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cinema` (`id_cinema`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`),
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,1,'2021-12-16 16:30:00',1,1);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `place` int NOT NULL,
  `id_session` int NOT NULL,
  `id_employee` int NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_session` (`id_session`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,6,1,1,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-13 21:41:51
