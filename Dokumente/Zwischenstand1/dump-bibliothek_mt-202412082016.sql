-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bibliothek_mt
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `isbn` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,52,'London Weimann','I will just explain to you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice very humbly: \'you had got its neck nicely straightened out, and was just possible it had finished this.','Gabriel Mueller',63.687637,'Santa Gottlieb','sapiente','2024-12-08 17:56:07','2024-12-08 17:56:07'),(2,84,'Osborne Spencer','Mouse, turning to Alice. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN.','Arvilla Rodriguez',271785991.8,'Prof. Rahsaan Barton I','totam','2024-12-08 17:56:07','2024-12-08 17:56:07'),(3,23,'Mr. Celestino Howell','When the procession moved on, three of the Queen\'s voice in the same side of the jury asked. \'That I can\'t put it more clearly,\' Alice replied in a melancholy air, and, after glaring at her hands.','Prof. Sierra Wyman DVM',4454729.35518,'Prof. Claud Okuneva','quia','2024-12-08 17:56:07','2024-12-08 17:56:07'),(4,41,'Isom Altenwerth MD','OURS they had a vague sort of way to hear the name of nearly everything there. \'That\'s the most curious thing I know. Silence all round, if you were never even introduced to a mouse, That he met in.','Christelle Casper IV',14092584.699,'Abner Lowe','dolor','2024-12-08 17:56:07','2024-12-08 17:56:07'),(5,18,'Mrs. Cecilia Strosin DDS','Alice asked in a voice of the other side, the puppy made another snatch in the other: the Duchess and the others all joined in chorus, \'Yes, please do!\' but the Hatter went on, \'What HAVE you been.','Onie Maggio Sr.',119804210.159,'Prof. Rico Conroy I','omnis','2024-12-08 17:56:07','2024-12-08 17:56:07'),(6,68,'Randy Graham','Queen. \'I never went to school in the sea, \'and in that ridiculous fashion.\' And he added in a great many teeth, so she set to work shaking him and punching him in the middle, wondering how she.','Herbert Kunde',0.98,'Ms. Camilla Rodriguez','tenetur','2024-12-08 17:56:07','2024-12-08 17:56:07'),(7,94,'Vivianne Kub','They all sat down at her feet in the direction it pointed to, without trying to make personal remarks,\' Alice said very politely, feeling quite pleased to have wondered at this, she came rather.','Prof. Alan Hartmann',26,'Ettie Hansen','et','2024-12-08 17:56:07','2024-12-08 17:56:07'),(8,45,'Estefania Crist I','And she began shrinking directly. As soon as look at them--\'I wish they\'d get the trial one way up as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then!\' roared the.','Gerardo Franecki',7.45,'Dr. Mathias Reinger Sr.','vel','2024-12-08 17:56:07','2024-12-08 17:56:07'),(9,55,'Mrs. Isabella Swaniawski','Was kindly permitted to pocket the spoon: While the Owl and the baby violently up and down, and nobody spoke for some minutes. The Caterpillar and Alice was very uncomfortable, and, as the soldiers.','Cielo Littel',21.074111663,'Mr. Manley Tromp','recusandae','2024-12-08 17:56:07','2024-12-08 17:56:07'),(10,68,'Adelle Stroman','Gryphon, and, taking Alice by the English, who wanted leaders, and had no pictures or conversations in it, and finding it very much,\' said Alice, in a natural way. \'I thought it had gone. \'Well!.','Betsy Douglas',436930.9286174,'Gene Hauck IV','dolores','2024-12-08 17:56:07','2024-12-08 17:56:07'),(11,53,'Prof. Jude Jaskolski','The baby grunted again, and we put a stop to this,\' she said to the garden at once; but, alas for poor Alice! when she had not gone far before they saw Alice coming. \'There\'s PLENTY of room!\' said.','Mckayla Upton',300,'Antonetta Pacocha','modi','2024-12-08 17:56:07','2024-12-08 17:56:07'),(12,39,'Makenzie Beatty','I fell off the fire, stirring a large one, but the Rabbit came near her, she began, rather timidly, as she spoke--fancy CURTSEYING as you\'re falling through the door, she found a little bit of the.','Blanche Parker DDS',34.34661,'Felicita Jerde IV','ducimus','2024-12-08 17:56:07','2024-12-08 17:56:07'),(13,33,'Jacinto Yost','Dormouse; \'VERY ill.\' Alice tried to say \'creatures,\' you see, as she could. \'The game\'s going on rather better now,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she could not.','Mr. Gabe Torp',186.22329674,'Domenick Hoeger','impedit','2024-12-08 17:56:07','2024-12-08 17:56:07'),(14,55,'Ms. Lacy Skiles PhD','Alice herself, and nibbled a little now and then added them up, and there she saw them, they were filled with cupboards and book-shelves; here and there was generally a frog or a watch to take MORE.','Dr. Mikayla Stracke',3295547.4436027,'Prof. Sonia Berge Sr.','et','2024-12-08 17:56:07','2024-12-08 17:56:07'),(15,54,'Jennyfer Boehm','So they had to be told so. \'It\'s really dreadful,\' she muttered to herself, \'because of his shrill little voice, the name again!\' \'I won\'t indeed!\' said the Hatter. \'It isn\'t mine,\' said the King.','Ms. Genesis Stroman',49391065.142169,'Noemy Littel DVM','omnis','2024-12-08 17:56:07','2024-12-08 17:56:07'),(16,39,'Thalia Weissnat','Bill had left off staring at the Gryphon went on, looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall do nothing of the country is, you ARE a simpleton.\' Alice did not get dry.','Ryley Lubowitz',658.15552721,'Prof. Alexane DuBuque','dolorem','2024-12-08 17:56:07','2024-12-08 17:56:07'),(17,36,'Dr. Robin Herman','White Rabbit, \'but it doesn\'t mind.\' The table was a body to cut it off from: that he had taken his watch out of the window, and one foot to the end: then stop.\' These were the verses to himself.','Alessia Dickens',141.6675004,'Aubree Boyle','voluptatibus','2024-12-08 17:56:07','2024-12-08 17:56:07'),(18,21,'Dr. Tracey Prosacco II','French mouse, come over with fright. \'Oh, I know!\' exclaimed Alice, who was peeping anxiously into its mouth and began to cry again, for she was always ready to talk about trouble!\' said the Mouse.','Eldon Williamson V',2120.94201809,'Brisa Doyle DDS','unde','2024-12-08 17:56:07','2024-12-08 17:56:07'),(19,29,'Ava Fisher','Queen to play croquet.\' Then they all cheered. Alice thought she had not a regular rule: you invented it just now.\' \'It\'s the Cheshire Cat sitting on a branch of a globe of goldfish she had got its.','Berniece Lockman',8.7,'Chadd Collins IV','sunt','2024-12-08 17:56:07','2024-12-08 17:56:07'),(20,58,'Mason Lang MD','The hedgehog was engaged in a mournful tone, \'he won\'t do a thing before, but she got up and straightening itself out again, and all the arches are gone from this morning,\' said Alice loudly. \'The.','Enrico Borer',0.69676,'Madeline Brakus DDS','consequuntur','2024-12-08 17:56:07','2024-12-08 17:56:07');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lendings`
--

DROP TABLE IF EXISTS `lendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lendings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint unsigned NOT NULL,
  `librarian_id` bigint unsigned NOT NULL,
  `borrower_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lendings`
--

LOCK TABLES `lendings` WRITE;
/*!40000 ALTER TABLE `lendings` DISABLE KEYS */;
INSERT INTO `lendings` VALUES (1,1,1,'Robert Little','2024-12-06','2024-12-20',0,'2024-12-08 17:56:07','2024-12-08 17:56:07'),(2,2,2,'Prof. Desmond Kautzer III','2024-12-02','2024-12-25',0,'2024-12-08 17:56:07','2024-12-08 17:56:07');
/*!40000 ALTER TABLE `lendings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarians`
--

DROP TABLE IF EXISTS `librarians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarians` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e-mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarians`
--

LOCK TABLES `librarians` WRITE;
/*!40000 ALTER TABLE `librarians` DISABLE KEYS */;
INSERT INTO `librarians` VALUES (1,'gwendolyn35','kschimmel@hotmail.com','Ida','Pollich','$2y$12$CmsBqSMQtlsn/nHgRpVXZueUmJWzbplEKAYm69UJDCcQwg5dQ/pri','2024-12-08 17:56:07','2024-12-08 17:56:07'),(2,'tristin77','nfadel@kulas.org','Katherine','Hirthe','$2y$12$8aviDvWFReUQQhHgcZzBs.YQ2E90yhqjzN.PuTDnPCMuw45nIpv7a','2024-12-08 17:56:07','2024-12-08 17:56:07'),(3,'therese.schmeler','wmurphy@schumm.com','Betsy','Mitchell','$2y$12$tQ/9xEDsMVkHf8wmlbRsme5StPh3QVMT/qwhm1uBdK1bmWjHWZ5zK','2024-12-08 17:56:07','2024-12-08 17:56:07'),(4,'erdman.peggie','emmalee.stanton@carroll.com','Fanny','Dach','$2y$12$.RXbG76DgOmO0eDl8/d2m..jC/xqx.3o/YL1s7TyCh2woYbeRWkOW','2024-12-08 17:56:07','2024-12-08 17:56:07');
/*!40000 ALTER TABLE `librarians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_12_02_122745_create_books_table',1),(5,'2024_12_02_122807_create_librarians_table',1),(6,'2024_12_02_122821_create_lendings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bibliothek_mt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 20:16:50
