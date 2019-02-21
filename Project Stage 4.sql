-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: newspaper
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` char(4) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(75) NOT NULL,
  `section` varchar(45) NOT NULL,
  `comment_count` int(10) DEFAULT NULL,
  `original_article` char(4) DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('4000','2017-11-17','Trump Impeached','Politics',1533,NULL),('4001','2017-11-16','Lebron James Wins MVP','Sports',6547,'4002'),('4002','2017-11-15','Cavs Win Championship','Sports',11346,NULL),('4004','2017-11-15','Warriors Lose Epically','Sports',13,'4002'),('4005','2017-11-15','Does Basketball Matter?','Opinion',4545,'4002'),('4006','2017-08-17','Summer Heatwave','Science',1611,NULL),('4007','2017-09-17','Fall Fashion','Fashion',1694,'4007'),('4008','2017-11-10','Da Vinci Sells for $450m','Art',16461,NULL),('4009','2017-09-17','Stocks Market Drops','Finance',16789,NULL),('4011','2017-04-14','Sessions Indicted','Politics',16163,'4000'),('4012','2017-11-17','Franken Target of Accusations','Politics',1611,NULL),('4013','2017-01-01','Michelle Obama to Run for President','Politics',16613,'4000'),('4014','2017-05-25','Brazil Economy Booming','World',16113,NULL),('4015','2017-11-17','El Salvador Finally Recovering','World',11314,NULL),('4016','2017-07-24','Back to School Curve','Education',646,NULL),('4017','2017-11-17','Rising Majors in Today\'s Economy','Education',412,NULL),('4018','2017-11-17','Student Wins Nobel Prize for Art','Art',41,NULL),('4019','2017-08-18','Is Racism Dead?','Opinion',412,NULL),('4020','2017-10-17','Family Matters?','Opinion',2,NULL),('4021','2017-12-04','Trump Indicted','Politics',1111,'4000'),('4022','2017-12-05','Sessions Takes Plea Deal','Politics',156,'4000'),('4023','2017-12-01','Brazil\'s World Cup Hangover','World',2662,'4014'),('4024','2017-11-29','Data Analytics - Highest Rising Major','Educ',516,'4017');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_to_img`
--

DROP TABLE IF EXISTS `article_to_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_to_img` (
  `Article_id` char(4) NOT NULL,
  `image_id` char(4) NOT NULL,
  PRIMARY KEY (`Article_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `article_to_img_ibfk_1` FOREIGN KEY (`Article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `article_to_img_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_to_img`
--

LOCK TABLES `article_to_img` WRITE;
/*!40000 ALTER TABLE `article_to_img` DISABLE KEYS */;
INSERT INTO `article_to_img` VALUES ('4000','3000'),('4001','3000'),('4002','3002'),('4004','3003'),('4005','3004'),('4011','3005'),('4017','3006');
/*!40000 ALTER TABLE `article_to_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_viewed`
--

DROP TABLE IF EXISTS `article_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_viewed` (
  `Article_id` char(4) NOT NULL,
  `acc_id` char(4) NOT NULL,
  PRIMARY KEY (`Article_id`,`acc_id`),
  KEY `acc_id` (`acc_id`),
  CONSTRAINT `article_viewed_ibfk_1` FOREIGN KEY (`Article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `article_viewed_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `subscriber` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_viewed`
--

LOCK TABLES `article_viewed` WRITE;
/*!40000 ALTER TABLE `article_viewed` DISABLE KEYS */;
INSERT INTO `article_viewed` VALUES ('4000','5000'),('4000','5001'),('4001','5001'),('4002','5002'),('4004','5003'),('4005','5004'),('4006','5006'),('4007','5007'),('4008','5008'),('4009','5009'),('4011','5010'),('4012','5011'),('4013','5012'),('4014','5013'),('4015','5015'),('4016','5016'),('4017','5017'),('4018','5018'),('4019','5019'),('4020','5020');
/*!40000 ALTER TABLE `article_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `employee_id` char(4) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('1000','John','Smith'),('1001','Joe','Johnson'),('1002','Peter','Paul'),('1003','Jelani','Johnson'),('1004','Paul','Wall'),('1005','Khasey','Keith'),('1006','Jerod','Carmichael'),('1007','Michael','Che'),('1008','Chris','Woo');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenter`
--

DROP TABLE IF EXISTS `commenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commenter` (
  `username` varchar(45) NOT NULL,
  `acc_id` char(4) NOT NULL,
  `comment_count` int(10) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_acc_id` (`acc_id`),
  CONSTRAINT `fk_acc_id` FOREIGN KEY (`acc_id`) REFERENCES `subscriber` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenter`
--

LOCK TABLES `commenter` WRITE;
/*!40000 ALTER TABLE `commenter` DISABLE KEYS */;
INSERT INTO `commenter` VALUES ('harryp3','5001',200),('herms45','5003',10),('hotdog123','5000',15),('peterpet2','5002',150),('ronwee44','5004',6);
/*!40000 ALTER TABLE `commenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` char(4) NOT NULL,
  `username` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL,
  `rec_count` int(10) NOT NULL,
  `np_pick` enum('Y','N') DEFAULT NULL,
  `article_id` char(4) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('6000','hotdog123','2017-11-17 13:15:05',150,'Y','4013'),('6001','harryp3','2017-11-17 14:10:59',200,'Y','4001'),('6002','ronwee44','2017-07-24 18:17:00',2,'N','4000'),('6003','hotdog123','2017-11-15 17:01:40',0,'N','4020'),('6004','herms45','2017-11-10 01:25:03',156,'Y','4020'),('6005','ronwee44','2017-08-17 16:50:55',40,'N','4019'),('6006','peterpet2','2017-05-25 18:16:18',11,'N','4018'),('6007','dliu1234','2017-07-21 15:16:18',115,'Y','4017'),('6008','pablo101','2017-11-20 20:16:18',116,'Y','4016'),('6009','chrisw000','2017-12-25 14:18:18',110,'Y','4015'),('6010','soumya114','2017-01-01 00:01:00',2,'N','4014'),('6011','jimi234','2017-07-17 21:22:18',6,'N','4013'),('6012','chayan34','2017-06-12 01:15:18',25,'N','4011'),('6013','maddog69','2017-01-12 16:15:18',4564,'Y','4012'),('6014','juanpablo412','2017-02-12 21:13:18',4562,'Y','4009'),('6015','andymanchez','2017-06-11 01:12:19',54548,'Y','4008'),('6016','yoooooo','2017-12-02 07:00:14',13,'N','4007'),('6017','kamilacf89','2017-12-01 09:23:43',544,'N','4006'),('6018','anaflava31','2017-12-03 13:46:20',4422,'Y','4005'),('6019','andrea_m','2017-11-23 19:14:22',478,'N','4003'),('6020','we_out_here13','2017-11-12 06:17:30',813,'Y','4005'),('6021','honeybunz43','2017-10-31 22:15:18',178,'Y','4002'),('6022','1love234','2017-10-02 22:49:03',136,'N','4000'),('6023','petey$pete','2017-02-12 11:20:18',123,'N','4000'),('6024','1love234','2017-02-12 11:20:18',123,'Y','4000'),('6025','we_out_here13','2017-02-12 11:20:18',16546,'Y','4000'),('6026','kamilacf89','2017-02-12 11:20:18',4641,'N','4000'),('6027','honeybunz43','2017-02-12 11:20:18',46465,'Y','4000'),('6028','we_out_here13','2017-02-12 11:20:18',1513,'N','4000'),('6029','anaflava31','2017-02-12 11:20:18',151,'Y','4000'),('6030','andymanchez','2017-02-12 11:20:18',1,'N','4000'),('6031','chayan34','2017-02-12 11:20:18',16,'Y','4000'),('6032','ronwee44','2017-02-12 11:20:18',216,'N','4000'),('6033','hotdog123','2017-02-12 11:20:18',164,'Y','4000'),('6034','chayan34','2017-02-12 11:20:18',1651,'Y','4000'),('6035','herms45','2017-02-12 11:20:18',131,'N','4000'),('6036','yoooooo','2017-02-12 11:20:18',216,'Y','4000'),('6037','ronwee44','2017-12-01 21:23:43',451,'N','4019'),('6038','pablo101','2017-12-03 13:46:20',123,'N','4020'),('6039','peterpet2','2017-12-01 19:23:43',54,'N','4019'),('6040','hotdog123','2017-12-03 13:56:20',15,'Y','4020'),('6041','1love234','2017-02-12 16:20:18',0,'N','4019'),('6042','pablo101','2017-12-03 13:46:20',156,'N','4020'),('6043','herms45','2017-11-15 14:01:40',45,'N','4005'),('6044','anaflava31','2017-11-15 13:01:40',0,'N','4005'),('6045','andymanchez','2017-11-15 12:31:40',566,'N','4005');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates_comment`
--

DROP TABLE IF EXISTS `creates_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creates_comment` (
  `acc_id` char(4) NOT NULL,
  `comment_id` char(4) NOT NULL,
  PRIMARY KEY (`acc_id`,`comment_id`),
  KEY `fk_comments_idx` (`comment_id`),
  CONSTRAINT `fk_comments` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscriber` FOREIGN KEY (`acc_id`) REFERENCES `subscriber` (`acc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates_comment`
--

LOCK TABLES `creates_comment` WRITE;
/*!40000 ALTER TABLE `creates_comment` DISABLE KEYS */;
INSERT INTO `creates_comment` VALUES ('5006','6001'),('5004','6002'),('5003','6003'),('5002','6004'),('5001','6005'),('5000','6006'),('5010','6007'),('5011','6008'),('5012','6009'),('5013','6010'),('5015','6011'),('5016','6012');
/*!40000 ALTER TABLE `creates_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illustrator`
--

DROP TABLE IF EXISTS `illustrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illustrator` (
  `employee_id` char(4) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illustrator`
--

LOCK TABLES `illustrator` WRITE;
/*!40000 ALTER TABLE `illustrator` DISABLE KEYS */;
INSERT INTO `illustrator` VALUES ('2000','Rihanna','Sal'),('2001','Ray','Charles'),('2002','Preety','Gadhoke'),('2003','Barrett','Brenton'),('2004','Carline','Bennett');
/*!40000 ALTER TABLE `illustrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_id` char(4) NOT NULL,
  `format` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`image_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('3000','jpg','2015-12-15'),('3001','png','2016-10-08'),('3002','jpg','2017-08-09'),('3003','jpg','2017-09-12'),('3004','jpg','2017-11-17'),('3005','png','2017-11-15'),('3006','png','2017-11-14');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makes_illustration`
--

DROP TABLE IF EXISTS `makes_illustration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makes_illustration` (
  `employee_id` char(4) NOT NULL,
  `image_id` char(4) NOT NULL,
  PRIMARY KEY (`employee_id`,`image_id`),
  KEY `Image_idx` (`image_id`),
  CONSTRAINT `Image` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Image_Author` FOREIGN KEY (`employee_id`) REFERENCES `illustrator` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makes_illustration`
--

LOCK TABLES `makes_illustration` WRITE;
/*!40000 ALTER TABLE `makes_illustration` DISABLE KEYS */;
INSERT INTO `makes_illustration` VALUES ('2000','3000'),('2001','3000'),('2000','3001'),('2001','3001'),('2002','3002'),('2003','3003'),('2004','3003'),('2004','3004'),('2003','3005'),('2001','3006'),('2002','3006');
/*!40000 ALTER TABLE `makes_illustration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber` (
  `acc_id` char(4) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` VALUES ('5000','Kevin','Smith','mthurn@live.com','Brooklyn','NY'),('5001','Emily','Johnson','euice@outlook.com','Newark','NJ'),('5002','Joshua','Williams','memimy@yahoo.com','Manhattan','NY'),('5003','Carol','Brown','mxiao@yahoo.com','Manhattan','NY'),('5004','Kenneth','Jones','sakusha@yahoo.ca','Oaklan','CA'),('5006','Charles','Miller','fangorn@hotmail.com','Staten Island','NY'),('5007','Margaret','Wilson','firstpr@att.net','Los Angeles','CA'),('5008','Thomas','Moore','jguyer@aol.com','Silver Springs','MD'),('5009','Joseph','Taylor','crandall@sbcglobal.net','Queens','NY'),('5010','Jessica','Anderson','miyop@icloud.com','Atlanta','GA'),('5011','Susan','Thomas','thomas@gmail.com','Queens','NY'),('5012','Richard','Jackson','jax@gmail.com','Baton Rouge','LA'),('5013','Barbara','White','white@gmail.com','Westbury','NY'),('5015','William','Martin','martin@hotmail.com','Laurel','MD'),('5016','Linda','Thompson','thompson@yahoo.com','New Cassell','NY'),('5017','Elizabeth','Garcia','rgarcia@optonline.net','Compton','CA'),('5018','Michael','Martinez','martinez@gmail.com','Oaklan','CA'),('5019','Robert','Robinson','rob@gmail.com','Queens','NY'),('5020','Patricia','Clark','clarks@gmail.com','Honolulu','HI'),('5021','Di-Heng','Liu','dliu@gmail.com','Taiwan','NY');
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writes_article`
--

DROP TABLE IF EXISTS `writes_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writes_article` (
  `employee_id` char(4) NOT NULL,
  `article_id` char(4) NOT NULL,
  PRIMARY KEY (`employee_id`,`article_id`),
  KEY `Article_idx` (`article_id`),
  CONSTRAINT `Article` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Author` FOREIGN KEY (`employee_id`) REFERENCES `author` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writes_article`
--

LOCK TABLES `writes_article` WRITE;
/*!40000 ALTER TABLE `writes_article` DISABLE KEYS */;
INSERT INTO `writes_article` VALUES ('1000','4000'),('1001','4000'),('1007','4000'),('1001','4001'),('1002','4002'),('1004','4004'),('1005','4005'),('1006','4006'),('1007','4007'),('1008','4008'),('1001','4009'),('1002','4011'),('1003','4012'),('1004','4013'),('1005','4014'),('1006','4015'),('1007','4016'),('1008','4017'),('1001','4018'),('1002','4019'),('1003','4020');
/*!40000 ALTER TABLE `writes_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 19:13:05
