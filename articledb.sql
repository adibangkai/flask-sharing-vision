-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: articledb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `category` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Publish','Draft','Trash') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Pohon mangga itu hijau? yang bener?',' Vivamus dictum nulla a tellus rutrum facilisis. Nunc et enim eget elit placerat posuere vitae sed quam. Etiam luctus, diam commodo faucibus dictum, velit dui varius leo, sit amet facilisis eros erat a libero. Sed dictum sed mi convallis vestibulum. Cras ullamcorper massa ante. Maecenas tristique varius nunc at vestibulum. Nulla efficitur purus eu orci elementum consequat. Quisque maximus magna elit, in imperdiet tellus sodales quis. In semper, risus sed molestie tincidunt, ex elit vestibulum nisi, non mattis eros nulla eget sem. Proin eu magna et elit blandit faucibus. In hac habitasse platea dictumst. Suspendisse ultricies, felis in mollis pulvinar, leo mi finibus nisl, sit amet aliquam tortor urna eu metus.','test','2023-03-22 09:58:04','2023-03-22 18:38:36','Trash'),(2,'Kenapa Lidah Buaya Tidak Main main?',' Vivamus dictum nulla a tellus rutrum facilisis. Nunc et enim eget elit placerat posuere vitae sed quam. Etiam luctus, diam commodo faucibus dictum, velit dui varius leo, sit amet facilisis eros erat a libero. Sed dictum sed mi convallis vestibulum. Cras ullamcorper massa ante. Maecenas tristique varius nunc at vestibulum. Nulla efficitur purus eu orci elementum consequat. Quisque maximus magna elit, in imperdiet tellus sodales quis. In semper, risus sed molestie tincidunt, ex elit vestibulum nisi, non mattis eros nulla eget sem. Proin eu magna et elit blandit faucibus. In hac habitasse platea dictumst. Suspendisse ultricies, felis in mollis pulvinar, leo mi finibus nisl, sit amet aliquam tortor urna eu metus.','ssss','2023-03-22 15:15:41','2023-03-22 18:39:21','Publish'),(3,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:06','2023-03-22 18:06:06','Draft'),(4,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:06','2023-03-22 18:06:06','Draft'),(5,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:07','2023-03-22 18:06:07','Draft'),(6,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:07','2023-03-22 18:06:07','Draft'),(7,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:07','2023-03-22 18:06:07','Draft'),(8,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:08','2023-03-22 18:06:08','Draft'),(9,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:08','2023-03-22 18:06:08','Draft'),(10,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:08','2023-03-22 18:06:08','Draft'),(11,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:13','2023-03-22 18:38:52','Trash'),(12,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:13','2023-03-22 18:06:13','Publish'),(13,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:13','2023-03-22 18:06:13','Publish'),(14,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:13','2023-03-22 18:06:13','Publish'),(15,'tutorial membersihkan kandang ','fs;adsaonsapodnpoasdijf pfojsdp ifdpfiaspdo ifsadnfapsdinfp asodnfpasodnfpas dnfaspdfnidnfpasodinfas pdfnpsoadnf psadnfapsdinfp asodnfpasodnfpas dnfaspdfn aspdifnpasidfnasp dfianspd fianspdfnsdpfinaspfias','et2','2023-03-22 18:06:14','2023-03-22 18:06:14','Publish'),(16,'LAGI LAGI LAGI TEST dong','LAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TESTLAGI LAGI LAGI TEST','TEST','2023-03-22 18:38:13','2023-03-22 18:38:13','Publish');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23  9:10:27
