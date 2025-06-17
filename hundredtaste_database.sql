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
INSERT INTO `in_house_order_details` VALUES ('1750149777686',1078,1,1),('1750149777686',1079,2,2),('1750149777686',1081,2,2);
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
INSERT INTO `in_house_orders` VALUES ('1750149777686','staff_minhhong',1,'2025-06-17 14:36:30','Tien Khoa',1);
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
INSERT INTO `online_order_details` VALUES ('1750149087990',1078,1),('1750149087990',1079,1),('1750149087990',1080,1),('1750151093309',1078,1),('1750151093309',1079,1),('1750151093309',1080,1),('1750151093309',1081,1),('1750151093309',1082,1),('1750151093309',1083,1);
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
INSERT INTO `online_orders` VALUES ('1750149087990','nghiavu','2025-06-17 14:30:45','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phone_number\": \"0356461425\"}','delivered','$2b$10$lkyC17Q6chkqWUNqBHwyX.yXvnIfHCD/Hgn5b3n8ybH3eJ.AvbOZe',1),('1750151093309','nghiavu','2025-06-17 14:47:28','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phone_number\": \"0356461333\"}','preparing','$2b$10$3R/0ORe9y79TotTnzEgUH.X94vPMOTZmxKc0oIluLCTVwSatxhe86',1);
/*!40000 ALTER TABLE `online_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_history`
--

DROP TABLE IF EXISTS `price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_history` (
  `_date` date NOT NULL DEFAULT (curdate()),
  `product_id` int NOT NULL,
  `product_price` double NOT NULL,
  PRIMARY KEY (`_date`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `price_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_history`
--

LOCK TABLES `price_history` WRITE;
/*!40000 ALTER TABLE `price_history` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1078,'Sandwich Thịt Bò Ngàn Lớp',35000,'Sandwich Thịt Bò Ngàn Lớp','1750145000267food_14.png',10,1),(1079,'Sữa Chua Trái Dâu',15000,'Sữa Chua Trái Dâu','1750145029745food_11.png',13,1),(1080,'Kem 3 Viên',25000,'Kem 3 Viên','1750145054660food_12.png',10,1),(1081,'Cơm Xào Chay',55000,'Cơm Xào Chay','1750145101137food_24.png',11,1),(1082,'Mỳ Ý Sốt Gà Kem',75000,'Mỳ Ý Sốt Gà Kem','1750145125738food_27.png',10,1),(1083,'Taco Cà Ri Gà',30000,'Taco Cà Ri Gà','1750145152326food_6.png',10,1),(1084,'Bún Riêu',40000,'Bún Riêu','1750145181438food_32.png',11,1),(1085,'Kem Trái Cây Châu Âu',28000,'Kem Trái Cây Châu Âu','1750145235818food_9.png',13,1),(1086,'Bánh Mỳ Truyền Thống',20000,'Bánh Mỳ Truyền Thống','1750145262841food_16.png',10,1);
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
INSERT INTO `seat` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
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
INSERT INTO `users` VALUES ('admin','harryyyyyy','adsfadf',NULL,'$2b$10$FhRcePsGTjIKLH8kKX0Bo.KT11zP/3fMzuvwxgz/NwouqHoHYc.S6',0,'{}'),('nghiavu','Nghĩa','Vũ','','$2b$10$e04m4EM.nRZcBoMNXYXViuEzLR7JreCtLn6AyL7Hw3XBixE.8EH8O',2,'{}'),('staff_minhhong','Minh','Hong','0778254589','$2b$10$Rgcnim2ojUGKHwc0SvbgtuSPVmZQB78PXm9iatG0SP5CQ2vKxeMLS',1,'{}');
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

-- Dump completed on 2025-06-17 15:56:21
