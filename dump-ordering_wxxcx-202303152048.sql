-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ordering_wxxcx
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
-- Table structure for table `o_acf`
--

DROP TABLE IF EXISTS `o_acf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_acf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `acfName` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_acf`
--

LOCK TABLES `o_acf` WRITE;
/*!40000 ALTER TABLE `o_acf` DISABLE KEYS */;
INSERT INTO `o_acf` VALUES (1,1,'香菜'),(2,1,'葱'),(3,1,'芒果'),(4,2,'臭豆腐'),(5,2,'榴莲');
/*!40000 ALTER TABLE `o_acf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_canteen`
--

DROP TABLE IF EXISTS `o_canteen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_canteen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `canteenName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `changerName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_canteen`
--

LOCK TABLES `o_canteen` WRITE;
/*!40000 ALTER TABLE `o_canteen` DISABLE KEYS */;
INSERT INTO `o_canteen` VALUES (1,'20001','123456','第一食堂','王大','1237453945','http://localhost/image/芹菜.png','2022-08-31 12:42:23'),(2,'20002','123456','第二食堂','刘二','12339877633','http://localhost/image/米饭.png','2022-08-31 13:57:38');
/*!40000 ALTER TABLE `o_canteen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_complain`
--

DROP TABLE IF EXISTS `o_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_complain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `foodId` int NOT NULL,
  `complainScore` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_complain`
--

LOCK TABLES `o_complain` WRITE;
/*!40000 ALTER TABLE `o_complain` DISABLE KEYS */;
INSERT INTO `o_complain` VALUES (1,1,5,'酸菜坏了，鱼肉也不新鲜，我怀疑是食人鱼','2022-08-15 01:46:04'),(2,2,1,'西红柿里面有虫子','2022-08-15 01:46:37');
/*!40000 ALTER TABLE `o_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_component`
--

DROP TABLE IF EXISTS `o_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodId` int NOT NULL,
  `componentName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_component`
--

LOCK TABLES `o_component` WRITE;
/*!40000 ALTER TABLE `o_component` DISABLE KEYS */;
INSERT INTO `o_component` VALUES (1,1,'西红柿'),(2,1,'鸡蛋'),(3,1,'葱'),(4,2,'猪肝'),(5,3,'酸菜'),(6,3,'鱼'),(7,4,'鸡蛋'),(8,4,'葱'),(9,5,'葱'),(10,5,'花椒'),(11,5,'辣椒'),(12,5,'鱼'),(13,5,'香菜'),(14,6,'西红柿'),(15,6,'鸡蛋'),(16,6,'葱'),(17,7,'牛肉'),(18,8,'牛肉'),(19,9,'猪肉'),(20,9,'青菜'),(21,8,'牛肉');
/*!40000 ALTER TABLE `o_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_evaluate`
--

DROP TABLE IF EXISTS `o_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_evaluate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `foodId` int NOT NULL,
  `evaluateScore` decimal(8,2) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_evaluate`
--

LOCK TABLES `o_evaluate` WRITE;
/*!40000 ALTER TABLE `o_evaluate` DISABLE KEYS */;
INSERT INTO `o_evaluate` VALUES (1,1,1,5.00,'2022-08-15 01:47:18'),(2,2,1,1.00,'2022-08-15 01:48:10'),(3,1,5,1.00,'2022-08-15 01:48:31'),(4,1,2,5.00,'2022-08-15 01:49:07'),(5,2,2,5.00,'2022-08-15 01:49:19'),(6,3,2,5.00,'2022-08-15 01:49:28');
/*!40000 ALTER TABLE `o_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_food`
--

DROP TABLE IF EXISTS `o_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shopId` int NOT NULL,
  `kindName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foodCarbohydrate` decimal(8,2) NOT NULL,
  `foodFat` decimal(8,2) NOT NULL,
  `foodProtein` decimal(8,2) NOT NULL,
  `foodBigDeal` int DEFAULT NULL,
  `foodBigPrice` decimal(8,2) DEFAULT NULL,
  `foodMiddleDeal` int DEFAULT NULL,
  `foodMiddlePrice` decimal(8,2) DEFAULT NULL,
  `foodSmallDeal` int DEFAULT NULL,
  `foodSmallPrice` decimal(8,2) DEFAULT NULL,
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `spicyDegree` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition` int DEFAULT NULL,
  `carousel` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_food`
--

LOCK TABLES `o_food` WRITE;
/*!40000 ALTER TABLE `o_food` DISABLE KEYS */;
INSERT INTO `o_food` VALUES (1,'西红柿炒鸡蛋',1,'蛋类',2.40,8.80,13.30,1000,20.00,750,15.00,500,10.00,'http://localhost/image/菜品_西红柿炒蛋.png','中等',1,'http://localhost/image/菜品_西红柿炒蛋.png'),(2,'猪肝面',1,'面条',5.00,3.50,19.30,1200,18.00,1000,16.00,800,14.00,'http://localhost/image/菜品_猪肝面.png','中等',1,'http://localhost/image/菜品_猪肝面.png'),(3,'酸菜鱼',1,'水生',1.64,4.40,13.09,1500,30.00,1200,26.00,1000,22.00,'http://localhost/image/菜品_酸菜鱼.png','中等',1,'http://localhost/image/菜品_酸菜鱼.png'),(4,'蛋炒饭',2,'米饭',19.43,6.43,4.69,1000,18.00,800,16.00,600,12.00,'http://localhost/image/菜品_蛋炒饭.png','中等',1,'http://localhost/image/菜品_蛋炒饭.png'),(5,'炭烧烤鱼',2,'水生',1.09,14.39,15.05,3000,66.00,2500,57.00,2000,50.00,'http://localhost/image/菜品_酸菜鱼.png','中等',1,'http://localhost/image/菜品_酸菜鱼.png'),(6,'西红柿炒鸡蛋',2,'瓜果',2.40,8.80,13.30,1000,22.00,750,16.00,400,8.00,'http://localhost/image/菜品_西红柿炒蛋.png','中等',1,'http://localhost/image/菜品_西红柿炒蛋.png'),(7,'牛肉粉丝套餐',2,'鲜肉',1.20,4.20,19.90,2200,40.00,2000,35.00,1800,32.00,'http://localhost/image/菜品_牛肉粉丝.png','中等',1,'http://localhost/image/菜品_牛肉粉丝.png'),(8,'牛肉粉丝套餐',1,'鲜肉',1.20,4.20,19.90,2200,40.00,2000,35.00,1800,32.00,'http://localhost/image/菜品_牛肉粉丝.png','中等',1,'http://localhost/image/菜品_牛肉粉丝.png'),(9,'猪排饭',3,'鲜肉',2.09,16.00,15.90,NULL,NULL,NULL,NULL,500,12.00,'http://localhost/image/首页_红烧肉2.png','无',1,'http://localhost/image/首页_红烧肉2.png');
/*!40000 ALTER TABLE `o_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_kind`
--

DROP TABLE IF EXISTS `o_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_kind` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kindName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bigKind` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(108) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_kind`
--

LOCK TABLES `o_kind` WRITE;
/*!40000 ALTER TABLE `o_kind` DISABLE KEYS */;
INSERT INTO `o_kind` VALUES (1,'米饭','主食','http://localhost/image/首页_米饭.png'),(2,'面条','主食','http://localhost/image/首页_面条.png'),(3,'面食','主食','http://localhost/image/首页_面条.png'),(4,'粥','主食','http://localhost/image/首页_面条.png'),(5,'烹饪','主食','http://localhost/image/首页_面条.png'),(6,'鲜肉','荤菜','http://localhost/image/首页_红烧肉.png'),(7,'禽肉','荤菜','http://localhost/image/首页_红烧肉2.png'),(8,'蛋类','荤菜','http://localhost/image/首页_红烧肉2.png'),(9,'水生','荤菜','http://localhost/image/首页_红烧肉2.png'),(10,'脏器','荤菜','http://localhost/image/首页_红烧肉2.png'),(11,'绿叶类','素菜','http://localhost/image/首页_青菜.png'),(12,'瓜果','素菜','http://localhost/image/首页_白菜.png'),(13,'水生菜','素菜','http://localhost/image/首页_白菜.png'),(14,'豆类','素菜','http://localhost/image/首页_白菜.png'),(15,'菌类','素菜','http://localhost/image/首页_白菜.png'),(16,'西瓜','其他','http://localhost/image/首页占位2.png'),(17,'炸弹','其他','http://localhost/image/首页占位2.png');
/*!40000 ALTER TABLE `o_kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_shop`
--

DROP TABLE IF EXISTS `o_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shopName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bossName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bossTelephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shopCanteen` int NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_shop`
--

LOCK TABLES `o_shop` WRITE;
/*!40000 ALTER TABLE `o_shop` DISABLE KEYS */;
INSERT INTO `o_shop` VALUES (1,'10001','123456','元气饭店','李大','12376548900',1,'http://localhost/image/店铺_元气饭店.png','2022-08-31 12:39:09'),(2,'10002','123456','瓷砖汤王','憋三','1232541250',1,'http://localhost/image/店铺_元气饭店.png','2022-08-31 13:11:23'),(3,'10003','123456','煲仔饭','丽丽','1235467324',2,'http://localhost/image/店铺_元气饭店.png','2022-10-11 12:40:25');
/*!40000 ALTER TABLE `o_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_traderecords`
--

DROP TABLE IF EXISTS `o_traderecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_traderecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `foodId` int NOT NULL,
  `tradeMoney` decimal(8,2) NOT NULL,
  `tradeTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `condition` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_traderecords`
--

LOCK TABLES `o_traderecords` WRITE;
/*!40000 ALTER TABLE `o_traderecords` DISABLE KEYS */;
INSERT INTO `o_traderecords` VALUES (1,1,1,20.00,'2022-08-15 01:51:22',1),(2,2,1,15.00,'2022-08-15 01:51:51',1),(3,1,5,57.00,'2022-08-15 01:52:10',0),(4,1,2,18.00,'2022-08-15 01:52:47',1),(5,2,2,14.00,'2022-08-15 01:53:01',1),(6,3,2,18.00,'2022-08-15 01:53:22',1);
/*!40000 ALTER TABLE `o_traderecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_user`
--

DROP TABLE IF EXISTS `o_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `userAge` varchar(8) DEFAULT NULL,
  `userHeight` varchar(8) DEFAULT NULL,
  `userWeight` varchar(8) DEFAULT NULL,
  `userWaistline` varchar(8) DEFAULT NULL,
  `userTelephone` varchar(16) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userGender` varchar(16) NOT NULL,
  `token` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `headPortrait` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_user`
--

LOCK TABLES `o_user` WRITE;
/*!40000 ALTER TABLE `o_user` DISABLE KEYS */;
INSERT INTO `o_user` VALUES (1,'酋长','37','180','160','140','1233456','2022-08-14 01:28:33','男','7891','http://localhost/image/菜品_西红柿炒蛋.png'),(2,'祭祀','22','165','100','70','7493628','2022-08-14 01:29:21','女','7892','http://localhost/image/菜品_西红柿炒蛋.png'),(3,'大长老','88','150','140','120','7654321','2022-08-14 01:30:02','男','7893','http://localhost/image/菜品_西红柿炒蛋.png'),(4,'二长老','79','172','159','120','35475637','2022-11-29 07:04:12','男','9874','http://localhost/image/菜品_西红柿炒蛋.png'),(5,'嘻嘻','0','0','0','0','0',NULL,'0','0','0'),(9,'0','0','0','0','0','0','2023-03-03 08:11:26','0','085400','0');
/*!40000 ALTER TABLE `o_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ordering_wxxcx'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 20:48:07
