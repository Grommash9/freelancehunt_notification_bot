-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dev_freelancehunt_bot
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `project_data`
--

DROP TABLE IF EXISTS `project_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_data` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_website_id` int DEFAULT NULL,
  `project_name` text NOT NULL,
  `project_description` text NOT NULL,
  `url` text NOT NULL,
  `time_added` int NOT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_data_project_id_uindex` (`project_id`),
  UNIQUE KEY `project_data_project_website_id_uindex` (`project_website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `project_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_skills` (
  `project_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `record_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `project_skills_project_id_skill_id_uindex` (`project_id`,`skill_id`),
  UNIQUE KEY `project_skills_record_id_uindex` (`record_id`),
  KEY `project_skills_skill_list_skill_id_fk` (`skill_id`),
  CONSTRAINT `project_skills_project_data_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project_data` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_skills_skill_list_skill_id_fk` FOREIGN KEY (`skill_id`) REFERENCES `skill_list` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_skills`
--

DROP TABLE IF EXISTS `skill_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_list` (
  `skill_id` int NOT NULL,
  `skill_name` text NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_list_skill_id_uindex` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_list`
--

INSERT INTO `skill_list` VALUES (1,'PHP'),(2,'C и C++'),(6,'Linux и Unix'),(7,'Windows'),(13,'Java'),(14,'Поисковое продвижение (SEO)'),(17,'Логотипы'),(18,'Обработка фото'),(22,'Python'),(23,'Ruby'),(24,'C#'),(28,'Javascript'),(37,'Перевод текстов'),(38,'Написание статей'),(39,'Администрирование систем'),(41,'Баннеры'),(42,'Дизайн интерфейсов'),(43,'Дизайн сайтов'),(45,'Сопровождение сайтов'),(56,'1C'),(57,'Тестирование и QA'),(58,'Векторная графика'),(59,'Создание 3D-моделей'),(61,'Microsoft .NET'),(62,'IP-телефония и VoIP'),(64,'Проектирование'),(65,'Защита ПО и безопасность'),(68,'Интернет-магазины и электронная коммерция'),(72,'Компьютерные сети'),(75,'Полиграфический дизайн'),(76,'Копирайтинг'),(77,'Фирменный стиль'),(78,'Установка и настройка CMS'),(79,'Английский язык'),(80,'Немецкий язык'),(82,'Итальянский язык'),(83,'Настройка ПО и серверов'),(84,'Испанский язык'),(85,'Системное программирование'),(86,'Базы данных'),(88,'Разработка игр'),(89,'Управление проектами'),(90,'Иллюстрации и рисунки'),(91,'Анимация'),(93,'Иконки и пиксельная графика'),(94,'Маркетинговые исследования'),(95,'Обучение'),(96,'Создание сайта под ключ'),(97,'Техническая документация'),(99,'Веб-программирование'),(100,'Музыка'),(101,'Обработка видео'),(102,'Обработка аудио'),(103,'Прикладное программирование'),(104,'Контент-менеджер'),(106,'Дизайн интерьеров'),(107,'Ландшафтный дизайн'),(108,'Архитектурные проекты'),(109,'Наружная реклама'),(111,'Визуализация и моделирование'),(112,'Бизнес-консультирование'),(113,'Аудио и видео монтаж'),(114,'Разработка презентаций'),(115,'Геоинформационные системы'),(116,'Рефераты, дипломы, курсовые'),(117,'Дизайн упаковки'),(120,'Разработка под iOS (iPhone и iPad)'),(121,'Разработка под Android'),(122,'Транскрибация'),(123,'Нейминг и слоганы'),(124,'HTML и CSS верстка'),(125,'Рерайтинг'),(127,'Контекстная реклама'),(129,'Интеграция платежных систем'),(131,'Продвижение в социальных сетях (SMM)'),(132,'Дизайн выставочных стендов'),(133,'Реклама в социальных медиа'),(134,'SEO-аудит сайтов'),(135,'Поисковое управление репутацией (SERM)'),(136,'E-mail маркетинг'),(138,'Публикация объявлений'),(139,'Фотосъемка'),(140,'Стихи, песни, проза'),(141,'Живопись и графика'),(142,'Рукоделие и хендмейд'),(143,'Услуги диктора'),(144,'Видеореклама'),(145,'Тизерная реклама'),(146,'Mac OS и Objective C'),(147,'Чертежи и схемы'),(148,'Инжиниринг'),(149,'Бухгалтерские услуги'),(150,'Управление клиентами и CRM'),(151,'Оформление страниц в социальных сетях'),(152,'Разработка шрифтов'),(153,'Юридические услуги'),(154,'Консалтинг'),(156,'Дизайн визиток'),(157,'Локализация ПО, сайтов и игр'),(158,'Французский язык'),(159,'Рекрутинг'),(160,'Swift'),(161,'Видеосъемка'),(162,'Продажи и генерация лидов'),(163,'Написание сценария'),(164,'Предметный дизайн'),(165,'Прототипирование'),(166,'Иврит'),(168,'Редактура и корректура текстов'),(169,'Парсинг данных'),(170,'Поиск и сбор информации'),(171,'Работа с клиентами'),(172,'Инфографика'),(173,'Go'),(174,'Node.js'),(175,'Машинное обучение'),(176,'Встраиваемые системы и микроконтроллеры'),(177,'Delphi и Object Pascal'),(178,'Обработка данных'),(179,'Дизайн мобильных приложений'),(180,'Разработка ботов'),(181,'DevOps'),(182,'Blockchain'),(183,'Гибридные мобильные приложения'),(184,'Покупка ссылок'),(185,'Upwork Python projects');

--
-- Table structure for table `upwork_project`
--

DROP TABLE IF EXISTS `upwork_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upwork_project` (
  `internal_project_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`internal_project_id`),
  UNIQUE KEY `upwork_project_internal_project_id_uindex` (`internal_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upwork_project`
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL,
  `user_api_key` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_user_id_uindex` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (314921662,NULL),(322420305,NULL),(428299544,NULL),(556537490,NULL),(592197076,NULL),(999678965,NULL),(1425372698,NULL),(2120309962,NULL),(5640731453,NULL);

--
-- Table structure for table `users_skills`
--

DROP TABLE IF EXISTS `users_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_skills` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `skill_id` int NOT NULL,
  `is_interested` int NOT NULL,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `users_skills_record_id_uindex` (`record_id`),
  UNIQUE KEY `users_skills_user_id_skill_id_uindex` (`user_id`,`skill_id`),
  KEY `users_skills_skill_list_skill_id_fk` (`skill_id`),
  CONSTRAINT `users_skills_skill_list_skill_id_fk` FOREIGN KEY (`skill_id`) REFERENCES `skill_list` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_skills`
--

INSERT INTO `users_skills` VALUES (1,999678965,1,0),(2,999678965,2,0),(3,999678965,6,1),(4,999678965,7,0),(5,999678965,13,0),(6,999678965,14,0),(7,999678965,17,0),(8,999678965,18,0),(9,999678965,22,1),(10,999678965,23,0),(11,999678965,24,0),(12,999678965,28,0),(13,999678965,37,0),(14,999678965,38,0),(15,999678965,39,1),(16,999678965,41,0),(17,999678965,42,0),(18,999678965,43,0),(19,999678965,45,0),(20,999678965,56,0),(21,999678965,57,0),(22,999678965,58,0),(23,999678965,59,0),(24,999678965,61,0),(25,999678965,62,0),(26,999678965,64,0),(27,999678965,65,0),(28,999678965,68,0),(29,999678965,72,0),(30,999678965,75,0),(31,999678965,76,0),(32,999678965,77,0),(33,999678965,78,0),(34,999678965,79,0),(35,999678965,80,0),(36,999678965,82,0),(37,999678965,83,0),(38,999678965,84,0),(39,999678965,85,0),(40,999678965,86,0),(41,999678965,88,0),(42,999678965,89,0),(43,999678965,90,0),(44,999678965,91,0),(45,999678965,93,0),(46,999678965,94,0),(47,999678965,95,0),(48,999678965,96,0),(49,999678965,97,0),(50,999678965,99,0),(51,999678965,100,0),(52,999678965,101,0),(53,999678965,102,0),(54,999678965,103,0),(55,999678965,104,0),(56,999678965,106,0),(57,999678965,107,0),(58,999678965,108,0),(59,999678965,109,0),(60,999678965,111,0),(61,999678965,112,0),(62,999678965,113,0),(63,999678965,114,0),(64,999678965,115,0),(65,999678965,116,0),(66,999678965,117,0),(67,999678965,120,0),(68,999678965,121,0),(69,999678965,122,0),(70,999678965,123,0),(71,999678965,124,1),(72,999678965,125,0),(73,999678965,127,0),(74,999678965,129,0),(75,999678965,131,0),(76,999678965,132,0),(77,999678965,133,0),(78,999678965,134,0),(79,999678965,135,0),(80,999678965,136,0),(81,999678965,138,0),(82,999678965,139,0),(83,999678965,140,0),(84,999678965,141,0),(85,999678965,142,0),(86,999678965,143,0),(87,999678965,144,0),(88,999678965,145,0),(89,999678965,146,0),(90,999678965,147,0),(91,999678965,148,0),(92,999678965,149,0),(93,999678965,150,0),(94,999678965,151,0),(95,999678965,152,0),(96,999678965,153,0),(97,999678965,154,0),(98,999678965,156,0),(99,999678965,157,0),(100,999678965,158,0),(101,999678965,159,0),(102,999678965,160,0),(103,999678965,161,0),(104,999678965,162,0),(105,999678965,163,0),(106,999678965,164,0),(107,999678965,165,0),(108,999678965,166,0),(109,999678965,168,0),(110,999678965,169,1),(111,999678965,170,0),(112,999678965,171,0),(113,999678965,172,0),(114,999678965,173,0),(115,999678965,174,0),(116,999678965,175,0),(117,999678965,176,0),(118,999678965,177,0),(119,999678965,178,0),(120,999678965,179,0),(121,999678965,180,1),(122,999678965,181,0),(123,999678965,182,1),(124,999678965,183,0),(125,999678965,184,0),(126,592197076,1,0),(127,592197076,2,0),(128,592197076,6,0),(129,592197076,7,0),(130,592197076,13,0),(131,592197076,14,0),(132,592197076,17,0),(133,592197076,18,0),(134,592197076,22,1),(135,592197076,23,0),(136,592197076,24,0),(137,592197076,28,0),(138,592197076,37,0),(139,592197076,38,0),(140,592197076,39,0),(141,592197076,41,0),(142,592197076,42,0),(143,592197076,43,0),(144,592197076,45,0),(145,592197076,56,0),(146,592197076,57,0),(147,592197076,58,0),(148,592197076,59,0),(149,592197076,61,0),(150,592197076,62,0),(151,592197076,64,0),(152,592197076,65,0),(153,592197076,68,0),(154,592197076,72,0),(155,592197076,75,0),(156,592197076,76,0),(157,592197076,77,0),(158,592197076,78,0),(159,592197076,79,0),(160,592197076,80,0),(161,592197076,82,0),(162,592197076,83,0),(163,592197076,84,0),(164,592197076,85,0),(165,592197076,86,0),(166,592197076,88,0),(167,592197076,89,0),(168,592197076,90,0),(169,592197076,91,0),(170,592197076,93,0),(171,592197076,94,0),(172,592197076,95,0),(173,592197076,96,0),(174,592197076,97,0),(175,592197076,99,0),(176,592197076,100,0),(177,592197076,101,0),(178,592197076,102,0),(179,592197076,103,0),(180,592197076,104,0),(181,592197076,106,0),(182,592197076,107,0),(183,592197076,108,0),(184,592197076,109,0),(185,592197076,111,0),(186,592197076,112,0),(187,592197076,113,0),(188,592197076,114,0),(189,592197076,115,0),(190,592197076,116,0),(191,592197076,117,0),(192,592197076,120,0),(193,592197076,121,0),(194,592197076,122,0),(195,592197076,123,0),(196,592197076,124,0),(197,592197076,125,0),(198,592197076,127,0),(199,592197076,129,0),(200,592197076,131,0),(201,592197076,132,0),(202,592197076,133,0),(203,592197076,134,0),(204,592197076,135,0),(205,592197076,136,0),(206,592197076,138,0),(207,592197076,139,0),(208,592197076,140,0),(209,592197076,141,0),(210,592197076,142,0),(211,592197076,143,0),(212,592197076,144,0),(213,592197076,145,0),(214,592197076,146,0),(215,592197076,147,0),(216,592197076,148,0),(217,592197076,149,0),(218,592197076,150,0),(219,592197076,151,0),(220,592197076,152,0),(221,592197076,153,0),(222,592197076,154,0),(223,592197076,156,0),(224,592197076,157,0),(225,592197076,158,0),(226,592197076,159,0),(227,592197076,160,0),(228,592197076,161,0),(229,592197076,162,0),(230,592197076,163,0),(231,592197076,164,0),(232,592197076,165,0),(233,592197076,166,0),(234,592197076,168,0),(235,592197076,169,0),(236,592197076,170,0),(237,592197076,171,0),(238,592197076,172,0),(239,592197076,173,0),(240,592197076,174,0),(241,592197076,175,0),(242,592197076,176,0),(243,592197076,177,0),(244,592197076,178,0),(245,592197076,179,0),(246,592197076,180,0),(247,592197076,181,0),(248,592197076,182,0),(249,592197076,183,0),(250,592197076,184,0),(251,322420305,1,0),(252,322420305,2,0),(253,322420305,6,0),(254,322420305,7,0),(255,322420305,13,0),(256,322420305,14,0),(257,322420305,17,0),(258,322420305,18,0),(259,322420305,22,1),(260,322420305,23,0),(261,322420305,24,0),(262,322420305,28,0),(263,322420305,37,0),(264,322420305,38,0),(265,322420305,39,0),(266,322420305,41,0),(267,322420305,42,0),(268,322420305,43,0),(269,322420305,45,0),(270,322420305,56,0),(271,322420305,57,0),(272,322420305,58,0),(273,322420305,59,0),(274,322420305,61,0),(275,322420305,62,0),(276,322420305,64,0),(277,322420305,65,0),(278,322420305,68,0),(279,322420305,72,0),(280,322420305,75,0),(281,322420305,76,0),(282,322420305,77,0),(283,322420305,78,0),(284,322420305,79,0),(285,322420305,80,0),(286,322420305,82,0),(287,322420305,83,0),(288,322420305,84,0),(289,322420305,85,0),(290,322420305,86,0),(291,322420305,88,0),(292,322420305,89,0),(293,322420305,90,0),(294,322420305,91,0),(295,322420305,93,0),(296,322420305,94,0),(297,322420305,95,0),(298,322420305,96,0),(299,322420305,97,0),(300,322420305,99,0),(301,322420305,100,0),(302,322420305,101,0),(303,322420305,102,0),(304,322420305,103,0),(305,322420305,104,0),(306,322420305,106,0),(307,322420305,107,0),(308,322420305,108,0),(309,322420305,109,0),(310,322420305,111,0),(311,322420305,112,0),(312,322420305,113,0),(313,322420305,114,0),(314,322420305,115,0),(315,322420305,116,0),(316,322420305,117,0),(317,322420305,120,0),(318,322420305,121,0),(319,322420305,122,0),(320,322420305,123,0),(321,322420305,124,0),(322,322420305,125,0),(323,322420305,127,0),(324,322420305,129,0),(325,322420305,131,0),(326,322420305,132,0),(327,322420305,133,0),(328,322420305,134,0),(329,322420305,135,0),(330,322420305,136,0),(331,322420305,138,0),(332,322420305,139,0),(333,322420305,140,0),(334,322420305,141,0),(335,322420305,142,0),(336,322420305,143,0),(337,322420305,144,0),(338,322420305,145,0),(339,322420305,146,0),(340,322420305,147,0),(341,322420305,148,0),(342,322420305,149,0),(343,322420305,150,0),(344,322420305,151,0),(345,322420305,152,0),(346,322420305,153,0),(347,322420305,154,0),(348,322420305,156,0),(349,322420305,157,0),(350,322420305,158,0),(351,322420305,159,0),(352,322420305,160,0),(353,322420305,161,0),(354,322420305,162,0),(355,322420305,163,0),(356,322420305,164,0),(357,322420305,165,0),(358,322420305,166,0),(359,322420305,168,0),(360,322420305,169,1),(361,322420305,170,0),(362,322420305,171,0),(363,322420305,172,0),(364,322420305,173,0),(365,322420305,174,0),(366,322420305,175,0),(367,322420305,176,0),(368,322420305,177,0),(369,322420305,178,0),(370,322420305,179,0),(371,322420305,180,1),(372,322420305,181,0),(373,322420305,182,0),(374,322420305,183,0),(375,322420305,184,0),(376,314921662,1,0),(377,314921662,2,0),(378,314921662,6,0),(379,314921662,7,0),(380,314921662,13,0),(381,314921662,14,0),(382,314921662,17,0),(383,314921662,18,0),(384,314921662,22,0),(385,314921662,23,0),(386,314921662,24,0),(387,314921662,28,0),(388,314921662,37,0),(389,314921662,38,0),(390,314921662,39,0),(391,314921662,41,0),(392,314921662,42,0),(393,314921662,43,0),(394,314921662,45,0),(395,314921662,56,0),(396,314921662,57,0),(397,314921662,58,0),(398,314921662,59,0),(399,314921662,61,0),(400,314921662,62,0),(401,314921662,64,0),(402,314921662,65,0),(403,314921662,68,0),(404,314921662,72,0),(405,314921662,75,0),(406,314921662,76,0),(407,314921662,77,0),(408,314921662,78,0),(409,314921662,79,0),(410,314921662,80,0),(411,314921662,82,0),(412,314921662,83,0),(413,314921662,84,0),(414,314921662,85,0),(415,314921662,86,0),(416,314921662,88,0),(417,314921662,89,0),(418,314921662,90,0),(419,314921662,91,0),(420,314921662,93,0),(421,314921662,94,0),(422,314921662,95,0),(423,314921662,96,0),(424,314921662,97,0),(425,314921662,99,0),(426,314921662,100,0),(427,314921662,101,0),(428,314921662,102,0),(429,314921662,103,0),(430,314921662,104,0),(431,314921662,106,0),(432,314921662,107,0),(433,314921662,108,0),(434,314921662,109,0),(435,314921662,111,0),(436,314921662,112,0),(437,314921662,113,0),(438,314921662,114,0),(439,314921662,115,0),(440,314921662,116,0),(441,314921662,117,0),(442,314921662,120,0),(443,314921662,121,0),(444,314921662,122,0),(445,314921662,123,0),(446,314921662,124,1),(447,314921662,125,0),(448,314921662,127,0),(449,314921662,129,0),(450,314921662,131,0),(451,314921662,132,0),(452,314921662,133,0),(453,314921662,134,0),(454,314921662,135,0),(455,314921662,136,0),(456,314921662,138,0),(457,314921662,139,0),(458,314921662,140,0),(459,314921662,141,0),(460,314921662,142,0),(461,314921662,143,0),(462,314921662,144,0),(463,314921662,145,0),(464,314921662,146,0),(465,314921662,147,0),(466,314921662,148,0),(467,314921662,149,0),(468,314921662,150,0),(469,314921662,151,0),(470,314921662,152,0),(471,314921662,153,0),(472,314921662,154,0),(473,314921662,156,0),(474,314921662,157,0),(475,314921662,158,0),(476,314921662,159,0),(477,314921662,160,0),(478,314921662,161,0),(479,314921662,162,0),(480,314921662,163,0),(481,314921662,164,0),(482,314921662,165,0),(483,314921662,166,0),(484,314921662,168,0),(485,314921662,169,0),(486,314921662,170,0),(487,314921662,171,0),(488,314921662,172,0),(489,314921662,173,0),(490,314921662,174,0),(491,314921662,175,0),(492,314921662,176,0),(493,314921662,177,0),(494,314921662,178,0),(495,314921662,179,0),(496,314921662,180,0),(497,314921662,181,0),(498,314921662,182,0),(499,314921662,183,0),(500,314921662,184,0),(501,1425372698,1,0),(502,1425372698,2,0),(503,1425372698,6,0),(504,1425372698,7,0),(505,1425372698,13,0),(506,1425372698,14,0),(507,1425372698,17,0),(508,1425372698,18,0),(509,1425372698,22,0),(510,1425372698,23,0),(511,1425372698,24,0),(512,1425372698,28,0),(513,1425372698,37,0),(514,1425372698,38,0),(515,1425372698,39,0),(516,1425372698,41,0),(517,1425372698,42,0),(518,1425372698,43,0),(519,1425372698,45,0),(520,1425372698,56,0),(521,1425372698,57,0),(522,1425372698,58,0),(523,1425372698,59,0),(524,1425372698,61,0),(525,1425372698,62,0),(526,1425372698,64,0),(527,1425372698,65,0),(528,1425372698,68,0),(529,1425372698,72,0),(530,1425372698,75,0),(531,1425372698,76,0),(532,1425372698,77,0),(533,1425372698,78,0),(534,1425372698,79,0),(535,1425372698,80,0),(536,1425372698,82,0),(537,1425372698,83,0),(538,1425372698,84,0),(539,1425372698,85,0),(540,1425372698,86,0),(541,1425372698,88,0),(542,1425372698,89,0),(543,1425372698,90,0),(544,1425372698,91,0),(545,1425372698,93,0),(546,1425372698,94,0),(547,1425372698,95,0),(548,1425372698,96,0),(549,1425372698,97,0),(550,1425372698,99,0),(551,1425372698,100,0),(552,1425372698,101,0),(553,1425372698,102,0),(554,1425372698,103,0),(555,1425372698,104,0),(556,1425372698,106,0),(557,1425372698,107,0),(558,1425372698,108,0),(559,1425372698,109,0),(560,1425372698,111,0),(561,1425372698,112,0),(562,1425372698,113,0),(563,1425372698,114,0),(564,1425372698,115,0),(565,1425372698,116,0),(566,1425372698,117,0),(567,1425372698,120,0),(568,1425372698,121,0),(569,1425372698,122,0),(570,1425372698,123,0),(571,1425372698,124,0),(572,1425372698,125,0),(573,1425372698,127,0),(574,1425372698,129,0),(575,1425372698,131,0),(576,1425372698,132,0),(577,1425372698,133,0),(578,1425372698,134,0),(579,1425372698,135,0),(580,1425372698,136,0),(581,1425372698,138,0),(582,1425372698,139,0),(583,1425372698,140,0),(584,1425372698,141,0),(585,1425372698,142,0),(586,1425372698,143,0),(587,1425372698,144,0),(588,1425372698,145,0),(589,1425372698,146,0),(590,1425372698,147,0),(591,1425372698,148,0),(592,1425372698,149,0),(593,1425372698,150,0),(594,1425372698,151,0),(595,1425372698,152,0),(596,1425372698,153,0),(597,1425372698,154,0),(598,1425372698,156,0),(599,1425372698,157,0),(600,1425372698,158,0),(601,1425372698,159,0),(602,1425372698,160,0),(603,1425372698,161,0),(604,1425372698,162,0),(605,1425372698,163,0),(606,1425372698,164,0),(607,1425372698,165,0),(608,1425372698,166,0),(609,1425372698,168,0),(610,1425372698,169,0),(611,1425372698,170,0),(612,1425372698,171,0),(613,1425372698,172,0),(614,1425372698,173,0),(615,1425372698,174,0),(616,1425372698,175,0),(617,1425372698,176,0),(618,1425372698,177,0),(619,1425372698,178,0),(620,1425372698,179,0),(621,1425372698,180,0),(622,1425372698,181,0),(623,1425372698,182,0),(624,1425372698,183,0),(625,1425372698,184,0),(626,428299544,1,0),(627,428299544,2,0),(628,428299544,6,0),(629,428299544,7,1),(630,428299544,13,1),(631,428299544,14,0),(632,428299544,17,0),(633,428299544,18,0),(634,428299544,22,1),(635,428299544,23,0),(636,428299544,24,0),(637,428299544,28,0),(638,428299544,37,0),(639,428299544,38,0),(640,428299544,39,0),(641,428299544,41,0),(642,428299544,42,0),(643,428299544,43,0),(644,428299544,45,0),(645,428299544,56,0),(646,428299544,57,1),(647,428299544,58,0),(648,428299544,59,0),(649,428299544,61,0),(650,428299544,62,0),(651,428299544,64,0),(652,428299544,65,0),(653,428299544,68,0),(654,428299544,72,0),(655,428299544,75,0),(656,428299544,76,0),(657,428299544,77,0),(658,428299544,78,0),(659,428299544,79,0),(660,428299544,80,0),(661,428299544,82,0),(662,428299544,83,0),(663,428299544,84,0),(664,428299544,85,0),(665,428299544,86,0),(666,428299544,88,1),(667,428299544,89,1),(668,428299544,90,0),(669,428299544,91,0),(670,428299544,93,0),(671,428299544,94,0),(672,428299544,95,0),(673,428299544,96,0),(674,428299544,97,0),(675,428299544,99,1),(676,428299544,100,0),(677,428299544,101,0),(678,428299544,102,0),(679,428299544,103,0),(680,428299544,104,0),(681,428299544,106,0),(682,428299544,107,0),(683,428299544,108,0),(684,428299544,109,0),(685,428299544,111,0),(686,428299544,112,0),(687,428299544,113,0),(688,428299544,114,1),(689,428299544,115,0),(690,428299544,116,0),(691,428299544,117,0),(692,428299544,120,0),(693,428299544,121,0),(694,428299544,122,0),(695,428299544,123,0),(696,428299544,124,0),(697,428299544,125,0),(698,428299544,127,0),(699,428299544,129,0),(700,428299544,131,0),(701,428299544,132,0),(702,428299544,133,0),(703,428299544,134,0),(704,428299544,135,0),(705,428299544,136,0),(706,428299544,138,0),(707,428299544,139,0),(708,428299544,140,0),(709,428299544,141,0),(710,428299544,142,0),(711,428299544,143,0),(712,428299544,144,0),(713,428299544,145,0),(714,428299544,146,0),(715,428299544,147,0),(716,428299544,148,0),(717,428299544,149,0),(718,428299544,150,0),(719,428299544,151,0),(720,428299544,152,0),(721,428299544,153,0),(722,428299544,154,0),(723,428299544,156,0),(724,428299544,157,1),(725,428299544,158,0),(726,428299544,159,0),(727,428299544,160,0),(728,428299544,161,0),(729,428299544,162,1),(730,428299544,163,0),(731,428299544,164,0),(732,428299544,165,0),(733,428299544,166,0),(734,428299544,168,0),(735,428299544,169,0),(736,428299544,170,0),(737,428299544,171,0),(738,428299544,172,0),(739,428299544,173,0),(740,428299544,174,1),(741,428299544,175,0),(742,428299544,176,0),(743,428299544,177,0),(744,428299544,178,0),(745,428299544,179,0),(746,428299544,180,1),(747,428299544,181,0),(748,428299544,182,0),(749,428299544,183,0),(750,428299544,184,1),(751,556537490,1,0),(752,556537490,2,0),(753,556537490,6,0),(754,556537490,7,0),(755,556537490,13,0),(756,556537490,14,0),(757,556537490,17,0),(758,556537490,18,0),(759,556537490,22,1),(760,556537490,23,0),(761,556537490,24,0),(762,556537490,28,0),(763,556537490,37,0),(764,556537490,38,0),(765,556537490,39,0),(766,556537490,41,0),(767,556537490,42,0),(768,556537490,43,0),(769,556537490,45,0),(770,556537490,56,0),(771,556537490,57,0),(772,556537490,58,0),(773,556537490,59,0),(774,556537490,61,0),(775,556537490,62,0),(776,556537490,64,0),(777,556537490,65,0),(778,556537490,68,0),(779,556537490,72,0),(780,556537490,75,0),(781,556537490,76,0),(782,556537490,77,0),(783,556537490,78,0),(784,556537490,79,0),(785,556537490,80,0),(786,556537490,82,0),(787,556537490,83,0),(788,556537490,84,0),(789,556537490,85,0),(790,556537490,86,0),(791,556537490,88,0),(792,556537490,89,0),(793,556537490,90,0),(794,556537490,91,0),(795,556537490,93,0),(796,556537490,94,0),(797,556537490,95,0),(798,556537490,96,0),(799,556537490,97,0),(800,556537490,99,0),(801,556537490,100,0),(802,556537490,101,0),(803,556537490,102,0),(804,556537490,103,0),(805,556537490,104,0),(806,556537490,106,0),(807,556537490,107,0),(808,556537490,108,0),(809,556537490,109,0),(810,556537490,111,0),(811,556537490,112,0),(812,556537490,113,0),(813,556537490,114,0),(814,556537490,115,0),(815,556537490,116,0),(816,556537490,117,0),(817,556537490,120,0),(818,556537490,121,0),(819,556537490,122,0),(820,556537490,123,0),(821,556537490,124,0),(822,556537490,125,0),(823,556537490,127,0),(824,556537490,129,0),(825,556537490,131,0),(826,556537490,132,0),(827,556537490,133,0),(828,556537490,134,0),(829,556537490,135,0),(830,556537490,136,0),(831,556537490,138,0),(832,556537490,139,0),(833,556537490,140,0),(834,556537490,141,0),(835,556537490,142,0),(836,556537490,143,0),(837,556537490,144,0),(838,556537490,145,0),(839,556537490,146,0),(840,556537490,147,0),(841,556537490,148,0),(842,556537490,149,0),(843,556537490,150,0),(844,556537490,151,0),(845,556537490,152,0),(846,556537490,153,0),(847,556537490,154,0),(848,556537490,156,0),(849,556537490,157,0),(850,556537490,158,0),(851,556537490,159,0),(852,556537490,160,0),(853,556537490,161,0),(854,556537490,162,0),(855,556537490,163,0),(856,556537490,164,0),(857,556537490,165,0),(858,556537490,166,0),(859,556537490,168,0),(860,556537490,169,0),(861,556537490,170,0),(862,556537490,171,0),(863,556537490,172,0),(864,556537490,173,0),(865,556537490,174,0),(866,556537490,175,0),(867,556537490,176,0),(868,556537490,177,0),(869,556537490,178,0),(870,556537490,179,0),(871,556537490,180,1),(872,556537490,181,0),(873,556537490,182,0),(874,556537490,183,0),(875,556537490,184,0),(876,2120309962,1,0),(877,2120309962,2,0),(878,2120309962,6,0),(879,2120309962,7,0),(880,2120309962,13,0),(881,2120309962,14,0),(882,2120309962,17,0),(883,2120309962,18,0),(884,2120309962,22,0),(885,2120309962,23,1),(886,2120309962,24,0),(887,2120309962,28,0),(888,2120309962,37,0),(889,2120309962,38,0),(890,2120309962,39,0),(891,2120309962,41,0),(892,2120309962,42,0),(893,2120309962,43,0),(894,2120309962,45,0),(895,2120309962,56,0),(896,2120309962,57,0),(897,2120309962,58,0),(898,2120309962,59,0),(899,2120309962,61,0),(900,2120309962,62,0),(901,2120309962,64,0),(902,2120309962,65,0),(903,2120309962,68,0),(904,2120309962,72,0),(905,2120309962,75,0),(906,2120309962,76,0),(907,2120309962,77,0),(908,2120309962,78,0),(909,2120309962,79,0),(910,2120309962,80,0),(911,2120309962,82,0),(912,2120309962,83,0),(913,2120309962,84,0),(914,2120309962,85,0),(915,2120309962,86,0),(916,2120309962,88,0),(917,2120309962,89,0),(918,2120309962,90,0),(919,2120309962,91,0),(920,2120309962,93,0),(921,2120309962,94,0),(922,2120309962,95,0),(923,2120309962,96,0),(924,2120309962,97,0),(925,2120309962,99,0),(926,2120309962,100,0),(927,2120309962,101,0),(928,2120309962,102,0),(929,2120309962,103,0),(930,2120309962,104,0),(931,2120309962,106,0),(932,2120309962,107,0),(933,2120309962,108,0),(934,2120309962,109,0),(935,2120309962,111,0),(936,2120309962,112,0),(937,2120309962,113,0),(938,2120309962,114,0),(939,2120309962,115,0),(940,2120309962,116,0),(941,2120309962,117,0),(942,2120309962,120,0),(943,2120309962,121,0),(944,2120309962,122,0),(945,2120309962,123,0),(946,2120309962,124,0),(947,2120309962,125,0),(948,2120309962,127,0),(949,2120309962,129,0),(950,2120309962,131,0),(951,2120309962,132,0),(952,2120309962,133,0),(953,2120309962,134,0),(954,2120309962,135,0),(955,2120309962,136,0),(956,2120309962,138,0),(957,2120309962,139,0),(958,2120309962,140,0),(959,2120309962,141,0),(960,2120309962,142,0),(961,2120309962,143,0),(962,2120309962,144,0),(963,2120309962,145,0),(964,2120309962,146,0),(965,2120309962,147,0),(966,2120309962,148,0),(967,2120309962,149,0),(968,2120309962,150,0),(969,2120309962,151,0),(970,2120309962,152,0),(971,2120309962,153,0),(972,2120309962,154,0),(973,2120309962,156,0),(974,2120309962,157,0),(975,2120309962,158,0),(976,2120309962,159,0),(977,2120309962,160,0),(978,2120309962,161,0),(979,2120309962,162,0),(980,2120309962,163,0),(981,2120309962,164,0),(982,2120309962,165,0),(983,2120309962,166,0),(984,2120309962,168,0),(985,2120309962,169,0),(986,2120309962,170,0),(987,2120309962,171,0),(988,2120309962,172,0),(989,2120309962,173,0),(990,2120309962,174,0),(991,2120309962,175,0),(992,2120309962,176,0),(993,2120309962,177,0),(994,2120309962,178,0),(995,2120309962,179,0),(996,2120309962,180,0),(997,2120309962,181,0),(998,2120309962,182,0),(999,2120309962,183,0),(1000,2120309962,184,0),(1001,5640731453,1,0),(1002,5640731453,2,0),(1003,5640731453,6,0),(1004,5640731453,7,0),(1005,5640731453,13,0),(1006,5640731453,14,0),(1007,5640731453,17,0),(1008,5640731453,18,0),(1009,5640731453,22,0),(1010,5640731453,23,0),(1011,5640731453,24,0),(1012,5640731453,28,0),(1013,5640731453,37,0),(1014,5640731453,38,0),(1015,5640731453,39,0),(1016,5640731453,41,0),(1017,5640731453,42,0),(1018,5640731453,43,0),(1019,5640731453,45,0),(1020,5640731453,56,0),(1021,5640731453,57,0),(1022,5640731453,58,0),(1023,5640731453,59,0),(1024,5640731453,61,0),(1025,5640731453,62,0),(1026,5640731453,64,0),(1027,5640731453,65,0),(1028,5640731453,68,0),(1029,5640731453,72,0),(1030,5640731453,75,0),(1031,5640731453,76,0),(1032,5640731453,77,0),(1033,5640731453,78,0),(1034,5640731453,79,0),(1035,5640731453,80,0),(1036,5640731453,82,0),(1037,5640731453,83,0),(1038,5640731453,84,0),(1039,5640731453,85,0),(1040,5640731453,86,0),(1041,5640731453,88,0),(1042,5640731453,89,0),(1043,5640731453,90,0),(1044,5640731453,91,0),(1045,5640731453,93,0),(1046,5640731453,94,0),(1047,5640731453,95,0),(1048,5640731453,96,0),(1049,5640731453,97,0),(1050,5640731453,99,0),(1051,5640731453,100,0),(1052,5640731453,101,0),(1053,5640731453,102,0),(1054,5640731453,103,0),(1055,5640731453,104,0),(1056,5640731453,106,0),(1057,5640731453,107,0),(1058,5640731453,108,0),(1059,5640731453,109,0),(1060,5640731453,111,0),(1061,5640731453,112,0),(1062,5640731453,113,0),(1063,5640731453,114,0),(1064,5640731453,115,0),(1065,5640731453,116,0),(1066,5640731453,117,0),(1067,5640731453,120,0),(1068,5640731453,121,0),(1069,5640731453,122,0),(1070,5640731453,123,0),(1071,5640731453,124,0),(1072,5640731453,125,0),(1073,5640731453,127,0),(1074,5640731453,129,0),(1075,5640731453,131,0),(1076,5640731453,132,0),(1077,5640731453,133,0),(1078,5640731453,134,0),(1079,5640731453,135,0),(1080,5640731453,136,0),(1081,5640731453,138,0),(1082,5640731453,139,0),(1083,5640731453,140,0),(1084,5640731453,141,0),(1085,5640731453,142,0),(1086,5640731453,143,0),(1087,5640731453,144,0),(1088,5640731453,145,0),(1089,5640731453,146,0),(1090,5640731453,147,0),(1091,5640731453,148,0),(1092,5640731453,149,0),(1093,5640731453,150,0),(1094,5640731453,151,0),(1095,5640731453,152,0),(1096,5640731453,153,0),(1097,5640731453,154,0),(1098,5640731453,156,0),(1099,5640731453,157,0),(1100,5640731453,158,0),(1101,5640731453,159,0),(1102,5640731453,160,0),(1103,5640731453,161,0),(1104,5640731453,162,0),(1105,5640731453,163,0),(1106,5640731453,164,0),(1107,5640731453,165,0),(1108,5640731453,166,0),(1109,5640731453,168,0),(1110,5640731453,169,0),(1111,5640731453,170,0),(1112,5640731453,171,0),(1113,5640731453,172,0),(1114,5640731453,173,0),(1115,5640731453,174,0),(1116,5640731453,175,0),(1117,5640731453,176,0),(1118,5640731453,177,0),(1119,5640731453,178,0),(1120,5640731453,179,0),(1121,5640731453,180,0),(1122,5640731453,181,0),(1123,5640731453,182,0),(1124,5640731453,183,0),(1125,5640731453,184,0),(1126,5640731453,185,1);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 10:56:02