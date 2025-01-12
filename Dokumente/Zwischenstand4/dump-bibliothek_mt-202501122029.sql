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
INSERT INTO `books` VALUES (1,58,'Miss Camille Wiegand DVM','Alice to herself, being rather proud of it: for she felt that it was quite pale (with passion, Alice thought), and it was over at last: \'and I do it again and again.\' \'You are old,\' said the Cat. \'I.','Jacinto Balistreri',280225,'Lesly Farrell','aperiam','2024-12-08 18:58:12','2024-12-08 18:58:12'),(2,1,'Ms. Carolanne Mueller','King, with an M, such as mouse-traps, and the little door: but, alas! the little golden key and hurried upstairs, in great fear lest she should push the matter on, What would become of it; then.','Tony Abernathy',104984.6918374,'Vella Ortiz','vel','2024-12-08 18:58:12','2024-12-08 18:58:12'),(3,83,'Monte Hegmann','I\'ll stay down here! It\'ll be no sort of people live about here?\' \'In THAT direction,\' the Cat went on, yawning and rubbing its eyes, \'Of course, of course; just what I say,\' the Mock Turtle.','Jamir Bins',71362.20502103,'Theodora Berge','et','2024-12-08 18:58:12','2024-12-08 18:58:12'),(4,60,'Abraham Kuhic','Alice, who was peeping anxiously into its nest. Alice crouched down among the party. Some of the busy farm-yard--while the lowing of the Nile On every golden scale! \'How cheerfully he seems to grin.','Miss Victoria Nikolaus',0,'Mr. Raphael Grant Jr.','sequi','2024-12-08 18:58:12','2024-12-08 18:58:12'),(5,91,'Prof. Van Dickens III','Rabbit angrily. \'Here! Come and help me out of the ground--and I should be free of them didn\'t know that you\'re mad?\' \'To begin with,\' said the King. (The jury all looked so good, that it led into a.','Yoshiko Mohr',4.784,'Adolphus Wolff','accusantium','2024-12-08 18:58:12','2024-12-08 18:58:12'),(6,74,'Hilma Greenholt','I can reach the key; and if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a growl, And concluded the banquet--] \'What.','Mr. Alvis King',61567,'Verna Moen','voluptas','2024-12-08 18:58:12','2024-12-08 18:58:12'),(7,64,'Ettie Fadel V','It doesn\'t look like one, but it makes rather a hard word, I will just explain to you how it was all about, and called out to be a grin, and she thought it would be a comfort, one way--never to be.','Ariane Flatley DDS',176932.08545817,'Adeline Medhurst','et','2024-12-08 18:58:12','2024-12-08 18:58:12'),(8,13,'Prof. Carmela Weimann','Alice noticed, had powdered hair that curled all over with William the Conqueror.\' (For, with all their simple sorrows, and find a thing,\' said the King. The next thing is, to get dry very soon.','Keagan Cronin',20890461.695,'Tyshawn Lakin','consequatur','2024-12-08 18:58:12','2024-12-08 18:58:12'),(9,16,'Shanel Dickens Sr.','Hardly knowing what she was nine feet high. \'Whoever lives there,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted much to know, but the three gardeners instantly threw.','Dr. Tyra Fadel III',1,'Ms. Lillie Schmeler','voluptatum','2024-12-08 18:58:12','2024-12-08 18:58:12'),(10,59,'Dana Wolff','On various pretexts they all moved off, and she crossed her hands on her spectacles, and began whistling. \'Oh, there\'s no use now,\' thought Alice, \'it\'ll never do to ask: perhaps I shall be late!\'.','Ms. Brianne Oberbrunner II',160519.69887,'Calista Green','molestiae','2024-12-08 18:58:12','2024-12-08 18:58:12'),(11,73,'Phyllis Zemlak Sr.','Mock Turtle went on all the way wherever she wanted much to know, but the Mouse was bristling all over, and she hurried out of court! Suppress him! Pinch him! Off with his whiskers!\' For some.','Rashawn Monahan',3636362.2607,'Ubaldo Hintz','in','2024-12-08 18:58:12','2024-12-08 18:58:12'),(12,35,'Ms. Roma Hammes','First, she dreamed of little animals and birds waiting outside. The poor little thing sobbed again (or grunted, it was very uncomfortable, and, as the doubled-up soldiers were silent, and looked at.','Orville Orn',4785044,'Dr. Sid Weimann','sint','2024-12-08 18:58:12','2024-12-08 18:58:12'),(13,86,'Ulices Wiegand','No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you, won\'t you, will you, won\'t you, won\'t you, will you join the dance? Will you, won\'t you, won\'t you, won\'t you join.','Marjorie Wehner',5.9233506,'Bonnie Cummings','commodi','2024-12-08 18:58:12','2024-12-08 18:58:12'),(14,34,'Price Erdman','White Rabbit, \'and that\'s the jury, who instantly made a snatch in the last time she had put the hookah out of it, and they all crowded round her, about four inches deep and reaching half down the.','Bryon Morar',65929258.568284,'Jeffrey Towne','fuga','2024-12-08 18:58:12','2024-12-08 18:58:12'),(15,15,'Prof. Jerrold Senger','Dodo suddenly called out \'The Queen! The Queen!\' and the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' the Dodo replied very readily: \'but that\'s because it stays the same.','Prof. Edward Franecki V',90953.079,'Amy Tillman','earum','2024-12-08 18:58:12','2024-12-08 18:58:12'),(16,82,'Daniela Wisoky Sr.','And here poor Alice began telling them her adventures from the roof. There were doors all round her head. Still she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' he began.','Jarret Wilkinson',0,'Ronaldo Kertzmann II','quo','2024-12-08 18:58:12','2024-12-08 18:58:12'),(17,57,'Dr. Lempi Goldner','Will you, won\'t you, will you join the dance?\"\' \'Thank you, it\'s a very fine day!\' said a timid and tremulous sound.] \'That\'s different from what I say--that\'s the same size for ten minutes.','Felix Johns',43960.7949891,'Tianna Spencer DVM','qui','2024-12-08 18:58:12','2024-12-08 18:58:12'),(18,39,'Nya King Sr.','Queen to play croquet.\' The Frog-Footman repeated, in the sea!\' cried the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon answered, very nearly getting up and down in.','Alexandrea Durgan',1.25,'Estrella Ankunding III','omnis','2024-12-08 18:58:12','2024-12-08 18:58:12'),(19,35,'Jewell Wuckert','Alice in a great many more than nine feet high, and her eyes immediately met those of a feather flock together.\"\' \'Only mustard isn\'t a letter, written by the Hatter, \'I cut some more.','Kayden Stanton',207.3751643,'Milton Streich','fugiat','2024-12-08 18:58:12','2024-12-08 18:58:12'),(20,51,'Deja Rodriguez','Let me see: four times five is twelve, and four times five is twelve, and four times seven is--oh dear! I wish I hadn\'t to bring but one; Bill\'s got the other--Bill! fetch it here, lad!--Here, put.','Dr. Vito Larkin DVM',111.451934,'Alden Durgan','impedit','2024-12-08 18:58:12','2024-12-08 18:58:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lendings`
--

LOCK TABLES `lendings` WRITE;
/*!40000 ALTER TABLE `lendings` DISABLE KEYS */;
INSERT INTO `lendings` VALUES (1,1,1,'Prof. Irwin Beatty','2024-12-06','2024-12-20',0,'2024-12-08 18:58:12','2024-12-08 18:58:12'),(2,4,2,'Darrion Schulist','2024-12-02','2025-02-26',0,'2024-12-08 18:58:12','2025-01-12 17:20:22'),(3,1,1,'Sepp','2025-01-06','2025-01-23',0,'2025-01-06 12:36:15','2025-01-06 12:36:15'),(4,2,1,'Pep','2025-01-06','2025-01-17',0,'2025-01-06 12:40:46','2025-01-06 12:40:46'),(8,2,1,'Herbert','2025-01-12','2025-01-08',0,'2025-01-12 13:31:24','2025-01-12 13:31:24'),(14,2,1,'Hermann','2025-01-12','2025-02-01',0,'2025-01-12 17:27:06','2025-01-12 17:32:34');
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
INSERT INTO `librarians` VALUES (1,'hirthe.liliane','izabella.dare@yahoo.com','Marquise','Cassin','$2y$12$EmChkJtTRyDnXJ7BPPxj7uy1BpaypEPGzZeXcRsXUqr7guS3GnEz2','2024-12-08 18:58:12','2024-12-08 18:58:12'),(2,'hayes.angelica','isanford@mante.com','Graciela','Wyman','$2y$12$FM1cob8EYzEXeBNnfVfW/usRtb9eT7QSulBQlV/Fh.AY6KlVVkobq','2024-12-08 18:58:12','2024-12-08 18:58:12'),(3,'mraz.jaclyn','ykuhn@olson.com','Meaghan','Treutel','$2y$12$lZHwvUYpv0R8JalFTYAOGu2noc/ybYBr3Y3UUNIeSqMZ90Y3gWHEa','2024-12-08 18:58:12','2024-12-08 18:58:12'),(4,'frankie93','ishields@yahoo.com','Tanya','Crona','$2y$12$nDOOUbTmHW2Yxs8IaK95jeWRRTJ4GbiLr3ah0XR8VgM0dte.BrtY.','2024-12-08 18:58:12','2024-12-08 18:58:12');
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
INSERT INTO `sessions` VALUES ('KBwE8Gqjd5tjCNa1wI8MLdpEAfqTUofYGIL8C0mZ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNFZ3YVRma1N0Zkk3NUNkYWljZml1Q2JPd08yQTlRak5RQnZzN2xxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jb2RlLnRlc3QvYXVzbGVpaGVuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MjoiaHR0cDovL2NvZGUudGVzdC9hdXNsZWloZW4/bGVuZGluZ19zZWFyY2g9Ijt9fQ==',1736709259);
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

-- Dump completed on 2025-01-12 20:29:55
