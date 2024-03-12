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
-- Table structure for table `horariogradogrupo`
--

DROP TABLE IF EXISTS `horariogradogrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horariogradogrupo` (
  `idHorarioGradoGrupo` int NOT NULL AUTO_INCREMENT,
  `estadoHorarioGG` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fkidHorario` int NOT NULL,
  `fkidGradoGrupo` int NOT NULL,
  PRIMARY KEY (`idHorarioGradoGrupo`),
  KEY `fk_detalleHorario_Horario1` (`fkidHorario`),
  KEY `fk_detalleHorario_GradoGrupo1` (`fkidGradoGrupo`),
  CONSTRAINT `fk_detalleHorario_GradoGrupo1` FOREIGN KEY (`fkidGradoGrupo`) REFERENCES `gradogrupo` (`idGradoGrupo`),
  CONSTRAINT `fk_detalleHorario_Horario1` FOREIGN KEY (`fkidHorario`) REFERENCES `horario` (`idHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=1160300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariogradogrupo`
--

LOCK TABLES `horariogradogrupo` WRITE;
/*!40000 ALTER TABLE `horariogradogrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `horariogradogrupo` ENABLE KEYS */;
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
