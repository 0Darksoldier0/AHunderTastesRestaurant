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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
/*!40000 ALTER TABLE `in_house_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
INSERT INTO `online_order_details` VALUES ('1749369422118',1055,1),('1749369422118',1056,1),('1749369574043',1052,1),('1749369574043',1053,1),('1749369574043',1055,1),('1749369574043',1056,1),('1749369574043',1057,1),('1749370912542',1052,3),('1749370912542',1053,2),('1749370912542',1058,1),('1749372366965',1052,1),('1749372366965',1053,1),('1749372366965',1055,1),('1749407207875',1052,3),('1749407207875',1060,1),('1749407207875',1061,1),('1749411969680',1052,1),('1749411969680',1053,1),('1749411969680',1055,1),('1749541789632',1052,1),('1749541789632',1053,1),('1749541789632',1055,1),('1749541789632',1056,1),('1749541789632',1057,1),('1749541789632',1058,1),('1749541789632',1061,1),('1749559120841',1052,1),('1749559120841',1053,1),('1749564699297',1052,1),('1749564699297',1053,1),('1749570660791',1053,2),('1749588276760',1052,1),('1749588276760',1053,1),('1749588276760',1055,1),('1749588276760',1056,1),('1749745385086',1052,1),('1749745385086',1053,1),('1749745385086',1056,1),('1749751858577',1053,1),('1749751858577',1056,1),('1749751858577',1070,1),('1749751858577',1071,1),('1749752470281',1052,1),('1749752470281',1053,1),('1749752470281',1056,1),('1749752470281',1070,1),('1749752470281',1071,1),('1749752470281',1072,1),('1749753277785',1052,1),('1749753277785',1053,1),('1749753489091',1052,1),('1749753489091',1053,1),('1749753489091',1056,1),('1749753489091',1070,1),('1749753489091',1071,1),('1749753489091',1072,1),('1749881290983',1052,1),('1749881290983',1053,1),('1749881290983',1055,1),('1749881290983',1056,1),('1749881290983',1070,1),('1749881325373',1052,1),('1749881325373',1053,1),('1749881325373',1055,1),('1749881325373',1056,1),('1749881340535',1052,1),('1749881340535',1053,1),('1749881340535',1055,1),('1749881340535',1056,1),('1749881515177',1052,1),('1749881515177',1053,1),('1749881515177',1055,1),('1749881515177',1056,1),('1749882327483',1052,1),('1749882327483',1053,1),('1749882327483',1055,1),('1749882327483',1056,1),('1749882327483',1070,1),('1749882327483',1071,1),('1749882327483',1072,1),('1749882376112',1052,1),('1749882376112',1053,1),('1749882376112',1055,1),('1749882479403',1052,1),('1749882479403',1053,1),('1749882479403',1055,1),('1749882479403',1056,1),('1749892521169',1052,1),('1749892521169',1053,1),('1749892521169',1055,1),('1749892521169',1056,1),('1749892976452',1052,1),('1749892976452',1053,1),('1749892976452',1055,1),('1749893032603',1052,1),('1749893032603',1053,1),('1749893032603',1055,1),('1749893463273',1053,1),('1749893463273',1055,1),('1749893697190',1052,1),('1749893697190',1053,1),('1749893697190',1055,1),('1749893715924',1053,1),('1749893715924',1055,1),('1749893822945',1052,1),('1749893822945',1053,1),('1749893822945',1055,1),('1749894018934',1052,1),('1749894018934',1053,1),('1749894018934',1055,1),('1749894037609',1053,1),('1749894037609',1055,1),('1749895419110',1053,1),('1749895581742',1053,1),('1749895581742',1055,1),('1749897865720',1052,1),('1749897865720',1053,1),('1749897865720',1055,1),('1749897865720',1056,1),('1749897865720',1070,1),('1749897865720',1071,1),('1749897865720',1072,1),('1749897865720',1074,1);
/*!40000 ALTER TABLE `online_order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
INSERT INTO `online_orders` VALUES ('1749369422118','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"mbj\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"jkhk\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,0),('1749369574043','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749370912542','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749372366965','admin','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"de\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"feef\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749407207875','admin','2025-06-08 00:00:00','{\"city\": \"sdfsdf\", \"ward\": \"fdsf\", \"email\": \"trungaiaiai@gmail\", \"street\": \"dfsdfsd\", \"district\": \"fdsffdsdfds\", \"lastName\": \"Tròn\", \"firstName\": \"Thi\", \"phoneNumber\": \"0123456789\"}','delivered',NULL,1),('1749411969680','nghiavu','2025-06-08 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749541789632','admin','2025-06-10 00:00:00','{\"city\": \"Ho Chi Minh\", \"ward\": \"đ\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dđ\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749559120841','admin','2025-06-10 18:26:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749564699297','nghiavu','2025-06-10 21:09:17','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749570660791','admin','2025-06-10 20:02:56','{\"city\": \"Ho Chi Minh\", \"ward\": \"dfsdf\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"sdfsdf\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749588276760','nghiavu','2025-06-11 02:21:08','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749745385086','nghiavu','2025-06-12 23:22:42','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749751858577','nghiavu','2025-06-12 23:07:22','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749752470281','nghiavu','2025-06-12 23:12:28','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749753277785','nghiavu','2025-06-12 23:19:12','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749753489091','nghiavu','2025-06-12 23:20:57','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','delivered',NULL,1),('1749881290983','nghiavu','2025-06-14 13:07:23','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881325373','nghiavu','2025-06-14 13:08:17','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881340535','nghiavu','2025-06-14 13:08:54','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749881515177','nghiavu','2025-06-14 13:10:52','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882327483','nghiavu','2025-06-14 13:25:16','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882376112','nghiavu','2025-06-14 13:26:05','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749882479403','nghiavu','2025-06-14 13:27:47','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing',NULL,0),('1749892521169','admin','2025-06-14 16:14:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$B5wfrsE/OaoBrGMxSc7e9uBBiZsqEF4CCYnmXBPneD.JLB6zya4Uu',1),('1749892976452','admin','2025-06-14 16:21:09','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$G9HBidroJdkwKPjBS28GVu1CRMJ55jQusJ.zGu.MlzwNBv8pUvHZK',0),('1749893032603','admin','2025-06-14 16:21:37','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$6/Hei71W6uMtJPLwDMaStOwVHr9wQ4r1j73ES/L2OqyrVea2TgVE2',1),('1749893463273','admin','2025-06-14 16:25:12','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$foS9X9ZP/mlEAW36HRzLh.dtzw0qwVclCCop9.Fp0mAhAhNwN8eV2',1),('1749893697190','admin','2025-06-14 16:34:05','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$vPZy8x2WP0/Oj6Y6CF7PQOWXvRVuCYvm6psZbbtw/8FZsEquai89m',1),('1749893715924','admin','2025-06-14 16:27:19','{\"city\": \"Ho Chi Minh\", \"ward\": \"ss\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"ss\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$kveX/x7.DzwA8LLdMKh8fuqZ/L1b72z5IISPw9pCnD55.4nS.7SDa',1),('1749893822945','admin','2025-06-14 16:35:08','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$GHzhQieKYuXQtyWMVbqFMulS3DcRP7rNKxEcgytYpV.w.pvrchdkG',1),('1749894018934','admin','2025-06-14 16:36:46','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$L.aY.SYdXsIGC07xY17pOuWIaCmQ/2rheTHG5QP.bozWkDAurH9Ni',1),('1749894037609','admin','2025-06-14 16:29:59','{\"city\": \"Ho Chi Minh\", \"ward\": \"ddd\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"dd\", \"lastName\": \"Vu\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$8FG.edGPLafHe4.PkGu39uKpoH6xMyS2dia75jQgqLPNn8s4YmfSS',1),('1749895419110','admin','2025-06-14 16:48:26','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$WJuNYBeEZ6g.StiwH1U6LeeScjAvvKnnYyFwlMi1bsx738dsb.w3G',1),('1749895581742','admin','2025-06-14 16:49:48','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$xiOO3tw.Tg9SCjdFsmG/cu/pTIm5C0B/HBWtpYvtPqtnzm9m1Siga',1),('1749897865720','admin','2025-06-14 17:08:50','{\"city\": \"Ho Chi Minh\", \"ward\": \"d\", \"email\": \"trungaiaiai@gmail.com\", \"street\": \"9 Nguyen Thi Dinh\", \"district\": \"d\", \"lastName\": \"ddd\", \"firstName\": \"Harry\", \"phoneNumber\": \"0356461447\"}','preparing','$2b$10$alePVR5MzwHgXKlqohWdoOlk2BvtSmUxOjYKsosok/K2VmoHFdiq6',1);
/*!40000 ALTER TABLE `online_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
) ENGINE=InnoDB AUTO_INCREMENT=1093 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1052,'Bún Bò Huế',80000,'A bold, spicy beef noodle soup from Central Vietnam.\nThick round rice noodles in a lemongrass-scented beef broth with tender beef slices, pork hock, and Hue-style pork loaf. Served with fresh herbs, banana blossom, and a squeeze of lime.','175016243750128f40db1-bun-bo-hue-quy-nhon-1.jpg',11,1),(1053,'Spaghetti in Creamy Crab Sauce',129000,'Al dente spaghetti tossed in a rich, velvety cream sauce infused with real crab meat, garlic, and a hint of white wine. Finished with fresh herbs and a touch of chili for a subtle kick.','1750160613485Mi-Y-Cua-sot-kem.jpg',11,1),(1055,'Chả Giò Truyền thống',75000,'Crispy Vietnamese Egg Rolls (5 pieces)\nGolden-fried rolls stuffed with minced pork, taro, mushrooms & glass noodles. Served with fish sauce dip.','17501616538191.png',10,1),(1056,'Bánh Khọt ',65000,'Crispy rice cakes with coconut milk, shrimp & green onion, served with fresh herbs and dipping sauce.','1750161759837f3c4358a-banh-khot-vung-tau-2.jpg',10,1),(1057,'Tiramisu Cake',39000,'No description','1750159566231Tiramisu-Cake-29.jpg',13,1),(1058,'Orange Juice',35000,'No description','1750168074456photo-1600271886742-f049cd451bba.jpg',12,1),(1060,'Panna Cotta',30000,'No description\n','1750162025269cach-lam-panna-cotta-xoai-thom-beo-mm-mn-tan-chy-trong-ming_32bb9f59.jpg',13,1),(1061,' Baked Macaroni and Cheese',129000,'Perfectly cooked macaroni smothered in rich, creamy cheese sauce, topped with a generous layer of mozzarella and cheddar, then baked until bubbly and golden brown. ','1750160692975nui-dut-lo-pho-mai-5-1.jpg',11,1),(1070,'Gỏi Xoài Tôm Khô',65000,'Green Mango Salad with Dried Shrimp & Peanuts\nTangy green mango, dried shrimp, Vietnamese herbs & crushed peanuts. A zesty, crunchy delight.','17501621189182022-05-17-Goi-xoai-tom-kho-600x400.jpg',10,1),(1071,'Tôm Lăn Bột Chiên Giòn',75000,'Crispy Fried Shrimp\nJuicy shrimp battered and fried to golden perfection. Served with chili mayo or plum sauce.','1750162258554maxresdefault.jpg',10,0),(1072,'Gỏi Ngó Sen Tôm Thịt',65000,'Lotus Stem Salad with Shrimp & Pork\n\nCrunchy lotus stems, boiled shrimp and pork in a refreshing, herbaceous salad with crispy shrimp crackers.','1750168471116cach-lam-goi-ngo-sen-tom-thit-ngon.jpg',10,1),(1074,'Gỏi Bò Tái Chanh',65000,'Rare Beef Salad with Lime & Lemongrass\n\nThinly sliced rare beef “cooked” in lime juice, with onions, lemongrass, herbs, and chili. Bold and refreshing.','1750168426145unnamed.jpg',10,1),(1077,'Mineral Water',15000,'No description','1750168598470aquafina-500ml.jpg',12,1),(1078,'Royal No.9 With Tapioka',39000,'Black milk tea with caramel and tapioka\r\n','1750151001845Caramel+Bubble+Tea.jpg',12,1),(1079,'Detox Eo Thon',39000,'Combination of lemon, apple, cucumber and celery','1750159238435whhqu007_1735031979.jpg',12,1),(1080,'Pepsi',20000,'No description','1750160886338menu-nuoc-hancook-pepsi.webp',12,1),(1081,'Phở Bò',80000,'Traditional Beef Pho\r\nSlow-simmered bone broth, flat rice noodles, tender sliced beef, herbs, and onions. A timeless Vietnamese classic.','1750161091426cach-nau-pho-bo-bap-hoa-thom-ngon-dam-da-huong-vi-4.jpg',11,1),(1082,'Bún chả Hà Nội',80000,'Grilled Pork with Vermicelli & Herbs\r\nCharcoal-grilled pork served with fresh vermicelli, herbs, pickled papaya, and a savory dipping sauce.','1750161214934image-20211229181528-1.jpeg',11,1),(1083,'Cơm tấm Sườn Trứng',80000,'Broken Rice with Grilled Pork Chop & Fried Egg\r\nFragrant broken rice served with marinated pork chop, fried egg, pickles, and scallion oil.','17501612883387Honthinthnhphm1-1709800144-8583-1709800424.jpg',11,1),(1084,'Gỏi Cuốn Tôm Thịt',45000,'Fresh Spring Rolls with Shrimp & Pork (2 Rolls)\r\nRice paper rolls filled with shrimp, pork, vermicelli, and herbs. Served with peanut-hoisin dipping sauce.','1750161362064323191dd-goi-cuon-sai-gon-8.jpg',10,1),(1085,'7UP',20000,'No description','1750168720339nuoc-ngot-7-up-vi-chanh-lon-320ml-141224-192858-1734179565246.webp',12,1),(1086,'Heineken',30000,'No description','1750168774295heineken-nutrition.jpg',12,1),(1087,'Fanta',20000,'No description','175016881743818-55918f9b-1d05-41e3-ba21-8fe883e5128f.webp',12,1),(1088,'Watermelon juice',35000,'Fresh watermelon juice','1750168959321whhqu005_1735032007.jpg',12,1),(1089,'Trà Đào Cam Sả',39000,'Peach Tea with Orange & Lemongrass\r\nRefreshing iced black tea infused with sweet peach, fresh orange slices, and aromatic lemongrass. Fruity, citrusy, and lightly herbal – perfect for hot days or any time you need a mood boost.','1750169073811whhqu003_1735033834.jpg',12,1),(1090,'Chè Bà Ba',39000,'A traditional Vietnamese coconut dessert soup made with taro, sweet potato, cassava, and tapioca pearls simmered in rich, fragrant coconut milk. Served warm or chilled—comforting, creamy, and delicately sweet.','1750172782892che-ba-ba-500.jpg.jpg',13,1),(1091,'Chè Khúc Bạch',39000,'A light and refreshing Vietnamese dessert featuring silky almond-flavored panna cotta-style cubes, lychee or longan, and roasted almonds in a chilled, floral syrup. ','1750172887485190424-lam-che-khuc-bach-buffet-poseidon-04.jpg',13,1),(1092,'Bánh Cuốn Tôm Thịt ',59000,'Delicate steamed rice rolls filled with seasoned ground pork and shrimps, served with crispy shallots, fresh herbs, and a side of Vietnamese dipping sauce.','1750173228235241123-banh-cuon-buffet-poseidon-4.jpg',10,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL,
  `status` varchar(20) DEFAULT 'available',
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-17 22:32:18

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
INSERT INTO `users` VALUES ('admin','harryyyyyy','adsfadf',NULL,'$2b$10$FhRcePsGTjIKLH8kKX0Bo.KT11zP/3fMzuvwxgz/NwouqHoHYc.S6',0,'{}'),('admin1','nghia','vu','','$2b$10$zng8Y.xV8Sc7Rs.ObC2fNug0/dvtMZ.mhEHroiENv1bGTi2V28Mkq',0,'{}'),('hongminh','hong','minh','','$2b$10$MiWy0Nqyii1pxfPLHRvSxeC02I/ExwhTnSas.WV/InMwCbibmeKc6',0,'{}'),('minhnhu','minh','nhu','','$2b$10$.tfUD62JTLASK2Txa8J4eutVgOYvNdvowQZZ70ZhyVfd6Zl51JJuS',2,'{}'),('nghiavu','Nghia','Vu',NULL,'$2b$10$JU8DosXDMfa6WR1ET.zLOenSiFcZ8P4gQPnteKnverLFx9ktA5Cpy',2,'{}'),('seal','Nhu','Minh','','$2b$10$AyCBo6IJdZ8FuBF0gRlBQ.qDDR6qXUZhUAapvzL//rSJGHZ724l5i',2,'{}'),('staff1','tiendd','khoaddd','0913353547','$2b$10$kp/uTvIBKC/SoLcJSh8EFOGsQwyNt6SklQ3mO1/fHNcXTRek3I/wa',1,'{}'),('thieuthi','thieu','thi','','$2b$10$Ju0WsXufCTjgPR5zz6ewXeY83NpA8b.eAb/UujbnW.8m..0I4bGmm',0,'{}'),('thitron','thi','tron','0913353543','$2b$10$M.M/K1tp6wwi/IISauxKi.IclK8kDnjQkUa3Y9M5Ma5GOfVJIfRHe',0,'{}');
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

-- Dump completed on 2025-06-17 22:32:18
