-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gab
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `apptid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduledDate` date NOT NULL,
  `services` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invUsed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `bill` int(11) NOT NULL,
  `opStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`apptid`),
  KEY `appointments_user_id_foreign` (`user_id`),
  CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dental_clinic_assistants`
--

DROP TABLE IF EXISTS `dental_clinic_assistants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dental_clinic_assistants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dental_clinic_assistants`
--

LOCK TABLES `dental_clinic_assistants` WRITE;
/*!40000 ALTER TABLE `dental_clinic_assistants` DISABLE KEYS */;
/*!40000 ALTER TABLE `dental_clinic_assistants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentist_services`
--

DROP TABLE IF EXISTS `dentist_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dentist_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentist_services`
--

LOCK TABLES `dentist_services` WRITE;
/*!40000 ALTER TABLE `dentist_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `dentist_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentists`
--

DROP TABLE IF EXISTS `dentists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dentists` (
  `dentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dentTelNo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentists`
--

LOCK TABLES `dentists` WRITE;
/*!40000 ALTER TABLE `dentists` DISABLE KEYS */;
INSERT INTO `dentists` VALUES (1,'Dr. Fred Gabriana','09125636987',NULL,NULL),(2,'Dr. Peejay De Leon','09487778564',NULL,NULL),(3,'Dr. Geraldine Garcia','09568899741',NULL,NULL);
/*!40000 ALTER TABLE `dentists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histories` (
  `histID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateAdded` date NOT NULL,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`histID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histories`
--

LOCK TABLES `histories` WRITE;
/*!40000 ALTER TABLE `histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `invID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `low_stock_quantity` int(11) NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invStatus` enum('Out of Stock','Low in Stock','Good') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invID`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'2 To 4 Holes Adapter',5,8,'Pcs','Low in Stock','Inactive',NULL,'2018-04-22 11:27:53'),(2,'4 To 2 Holes Adapter',6,4,'Pcs','Good','Active',NULL,'2018-06-14 22:00:14'),(3,'Alginate/Kromopan',16,14,'Kilos','Good','Active',NULL,'2018-06-14 20:46:19'),(4,'Anesthesia',10,13,'Pcs','Low in Stock','Active',NULL,'2018-04-22 11:26:39'),(6,'Articulating Paper',21,24,'Pcs','Low in Stock','Active',NULL,NULL),(8,'BEAUTI-CEMENT',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(9,'big diamonds finishing burr',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(10,'Bite Block',8,11,'Pcs','Low in Stock','Active',NULL,NULL),(11,'Bite Wax',37,40,'Pcs','Low in Stock','Active',NULL,NULL),(12,'Bone Burrs',6,9,'Pcs','Low in Stock','Active',NULL,NULL),(13,'BONDING agent',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(14,'Brackets',26,29,'set','Low in Stock','Active',NULL,NULL),(15,'Buccal Tubes',0,3,'set','Out of Stock','Inactive',NULL,NULL),(16,'Burr -40 round',2,5,'Pcs','Low in Stock','Active',NULL,NULL),(17,'Burrs # 368016',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(18,'Burrs diamond point (FG)',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(19,'Calibra esthetic Resin Cement',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(20,'Castone',12,15,'Pcs','Low in Stock','Active',NULL,NULL),(21,'Cavitron',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(22,'Celluloid Strip',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(23,'Ceramic Brackets',4,7,'set','Low in Stock','Active',NULL,NULL),(24,'CLOSED COIL SPRING',6,9,'Pcs','Low in Stock','Active',NULL,NULL),(25,'Coax',1,4,'packs','Low in Stock','Active',NULL,NULL),(26,'Composite A1',0,4,'Pcs','Out of Stock','Active',NULL,'2018-06-14 21:59:21'),(27,'Composite A2',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(28,'Composite A3',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(29,'Composite A3.5',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(31,'Composite B2',2,5,'Pcs','Low in Stock','Active',NULL,NULL),(32,'Composite Bonding Agent',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(33,'Composite instruments code-05703',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(34,'Composite instruments code-05707',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(35,'composite Inc.',11,14,'Pcs','Low in Stock','Active',NULL,NULL),(36,'CuNiTi .016 Lower',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(37,'CuNiTi .12 Upper',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(38,'Defoger',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(39,'Dental Impression material tray',85,88,'Pcs','Low in Stock','Active',NULL,NULL),(40,'Diestone',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(41,'Disposable Syringes 10cc',50,53,'Pcs','Low in Stock','Active',NULL,NULL),(42,'Dowel Posts Large',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(43,'Dowel Posts Medium',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(44,'Dowel Posts Short',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(45,'DRIVER',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(47,'Elastic Chain',20,23,'Pcs','Low in Stock','Active',NULL,NULL),(48,'Endo Block',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(49,'Etchant',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(53,'Fermine',1,4,'Bottles','Low in Stock','Active',NULL,NULL),(54,'Fishbone Trrays',2,5,'Pcs','Low in Stock','Active',NULL,NULL),(57,'Flowable Composite A2',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(58,'Flowable Composite A3',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(59,'Flowable Composite A3.5',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(60,'Forestadent wire LOWER .012',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(61,'Forestadent wire UPER .012',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(62,'Formocresol',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(63,'gauze',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(64,'Gingi Master',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(65,'Gingi Master Refill',6,9,'Pcs','Low in Stock','Active',NULL,NULL),(66,'Glass Ionomer Cement GIC',0,3,'Boxes','Out of Stock','Active',NULL,NULL),(70,'GS II FIXTURE',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(71,'Gun type w/ temp crown',1,4,'Set','Low in Stock','Active',NULL,NULL),(72,'Gutta Percha 15-40',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(73,'Gutta Percha 45-80',6,9,'Packs','Low in Stock','Active',NULL,NULL),(74,'HANDPIECE HIGHSPEED / yabangbang',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(75,'HANDPIECE NSK DYNALED/SURGERY',0,3,'Packs','Out of Stock','Active',NULL,NULL),(76,'HANDPIECE NSK PANAMAX',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(77,'HANDPIECE SET serial # 100300503',2,5,'set','Low in Stock','Active',NULL,NULL),(78,'HANDPIECE SET serial # 1100300503',0,3,'set','Out of Stock','Active',NULL,NULL),(79,'HANDPIECE SINGLE SET # 0074693',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(80,'HANDPIECE SINGLE SET # 0074694',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(81,'HANDPIECE SINGLE SET # 0074695',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(82,'HANDPIECE SINGLE SET # 0074696',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(83,'HANPIECE LUBRICANT',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(84,'HANDPIECE SINGLE SET # 0866090',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(85,'Hemodent',1,4,'Bottles','Low in Stock','Active',NULL,NULL),(86,'H-FILE 015-040',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(87,'IRM',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(90,'Ligature wire',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(91,'LIIDOCAINE hcl',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(94,'METAPEX',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(95,'Mixing Pad Big',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(96,'Mixing Pad Small',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(97,'Modeling compound',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(101,'NiTi .014 Lower',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(102,'NiTi .014 Upper',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(111,'NiTi .019x.025 Upper',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(113,'NiTi .16 x 22 Lower',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(114,'NiTi .16 x 22 Upper',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(115,'Op brush tips',2,5,'Boxes','Low in Stock','Active',NULL,NULL),(116,'Open coil spring',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(118,'Ortho bonding Agent',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(119,'Ortho cement',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(124,'Ortho elastics 1/8 Light',0,3,'Packs','Out of Stock','Active',NULL,NULL),(132,'Ortho kit',3,6,'Packs','Low in Stock','Active',NULL,NULL),(134,'Ostem Implant Kit',0,3,'Boxes','Out of Stock','Active',NULL,'2018-06-14 20:45:49'),(135,'Paper points 15-40',3,6,'Packs','Low in Stock','Active',NULL,NULL),(136,'Paper points 45-80',5,8,'Packs','Low in Stock','Active',NULL,NULL),(138,'Plastic Vyneers',4,7,'Packs','Low in Stock','Active',NULL,NULL),(139,'Polishing burrs',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(140,'Polishing Strips',3,6,'set','Low in Stock','Active',NULL,NULL),(141,'Polybib',5,8,'Packs','Low in Stock','Active',NULL,NULL),(142,'Primer',2,5,'Pcs','Low in Stock','Active',NULL,NULL),(143,'Pumice',1,4,'Bottles','Low in Stock','Active',NULL,NULL),(144,'Rigid abutment',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(146,'Saline Solution',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(147,'Saliva Ejector tips',3,6,'Packs','Low in Stock','Active',NULL,NULL),(148,'Scaler ultrasonic insert 25 khz',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(149,'Scaler tips 30k denstply',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(150,'Screw',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(151,'Self curing liquid',1,4,'Bottles','Low in Stock','Active',NULL,NULL),(152,'Self curing powder',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(155,'Self ligating brackets metal',0,3,'set','Out of Stock','Active',NULL,NULL),(156,'Self ligating ceramic brackets',1,4,'set','Low in Stock','Active',NULL,NULL),(158,'Sodium chloride',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(163,'Stainless steel .017*022 lower',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(165,'Stainless steel 012 lower',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(169,'Stainless steel 016 lower',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(172,'Stainless steel 018 upper',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(174,'Sterilizing pouch large',1,4,'Boxes','Low in Stock','Active',NULL,NULL),(181,'Surgical tips',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(184,'Suturing needle silk 4/0 metric',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(185,'Syringe (G27 long)',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(186,'Sterilization  pouch (5 1/4 x 10\")\"',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(187,'Suturing thread',2,5,'Roll','Low in Stock','Active',NULL,NULL),(188,'TF-13',4,7,'Pcs','Low in Stock','Active',NULL,NULL),(190,'Thermafil Obturation',1,4,'set','Low in Stock','Active',NULL,NULL),(191,'Topical Anesthesia',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(192,'TR-11',5,8,'Pcs','Low in Stock','Active',NULL,NULL),(193,'TR-13',3,6,'Pcs','Low in Stock','Active',NULL,NULL),(196,'Transfer Abutment',1,4,'Pcs','Low in Stock','Active',NULL,NULL),(197,'Zeta plus',0,3,'Pcs','Out of Stock','Active',NULL,NULL),(198,'Zeta ultra disinfectant',0,3,'Bottles','Out of Stock','Active',NULL,NULL),(199,'Extension',500,50,'Pcs','Good','Active','2018-04-22 11:37:39','2018-04-22 11:37:39'),(200,'sample',12,9,'Pcs','Good','Active','2018-05-29 05:56:31','2018-05-29 05:56:31'),(201,'Tooth Filling',10,5,'Pcs','Good','Active','2018-06-14 19:52:23','2018-06-14 19:53:52');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invhistory`
--

DROP TABLE IF EXISTS `invhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invhistory` (
  `invHistID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invID` int(10) unsigned NOT NULL,
  `patID` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `historyStatus` enum('Added','Reduced') NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`invHistID`),
  KEY `patientID` (`patID`),
  KEY `invID` (`invID`),
  CONSTRAINT `invID` FOREIGN KEY (`invID`) REFERENCES `inventory` (`invID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `patID` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invhistory`
--

LOCK TABLES `invhistory` WRITE;
/*!40000 ALTER TABLE `invhistory` DISABLE KEYS */;
INSERT INTO `invhistory` VALUES (1,2,0,1,'Added','2018-05-29 05:55:19','2018-05-29 05:55:19'),(2,2,0,1,'Reduced','2018-05-29 05:55:34','2018-05-29 05:55:34'),(3,2,0,5,'Added','2018-05-29 07:32:34','2018-05-29 07:32:34'),(4,3,0,5,'Added','2018-05-29 07:33:53','2018-05-29 07:33:53'),(5,2,0,2,'Reduced','2018-06-09 13:17:15','2018-06-09 13:17:15'),(6,2,0,2,'Added','2018-06-14 22:00:14','2018-06-14 22:00:14');
/*!40000 ALTER TABLE `invhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_03_12_12000_create_dentists_table',1),(4,'2018_03_14_074254_create_patients_table',1),(5,'2018_03_18_033440_create_inventories_table',1),(6,'2018_03_22_144428_create_services_table',1),(7,'2018_03_25_064131_create_schedules_table',1),(8,'2018_03_31_173654_create_histories_table',1),(9,'2018_03_31_174723_create_records_table',1),(10,'2018_03_31_174752_create_payments_table',1),(11,'2018_03_31_174825_create_dental_clinic_assistants_table',1),(12,'2018_03_31_174849_create_service_scheduleds_table',1),(13,'2018_03_31_174905_create_dentist_services_table',1),(14,'2018_03_31_174938_create_ser_per_inventories_table',1),(15,'2018_03_31_175020_create_appointments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patientTelNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medconditions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allergies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `patStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`patID`),
  KEY `patients_dentid_foreign` (`dentID`),
  CONSTRAINT `patients_dentid_foreign` FOREIGN KEY (`dentID`) REFERENCES `dentists` (`dentID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (0,'Jessie G. Bautista','Honeymonon RD, Baguio City','Maintenance','09302184788','Married','1988-08-24','27','M','None','None',0,'Active',NULL,'2018-06-14 19:25:15',NULL),(1,'Gandeza Rachel E','Marville Subdivision, Irisan, Baguio City','Student','09260717250','Single','1993-01-28','24','F','Asthma','None',15000,'Active',NULL,'2018-06-14 10:04:29',NULL),(2,'Maria Olivia Margaris','Marville Subdivision baguio','Student','09193279345','Married','1982-07-15','35','F','None','None',0,'Active',NULL,NULL,NULL),(3,'Di Anne P Monreal','Bakakeng Sur, Baguio City','Cabni Crew','09173024102','Single','1991-02-28','26','F','None','None',0,'Active',NULL,'2018-06-14 19:07:48',NULL),(5,'Joan Polomen','Jc 123 La trinidad','Student','09282817870','Married','1983-09-15','34','F','None','None',0,'Active',NULL,'2018-06-13 07:15:32',NULL),(6,'Jhoairha Manaiang','Jc 123 La trinidad','Student','09125554867','Married','1999-05-27','17','M','None','Seafood',0,'Active',NULL,NULL,NULL),(7,'Magilyn Lim','7 Laubach Road','Student','09277948873','Married','1997-11-03','40','F','None','None',0,'Active',NULL,'2018-05-29 08:20:57',NULL),(8,'Kailey Robyn C. Bernal','129E Leonila Mill','Student','09778560101','Single','2010-06-19','8','F','None','None',0,'Active',NULL,NULL,NULL),(9,'Rexelle Jun R. Bersamin','North Cambridge Condominium Bakakeng, Baguio City','Security Guard','09269350953','Single','1994-06-25','23','M','None','None',0,'Active',NULL,NULL,NULL),(10,'charice Costales','2A-11 Ledesma St. Aurora Hil','HouseWife','244-2461','Married','1998-12-04','29','f','None','None',0,'Active',NULL,NULL,NULL),(11,'Axel Portugal','59 Loakan Liwanag ','Delivery Boy','09150787422','Single','1995-08-13','22','M','None','None',0,'Active',NULL,'2018-06-06 17:10:48',NULL),(12,'Nataniel Balandra','28 Camp 7 Amparo Baguio City','Factory Worker','09224149982','Single','1990-02-01','28','M','None','None',0,'Active',NULL,'2018-05-30 06:33:26',NULL),(13,'Darell Buclod','Lexber Heights Monticello Baguio City','Teacher','09174904035','Married','1988-12-21','30','M','None','None',0,'Active',NULL,NULL,NULL),(14,'Leonardo Vargas','22 Ongasan Loakan Baguio City','Student','09142282910','Single','1991-04-20','27','M','None','None',0,'Active',NULL,NULL,NULL),(15,'Alexa Malabanan','Upper Bonifacio Baguio City','Online Seller','09354218290','Married','1992-09-27','26','F','None','None',0,'Active',NULL,'2018-06-14 19:42:38',NULL),(16,'Natasha Medina','Quisumbing st Baguio City','Accountant','09175847902','Married','1983-06-30','35','F','None','None',0,'Active',NULL,NULL,NULL),(17,'Ralph Abad','Dominican Hill Baguio City','Baker','09356902867','Single','1994-03-11','24','M','None','None',0,'Active',NULL,NULL,NULL),(18,'Rogelio Gomez','Hillside Baguio City','Driver','09164745655','Married','1981-10-22','37','M','None','None',0,'Inactive',NULL,'2018-06-14 21:41:38',NULL),(19,'Norman Bulan','23 Kias PMA Baguio City','Carpenter','09275899890','Single','1989-04-06','34','M','None','None',0,'Active',NULL,NULL,NULL),(20,'Violet Fajardo','Bakakeng Central Baguio City','Botanist','09191267844','Married','1980-06-23','38','F','None','Dust',0,'Active',NULL,'2018-06-14 21:43:21',NULL),(21,'Joshua Tumulak','40 Holy Ghost Proper Baguio City','Cleaner','09222543657','Single','1997-12-29','20','M','None','None',0,'Active',NULL,NULL,NULL),(22,'Eugenio Amurao','10 Guisad Sorong Baguio City','Electrician','09355675478','Married','1984-06-13','34','M','None','None',0,'Active',NULL,NULL,NULL),(23,'Chase Fernando','Camp Allen Baguio City','Ergonomist','09336457807','Single','1994-02-06','24','F','None','None',0,'Active',NULL,NULL,NULL),(24,'Cedric Veterano','14 Sanitary Camp North Baguio City','Engineer','09450886455','Single','1996-06-27','21','M','None','None',0,'Active',NULL,NULL,NULL),(25,'Amado Andal','Lucnab Baguio City','Fireman','09484589754','Single','1988-03-03','30','M','None','None',0,'Active',NULL,'2018-05-30 06:57:22',NULL),(26,'Terence Davidson','#300 irisan Baguio City','Student','09124235975','Single','1981-02-23','37','M','None','None',0,'Inactive',NULL,'2018-06-14 21:41:34',NULL),(27,'Mark Anthony Fernando','#12 general luna  Baguio City','Secretary','09095566325','Single','1984-05-15','33','M','None','None',0,'Inactive',NULL,'2018-06-14 21:41:44',NULL),(28,'Lucille David','Block 30 eagle crest  Baguio City','Treasurer','09567586952','Single','1982-07-16','31','F','None','None',0,'Active',NULL,NULL,NULL),(29,'Angelica Castillo','Poblacion Street La trinidad','Security','09104561239','Single','1989-03-04','29','F','None','None',0,'Active',NULL,NULL,NULL),(30,'Maria Antero','Jc 456 Puguis La trinidad','Accountant','09489512365','Married','1970-11-27','47','F','None','None',0,'Active',NULL,NULL,NULL),(31,'Jay','#608 Irisan Road Baguio City','Driver','09565779863','Single','1998-03-09','20','M','None','None',0,'Active','2018-04-22 09:22:52','2018-04-22 09:22:52',NULL),(32,'Franco Ramon','#42 Loakan Cudi Baguio City','Online Seller','09061254769','Single','1997-12-30','20','M','None','Seafood',0,'Active','2018-06-14 08:48:28','2018-06-14 08:48:28',NULL),(33,'Rounda Dimalantay','jc 268 pico puguis','Teacher','09565977863','Single','1997-12-30','20','M','None','None',0,'Active','2018-06-14 08:50:30','2018-06-14 08:50:30',NULL),(34,'Romando Daruis','Trinidad KM4','Online Seller','09565977864','Single','1997-12-28','20','M','None','Peanuts',0,'Active','2018-06-14 08:58:06','2018-06-14 08:58:06',NULL),(35,'Max Orenje','jc 268 pico puguis','Online Seller','09565977854','Single','1998-04-10','20','M','None','None',0,'Active','2018-06-14 09:03:03','2018-06-14 09:03:03',NULL),(36,'Rick Belardo','#40 Loakan Liwanag Baguio City','Security Guard','09150772511','Single','1990-12-05','28','M','None','None',0,'Active','2018-06-14 21:37:59','2018-06-14 21:37:59',NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `schedId` int(10) unsigned NOT NULL,
  `patID` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `servID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `payments_schedId_foreign` (`schedId`),
  KEY `patID23` (`patID`),
  KEY `servID23` (`servID`),
  CONSTRAINT `payments_patID_foreign` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON UPDATE CASCADE,
  CONSTRAINT `payments_schedId_foreign` FOREIGN KEY (`schedId`) REFERENCES `schedules` (`schedId`) ON UPDATE CASCADE,
  CONSTRAINT `payments_servId_foreign` FOREIGN KEY (`servID`) REFERENCES `services` (`servID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (6,450,32,1,'2018-06-06 16:27:13','2018-06-06 16:27:13',1),(7,0,33,11,'2018-06-06 17:10:27','2018-06-06 17:10:27',1),(8,450,33,11,'2018-06-06 17:10:48','2018-06-06 17:10:48',1),(9,200,36,1,'2018-06-09 13:07:25','2018-06-09 13:07:25',17),(10,1,37,0,'2018-06-13 06:45:38','2018-06-13 06:45:38',3),(11,2000,38,5,'2018-06-13 06:47:51','2018-06-13 06:47:51',7),(12,2000,39,5,'2018-06-13 06:59:36','2018-06-13 06:59:36',9),(13,5000,40,5,'2018-06-13 07:05:51','2018-06-13 07:05:51',14),(14,20000,40,5,'2018-06-13 07:15:32','2018-06-13 07:15:32',14),(15,0,40,5,'2018-06-13 07:17:45','2018-06-13 07:17:45',14),(16,0,40,5,'2018-06-14 09:46:15','2018-06-14 09:46:15',14),(17,5000,42,15,'2018-06-14 09:51:47','2018-06-14 09:51:47',15),(18,5000,42,15,'2018-06-14 09:57:32','2018-06-14 09:57:32',15),(19,5000,42,15,'2018-06-14 10:02:07','2018-06-14 10:02:07',15),(20,5000,42,15,'2018-06-14 10:03:08','2018-06-14 10:03:08',15),(21,5000,42,15,'2018-06-14 10:03:45','2018-06-14 10:03:45',15),(22,14800,36,1,'2018-06-14 10:04:30','2018-06-14 10:04:30',17),(23,450,43,5,'2018-06-14 17:49:06','2018-06-14 17:49:06',1),(24,450,34,3,'2018-06-14 19:07:48','2018-06-14 19:07:48',1),(25,1349,37,0,'2018-06-14 19:25:15','2018-06-14 19:25:15',12),(26,450,41,15,'2018-06-14 19:29:37','2018-06-14 19:29:37',1),(27,0,42,15,'2018-06-14 19:50:40','2018-06-14 19:50:40',12);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `recordId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateRecorded` date NOT NULL,
  `dentist` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` int(11) NOT NULL,
  `patID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`recordId`),
  KEY `records_patid_foreign` (`patID`),
  CONSTRAINT `records_patid_foreign` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `schedId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `timeFrom` time DEFAULT NULL,
  `timeTo` time DEFAULT NULL,
  `opStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patID` int(10) unsigned NOT NULL,
  `dentID` int(10) unsigned NOT NULL,
  `servID` int(10) unsigned NOT NULL,
  `teethID` int(11) NOT NULL,
  `balance` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedId`),
  KEY `schedules_patid_foreign` (`patID`),
  KEY `schedules_dentid_foreign` (`dentID`),
  KEY `schedules_servid_foreign` (`servID`),
  KEY `schedules_teethID_foreign` (`teethID`),
  CONSTRAINT `schedules_dentid_foreign` FOREIGN KEY (`dentID`) REFERENCES `dentists` (`dentID`) ON UPDATE CASCADE,
  CONSTRAINT `schedules_patid_foreign` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON UPDATE CASCADE,
  CONSTRAINT `schedules_servid_foreign` FOREIGN KEY (`servID`) REFERENCES `services` (`servID`) ON UPDATE CASCADE,
  CONSTRAINT `schedules_teethID_foreign` FOREIGN KEY (`teethID`) REFERENCES `teeth` (`teethID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (32,'2018-06-07','13:00:00','14:00:00','Done',1,1,1,1,0,'2018-06-06 16:27:01','2018-06-06 16:27:13'),(33,'2018-06-07','15:00:00','16:00:00','Done',11,1,1,1,0,'2018-06-06 17:10:07','2018-06-06 17:10:48'),(34,'2018-06-15','09:30:00','10:00:00','Done',3,1,1,1,0,'2018-06-06 17:13:21','2018-06-14 19:07:48'),(35,'2018-06-22','17:00:00','18:00:00','Pending',1,2,17,48,15000,'2018-06-08 07:37:27','2018-06-14 21:45:12'),(36,'2018-06-08','17:00:00','18:00:00','Cancelled',1,2,17,1,0,'2018-06-08 09:49:49','2018-06-14 19:06:51'),(37,'2018-06-15','11:00:00','11:30:00','Done',0,3,12,1,0,'2018-06-13 06:44:42','2018-06-14 19:25:15'),(38,'2018-06-13','15:00:00','16:00:00','Done',5,2,7,1,0,'2018-06-13 06:46:49','2018-06-13 06:47:51'),(39,'2018-06-13','14:00:00','15:00:00','Done',5,1,9,1,0,'2018-06-13 06:54:05','2018-06-13 06:59:36'),(40,'2018-06-13','17:00:00','18:00:00','Done',5,1,14,1,0,'2018-06-13 07:04:46','2018-06-14 09:46:15'),(41,'2018-06-14','17:00:00','18:00:00','Ongoing',15,2,1,1,0,'2018-06-14 09:50:50','2018-06-14 19:29:37'),(42,'2018-06-17','19:00:00','20:00:00','Done',15,1,12,15,0,'2018-06-14 09:51:38','2018-06-14 19:50:40'),(43,'2018-06-15','17:00:00','18:00:00','Done',5,1,1,1,0,'2018-06-14 17:48:56','2018-06-14 17:49:06'),(44,'2018-06-23','10:00:00','11:00:00','Cancelled',8,1,1,48,450,'2018-06-14 19:24:35','2018-06-14 20:21:51');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ser_per_inventories`
--

DROP TABLE IF EXISTS `ser_per_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ser_per_inventories` (
  `invQty` int(11) NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ser_per_inventories`
--

LOCK TABLES `ser_per_inventories` WRITE;
/*!40000 ALTER TABLE `ser_per_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ser_per_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_scheduleds`
--

DROP TABLE IF EXISTS `service_scheduleds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_scheduleds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_scheduleds`
--

LOCK TABLES `service_scheduleds` WRITE;
/*!40000 ALTER TABLE `service_scheduleds` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_scheduleds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `servID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`servID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Consultation',450,NULL,NULL),(2,'Per-Apical Xray',450,NULL,NULL),(3,'Panoramic Xray',1350,NULL,NULL),(4,'Cephalometric Xray',1350,NULL,NULL),(5,'Oral Prohylaxis/Cleaning(MILD)',650,NULL,NULL),(6,'Oral Prohylaxis/Cleaning(MODERATE)',1000,NULL,NULL),(7,'Oral Prohylaxis/Cleaning(SEVERE)',2000,NULL,NULL),(8,'Composite Fillings (per surface)',750,NULL,NULL),(9,'Pit and fissure sealant',2000,NULL,NULL),(10,'Recementation of crowns',1000,NULL,NULL),(11,'Flouride treatment(Child/Adult)',5000,NULL,NULL),(12,'Temporary filling',750,NULL,NULL),(13,'Flouride varnish',1500,NULL,NULL),(14,'Porcelain Veneers(Zirconia)',25000,NULL,NULL),(15,'Porcelain Veneers(IPS-Emax)',25000,NULL,NULL),(16,'Porcelain Veneers(Adoro)',25000,NULL,NULL),(17,'Teeth whitening',15000,NULL,NULL),(18,'Root Canal(Simple Extraction)',550,NULL,NULL),(19,'Root Canal(Difficult Extraction)',1500,NULL,NULL),(20,'Root Canal(Odontectomy/Impaction)',6500,NULL,NULL),(21,'Implants',60000,NULL,NULL),(22,'Porcelain fused to TI-LITE',9500,NULL,NULL),(23,'Porcelain fused to GOLD',7500,NULL,NULL),(24,'All porcelain crowns (Zirconia)',25000,NULL,NULL),(25,'All porcelain crowns (IPS-emax)',25000,NULL,NULL),(26,'All porcelain crowns (Adoro)',25000,NULL,NULL),(27,'All plastic Biotone (Flexite)',15000,NULL,NULL),(28,'Stayplate-Unilateral-Trubyte(Porcelain)',25000,NULL,NULL),(29,'Stayplate-Unilateral-Naturadent(Porcelain)',20000,NULL,NULL),(30,'CompleteDenture-Ivocap-Injectable(Porcelain)',25000,NULL,NULL),(31,'CompleteDenture-Trubyte-Bioform(Porcelain)',25000,NULL,NULL),(32,'CompleteDenture-Vitanorm(Porcelain)',25000,NULL,NULL),(33,'CompleteDenture-Natura Dent(Porcelain)',25000,NULL,NULL),(34,'CompleteDenture-Vertex-High Impact(Porcelain)',750,NULL,NULL),(35,'CompleteDenture-Biotone(Porcelain)',750,NULL,NULL),(36,'CompleteDenture-Ivoclar(Porcelain)',750,NULL,NULL),(37,'CompleteDenture-Naturatone(Porcelain)',750,NULL,NULL),(38,'CompleteDenture-Denture repair(Porcelain)',750,NULL,NULL),(39,'CompleteDenture-Denture repair w/ impression taking(Porcelain)',1000,NULL,NULL),(40,'CompleteDenture-Denture reline(Porcelain)',750,NULL,NULL),(41,'Retainers-Ordinary',5000,NULL,NULL),(42,'Retainers-Ordinary w/ design',7000,NULL,NULL),(43,'Retainers-Invisible',7000,NULL,NULL),(44,'Retainers-Lingual Retainer',5000,NULL,NULL),(45,'Orthodontic Treatment-Simple',40000,NULL,NULL),(46,'Orthodontic Treatment-Moderate',50000,NULL,NULL),(47,'Orthodontic Treatment-Difficult',60000,NULL,NULL),(48,'Orthodontic Treatment-Ceramic',125000,NULL,NULL),(49,'Orthodontic Treatment-Daemon/Self-ligating',80000,NULL,NULL),(50,'Orthodontic Treatment-Lingual Braces',80000,NULL,NULL),(51,'Orthodontic Treatment-Invisalign',80000,NULL,NULL),(52,'Recementation of fallen brackets, molar bands, buccal tube',550,NULL,NULL),(53,'Replacement of fallen brackets, molar bands, buccal tube',1100,NULL,NULL),(54,'Teeth Whitening (Advanced)',1200,'2018-04-22 11:39:11','2018-04-22 11:39:11'),(55,'All Around Mouth Cleaning',1500,'2018-06-14 22:05:15','2018-06-14 22:05:15');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teeth`
--

DROP TABLE IF EXISTS `teeth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teeth` (
  `teethID` int(11) NOT NULL AUTO_INCREMENT,
  `teethCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teethID`),
  UNIQUE KEY `teethID_UNIQUE` (`teethID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teeth`
--

LOCK TABLES `teeth` WRITE;
/*!40000 ALTER TABLE `teeth` DISABLE KEYS */;
INSERT INTO `teeth` VALUES (1,'All'),(2,'Upper Teeth'),(3,'Lower Teeth'),(11,'11'),(12,'12'),(13,'13'),(14,'14'),(15,'15'),(16,'16'),(17,'17'),(18,'18'),(21,'21'),(22,'22'),(23,'23'),(24,'24'),(25,'25'),(26,'26'),(27,'27'),(28,'28'),(31,'31'),(32,'32'),(33,'33'),(34,'34'),(35,'35'),(36,'36'),(37,'37'),(38,'38'),(41,'41'),(42,'42'),(43,'43'),(44,'44'),(45,'45'),(46,'46'),(47,'47'),(48,'48');
/*!40000 ALTER TABLE `teeth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'Admin','Admin@test.com',1,'$2y$10$qc7S/BFGYlzNegftOx5Q1ePGs6490uFhiWquzOslkDTSiMm6y7MsK','hyS8cQ7Ibma2vXv83QgMKfiH91nfJWfw164mP8hOg00kTSilm4DLY2FS6WAA','2018-06-15 11:23:30','2018-06-15 11:23:30'),(9,'Assistant','Assistant@test.com',0,'$2y$10$Hdg/QLvdXY817LA/GmEDlePVMTzr/TWIEuZ044rRW5qLscRuolT56','CJRHwZNihtDB7xbjwcLLpOsosxULt9i16iO2FLzXVXrfrzg4OO6P97agG5Z0','2018-06-15 11:23:59','2018-06-15 11:23:59');
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

-- Dump completed on 2018-06-15 19:25:13
