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
-- Table structure for table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiar` (
  `identificacionFamiliar` bigint NOT NULL,
  `nombreFamiliar` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacionFamiliar` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correoFamiliar` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celularFamiliar` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentescoFamiliar` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsabilidadEconomicaEstudiante` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estadoAcudiente` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genero_idGenero` int NOT NULL,
  `Estudiante_idEstudiante` int NOT NULL,
  PRIMARY KEY (`identificacionFamiliar`),
  KEY `fk_Acudiente_Genero1` (`Genero_idGenero`),
  KEY `fk_Acudiente_Estudiante1` (`Estudiante_idEstudiante`),
  CONSTRAINT `fk_Acudiente_Estudiante1` FOREIGN KEY (`Estudiante_idEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `fk_Acudiente_Genero1` FOREIGN KEY (`Genero_idGenero`) REFERENCES `genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiar`
--

LOCK TABLES `familiar` WRITE;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
INSERT INTO `familiar` VALUES (123650260,'Marco Gaviria ','Obrero','Maga@el.co','3216','Padre','Si','Si',5001,106603),(1117568978,'Alguien Roberto','Doctor',NULL,'312654987','Padre','Completa','No',5001,106600),(1234654791,'Maria Hachala','Madre de hogar','Hachala@ella.co','1234','Madre','No','Si',5000,106600);
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 15:54:11
