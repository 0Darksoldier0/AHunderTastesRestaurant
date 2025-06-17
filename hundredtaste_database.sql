CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  CONSTRAINT `categories_chk_1` CHECK ((`category_name` in (_utf8mb4'appetizers',_utf8mb4'main dishes',_utf8mb4'drinks',_utf8mb4'desserts')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (10,'appetizers'),(11,'main dishes'),(12,'drinks'),(13,'desserts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_house_order_details`
--

DROP TABLE IF EXISTS `in_house_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_house_order_details` (
  `order_id` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `served_quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `in_house_order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_house_order_details`
--

LOCK TABLES `in_house_order_details` WRITE;
/*!40000 ALTER TABLE `in_house_order_details` DISABLE KEYS */;
INSERT INTO `in_house_order_details` VALUES ('123',1052,3,0),('123',1053,2,0),('123',1055,4,0),('124',1053,1,0),('124',1055,4,0),('1750064764532',1052,8,0),('1750064764532',1053,4,0),('1750064764532',1055,4,0),('1750064764532',1056,2,0),('1750064764532',1070,2,0),('1750064764532',1071,2,0),('1750064764532',1072,2,0),('1750064764532',1074,2,0),('1750064764532',1077,2,0),('1750086931195',1052,1,0),('1750086931195',1053,1,0),('1750086931195',1055,1,0),('1750086931195',1056,2,0),('1750087308503',1052,5,0),('1750087308503',1053,5,0),('1750087883141',1070,10,0),('1750087883141',1074,10,0),('1750091884542',1052,1,1),('1750091884542',1053,1,1),('1750091933824',1052,1,1),('1750091933824',1055,2,2),('1750091933824',1056,3,3),('1750108636565',1052,1,1),('1750108820132',1052,1,1),('1750108820132',1053,1,1),('1750108820132',1055,1,1),('1750109727574',1052,7,4),('1750109727574',1053,5,2),('1750109727574',1055,4,1),('1750109727574',1056,5,2),('1750109727574',1070,6,3),('1750109727574',1071,4,1),('1750109727574',1072,4,2),('1750109727574',1074,3,1),('1750111001088',1052,1,0),('1750111001088',1053,1,0),('1750111001088',1055,1,1),('1750111001088',1056,1,1),('1750111001088',1070,1,0),('1750111001088',1071,1,0),('1750111001088',1072,1,0),('1750111001088',1074,1,0);
/*!40000 ALTER TABLE `in_house_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_house_orders`
--

DROP TABLE IF EXISTS `in_house_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_house_orders` (
  `order_id` varchar(100) NOT NULL,
  `staff_incharged_username` varchar(100) NOT NULL,
  `seat_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT (now()),
  `customer_name` varchar(100) NOT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `seat_id` (`seat_id`),
  KEY `staff_incharged_username` (`staff_incharged_username`),
  CONSTRAINT `in_house_orders_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`),
  CONSTRAINT `in_house_orders_ibfk_2` FOREIGN KEY (`staff_incharged_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_house_orders`
--

LOCK TABLES `in_house_orders` WRITE;
/*!40000 ALTER TABLE `in_house_orders` DISABLE KEYS */;
INSERT INTO `in_house_orders` VALUES ('1749974702030','staff1',1,'2025-06-15 15:02:58','harry vu',1),('1749974908727','staff1',1,'2025-06-15 15:04:42','harry vu',1),('1749975748303','staff1',2,'2025-06-15 15:22:25','dasdf',1),('1749978622965','staff1',4,'2025-06-15 15:46:28','dddd',1),('1749978830475','staff1',5,'2025-06-15 15:48:12','asdf',1),('1749978936744','staff1',3,'2025-06-15 15:49:05','dadsf',1),('1749980115718','staff1',1,'2025-06-15 15:58:55','dasdf',1),('1750064764532','admin',6,'2025-06-16 16:05:16','ddd',1),('1750077009386','staff1',4,'2025-06-16 19:27:33','ddd',1),('1750077823095','admin',8,'2025-06-16 19:09:10','ddd',1),('1750078276539','staff1',7,'2025-06-16 19:12:57','dasdf',1),('1750086931195','staff1',1,'2025-06-16 21:28:11','nghia',1),('1750087308503','staff1',1,'2025-06-16 21:31:20','quang',1),('1750087883141','staff1',1,'2025-06-16 21:36:07','minh',1),('1750088271844','staff1',2,'2025-06-16 21:39:22','asdf',1),('1750088350685','staff1',5,'2025-06-16 21:40:01','asdfafd',1),('1750088908301','staff1',3,'2025-06-16 21:44:40','sdfdfdfeef',1),('1750089143920','staff1',3,'2025-06-16 21:46:38','aeee',1),('1750089193798','staff1',3,'2025-06-16 21:47:03','asdf',1),('1750091361256','staff1',1,'2025-06-16 22:05:06','adsfeefd',1),('1750091630531','staff1',4,'2025-06-16 22:07:21','dao',1),('1750091884542','staff1',4,'2025-06-16 22:09:28','dadsf',1),('1750091933824','staff1',1,'2025-06-16 22:09:53','nghia',1),('1750106954291','staff1',1,'2025-06-17 03:43:17','hongminh',0),('1750106977017','staff1',2,'2025-06-17 03:43:28','hongminh',0),('1750108475622','staff1',4,'2025-06-17 03:55:57','nghia',0),('1750108636565','staff1',3,'2025-06-17 04:11:40','dfasdf',1),('1750108820132','staff1',5,'2025-06-17 04:13:11','dadfafefad',1),('1750109727574','staff1',1,'2025-06-17 04:20:45','dasdfadsf',0),('1750111001088','staff1',2,'2025-06-17 04:42:03','adsfeef',0);
/*!40000 ALTER TABLE `in_house_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_order_details`
--

DROP TABLE IF EXISTS `online_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_order_details` (
  `order_id` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `online_order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `online_orders` (`order_id`),
  CONSTRAINT `online_order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_order_details`
--

LOCK TABLES `online_order_details` WRITE;
/*!40000 ALTER TABLE `online_order_details` DISABLE KEYS */;
INSERT INTO `online_order_details` VALUES ('1749369422118',1055,1),('1749369422118',1056,1),('1749369574043',1052,1),('1749369574043',1053,1),('1749369574043',1055,1),('1749369574043',1056,1),('1749369574043',1057,1),('1749370912542',1052,3),('1749370912542',1053,2),('1749370912542',1058,1),('1749372366965',1052,1),('1749372366965',1053,1),('1749372366965',1055,1),('1749407207875',1052,3),('1749407207875',1060,1),('1749407207875',1061,1),('1749411969680',1052,1),('1749411969680',1053,1),('1749411969680',1055,1),('1749541789632',1052,1),('1749541789632',1053,1),('1749541789632',1055,1),('1749541789632',1056,1),('1749541789632',1057,1),('1749541789632',1058,1),('1749541789632',1061,1),('1749559120841',1052,1),('1749559120841',1053,1),('1749564699297',1052,1),('1749564699297',1053,1),('1749570660791',1053,2),('1749588276760',1052,1),('1749588276760',1053,1),('1749588276760',1055,1),('1749588276760',1056,1),('1749745385086',1052,1),('1749745385086',1053,1),('1749745385086',1056,1),('1749751858577',1053,1),('1749751858577',1056,1),('1749751858577',1070,1),('1749751858577',1071,1),('1749752470281',1052,1),('1749752470281',1053,1),('1749752470281',1056,1),('1749752470281',1070,1),('1749752470281',1071,1),('1749752470281',1072,1),('1749753277785',1052,1),('1749753277785',1053,1),('1749753489091',1052,1),('1749753489091',1053,1),('1749753489091',1056,1),('1749753489091',1070,1),('1749753489091',1071,1),('1749753489091',1072,1),('1749881290983',1052,1),('1749881290983',1053,1),('1749881290983',1055,1),('1749881290983',1056,1),('1749881290983',1070,1),('1749881325373',1052,1),('1749881325373',1053,1),('1749881325373',1055,1),('1749881325373',1056,1),('1749881340535',1052,1),('1749881340535',1053,1),('1749881340535',1055,1),('1749881340535',1056,1),('1749881515177',1052,1),('1749881515177',1053,1),('1749881515177',1055,1),('1749881515177',1056,1),('1749882327483',1052,1),('1749882327483',1053,1),('1749882327483',1055,1),('1749882327483',1056,1),('1749882327483',1070,1),('1749882327483',1071,1),('1749882327483',1072,1),('1749882376112',1052,1),('1749882376112',1053,1),('1749882376112',1055,1),('1749882479403',1052,1),('1749882479403',1053,1),('1749882479403',1055,1),('1749882479403',1056,1),('1749892521169',1052,1),('1749892521169',1053,1),('1749892521169',1055,1),('1749892521169',1056,1),('1749892976452',1052,1),('1749892976452',1053,1),('1749892976452',1055,1),('1749893032603',1052,1),('1749893032603',1053,1),('1749893032603',1055,1),('1749893463273',1053,1),('1749893463273',1055,1),('1749893697190',1052,1),('1749893697190',1053,1),('1749893697190',1055,1),('1749893715924',1053,1),('1749893715924',1055,1),('1749893822945',1052,1),('1749893822945',1053,1),('1749893822945',1055,1),('1749894018934',1052,1),('1749894018934',1053,1),('1749894018934',1055,1),('1749894037609',1053,1),('1749894037609',1055,1),('1749895419110',1053,1),('1749895581742',1053,1),('1749895581742',1055,1),('1749897865720',1052,1),('1749897865720',1053,1),('1749897865720',1055,1),('1749897865720',1056,1),('1749897865720',1070,1),('1749897865720',1071,1),('1749897865720',1072,1),('1749897865720',1074,1),('1750064602424',1052,2),('1750064602424',1053,2),('1750064602424',1055,1),('1750064602424',1056,1),('1750064624610',1052,2),('1750064624610',1053,2),('1750064624610',1055,1),('1750064624610',1056,1),('1750064660567',1052,2),('1750064660567',1053,2),('1750064660567',1055,1),('1750064660567',1056,1);
/*!40000 ALTER TABLE `online_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_orders`
--

DROP TABLE IF EXISTS `online_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_orders` (
  `order_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `shipping_details` json DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT (_utf8mb4'preparing'),
  `payment_token` varchar(1000) DEFAULT NULL,
  `payment` tinyint(1) DEFAULT (false),
  PRIMARY KEY (`order_id`),
  KEY `username` (`username`),
  CONSTRAINT `online_orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `online_orders_chk_1` CHECK ((`status` in (_utf8mb4'preparing',_utf8mb4'out for delivery',_utf8mb4'delivered')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_orders`
--

LOCK TABLES `online_orders` WRITE;
/*!40000 ALTER TABLE `online_orders` DISABLE KEYS */;
INSERT INTO `online_orders` VALUES ('1749369422118','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"mbj\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"jkhk\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,0),('1749369574043','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749370912542','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749372366965','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749407207875','admin','2025-06-08 00:00:00','{\"city\": \"sdfsdf\", \"ward\": \"fdsf\", \"email\": \"trungaiaiai@gmail\", \"street\": \"dfsdfsd\", \"district\": \"fdsffdsdfds\", \"lastName\": \"Tròn\", \"firstName\": \"Thi\", \"phoneNumber\": \"0123456789\"}','delivered',NULL,1),('1749411969680','nghiavu','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749541789632','admin','2025-06-10 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749559120841','admin','2025-06-10 18:26:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749564699297','nghiavu','2025-06-10 21:09:17','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749570660791','admin','2025-06-10 20:02:56','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749588276760','nghiavu','2025-06-11 02:21:08','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749745385086','nghiavu','2025-06-12 23:22:42','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749751858577','nghiavu','2025-06-12 23:07:22','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749752470281','nghiavu','2025-06-12 23:12:28','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749753277785','nghiavu','2025-06-12 23:19:12','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749753489091','nghiavu','2025-06-12 23:20:57','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749881290983','nghiavu','2025-06-14 13:07:23','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881325373','nghiavu','2025-06-14 13:08:17','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881340535','nghiavu','2025-06-14 13:08:54','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881515177','nghiavu','2025-06-14 13:10:52','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882327483','nghiavu','2025-06-14 13:25:16','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882376112','nghiavu','2025-06-14 13:26:05','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882479403','nghiavu','2025-06-14 13:27:47','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749892521169','admin','2025-06-14 16:14:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$B5wfrsE/OaoBrGMxSc7e9uBBiZsqEF4CCYnmXBPneD.JLB6zya4Uu',1),('1749892976452','admin','2025-06-14 16:21:09','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$G9HBidroJdkwKPjBS28GVu1CRMJ55jQusJ.zGu.MlzwNBv8pUvHZK',0),('1749893032603','admin','2025-06-14 16:21:37','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$6/Hei71W6uMtJPLwDMaStOwVHr9wQ4r1j73ES/L2OqyrVea2TgVE2',1),('1749893463273','admin','2025-06-14 16:25:12','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$foS9X9ZP/mlEAW36HRzLh.dtzw0qwVclCCop9.Fp0mAhAhNwN8eV2',1),('1749893697190','admin','2025-06-14 16:34:05','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$vPZy8x2WP0/Oj6Y6CF7PQOWXvRVuCYvm6psZbbtw/8FZsEquai89m',1),('1749893715924','admin','2025-06-14 16:27:19','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$kveX/x7.DzwA8LLdMKh8fuqZ/L1b72z5IISPw9pCnD55.4nS.7SDa',1),('1749893822945','admin','2025-06-14 16:35:08','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$GHzhQieKYuXQtyWMVbqFMulS3DcRP7rNKxEcgytYpV.w.pvrchdkG',1),('1749894018934','admin','2025-06-14 16:36:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$L.aY.SYdXsIGC07xY17pOuWIaCmQ/2rheTHG5QP.bozWkDAurH9Ni',1),('1749894037609','admin','2025-06-14 16:29:59','{\"city\": \"Ho Chi Minh\", \"ward\": \"ddd\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dd\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$8FG.edGPLafHe4.PkGu39uKpoH6xMyS2dia75jQgqLPNn8s4YmfSS',1),('1749895419110','admin','2025-06-14 16:48:26','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$WJuNYBeEZ6g.StiwH1U6LeeScjAvvKnnYyFwlMi1bsx738dsb.w3G',1),('1749895581742','admin','2025-06-14 16:49:48','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$xiOO3tw.Tg9SCjdFsmG/cu/pTIm5C0B/HBWtpYvtPqtnzm9m1Siga',1),('1749897865720','admin','2025-06-14 17:08:50','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered','$2b$10$alePVR5MzwHgXKlqohWdoOlk2BvtSmUxOjYKsosok/K2VmoHFdiq6',1),('1750064602424','staff1','2025-06-16 16:02:31','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$Ss.z1Z8pKaPVnFWthInCT.T3xTgna6UaIrNeTCN/N9anEM9JTZvGq',0),('1750064624610','staff1','2025-06-16 16:03:31','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$CjBkIMbak/JV9RPiwueQM.WxyFsSgdO42YvVn4UoXjy2OYvyBIy2q',0),('1750064660567','staff1','2025-06-16 16:04:16','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$IW7gLudkH5BGtAOeG41ww.FZeKuaZTT3qEIoXYAh5kvulLMyaOFs6',0);
/*!40000 ALTER TABLE `online_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_history`
--

DROP TABLE IF EXISTS `price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_history` (
  `date` date NOT NULL DEFAULT (curdate()),
  `product_id` int NOT NULL,
  `product_price` double DEFAULT NULL,
  PRIMARY KEY (`date`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `price_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_history`
--

LOCK TABLES `price_history` WRITE;
/*!40000 ALTER TABLE `price_history` DISABLE KEYS */;
INSERT INTO `price_history` VALUES ('2025-06-11',1052,20000),('2025-06-11',1053,65000),('2025-06-11',1055,85000),('2025-06-11',1056,70000),('2025-06-11',1057,15000),('2025-06-11',1058,24000),('2025-06-11',1060,30000),('2025-06-11',1061,35000);
/*!40000 ALTER TABLE `price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `category_id` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name` (`product_name`),
  UNIQUE KEY `product_name_2` (`product_name`),
  UNIQUE KEY `constraint_name` (`product_name`),
  UNIQUE KEY `product_name_3` (`product_name`),
  UNIQUE KEY `product_name_4` (`product_name`),
  UNIQUE KEY `uq_product_name_constraint` (`product_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1052,'food',20000,'12322','1749493909800Screenshot 2025-05-21 195608.png',11,1),(1053,'food2',65000,'123456','1749286277427food_2.png',11,1),(1055,'Taco gà cà ridddd',85000,'Taco gàddd','1749309794716food_6.png',10,1),(1056,'food5',70000,'food5','1749306345945food_9.png',10,1),(1057,'food6',15000,'food6','1749286478207food_6.png',13,0),(1058,'food8',24000,'222','1749300499292food_32.png',12,0),(1060,'food9',30000,'23234','1749302474211food_17.png',13,0),(1061,'Nui Phô Mai Đút Lò',35000,'Thơm béo ngậy','1749389569157food_25.png',11,0),(1070,'asdfadsf',33333,'33333','1749662695255food_1.png',10,1),(1071,'asdasddf',333111,'asdfadf','1749662706191food_13.png',10,1),(1072,'asdfdf',232323,'asdfadf','1749662714071food_14.png',10,1),(1074,'adsfadsf',33333,'asdfadsf','1749662731756food_16.png',10,1),(1077,'sdfasdf',33333,'asdfasdf','1749895222345parcel_icon.png',10,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL,
  `availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,0),(2,0),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(1024) NOT NULL,
  `type` int NOT NULL,
  `cart` json DEFAULT (json_object()),
  PRIMARY KEY (`username`),
  CONSTRAINT `users_chk_1` CHECK ((`type` in (0,1,2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','harryyyyyy','adsfadf',NULL,'$2b$10$FhRcePsGTjIKLH8kKX0Bo.KT11zP/3fMzuvwxgz/NwouqHoHYc.S6',0,'{}'),('admin1','nghia','vu','','$2b$10$zng8Y.xV8Sc7Rs.ObC2fNug0/dvtMZ.mhEHroiENv1bGTi2V28Mkq',0,'{}'),('hongminh','hong','minh','','$2b$10$MiWy0Nqyii1pxfPLHRvSxeC02I/ExwhTnSas.WV/InMwCbibmeKc6',0,'{}'),('minhnhu','minh','nhu','','$2b$10$.tfUD62JTLASK2Txa8J4eutVgOYvNdvowQZZ70ZhyVfd6Zl51JJuS',2,'{}'),('nghiavu','Nghia','Vu',NULL,'$2b$10$JU8DosXDMfa6WR1ET.zLOenSiFcZ8P4gQPnteKnverLFx9ktA5Cpy',2,'{}'),('staff1','tiendd','khoaddd','0913353547','$2b$10$kp/uTvIBKC/SoLcJSh8EFOGsQwyNt6SklQ3mO1/fHNcXTRek3I/wa',1,'{\"1052\": 2, \"1053\": 2, \"1055\": 1, \"1056\": 1}'),('thieuthi','thieu','thi','','$2b$10$Ju0WsXufCTjgPR5zz6ewXeY83NpA8b.eAb/UujbnW.8m..0I4bGmm',0,'{}'),('thitron','thi','tron','0913353543','$2b$10$M.M/K1tp6wwi/IISauxKi.IclK8kDnjQkUa3Y9M5Ma5GOfVJIfRHe',0,'{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17  4:57:04
