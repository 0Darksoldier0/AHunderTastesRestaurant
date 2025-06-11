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
INSERT INTO `online_order_details` VALUES ('1749369422118',1055,1),('1749369422118',1056,1),('1749369574043',1052,1),('1749369574043',1053,1),('1749369574043',1055,1),('1749369574043',1056,1),('1749369574043',1057,1),('1749370912542',1052,3),('1749370912542',1053,2),('1749370912542',1058,1),('1749372366965',1052,1),('1749372366965',1053,1),('1749372366965',1055,1),('1749407207875',1052,3),('1749407207875',1060,1),('1749407207875',1061,1),('1749411969680',1052,1),('1749411969680',1053,1),('1749411969680',1055,1),('1749541789632',1052,1),('1749541789632',1053,1),('1749541789632',1055,1),('1749541789632',1056,1),('1749541789632',1057,1),('1749541789632',1058,1),('1749541789632',1061,1),('1749559120841',1052,1),('1749559120841',1053,1),('1749564699297',1052,1),('1749564699297',1053,1),('1749570660791',1053,2),('1749588276760',1052,1),('1749588276760',1053,1),('1749588276760',1055,1),('1749588276760',1056,1);
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
INSERT INTO `online_orders` VALUES ('1749369422118','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"mbj\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"jkhk\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',0),('1749369574043','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',0),('1749370912542','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749372366965','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749407207875','admin','2025-06-08 00:00:00','{\"city\": \"sdfsdf\", \"ward\": \"fdsf\", \"email\": \"trungaiaiai@gmail\", \"street\": \"dfsdfsd\", \"district\": \"fdsffdsdfds\", \"lastName\": \"Tròn\", \"firstName\": \"Thi\", \"phoneNumber\": \"0123456789\"}','delivered',1),('1749411969680','nghiavu','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749541789632','admin','2025-06-10 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749559120841','admin','2025-06-10 18:26:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749564699297','nghiavu','2025-06-10 21:09:17','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1),('1749570660791','admin','2025-06-10 20:02:56','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',0),('1749588276760','nghiavu','2025-06-11 02:21:08','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',1);
/*!40000 ALTER TABLE `online_orders` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1052,'food',20000,'12322','1749493909800Screenshot 2025-05-21 195608.png',11,1),(1053,'food2',65000,'123456','1749286277427food_2.png',11,1),(1055,'Taco gà cà ri',85000,'Taco gà','1749309794716food_6.png',10,1),(1056,'food5',70000,'food5','1749306345945food_9.png',10,1),(1057,'food6',15000,'food6','1749286478207food_6.png',13,1),(1058,'food8',24000,'222','1749300499292food_32.png',12,1),(1060,'food9',30000,'23234','1749302474211food_17.png',13,0),(1061,'Nui Phô Mai Đút Lò',35000,'Thơm béo ngậy','1749389569157food_25.png',11,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('admin','adsf','adsfadf','$2b$10$FhRcePsGTjIKLH8kKX0Bo.KT11zP/3fMzuvwxgz/NwouqHoHYc.S6',0,'{}'),('nghiavu','Nghia','Vu','$2b$10$JU8DosXDMfa6WR1ET.zLOenSiFcZ8P4gQPnteKnverLFx9ktA5Cpy',2,'{}');
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

-- Dump completed on 2025-06-11  9:50:15
