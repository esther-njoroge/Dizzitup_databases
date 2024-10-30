-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: dizzitup
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

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
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_of_residence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_residence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_account_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('USER','SHOP_PROVIDER','BUYER','ADMIN','COMMUNITY_MANAGER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('650b9077-9ea9-435a-bdb6-692fd1df98d2','95c834fe3ee5ad18ae6e4b9ab1aa09b1adec9ef2c13bfbe3277d45a8d7a5d0a2','2024-10-12 22:14:57.868','20240915163040_dizz_changes',NULL,NULL,'2024-10-12 22:14:57.057',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `admin_UUID_fkey` (`UUID`),
  CONSTRAINT `admin_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User` (`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `buyer_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UTID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`buyer_id`),
  KEY `buyer_UUID_fkey` (`UUID`),
  KEY `buyer_UTID_fkey` (`UTID`),
  CONSTRAINT `buyer_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User` (`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_manager`
--

DROP TABLE IF EXISTS `community_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_manager` (
  `community_manager_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`community_manager_id`),
  KEY `community_manager_UUID_fkey` (`UUID`),
  CONSTRAINT `community_manager_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User` (`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_manager`
--

LOCK TABLES `community_manager` WRITE;
/*!40000 ALTER TABLE `community_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_provider`
--

DROP TABLE IF EXISTS `shop_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_provider` (
  `shop_provider_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_products_types` enum('goods','digital','services') COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_neighbourhood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_geolocation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_african_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_website` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_facebook_page` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_instagram` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_whatsapp_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_telegram_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_dizzitup_e_store` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USID`),
  UNIQUE KEY `shop_provider_shop_email_key` (`shop_email`),
  KEY `shop_provider_UUID_fkey` (`UUID`),
  CONSTRAINT `shop_provider_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User` (`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_provider`
--

LOCK TABLES `shop_provider` WRITE;
/*!40000 ALTER TABLE `shop_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transactions_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UTID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` enum('Pay_bill','Buy_goods','Buy_gift_cards','Send_money','Buy_voucher','Subscribe_Visa_Mastercard','Save_money','Borrow_money','Lend_money') COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_UUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`UTID`),
  KEY `transactions_UUID_fkey` (`UUID`),
  KEY `transactions_USID_fkey` (`USID`),
  CONSTRAINT `transactions_UUID_fkey` FOREIGN KEY (`UUID`) REFERENCES `User` (`UUID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_of_residence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_residence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_account_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('USER','SHOP_PROVIDER','BUYER','ADMIN','COMMUNITY_MANAGER') COLLATE utf8mb4_unicode_ci DEFAULT 'USER',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2024-10-15  8:23:13
