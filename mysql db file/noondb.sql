-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 31.170.162.152    Database: webinfinity_noon
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.11-MariaDB-cll-lve

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `dateCreated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin','$2b$10$SKf41MV0GAtdNZ3yRa0UBeCKWi9j1adh1KKHk6cI9JxrMwAHTa5SS','admin','2025-04-03');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badgeList`
--

DROP TABLE IF EXISTS `badgeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badgeList` (
  `badgeList_id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeList_icon` varchar(255) DEFAULT NULL,
  `badgeList_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`badgeList_id`),
  KEY `status_id` (`status_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `badgeList_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `badgeList_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `badgeList_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badgeList`
--

LOCK TABLES `badgeList` WRITE;
/*!40000 ALTER TABLE `badgeList` DISABLE KEYS */;
INSERT INTO `badgeList` VALUES (1,'https://cdn-icons-png.flaticon.com/128/3954/3954386.png','High Rated Seller',1,1,1),(2,'https://cdn-icons-png.flaticon.com/128/5359/5359689.png','Cash on Delivery',1,1,1),(3,'https://cdn-icons-png.flaticon.com/128/9578/9578794.png','Secure Transaction',1,1,1);
/*!40000 ALTER TABLE `badgeList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bank_id`),
  UNIQUE KEY `bank_name` (`bank_name`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Mashreq Bank',1),(2,'ADCB Bank',1);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple',1),(2,'Threadz By Ajooni',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `id` int(10) NOT NULL,
  `title` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `deadlineDate` date DEFAULT NULL,
  `hours` text DEFAULT NULL,
  `addDate` date DEFAULT NULL,
  `worker` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int(15) NOT NULL,
  `client` text DEFAULT NULL,
  `clientDetails` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `postalCode` text DEFAULT NULL,
  `clientDateCreated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (0,'','','','Polska','','','','2025-04-03'),(0,'','','','Polska','','','','2025-04-03'),(0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-04-04'),(0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-04-04');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reviews`
--

DROP TABLE IF EXISTS `customer_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `customer_reviews_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `customer_reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reviews`
--

LOCK TABLES `customer_reviews` WRITE;
/*!40000 ALTER TABLE `customer_reviews` DISABLE KEYS */;
INSERT INTO `customer_reviews` VALUES (1,1,101,5.0,'Amazing product!','2025-04-02 05:47:54',1),(2,1,102,4.5,'Very good, but can be improved.','2025-04-02 05:47:54',1),(3,1,103,5.0,'Loved it!','2025-04-02 05:47:54',1),(4,1,104,4.0,'Good product!','2025-04-02 05:47:54',1),(5,2,105,4.0,'Nice quality!','2025-04-02 05:47:54',1),(6,2,106,3.5,'Could be better.','2025-04-02 05:47:54',1),(7,2,107,4.5,'Good performance!','2025-04-02 05:47:54',1),(8,2,108,4.0,'Worth it.','2025-04-02 05:47:54',1),(9,2,109,4.0,'Solid purchase.','2025-04-02 05:47:54',1);
/*!40000 ALTER TABLE `customer_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_tag`
--

DROP TABLE IF EXISTS `delivery_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_tag` (
  `delivery_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_tag_name` varchar(255) DEFAULT NULL,
  `delivery_day_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`delivery_tag_id`),
  KEY `status_id` (`status_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `delivery_tag_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `delivery_tag_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `delivery_tag_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_tag`
--

LOCK TABLES `delivery_tag` WRITE;
/*!40000 ALTER TABLE `delivery_tag` DISABLE KEYS */;
INSERT INTO `delivery_tag` VALUES (1,'express','Get it Tomorrow',NULL,1,1),(2,'express','Get it Tomorrow',NULL,2,1);
/*!40000 ALTER TABLE `delivery_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `header_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_name` varchar(255) NOT NULL,
  `header_icon` varchar(255) DEFAULT NULL,
  `header_url` varchar(500) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`header_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `header_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,'noon',NULL,'logo',1,'2025-04-02 11:01:02',1),(2,'Delivery Location','uae_flag.png','delivery-location',2,'2025-04-02 11:01:02',1),(3,'Search',NULL,'search',3,'2025-04-02 11:01:02',1),(4,'Language',NULL,'language',4,'2025-04-02 11:01:02',1),(5,'Log in','https://cdn-icons-png.flaticon.com/128/4929/4929629.png','log-in',5,'2025-04-02 11:01:02',1),(6,'Wishlist','wishlist_icon.png','wishlist',6,'2025-04-02 11:01:02',1),(7,'Cart','cart_icon.png','cart',7,'2025-04-02 11:01:02',1);
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_settings`
--

DROP TABLE IF EXISTS `header_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header_settings` (
  `id` int(11) NOT NULL CHECK (`id` = 1),
  `background_color` varchar(7) DEFAULT '#ffcc00',
  `text_color` varchar(7) DEFAULT '#000000',
  `hover_color` varchar(7) DEFAULT '#f0f0f0',
  `search_placeholder` varchar(255) DEFAULT 'What are you looking for?',
  `delivery_location` varchar(255) DEFAULT 'Dubai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_settings`
--

LOCK TABLES `header_settings` WRITE;
/*!40000 ALTER TABLE `header_settings` DISABLE KEYS */;
INSERT INTO `header_settings` VALUES (1,'#ffcc00','#000000','#f0f0f0','What are you looking for?','Dubai','2025-04-02 12:00:10');
/*!40000 ALTER TABLE `header_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `images_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moving_tag`
--

DROP TABLE IF EXISTS `moving_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moving_tag` (
  `moving_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `moving_tag_icon` varchar(255) DEFAULT NULL,
  `moving_tag_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`moving_tag_id`),
  KEY `status_id` (`status_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `moving_tag_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `moving_tag_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `moving_tag_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moving_tag`
--

LOCK TABLES `moving_tag` WRITE;
/*!40000 ALTER TABLE `moving_tag` DISABLE KEYS */;
INSERT INTO `moving_tag` VALUES (1,'https://cdn-icons-png.flaticon.com/128/5637/5637217.png','Free Delivery',5,1,1),(2,'https://cdn-icons-png.flaticon.com/128/11712/11712454.png','Selling out fast',9,2,1);
/*!40000 ALTER TABLE `moving_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `offer_details` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`offer_id`),
  KEY `status_id` (`status_id`),
  KEY `bank_id` (`bank_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`bank_id`) ON DELETE CASCADE,
  CONSTRAINT `offers_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `offers_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,1,NULL,1,'Earn 5% cashback with the Mashreq noon Credit Card',5.00,1),(2,2,NULL,2,'Earn 15% cashback with the Mashreq noon Credit Card',15.00,1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `client_id` int(15) NOT NULL,
  `date` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` text DEFAULT NULL,
  `workerName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (0,0,'2025-04-03',0,'',NULL),(0,0,'2025-04-03',0,'',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_category`
--

DROP TABLE IF EXISTS `parent_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `sub_sub_category` int(11) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `category_url` varchar(255) DEFAULT NULL,
  `parent_category_img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  UNIQUE KEY `category_url` (`category_url`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `parent_category_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_category`
--

LOCK TABLES `parent_category` WRITE;
/*!40000 ALTER TABLE `parent_category` DISABLE KEYS */;
INSERT INTO `parent_category` VALUES (1,'Electronics',0,0,1,1,'electronics',NULL),(2,'Mobiles & Accessories',1,0,1,1,'mobiles-&-accessories',NULL),(3,'iPhones',2,0,2,1,'iphones',NULL),(4,'iPhone 16 Series',3,3,1,1,'iphone-16-series',NULL),(5,'iPhone 16 Pro',4,4,2,1,'iphone-16-pro',NULL),(6,'Women\'s Fashion',0,0,3,1,'women\'s-fashion',NULL),(7,'Clothing',6,0,2,1,'clothing',NULL),(8,'Dresses',7,0,2,1,'dresses',NULL),(9,'Work Dresses',8,8,4,1,'work-dresses',NULL);
/*!40000 ALTER TABLE `parent_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `pricing_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pricing_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `pricing_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `pricing` VALUES (1,1,5015.00,5549.00,534.00,0.00,1),(2,2,104.00,709.00,605.00,0.00,1);
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sellers`
--

DROP TABLE IF EXISTS `product_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sellers` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`seller_id`),
  KEY `status_id` (`status_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `product_sellers_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `product_sellers_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  CONSTRAINT `product_sellers_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sellers`
--

LOCK TABLES `product_sellers` WRITE;
/*!40000 ALTER TABLE `product_sellers` DISABLE KEYS */;
INSERT INTO `product_sellers` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `product_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `status_id` (`status_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `product_tags_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_view`
--

DROP TABLE IF EXISTS `product_view`;
/*!50001 DROP VIEW IF EXISTS `product_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_view` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `seo_url`,
 1 AS `description`,
 1 AS `category_name`,
 1 AS `brand_name`,
 1 AS `price`,
 1 AS `original_price`,
 1 AS `discount`,
 1 AS `shipping_fee`,
 1 AS `image_url`,
 1 AS `review_count`,
 1 AS `review_rating`,
 1 AS `review_ranking`,
 1 AS `ranking_value`,
 1 AS `tag_name`,
 1 AS `delivery_tag_name`,
 1 AS `delivery_day_name`,
 1 AS `moving_tag_icon`,
 1 AS `moving_tag_name`,
 1 AS `seller_name`,
 1 AS `seller_rating`,
 1 AS `positive_rating`,
 1 AS `partner_since`,
 1 AS `item_as_described`,
 1 AS `bank_name`,
 1 AS `offer_details`,
 1 AS `offer_discount`,
 1 AS `promo_code`,
 1 AS `promo_details`,
 1 AS `promo_discount`,
 1 AS `valid_from`,
 1 AS `valid_till`,
 1 AS `badgeList_icon`,
 1 AS `badgeList_name`,
 1 AS `variant_colour_name`,
 1 AS `variant_colour_img_url`,
 1 AS `variant_memory_name`,
 1 AS `variant_version_name`,
 1 AS `status_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `seo_url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `status_id` (`status_id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 16 Pro 512GB White Titanium 5G','iphone-16-pro-512gb-white-titanium-5g','Middle East Version with FaceTime',5,1,1),(2,'Button Detail Belted Dress','button-detail-belted-dress','Elegant white dress with detailed belt design',9,2,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promo_id` int(11) NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(50) NOT NULL,
  `promo_details` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`promo_id`),
  UNIQUE KEY `promo_code` (`promo_code`),
  KEY `status_id` (`status_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `parent_category` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,'SAVEBIG','Extra 10% off!',10.00,'2025-04-01','2025-05-30',NULL,1,1),(2,'ADCBONE','Extra 20% off!',20.00,'2025-04-01','2025-05-30',NULL,2,1);
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `ranking_value` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ranking_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `ranking_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
INSERT INTO `ranking` VALUES (1,1,'Top 5',1),(2,2,'Top 10',1);
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `review_count` int(11) DEFAULT NULL,
  `review_rating` decimal(3,1) DEFAULT NULL,
  `review_ranking` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,4,5.0,'Top Rated',1),(2,2,5,4.0,'Best Seller',1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(255) NOT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `positive_rating` int(11) DEFAULT NULL,
  `partner_since` date DEFAULT NULL,
  `item_as_described` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Apple Deals',4.8,98,'2025-03-31',100,1),(2,'Noon Fashion Group',4.2,74,'2025-03-31',80,1);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'active'),(2,'not active'),(3,'out of stock'),(4,'pending');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Best Seller',1),(2,'Top Rated',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_colour`
--

DROP TABLE IF EXISTS `variant_colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_colour` (
  `variant_colour_id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_colour_name` varchar(255) DEFAULT NULL,
  `variant_colour_img_url` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`variant_colour_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variant_colour_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `variant_colour_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_colour`
--

LOCK TABLES `variant_colour` WRITE;
/*!40000 ALTER TABLE `variant_colour` DISABLE KEYS */;
INSERT INTO `variant_colour` VALUES (1,'Desert Titanium',NULL,1,1),(2,'Black Titanium',NULL,1,1),(3,'Natural Titanium',NULL,1,1),(4,'White Titanium',NULL,1,1);
/*!40000 ALTER TABLE `variant_colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_memory`
--

DROP TABLE IF EXISTS `variant_memory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_memory` (
  `variant_memory_id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_memory_name` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`variant_memory_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variant_memory_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `variant_memory_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_memory`
--

LOCK TABLES `variant_memory` WRITE;
/*!40000 ALTER TABLE `variant_memory` DISABLE KEYS */;
INSERT INTO `variant_memory` VALUES (1,'1 TB',1,1),(2,'128 GB',1,1),(3,'256 GB',1,1),(4,'512 GB',1,1);
/*!40000 ALTER TABLE `variant_memory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_version`
--

DROP TABLE IF EXISTS `variant_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_version` (
  `variant_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_version_name` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`variant_version_id`),
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variant_version_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE,
  CONSTRAINT `variant_version_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_version`
--

LOCK TABLES `variant_version` WRITE;
/*!40000 ALTER TABLE `variant_version` DISABLE KEYS */;
INSERT INTO `variant_version` VALUES (1,'International Version',1,1),(2,'Middle East Version',1,1),(3,'USA Version',1,1);
/*!40000 ALTER TABLE `variant_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `product_view`
--

/*!50001 DROP VIEW IF EXISTS `product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`webinfinity`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_view` AS with first_image as (select `img`.`image_id` AS `image_id`,`img`.`product_id` AS `product_id`,`img`.`image_url` AS `image_url`,`img`.`sort_order` AS `sort_order`,`img`.`status_id` AS `status_id`,`img`.`rn` AS `rn` from (select `images`.`image_id` AS `image_id`,`images`.`product_id` AS `product_id`,`images`.`image_url` AS `image_url`,`images`.`sort_order` AS `sort_order`,`images`.`status_id` AS `status_id`,row_number() over ( partition by `images`.`product_id` order by `images`.`image_url`) AS `rn` from `images`) `img` where `img`.`rn` = 1), first_tag as (select `pt`.`product_id` AS `product_id`,`t`.`tag_name` AS `tag_name` from (`product_tags` `pt` join `tags` `t` on(`pt`.`tag_id` = `t`.`tag_id`)) group by `pt`.`product_id`), first_delivery_tag as (select `dt`.`delivery_tag_id` AS `delivery_tag_id`,`dt`.`delivery_tag_name` AS `delivery_tag_name`,`dt`.`delivery_day_name` AS `delivery_day_name`,`dt`.`category_id` AS `category_id`,`dt`.`product_id` AS `product_id`,`dt`.`status_id` AS `status_id`,`dt`.`rn` AS `rn` from (select `delivery_tag`.`delivery_tag_id` AS `delivery_tag_id`,`delivery_tag`.`delivery_tag_name` AS `delivery_tag_name`,`delivery_tag`.`delivery_day_name` AS `delivery_day_name`,`delivery_tag`.`category_id` AS `category_id`,`delivery_tag`.`product_id` AS `product_id`,`delivery_tag`.`status_id` AS `status_id`,row_number() over ( partition by `delivery_tag`.`product_id` order by `delivery_tag`.`delivery_tag_name`) AS `rn` from `delivery_tag`) `dt` where `dt`.`rn` = 1), first_moving_tag as (select `mt`.`moving_tag_id` AS `moving_tag_id`,`mt`.`moving_tag_icon` AS `moving_tag_icon`,`mt`.`moving_tag_name` AS `moving_tag_name`,`mt`.`category_id` AS `category_id`,`mt`.`product_id` AS `product_id`,`mt`.`status_id` AS `status_id`,`mt`.`rn` AS `rn` from (select `moving_tag`.`moving_tag_id` AS `moving_tag_id`,`moving_tag`.`moving_tag_icon` AS `moving_tag_icon`,`moving_tag`.`moving_tag_name` AS `moving_tag_name`,`moving_tag`.`category_id` AS `category_id`,`moving_tag`.`product_id` AS `product_id`,`moving_tag`.`status_id` AS `status_id`,row_number() over ( partition by `moving_tag`.`product_id` order by `moving_tag`.`moving_tag_name`) AS `rn` from `moving_tag`) `mt` where `mt`.`rn` = 1), first_seller as (select `seller`.`product_id` AS `product_id`,`seller`.`seller_id` AS `seller_id`,`seller`.`seller_name` AS `seller_name`,`seller`.`rating` AS `rating`,`seller`.`positive_rating` AS `positive_rating`,`seller`.`partner_since` AS `partner_since`,`seller`.`item_as_described` AS `item_as_described`,`seller`.`status_id` AS `status_id` from (select `ps`.`product_id` AS `product_id`,`s`.`seller_id` AS `seller_id`,`s`.`seller_name` AS `seller_name`,`s`.`rating` AS `rating`,`s`.`positive_rating` AS `positive_rating`,`s`.`partner_since` AS `partner_since`,`s`.`item_as_described` AS `item_as_described`,`s`.`status_id` AS `status_id` from (`product_sellers` `ps` join `sellers` `s` on(`ps`.`seller_id` = `s`.`seller_id`)) where `ps`.`seller_id` is not null) `seller` group by `seller`.`product_id`), first_offer as (select `o`.`offer_id` AS `offer_id`,`o`.`bank_id` AS `bank_id`,`o`.`category_id` AS `category_id`,`o`.`product_id` AS `product_id`,`o`.`offer_details` AS `offer_details`,`o`.`discount_percentage` AS `discount_percentage`,`o`.`status_id` AS `status_id`,`o`.`rn` AS `rn` from (select `offers`.`offer_id` AS `offer_id`,`offers`.`bank_id` AS `bank_id`,`offers`.`category_id` AS `category_id`,`offers`.`product_id` AS `product_id`,`offers`.`offer_details` AS `offer_details`,`offers`.`discount_percentage` AS `discount_percentage`,`offers`.`status_id` AS `status_id`,row_number() over ( partition by `offers`.`product_id` order by `offers`.`discount_percentage` desc) AS `rn` from `offers`) `o` where `o`.`rn` = 1), first_promo as (select `promo`.`promo_id` AS `promo_id`,`promo`.`promo_code` AS `promo_code`,`promo`.`promo_details` AS `promo_details`,`promo`.`discount_percentage` AS `discount_percentage`,`promo`.`valid_from` AS `valid_from`,`promo`.`valid_till` AS `valid_till`,`promo`.`category_id` AS `category_id`,`promo`.`product_id` AS `product_id`,`promo`.`status_id` AS `status_id`,`promo`.`rn` AS `rn` from (select `promotions`.`promo_id` AS `promo_id`,`promotions`.`promo_code` AS `promo_code`,`promotions`.`promo_details` AS `promo_details`,`promotions`.`discount_percentage` AS `discount_percentage`,`promotions`.`valid_from` AS `valid_from`,`promotions`.`valid_till` AS `valid_till`,`promotions`.`category_id` AS `category_id`,`promotions`.`product_id` AS `product_id`,`promotions`.`status_id` AS `status_id`,row_number() over ( partition by `promotions`.`product_id` order by `promotions`.`discount_percentage` desc) AS `rn` from `promotions`) `promo` where `promo`.`rn` = 1), first_badge as (select `bi`.`badgeList_id` AS `badgeList_id`,`bi`.`badgeList_icon` AS `badgeList_icon`,`bi`.`badgeList_name` AS `badgeList_name`,`bi`.`category_id` AS `category_id`,`bi`.`product_id` AS `product_id`,`bi`.`status_id` AS `status_id`,`bi`.`rn` AS `rn` from (select `badgeList`.`badgeList_id` AS `badgeList_id`,`badgeList`.`badgeList_icon` AS `badgeList_icon`,`badgeList`.`badgeList_name` AS `badgeList_name`,`badgeList`.`category_id` AS `category_id`,`badgeList`.`product_id` AS `product_id`,`badgeList`.`status_id` AS `status_id`,row_number() over ( partition by `badgeList`.`product_id` order by `badgeList`.`badgeList_name`) AS `rn` from `badgeList`) `bi` where `bi`.`rn` = 1), first_variant_colour as (select `v`.`variant_colour_id` AS `variant_colour_id`,`v`.`variant_colour_name` AS `variant_colour_name`,`v`.`variant_colour_img_url` AS `variant_colour_img_url`,`v`.`product_id` AS `product_id`,`v`.`status_id` AS `status_id`,`v`.`rn` AS `rn` from (select `variant_colour`.`variant_colour_id` AS `variant_colour_id`,`variant_colour`.`variant_colour_name` AS `variant_colour_name`,`variant_colour`.`variant_colour_img_url` AS `variant_colour_img_url`,`variant_colour`.`product_id` AS `product_id`,`variant_colour`.`status_id` AS `status_id`,row_number() over ( partition by `variant_colour`.`product_id` order by `variant_colour`.`variant_colour_name`) AS `rn` from `variant_colour`) `v` where `v`.`rn` = 1), first_variant_memory as (select `vm`.`variant_memory_id` AS `variant_memory_id`,`vm`.`variant_memory_name` AS `variant_memory_name`,`vm`.`product_id` AS `product_id`,`vm`.`status_id` AS `status_id`,`vm`.`rn` AS `rn` from (select `variant_memory`.`variant_memory_id` AS `variant_memory_id`,`variant_memory`.`variant_memory_name` AS `variant_memory_name`,`variant_memory`.`product_id` AS `product_id`,`variant_memory`.`status_id` AS `status_id`,row_number() over ( partition by `variant_memory`.`product_id` order by `variant_memory`.`variant_memory_name`) AS `rn` from `variant_memory`) `vm` where `vm`.`rn` = 1), first_variant_version as (select `vv`.`variant_version_id` AS `variant_version_id`,`vv`.`variant_version_name` AS `variant_version_name`,`vv`.`product_id` AS `product_id`,`vv`.`status_id` AS `status_id`,`vv`.`rn` AS `rn` from (select `variant_version`.`variant_version_id` AS `variant_version_id`,`variant_version`.`variant_version_name` AS `variant_version_name`,`variant_version`.`product_id` AS `product_id`,`variant_version`.`status_id` AS `status_id`,row_number() over ( partition by `variant_version`.`product_id` order by `variant_version`.`variant_version_name`) AS `rn` from `variant_version`) `vv` where `vv`.`rn` = 1)select `p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`p`.`seo_url` AS `seo_url`,`p`.`description` AS `description`,`c1`.`category_name` AS `category_name`,`b`.`brand_name` AS `brand_name`,`pr`.`price` AS `price`,`pr`.`original_price` AS `original_price`,`pr`.`discount` AS `discount`,`pr`.`shipping_fee` AS `shipping_fee`,`fi`.`image_url` AS `image_url`,`r`.`review_count` AS `review_count`,`r`.`review_rating` AS `review_rating`,`r`.`review_ranking` AS `review_ranking`,`rk`.`ranking_value` AS `ranking_value`,`ft`.`tag_name` AS `tag_name`,`fdt`.`delivery_tag_name` AS `delivery_tag_name`,`fdt`.`delivery_day_name` AS `delivery_day_name`,`fmt`.`moving_tag_icon` AS `moving_tag_icon`,`fmt`.`moving_tag_name` AS `moving_tag_name`,`fs`.`seller_name` AS `seller_name`,`fs`.`rating` AS `seller_rating`,`fs`.`positive_rating` AS `positive_rating`,`fs`.`partner_since` AS `partner_since`,`fs`.`item_as_described` AS `item_as_described`,`bn`.`bank_name` AS `bank_name`,`fo`.`offer_details` AS `offer_details`,`fo`.`discount_percentage` AS `offer_discount`,`fp`.`promo_code` AS `promo_code`,`fp`.`promo_details` AS `promo_details`,`fp`.`discount_percentage` AS `promo_discount`,`fp`.`valid_from` AS `valid_from`,`fp`.`valid_till` AS `valid_till`,`fb`.`badgeList_icon` AS `badgeList_icon`,`fb`.`badgeList_name` AS `badgeList_name`,`fvc`.`variant_colour_name` AS `variant_colour_name`,`fvc`.`variant_colour_img_url` AS `variant_colour_img_url`,`fvm`.`variant_memory_name` AS `variant_memory_name`,`fvv`.`variant_version_name` AS `variant_version_name`,`st`.`status_name` AS `status_name` from ((((((((((((((((((`products` `p` left join `parent_category` `c1` on(`p`.`category_id` = `c1`.`category_id`)) left join `brands` `b` on(`p`.`brand_id` = `b`.`brand_id`)) left join `pricing` `pr` on(`p`.`product_id` = `pr`.`product_id`)) left join `first_image` `fi` on(`p`.`product_id` = `fi`.`product_id`)) left join `reviews` `r` on(`p`.`product_id` = `r`.`product_id`)) left join `ranking` `rk` on(`p`.`product_id` = `rk`.`product_id`)) left join `first_tag` `ft` on(`p`.`product_id` = `ft`.`product_id`)) left join `first_delivery_tag` `fdt` on(`p`.`product_id` = `fdt`.`product_id`)) left join `first_moving_tag` `fmt` on(`p`.`product_id` = `fmt`.`product_id`)) left join `first_seller` `fs` on(`p`.`product_id` = `fs`.`product_id`)) left join `first_offer` `fo` on(`p`.`product_id` = `fo`.`product_id`)) left join `banks` `bn` on(`fo`.`bank_id` = `bn`.`bank_id`)) left join `first_promo` `fp` on(`p`.`product_id` = `fp`.`product_id`)) left join `first_badge` `fb` on(`p`.`product_id` = `fb`.`product_id`)) left join `first_variant_colour` `fvc` on(`p`.`product_id` = `fvc`.`product_id`)) left join `first_variant_memory` `fvm` on(`p`.`product_id` = `fvm`.`product_id`)) left join `first_variant_version` `fvv` on(`p`.`product_id` = `fvv`.`product_id`)) left join `status` `st` on(`p`.`status_id` = `st`.`status_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 12:18:24
