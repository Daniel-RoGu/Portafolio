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
-- Table structure for table `estudiantesgradogrupo`
--

DROP TABLE IF EXISTS `estudiantesgradogrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantesgradogrupo` (
  `idEstudianteGG` int NOT NULL AUTO_INCREMENT,
  `rendimientoGeneral` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estadoEstudianteGG` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fkidEstudiante` int NOT NULL,
  `fkidGradoGrupo` int NOT NULL,
  PRIMARY KEY (`idEstudianteGG`),
  KEY `fk_EstudiantesGrupo_Estudiante1` (`fkidEstudiante`),
  KEY `fk_EstudiantesGrupo_GradoGrupo1` (`fkidGradoGrupo`),
  CONSTRAINT `fk_EstudiantesGrupo_Estudiante1` FOREIGN KEY (`fkidEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `fk_EstudiantesGrupo_GradoGrupo1` FOREIGN KEY (`fkidGradoGrupo`) REFERENCES `gradogrupo` (`idGradoGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=680286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantesgradogrupo`
--

LOCK TABLES `estudiantesgradogrupo` WRITE;
/*!40000 ALTER TABLE `estudiantesgradogrupo` DISABLE KEYS */;
INSERT INTO `estudiantesgradogrupo` VALUES (680200,'Sin definir','Activo',106600,208101),(680201,'Sin definir','Activo',106601,208102),(680202,'Sin definir','Activo',106602,208101),(680203,'Sin definir','Activo',106603,208102),(680204,'Sin definir','Activo',106604,208103),(680205,'Sin definir','Activo',106605,208104),(680206,'Sin definir','Activo',106606,208105),(680207,'Sin definir','Activo',106607,208101),(680208,'Sin definir','Activo',106608,208106),(680209,'Sin definir','Activo',106609,208105),(680210,'Sin definir','Activo',106610,208106),(680211,'Sin definir','Activo',106611,208104),(680212,'Sin definir','Activo',106612,208107),(680213,'Sin definir','Activo',106613,208104),(680214,'Sin definir','Activo',106614,208105),(680215,'Sin definir','Activo',106615,208106),(680216,'Sin definir','Activo',106616,208101),(680217,'Sin definir','Activo',106617,208101),(680218,'Sin definir','Activo',106618,208107),(680219,'Sin definir','Activo',106619,208106),(680220,'Sin definir','Activo',106620,208103),(680221,'Sin definir','Activo',106621,208108),(680222,'Sin definir','Activo',106622,208102),(680223,'Sin definir','Activo',106623,208103),(680224,'Sin definir','Activo',106624,208101),(680225,'Sin definir','Activo',106625,208105),(680226,'Sin definir','Activo',106626,208107),(680227,'Sin definir','Activo',106627,208107),(680228,'Sin definir','Activo',106628,208109),(680229,'Sin definir','Activo',106629,208108),(680230,'Sin definir','Activo',106630,208110),(680231,'Sin definir','Activo',106631,208109),(680232,'Sin definir','Activo',106632,208101),(680233,'Sin definir','Activo',106633,208108),(680234,'Sin definir','Activo',106634,208109),(680235,'Sin definir','Activo',106635,208104),(680236,'Sin definir','Activo',106636,208104),(680237,'Sin definir','Activo',106637,208108),(680238,'Sin definir','Activo',106638,208107),(680239,'Sin definir','Activo',106639,208101),(680240,'Sin definir','Activo',106640,208101),(680241,'Sin definir','Activo',106641,208104),(680242,'Sin definir','Activo',106642,208104),(680243,'Sin definir','Activo',106643,208103),(680244,'Sin definir','Activo',106644,208110),(680245,'Sin definir','Activo',106645,208104),(680246,'Sin definir','Activo',106646,208101),(680247,'Sin definir','Activo',106647,208104),(680248,'Sin definir','Activo',106648,208104),(680249,'Sin definir','Activo',106649,208101),(680250,'Sin definir','Activo',106650,208101),(680251,'Sin definir','Activo',106651,208104),(680252,'Sin definir','Activo',106652,208108),(680253,'Sin definir','Activo',106653,208103),(680254,'Sin definir','Activo',106654,208103),(680255,'Sin definir','Activo',106655,208101),(680256,'Sin definir','Activo',106656,208104),(680257,'Sin definir','Activo',106657,208107),(680258,'Sin definir','Activo',106658,208102),(680259,'Sin definir','Activo',106659,208101),(680260,'Sin definir','Activo',106660,208101),(680261,'Sin definir','Activo',106661,208109),(680262,'Sin definir','Activo',106662,208104),(680263,'Sin definir','Activo',106663,208110),(680264,'Sin definir','Activo',106664,208108),(680265,'Sin definir','Activo',106665,208110),(680266,'Sin definir','Activo',106666,208103),(680267,'Sin definir','Activo',106667,208102),(680268,'Sin definir','Activo',106668,208105),(680269,'Sin definir','Activo',106669,208104),(680270,'Sin definir','Activo',106670,208105),(680271,'Sin definir','Activo',106671,208109),(680272,'Sin definir','Activo',106672,208107),(680273,'Sin definir','Activo',106673,208110),(680274,'Sin definir','Activo',106674,208101),(680275,'Sin definir','Activo',106675,208110),(680276,'Sin definir','Activo',106676,208108),(680277,'Sin definir','Activo',106677,208108),(680278,'Sin definir','Activo',106678,208106),(680279,'Sin definir','Activo',106679,208107),(680280,'Sin definir','Activo',106680,208107),(680281,'Sin definir','Activo',106681,208105),(680282,'Sin definir','Activo',106600,208100),(680283,'Sin definir','Activo',106603,208100);
/*!40000 ALTER TABLE `estudiantesgradogrupo` ENABLE KEYS */;
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
