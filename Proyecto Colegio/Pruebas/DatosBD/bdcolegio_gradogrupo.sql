CREATE DATABASE  IF NOT EXISTS `bdcolegio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdcolegio`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bdcolegio
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `gradogrupo`
--

DROP TABLE IF EXISTS `gradogrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradogrupo` (
  `idGradoGrupo` int NOT NULL AUTO_INCREMENT,
  `nombreTitular` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grupoGrado` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estadoGrupoGrado` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fkidGrado` int NOT NULL,
  PRIMARY KEY (`idGradoGrupo`),
  KEY `fk_GradoGrupo_Grados1` (`fkidGrado`),
  CONSTRAINT `fk_GradoGrupo_Grados1` FOREIGN KEY (`fkidGrado`) REFERENCES `grados` (`idGrado`)
) ENGINE=InnoDB AUTO_INCREMENT=208112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradogrupo`
--

LOCK TABLES `gradogrupo` WRITE;
/*!40000 ALTER TABLE `gradogrupo` DISABLE KEYS */;
INSERT INTO `gradogrupo` VALUES (208100,'Por definir','1202','Activo',207000),(208101,'Por definir','201','Activo',207001),(208102,'Por definir','701','Activo',207002),(208103,'Por definir','901','Activo',207003),(208104,'Por definir','301','Activo',207004),(208105,'Por definir','801','Activo',207005),(208106,'Por definir','601','Activo',207006),(208107,'Por definir','101','Activo',207007),(208108,'Por definir','401','Activo',207008),(208109,'Por definir','501','Activo',207009),(208110,'Por definir','1','Activo',207010);
/*!40000 ALTER TABLE `gradogrupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 15:54:13
