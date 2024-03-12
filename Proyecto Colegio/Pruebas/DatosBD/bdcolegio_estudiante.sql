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
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `idEstudiante` int NOT NULL AUTO_INCREMENT,
  `codigoEstudiante` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudadNacimiento` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudadResidencia` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudadExpedicionDocumento` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paisOrigen` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asistenciaAcademicaEspecial` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desplazadoEstado` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Usuario_identificacion` bigint NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `fk_Estudiante_Usuario1` (`Usuario_identificacion`),
  CONSTRAINT `fk_Estudiante_Usuario1` FOREIGN KEY (`Usuario_identificacion`) REFERENCES `usuario` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=106682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (106600,'80802349','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118377419),(106601,'72901789','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029565035),(106602,'82028721','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073451),(106603,'72934343','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118373676),(106604,'70536491','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072041),(106605,'78509110','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073184),(106606,'71278875','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117933294),(106607,'80963811','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117941284),(106608,'68288622','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','ATENCION EN EL ESTABLECIMIENTO EDUCATIVO','Sin_Registro',1117019462),(106609,'65896844','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118071466),(106610,'70363094','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072338),(106611,'75615587','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072866),(106612,'83619448','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117827204),(106613,'76250347','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072948),(106614,'70205144','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117932967),(106615,'72934068','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072680),(106616,'78480759','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1145829438),(106617,'76108392','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1145731011),(106618,'84072934','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073384),(106619,'73343282','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072531),(106620,'66420825','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1031813380),(106621,'76468873','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1215964268),(106622,'58983404','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118071673),(106623,'65932695','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118368011),(106624,'78480881','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118376891),(106625,'58983380','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118371072),(106626,'83620111','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1215966284),(106627,'83533008','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1013362165),(106628,'72999821','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117266002),(106629,'75302858','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072652),(106630,'85388574','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117555499),(106631,'75203412','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117938072),(106632,'78687060','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118376699),(106633,'78689223','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118375877),(106634,'58983384','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118370878),(106635,'74142935','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118374836),(106636,'77182864','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118376165),(106637,'68034986','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117515786),(106638,'82948905','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1081064298),(106639,'80371638','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117838238),(106640,'80885436','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073294),(106641,'78089444','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117939169),(106642,'77930602','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1076916583),(106643,'62120050','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1024478392),(106644,'83512563','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118029473),(106645,'76247052','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072870),(106646,'81071903','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117940529),(106647,'78533664','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073732),(106648,'76705703','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1215964870),(106649,'82114885','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1215967021),(106650,'78007499','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073125),(106651,'77774070','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029567750),(106652,'78490700','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072799),(106653,'64758561','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118469958),(106654,'65802466','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1116206562),(106655,'74780906','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1215964164),(106656,'76483573','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118473714),(106657,'84072967','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',11177941658),(106658,'70153220','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029561167),(106659,'79204020','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117940256),(106660,'77911306','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029965132),(106661,'70016920','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117265859),(106662,'77885533','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','ATENCION EN EL ESTABLECIMIENTO EDUCATIVO','Sin_Registro',1117267214),(106663,'85323469','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073625),(106664,'75020084','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117938596),(106665,'85306890','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1119586982),(106666,'60127629','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1059764954),(106667,'72931313','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072720),(106668,'58983372','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072141),(106669,'78491536','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118377058),(106670,'69893515','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117933610),(106671,'74749978','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117936646),(106672,'81815932','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073412),(106673,'85457950','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073628),(106674,'77473714','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1117939344),(106675,'85210451','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029568887),(106676,'76432771','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118375296),(106677,'76177561','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1115950965),(106678,'71591526','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118072365),(106679,'84269296','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1118073499),(106680,'85796381','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1084869115),(106681,'65932426','Sin_Registro','Sin_Registro','Sin_Registro','COLOMBIA','NO APLICA','Sin_Registro',1029560098);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 15:54:10
