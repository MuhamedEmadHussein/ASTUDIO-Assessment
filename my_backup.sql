-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: astudio_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_values_project_id_attribute_id_index` (`project_id`,`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
INSERT INTO `attribute_values` VALUES (1,1,1,'HR','2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,2,1,'2025-02-21','2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,3,1,'2025-12-22','2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,4,1,'115870','2025-03-16 18:42:09','2025-03-16 18:42:09'),(5,1,2,'Marketing','2025-03-16 18:42:09','2025-03-16 18:42:09'),(6,2,2,'2024-12-22','2025-03-16 18:42:09','2025-03-16 18:42:09'),(7,3,2,'2025-07-30','2025-03-16 18:42:09','2025-03-16 18:42:09'),(8,4,2,'288335','2025-03-16 18:42:09','2025-03-16 18:42:09'),(9,1,3,'Finance','2025-03-16 18:42:09','2025-03-16 18:42:09'),(10,2,3,'2024-12-14','2025-03-16 18:42:09','2025-03-16 18:42:09'),(11,3,3,'2025-10-03','2025-03-16 18:42:09','2025-03-16 18:42:09'),(12,4,3,'315603','2025-03-16 18:42:09','2025-03-16 18:42:09'),(13,1,4,'IT','2025-03-16 18:42:09','2025-03-16 18:42:09'),(14,2,4,'2025-04-06','2025-03-16 18:42:09','2025-03-16 18:42:09'),(15,3,4,'2025-05-05','2025-03-16 18:42:09','2025-03-16 18:42:09'),(16,4,4,'341581','2025-03-16 18:42:09','2025-03-16 18:42:09'),(17,1,5,'HR','2025-03-16 18:42:09','2025-03-16 18:42:09'),(18,2,5,'2024-12-15','2025-03-16 18:42:09','2025-03-16 18:42:09'),(19,3,5,'2026-01-28','2025-03-16 18:42:09','2025-03-16 18:42:09'),(20,4,5,'682547','2025-03-16 18:42:09','2025-03-16 18:42:09'),(21,1,6,'Operations','2025-03-16 18:42:09','2025-03-16 18:42:09'),(22,2,6,'2024-12-31','2025-03-16 18:42:09','2025-03-16 18:42:09'),(23,3,6,'2025-04-01','2025-03-16 18:42:09','2025-03-16 18:42:09'),(24,4,6,'529833','2025-03-16 18:42:09','2025-03-16 18:42:09'),(25,1,7,'HR','2025-03-16 18:42:09','2025-03-16 18:42:09'),(26,2,7,'2025-03-28','2025-03-16 18:42:09','2025-03-16 18:42:09'),(27,3,7,'2025-08-16','2025-03-16 18:42:09','2025-03-16 18:42:09'),(28,4,7,'888006','2025-03-16 18:42:09','2025-03-16 18:42:09'),(29,1,8,'Operations','2025-03-16 18:42:09','2025-03-16 18:42:09'),(30,2,8,'2025-02-22','2025-03-16 18:42:09','2025-03-16 18:42:09'),(31,3,8,'2025-10-24','2025-03-16 18:42:09','2025-03-16 18:42:09'),(32,4,8,'223575','2025-03-16 18:42:09','2025-03-16 18:42:09'),(33,1,9,'HR','2025-03-16 18:42:09','2025-03-16 18:42:09'),(34,2,9,'2025-01-27','2025-03-16 18:42:09','2025-03-16 18:42:09'),(35,3,9,'2025-12-14','2025-03-16 18:42:09','2025-03-16 18:42:09'),(36,4,9,'240528','2025-03-16 18:42:09','2025-03-16 18:42:09'),(37,1,10,'HR','2025-03-16 18:42:09','2025-03-16 18:42:09'),(38,2,10,'2024-11-30','2025-03-16 18:42:09','2025-03-16 18:42:09'),(39,3,10,'2025-10-21','2025-03-16 18:42:09','2025-03-16 18:42:09'),(40,4,10,'528111','2025-03-16 18:42:09','2025-03-16 18:42:09');
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_name_unique` (`name`),
  KEY `attributes_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'department','select','\"[\\\"IT\\\",\\\"HR\\\",\\\"Finance\\\",\\\"Marketing\\\",\\\"Operations\\\"]\"','2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,'start_date','date',NULL,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,'end_date','date',NULL,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,'budget','number',NULL,'2025-03-16 18:42:09','2025-03-16 18:42:09');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2025_03_16_000711_create_projects_table',1),(11,'2025_03_16_000718_create_timesheets_table',1),(12,'2025_03_16_000746_create_attributes_table',1),(13,'2025_03_16_000810_create_attribute_values_table',1),(14,'2025_03_16_000952_create_project_user_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_user_id_foreign` (`user_id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES (1,3,1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,8,1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,9,1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,2,2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(5,3,2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(6,6,2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(7,11,3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(8,6,3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(9,10,3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(10,2,4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(11,5,4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(12,9,4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(13,1,5,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(14,3,5,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(15,7,5,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(16,4,6,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(17,5,6,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(18,7,6,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(19,2,7,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(20,5,7,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(21,7,7,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(22,2,8,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(23,5,8,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(24,7,8,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(25,11,9,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(26,3,9,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(27,4,9,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(28,2,10,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(29,11,10,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(30,7,10,'2025-03-16 18:42:09','2025-03-16 18:42:09');
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','active','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Animi repellendus iure qui.','active','2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,'At iusto consequatur.','completed','2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,'Eum deleniti omnis.','completed','2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,'In voluptatibus est.','pending','2025-03-16 18:42:09','2025-03-16 18:42:09'),(5,'Error deleniti qui.','completed','2025-03-16 18:42:09','2025-03-16 18:42:09'),(6,'Rerum aspernatur est.','active','2025-03-16 18:42:09','2025-03-16 18:42:09'),(7,'Quam ut repellat.','completed','2025-03-16 18:42:09','2025-03-16 18:42:09'),(8,'Inventore repellendus dignissimos.','pending','2025-03-16 18:42:09','2025-03-16 18:42:09'),(9,'Ab aspernatur error ad.','completed','2025-03-16 18:42:09','2025-03-16 18:42:09'),(10,'Maiores tenetur fugiat.','pending','2025-03-16 18:42:09','2025-03-16 18:42:09');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `hours` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesheets_user_id_foreign` (`user_id`),
  KEY `timesheets_project_id_foreign` (`project_id`),
  CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,3,2,'Ipsa dolorum rem.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,3,9,'Non qui sed dolorum.','2025-03-13',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,3,5,'Eligendi in occaecati.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,3,1,'In quia sint.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(5,3,2,'Quo asperiores maiores repudiandae.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(6,3,2,'Quibusdam dolor dignissimos sed.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(7,3,9,'Laboriosam molestias numquam et.','2025-03-11',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(8,3,9,'Voluptatem enim cumque.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(9,3,9,'Qui quos labore.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(10,3,5,'Et qui qui.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(11,3,2,'Et eum recusandae blanditiis.','2025-03-06',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(12,3,9,'Autem eos architecto eveniet.','2025-03-06',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(13,3,9,'Sed voluptates expedita dolores occaecati.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(14,3,9,'Deleniti sit earum.','2025-03-04',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(15,3,9,'Est est deleniti.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(16,3,2,'Assumenda qui quae.','2025-03-04',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(17,3,9,'Nihil voluptas.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(18,3,2,'Harum quis occaecati.','2025-02-28',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(19,3,5,'Qui voluptate recusandae nam blanditiis.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(20,3,9,'Rem sunt omnis dolorum.','2025-02-27',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(21,3,5,'Possimus id qui est minus.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(22,3,9,'Reiciendis animi omnis.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(23,3,2,'Quo magnam nisi et.','2025-02-26',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(24,3,5,'Doloribus placeat consequatur quis.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(25,3,9,'Ducimus voluptas quas.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(26,3,2,'Consequatur debitis ipsa.','2025-02-25',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(27,3,5,'Et id non.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(28,3,1,'Sed at est sed.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(29,3,2,'Iste adipisci nulla.','2025-02-24',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(30,3,9,'Est delectus officiis ab.','2025-02-21',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(31,3,1,'Voluptatem aspernatur deserunt.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(32,3,5,'Aut ea sapiente illum.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(33,3,9,'Est accusamus officiis.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(34,3,2,'Voluptatem facilis quibusdam assumenda.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(35,3,2,'Et ratione quas reiciendis.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(36,3,1,'Cumque ad modi quos.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(37,3,2,'Laboriosam eligendi fuga.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(38,3,5,'Aut placeat dolores.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(39,8,1,'Iure facilis delectus.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(40,8,1,'Cumque ipsum ut ea.','2025-03-14',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(41,8,1,'Voluptas similique quae quod.','2025-03-14',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(42,8,1,'Voluptatem enim officia.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(43,8,1,'Et quae ex eos.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(44,8,1,'Voluptatibus eligendi dolor corrupti.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(45,8,1,'Libero nesciunt labore accusantium.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(46,8,1,'Ipsa incidunt alias.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(47,8,1,'Tenetur aspernatur laboriosam recusandae.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(48,8,1,'Magnam assumenda quas.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(49,8,1,'Libero quod eum veniam.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(50,8,1,'Voluptates et sed.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(51,8,1,'Natus ullam.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(52,8,1,'Tempore sed libero veritatis.','2025-03-07',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(53,8,1,'Voluptates unde ut quia.','2025-03-06',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(54,8,1,'Iusto suscipit esse.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(55,8,1,'Similique qui assumenda.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(56,8,1,'Sequi debitis cupiditate dicta.','2025-03-05',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(57,8,1,'Minus suscipit.','2025-03-04',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(58,8,1,'Accusantium accusantium dolor commodi quod.','2025-03-04',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(59,8,1,'Et alias nesciunt.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(60,8,1,'Quisquam et quia.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(61,8,1,'Laudantium natus reiciendis.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(62,8,1,'Et porro.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(63,8,1,'Dolores incidunt voluptas aut.','2025-02-28',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(64,8,1,'Rem molestiae minus.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(65,8,1,'Maxime fugiat.','2025-02-27',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(66,8,1,'Possimus aut qui recusandae.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(67,8,1,'Optio laborum corrupti.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(68,8,1,'Excepturi sit quia explicabo.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(69,8,1,'Qui incidunt laudantium.','2025-02-26',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(70,8,1,'Ut est voluptatibus consequuntur.','2025-02-26',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(71,8,1,'Perspiciatis ut ea corporis.','2025-02-25',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(72,8,1,'Quis recusandae doloribus.','2025-02-25',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(73,8,1,'Pariatur quo a ratione.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(74,8,1,'Iste officia est beatae.','2025-02-24',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(75,8,1,'Earum eligendi sint.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(76,8,1,'Doloremque dignissimos odit ut.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(77,8,1,'Architecto quibusdam aut eos.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(78,8,1,'Nihil cum eos odio a.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(79,8,1,'Minus et quo eveniet qui.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(80,8,1,'Quia aut.','2025-02-18',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(81,8,1,'Voluptatem architecto sit.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(82,8,1,'Culpa in qui.','2025-02-17',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(83,9,4,'Ducimus tempora illum sint.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(84,9,1,'Nostrum natus dolorum.','2025-03-14',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(85,9,4,'Corrupti sed qui.','2025-03-14',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(86,9,1,'Ex velit.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(87,9,1,'Qui quod sit enim.','2025-03-13',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(88,9,4,'Dicta consequatur molestiae hic.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(89,9,4,'Labore enim perspiciatis ad ut.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(90,9,4,'Expedita quas accusamus perspiciatis.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(91,9,1,'Odio sint placeat.','2025-03-11',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(92,9,4,'Ab sit at.','2025-03-11',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(93,9,1,'Dolorem dolor at.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(94,9,4,'Quam ea a fugiat.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(95,9,4,'Nobis sequi sequi.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(96,9,4,'Non est.','2025-03-07',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(97,9,1,'Ipsam aliquid sed sequi.','2025-03-06',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(98,9,1,'Animi voluptatum.','2025-03-05',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(99,9,4,'Voluptas praesentium nostrum.','2025-03-05',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(100,9,4,'Facere atque rerum rem.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(101,9,1,'Vero et.','2025-03-04',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(102,9,4,'Mollitia nobis explicabo.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(103,9,1,'Delectus nobis impedit sit.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(104,9,4,'Consequuntur sed velit.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(105,9,4,'Doloribus pariatur.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(106,9,4,'Quis ullam quae voluptatem.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(107,9,1,'Earum velit qui in.','2025-02-28',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(108,9,1,'Ut soluta error numquam.','2025-02-27',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(109,9,1,'Quas cum et non.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(110,9,1,'Nostrum voluptatibus.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(111,9,1,'Modi quos aliquam aperiam.','2025-02-26',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(112,9,4,'Itaque consectetur error.','2025-02-26',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(113,9,1,'Voluptatum eaque est consectetur.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(114,9,1,'Eligendi libero eos nemo.','2025-02-25',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(115,9,1,'Assumenda suscipit odio.','2025-02-25',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(116,9,1,'In eveniet rerum.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(117,9,1,'Et sit velit et.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(118,9,1,'Eaque deleniti qui.','2025-02-24',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(119,9,1,'Quisquam quia consequatur.','2025-02-21',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(120,9,1,'Molestiae ea commodi.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(121,9,4,'Vel similique.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(122,9,1,'Qui amet nemo.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(123,9,4,'Ipsum doloribus iste.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(124,9,4,'Id excepturi excepturi ipsa.','2025-02-17',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(125,9,1,'Corrupti aut temporibus voluptatem.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(126,2,4,'Voluptatem ut facilis sed.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(127,2,8,'Est quibusdam nesciunt sunt eligendi.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(128,2,2,'Debitis qui qui.','2025-03-13',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(129,2,7,'Rem laudantium ab nesciunt vel.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(130,2,7,'Ad iure et.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(131,2,4,'Dolorem deserunt ab.','2025-03-12',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(132,2,4,'Maxime qui sit earum.','2025-03-12',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(133,2,4,'Quisquam animi distinctio sit.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(134,2,2,'Itaque sequi et eius possimus.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(135,2,7,'Sint et.','2025-03-11',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(136,2,7,'Est quae laudantium.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(137,2,7,'Veritatis fugit molestiae.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(138,2,2,'Reprehenderit aut eveniet.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(139,2,4,'Soluta corrupti eligendi nihil.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(140,2,8,'Ipsam adipisci nobis.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(141,2,7,'Fuga natus qui qui.','2025-03-05',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(142,2,10,'Earum repudiandae iure qui.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(143,2,7,'Et eum atque commodi.','2025-03-04',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(144,2,10,'Dolor quam.','2025-03-04',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(145,2,4,'Cupiditate eligendi aspernatur excepturi.','2025-03-03',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(146,2,4,'Error quia ducimus.','2025-03-03',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(147,2,2,'Autem aspernatur saepe omnis.','2025-02-28',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(148,2,4,'Quia molestiae et.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(149,2,10,'Id et quia.','2025-02-28',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(150,2,2,'A quia laborum iure.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(151,2,8,'Dolore itaque ea magni.','2025-02-27',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(152,2,10,'Qui tenetur nihil.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(153,2,7,'Error ut dolores cum.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(154,2,4,'Est nulla distinctio.','2025-02-25',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(155,2,10,'Maxime tempora et voluptatibus.','2025-02-25',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(156,2,10,'Amet autem.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(157,2,4,'Non occaecati.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(158,2,10,'Quia optio dolorum.','2025-02-21',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(159,2,7,'Dolore voluptas.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(160,2,2,'Molestiae est a perspiciatis ab.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(161,2,8,'Provident consequuntur.','2025-02-20',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(162,2,8,'Saepe harum rerum quisquam.','2025-02-20',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(163,2,10,'Eaque ut ipsa reprehenderit.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(164,2,10,'Quidem quam neque numquam.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(165,2,2,'Repudiandae quia consequatur dolore.','2025-02-18',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(166,2,8,'Ullam rerum aliquid ut.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(167,2,2,'Harum earum id quo.','2025-02-17',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(168,6,3,'Consequuntur sint voluptas animi accusantium.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(169,6,3,'Deserunt expedita eaque.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(170,6,2,'Modi adipisci corporis.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(171,6,2,'Culpa debitis autem rerum.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(172,6,2,'Repellat possimus omnis dolores.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(173,6,2,'Placeat nam nobis iste.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(174,6,2,'Aut placeat eaque omnis.','2025-03-11',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(175,6,2,'Nam doloremque itaque.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(176,6,2,'Error iusto velit.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(177,6,2,'Molestiae est quia ipsum fuga.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(178,6,2,'Quis ratione magnam animi rem.','2025-03-06',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(179,6,2,'Reiciendis minus odio non.','2025-03-06',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(180,6,3,'Deleniti esse occaecati deleniti.','2025-03-06',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(181,6,2,'Laborum ducimus sunt eum.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(182,6,3,'Delectus laborum rem molestiae.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(183,6,3,'Ea laudantium.','2025-03-05',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(184,6,3,'Eum qui aperiam.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(185,6,3,'Accusamus non et voluptates iusto.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(186,6,2,'Tenetur dolor.','2025-03-04',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(187,6,3,'Est modi autem.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(188,6,3,'Iste officiis eum nam.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(189,6,3,'Ipsam nemo dolorem eos fugiat.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(190,6,2,'Voluptatem vel.','2025-02-28',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(191,6,2,'Magni assumenda tenetur sit.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(192,6,3,'Omnis labore vero animi.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(193,6,3,'Eligendi vel maiores distinctio omnis.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(194,6,2,'Quaerat voluptatem repellat.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(195,6,3,'Impedit aut maiores.','2025-02-26',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(196,6,3,'Eaque non distinctio.','2025-02-25',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(197,6,2,'Distinctio et ut ea.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(198,6,3,'Beatae quia doloremque.','2025-02-25',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(199,6,2,'Eos labore et eveniet.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(200,6,3,'Ea fugit inventore dolore.','2025-02-24',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(201,6,3,'Vel rerum consectetur consectetur.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(202,6,2,'Et quae dolores.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(203,6,2,'Et provident nobis.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(204,6,3,'Beatae reprehenderit modi.','2025-02-20',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(205,6,3,'Aut qui maiores sed.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(206,6,2,'Aut quod est.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(207,6,3,'Vel velit ut.','2025-02-19',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(208,6,3,'Ad sint.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(209,6,3,'Magnam quia odio.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(210,6,2,'Iste ad qui ut.','2025-02-18',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(211,6,3,'Sed autem saepe laudantium nisi.','2025-02-17',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(212,6,3,'Expedita repellendus rerum sit.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(213,6,2,'Rerum fugiat.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(214,11,3,'Delectus qui.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(215,11,3,'Sit occaecati et in.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(216,11,3,'Neque corporis quod.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(217,11,9,'Quasi qui perspiciatis culpa.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(218,11,3,'Quidem a quia.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(219,11,10,'Voluptatem enim at.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(220,11,3,'Facere quos modi.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(221,11,10,'Nostrum et esse.','2025-03-12',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(222,11,3,'Ex explicabo explicabo.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(223,11,3,'Ut corporis perferendis neque.','2025-03-11',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(224,11,9,'Enim minus ex eum.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(225,11,3,'Dicta esse.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(226,11,9,'Aut eos dolorem.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(227,11,10,'Ad consequuntur at.','2025-03-07',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(228,11,10,'Molestiae molestias perspiciatis culpa.','2025-03-06',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(229,11,9,'Rerum numquam rerum quas.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(230,11,9,'Voluptatem ut deleniti quia.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(231,11,10,'Ipsam quod eius vitae.','2025-03-05',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(232,11,9,'Voluptates illo.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(233,11,9,'Porro ratione impedit.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(234,11,10,'Amet ipsam error quos.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(235,11,3,'Saepe sed quos dolores.','2025-03-03',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(236,11,9,'Distinctio consequuntur aut non.','2025-02-28',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(237,11,10,'Cupiditate dignissimos.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(238,11,10,'Aliquam quaerat iure perferendis.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(239,11,3,'Facere est repudiandae unde.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(240,11,10,'Vero occaecati repellendus.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(241,11,10,'In quo aut id.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(242,11,9,'Rerum ab ut.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(243,11,9,'Nihil tempore et.','2025-02-26',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(244,11,10,'Illo aliquam in.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(245,11,3,'Corporis corrupti quo aut.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(246,11,9,'Qui sint rerum ducimus.','2025-02-21',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(247,11,3,'Pariatur exercitationem aliquam quo doloremque.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(248,11,3,'Unde libero officia.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(249,11,9,'Id rerum nisi.','2025-02-20',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(250,11,10,'At voluptas.','2025-02-19',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(251,11,10,'Omnis officia quia.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(252,11,9,'Rem explicabo dignissimos officiis.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(253,11,10,'Recusandae commodi nam facere.','2025-02-18',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(254,11,3,'Harum quis sunt.','2025-02-17',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(255,10,3,'Temporibus ut ex.','2025-03-14',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(256,10,3,'Occaecati minima atque voluptatem voluptatum.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(257,10,3,'Laboriosam ipsa odio dolores.','2025-03-14',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(258,10,3,'Quis ratione.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(259,10,3,'Delectus impedit nisi sint.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(260,10,3,'Alias facilis amet.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(261,10,3,'Sapiente qui aut.','2025-03-12',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(262,10,3,'Sunt dignissimos qui.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(263,10,3,'Dolor dolorem quae.','2025-03-12',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(264,10,3,'Consequatur doloribus deserunt pariatur.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(265,10,3,'Architecto qui.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(266,10,3,'Quo est suscipit et.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(267,10,3,'Et adipisci sint.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(268,10,3,'Soluta rerum commodi expedita.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(269,10,3,'Molestias delectus at.','2025-03-07',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(270,10,3,'Doloremque architecto voluptatem quia.','2025-03-06',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(271,10,3,'Adipisci ducimus saepe soluta.','2025-03-06',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(272,10,3,'Quae error expedita voluptatum.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(273,10,3,'Qui praesentium officiis.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(274,10,3,'Minima nihil sapiente repudiandae.','2025-03-04',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(275,10,3,'Aperiam aspernatur.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(276,10,3,'Ipsa est necessitatibus.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(277,10,3,'Unde suscipit ab quis perspiciatis.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(278,10,3,'Aut quidem.','2025-02-28',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(279,10,3,'Optio optio accusantium voluptate.','2025-02-28',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(280,10,3,'Ut qui repellendus.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(281,10,3,'Qui quisquam rerum.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(282,10,3,'Numquam nobis possimus ea.','2025-02-26',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(283,10,3,'Sit aut.','2025-02-25',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(284,10,3,'Ut et et.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(285,10,3,'Quam ratione velit impedit.','2025-02-24',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(286,10,3,'Omnis eos corporis vero.','2025-02-21',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(287,10,3,'Omnis neque enim.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(288,10,3,'Maiores officia magnam rerum.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(289,10,3,'Facere et.','2025-02-20',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(290,10,3,'Iste commodi repellendus non.','2025-02-20',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(291,10,3,'Eum est.','2025-02-19',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(292,10,3,'Architecto quia at dolores.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(293,10,3,'Fugit quidem vitae ea.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(294,10,3,'Alias rerum deleniti aut.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(295,10,3,'Nisi vel officiis deserunt.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(296,10,3,'Corrupti alias ea voluptatem.','2025-02-17',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(297,10,3,'Enim et nobis.','2025-02-17',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(298,10,3,'Qui fuga exercitationem sapiente.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(299,5,8,'Possimus praesentium et molestiae.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(300,5,6,'Esse aut iusto praesentium.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(301,5,6,'Soluta eius.','2025-03-13',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(302,5,4,'Minus corporis molestias.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(303,5,4,'Totam eligendi officiis quisquam.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(304,5,7,'Rerum incidunt eligendi.','2025-03-12',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(305,5,6,'Doloremque eligendi aliquid in.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(306,5,8,'Ut accusamus facere.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(307,5,8,'Magni labore est.','2025-03-11',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(308,5,6,'Velit sint tenetur ipsum.','2025-03-10',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(309,5,6,'Cupiditate quasi qui pariatur.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(310,5,7,'Commodi dicta nostrum maxime.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(311,5,6,'Consequatur laborum.','2025-03-07',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(312,5,7,'Recusandae itaque culpa.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(313,5,6,'Quia autem voluptas.','2025-03-06',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(314,5,8,'Architecto quia.','2025-03-06',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(315,5,8,'Asperiores voluptatum non.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(316,5,8,'Assumenda numquam omnis vel.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(317,5,4,'Ut est quia iste.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(318,5,6,'Explicabo nesciunt eum qui est.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(319,5,7,'Ut repellat natus minus.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(320,5,8,'Sint aut est.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(321,5,6,'Ex consequatur dolorem.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(322,5,7,'Pariatur quia sapiente architecto accusamus.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(323,5,7,'Adipisci nihil.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(324,5,7,'Est laboriosam.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(325,5,6,'Dignissimos quos cum.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(326,5,4,'Qui neque dicta esse.','2025-02-25',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(327,5,6,'Et quam minus.','2025-02-25',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(328,5,6,'Autem excepturi dolorem officia.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(329,5,7,'Quia aut in nihil.','2025-02-24',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(330,5,6,'Et saepe commodi quibusdam.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(331,5,7,'Quis nobis voluptatem.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(332,5,6,'Qui sit quisquam doloremque.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(333,5,8,'Earum iste sapiente.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(334,5,4,'Iure aliquam est.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(335,5,8,'Ea rerum eligendi.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(336,5,7,'Sunt necessitatibus culpa consectetur.','2025-02-19',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(337,5,4,'Mollitia voluptas ratione vel.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(338,5,6,'Doloribus sit aut.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(339,5,8,'Facere ut illum reiciendis a.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(340,5,8,'Architecto velit cum suscipit.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(341,5,6,'Et facere fuga commodi quis.','2025-02-17',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(342,1,5,'Aut rem maiores et.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(343,1,5,'Hic id assumenda.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(344,1,5,'Molestiae ipsam et.','2025-03-13',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(345,1,5,'Ducimus fugiat ut.','2025-03-13',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(346,1,5,'Libero molestias et quis.','2025-03-12',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(347,1,5,'Non velit sit.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(348,1,5,'Sint reprehenderit laudantium.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(349,1,5,'Nisi exercitationem velit.','2025-03-07',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(350,1,5,'Veniam eaque animi qui sint.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(351,1,5,'Excepturi voluptatem quia.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(352,1,5,'Corrupti sint qui incidunt.','2025-03-05',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(353,1,5,'Dolore enim esse.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(354,1,5,'Perspiciatis repudiandae sit repellat.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(355,1,5,'Velit et tenetur maxime quidem.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(356,1,5,'Placeat dolorem sit ea.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(357,1,5,'Ut tenetur quod.','2025-02-28',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(358,1,5,'Ut qui necessitatibus.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(359,1,5,'Aut cupiditate consequatur.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(360,1,5,'Aut fugit neque.','2025-02-25',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(361,1,5,'Aut et optio.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(362,1,5,'Expedita dolorem quos.','2025-02-21',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(363,1,5,'Sequi natus numquam reiciendis aut.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(364,1,5,'Unde amet asperiores sed.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(365,1,5,'Quisquam vel velit aspernatur autem.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(366,1,5,'Ut odio earum.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(367,1,5,'Ducimus aperiam.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(368,1,5,'Quod aut magnam in.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(369,1,5,'Quis provident.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(370,1,5,'Doloremque cupiditate aliquid.','2025-02-18',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(371,1,5,'Sunt consequatur veniam.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(372,1,5,'Dolor quas voluptatem.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(373,1,5,'Voluptatem sit aut.','2025-02-17',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(374,7,8,'Omnis dicta et ducimus inventore.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(375,7,5,'Quae fugiat ut.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(376,7,5,'Beatae vero sequi reiciendis.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(377,7,5,'Magnam voluptatem corrupti.','2025-03-13',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(378,7,6,'Rerum ratione.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(379,7,7,'Neque ratione aut nobis.','2025-03-12',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(380,7,6,'Ipsum dignissimos odio enim.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(381,7,10,'Praesentium est occaecati et.','2025-03-11',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(382,7,6,'Ipsa voluptatem deleniti culpa.','2025-03-11',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(383,7,5,'Cupiditate et suscipit tempora.','2025-03-10',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(384,7,6,'Vero consequuntur a.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(385,7,8,'Et voluptate nulla.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(386,7,6,'Dicta reprehenderit.','2025-03-07',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(387,7,8,'Aliquid aliquam qui placeat.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(388,7,8,'Dolorem tempore accusamus non.','2025-03-07',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(389,7,7,'Non laboriosam fugiat voluptate nihil.','2025-03-06',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(390,7,10,'Et id qui consequatur.','2025-03-05',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(391,7,8,'Expedita aperiam libero.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(392,7,5,'Debitis et hic placeat.','2025-03-04',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(393,7,7,'Non et nihil.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(394,7,7,'Eveniet soluta hic ducimus.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(395,7,6,'Hic deserunt quia.','2025-03-03',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(396,7,7,'Dignissimos mollitia minima.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(397,7,5,'Et ab perferendis.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(398,7,8,'Tempore incidunt.','2025-02-27',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(399,7,10,'Qui dolores dolor.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(400,7,6,'Voluptas fugiat minus sed.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(401,7,6,'Rem accusamus.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(402,7,7,'Repellat eaque ab.','2025-02-24',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(403,7,6,'Voluptatem ut.','2025-02-21',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(404,7,6,'Iste nemo in laboriosam.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(405,7,8,'Omnis doloribus.','2025-02-20',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(406,7,8,'Quae hic et.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(407,7,6,'Atque voluptas perspiciatis modi.','2025-02-19',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(408,7,6,'Qui saepe architecto perferendis.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(409,7,5,'Non omnis aut.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(410,7,5,'Labore at quos beatae.','2025-02-18',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(411,7,7,'Ut quis molestias.','2025-02-18',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(412,7,5,'Quasi illum.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(413,4,9,'Maxime neque velit qui.','2025-03-14',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(414,4,9,'Quam qui iste.','2025-03-14',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(415,4,6,'Veritatis sapiente qui.','2025-03-14',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(416,4,9,'Similique dolorum fuga.','2025-03-13',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(417,4,9,'Voluptates id quia.','2025-03-13',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(418,4,9,'Dolores saepe.','2025-03-12',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(419,4,9,'Enim dolores non cumque.','2025-03-11',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(420,4,9,'Sunt dicta beatae omnis cum.','2025-03-11',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(421,4,9,'Et optio sequi eum.','2025-03-10',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(422,4,6,'Aspernatur dicta incidunt est.','2025-03-10',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(423,4,9,'Illum sed et animi.','2025-03-07',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(424,4,9,'Qui adipisci laborum eveniet.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(425,4,9,'Eum illum.','2025-03-06',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(426,4,6,'Labore nihil.','2025-03-06',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(427,4,6,'Ut soluta.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(428,4,6,'Error nulla molestias magni.','2025-03-05',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(429,4,9,'Nihil fugiat itaque.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(430,4,9,'Repellat dicta sunt.','2025-03-04',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(431,4,9,'Suscipit expedita delectus non quis.','2025-03-03',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(432,4,9,'Eius sequi dignissimos et tempore.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(433,4,6,'Dolores dicta unde quisquam voluptas.','2025-02-28',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(434,4,6,'Ab ut assumenda ut harum.','2025-02-27',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(435,4,9,'Vero fugiat dolorem.','2025-02-27',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(436,4,6,'Est ullam consectetur aliquid.','2025-02-26',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(437,4,6,'Incidunt excepturi incidunt.','2025-02-26',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(438,4,9,'Ea qui alias.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(439,4,9,'Sequi laudantium cupiditate maxime.','2025-02-25',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(440,4,6,'Saepe veniam fugit.','2025-02-25',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(441,4,6,'Inventore quae laudantium nam.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(442,4,6,'Dolorem qui est.','2025-02-24',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(443,4,6,'Veniam provident facere quaerat et.','2025-02-21',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(444,4,6,'Dignissimos magni est.','2025-02-21',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(445,4,6,'Rerum dolorem voluptatem ut.','2025-02-20',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(446,4,9,'Maxime est.','2025-02-20',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(447,4,9,'Tempore facilis nihil qui.','2025-02-19',2,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(448,4,6,'Harum eos dolorem.','2025-02-19',3,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(449,4,6,'Est aliquam eligendi enim.','2025-02-18',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(450,4,9,'Alias reprehenderit labore eum.','2025-02-18',4,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(451,4,6,'Doloribus debitis laudantium.','2025-02-17',1,'2025-03-16 18:42:09','2025-03-16 18:42:09'),(452,4,6,'Qui non voluptas et iusto.','2025-02-17',2,'2025-03-16 18:42:09','2025-03-16 18:42:09');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','User','admin@example.com','2025-03-16 18:42:08','$2y$12$2rPn2KNud3U0qrfwb.1Jn.4uqltatGwX0niKIbqH6TIztmuxkJP2O','KGHs8jdwJb','2025-03-16 18:42:09','2025-03-16 18:42:09'),(2,'Jaren','Price','user1@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','R5CPoQjoBB','2025-03-16 18:42:09','2025-03-16 18:42:09'),(3,'Lois','Heller','user2@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','NzCQvHOhFJ','2025-03-16 18:42:09','2025-03-16 18:42:09'),(4,'Clarabelle','Weissnat','user3@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','9alENIM3FK','2025-03-16 18:42:09','2025-03-16 18:42:09'),(5,'Kailey','Will','user4@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','hfYWLpq2nB','2025-03-16 18:42:09','2025-03-16 18:42:09'),(6,'Whitney','Hackett','user5@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','S0BXmIONSr','2025-03-16 18:42:09','2025-03-16 18:42:09'),(7,'Rolando','Hermann','user6@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','1H3pZKpxJV','2025-03-16 18:42:09','2025-03-16 18:42:09'),(8,'Lauretta','Russel','user7@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','LmEPgdaoaT','2025-03-16 18:42:09','2025-03-16 18:42:09'),(9,'Lenny','Leuschke','user8@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','hO05SQKZF6','2025-03-16 18:42:09','2025-03-16 18:42:09'),(10,'Morton','Wehner','user9@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','CLLjMTXqax','2025-03-16 18:42:09','2025-03-16 18:42:09'),(11,'Kennedi','VonRueden','user10@example.com','2025-03-16 18:42:09','$2y$12$.9ri8kaNSbDooXXJulabrefmIvgY0irEWpo6kZaVzOVaU3MaJZ8RC','Yi0tSZLoGt','2025-03-16 18:42:09','2025-03-16 18:42:09');
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

-- Dump completed on 2025-03-16 23:20:43
