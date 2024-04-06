-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: seriousmd
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `pxid` varchar(32) NOT NULL,
  `clinicid` varchar(32) NOT NULL,
  `doctorid` varchar(32) NOT NULL,
  `apptid` varchar(32) NOT NULL,
  `status` text NOT NULL,
  `TimeQueued` datetime NOT NULL,
  `QueueDate` datetime DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `type` text NOT NULL,
  `_virtual` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`apptid`),
  KEY `appointments_px_pxid_fk` (`pxid`),
  KEY `appointments_clinics_clinicid_fk` (`clinicid`),
  KEY `appointments_doctors_doctorid_fk` (`doctorid`),
  CONSTRAINT `appointments_clinics_clinicid_fk` FOREIGN KEY (`clinicid`) REFERENCES `clinics` (`clinicid`),
  CONSTRAINT `appointments_doctors_doctorid_fk` FOREIGN KEY (`doctorid`) REFERENCES `doctors` (`doctorid`),
  CONSTRAINT `appointments_px_pxid_fk` FOREIGN KEY (`pxid`) REFERENCES `px` (`pxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics` (
  `clinicid` varchar(32) NOT NULL,
  `hospitalname` text,
  `IsHopsital` tinyint(1) NOT NULL,
  `City` text NOT NULL,
  `Province` text NOT NULL,
  `RegionName` text NOT NULL,
  PRIMARY KEY (`clinicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctorid` varchar(32) NOT NULL,
  `mainspecialty` text,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `px`
--

DROP TABLE IF EXISTS `px`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `px` (
  `pxid` varchar(32) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('FEMALE','MALE') NOT NULL,
  PRIMARY KEY (`pxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-20 13:28:51
