CREATE DATABASE  IF NOT EXISTS `bd_multas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_multas`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_multas
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `guardias`
--

DROP TABLE IF EXISTS `guardias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardias` (
  `CodigoG` char(5) NOT NULL,
  `CodigoGJefe` char(5) DEFAULT NULL,
  `Nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`CodigoG`),
  KEY `fk_CodigoGJefe_Guardias` (`CodigoGJefe`),
  CONSTRAINT `fk_CodigoGJefe_Guardias` FOREIGN KEY (`CodigoGJefe`) REFERENCES `guardias` (`CodigoG`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardias`
--

LOCK TABLES `guardias` WRITE;
/*!40000 ALTER TABLE `guardias` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multas` (
  `NMulta` int NOT NULL AUTO_INCREMENT,
  `CodigoG` char(5) NOT NULL,
  `Matricula` char(7) NOT NULL,
  `Fecha` date NOT NULL DEFAULT '2021-12-03',
  `Lugar` varchar(50) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Importe` float NOT NULL,
  `Pagado` enum('SI','NO') NOT NULL,
  PRIMARY KEY (`NMulta`),
  KEY `fk_CodigoG_Multas` (`CodigoG`),
  KEY `fk_Matricula_Multas` (`Matricula`),
  CONSTRAINT `fk_CodigoG_Multas` FOREIGN KEY (`CodigoG`) REFERENCES `guardias` (`CodigoG`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Matricula_Multas` FOREIGN KEY (`Matricula`) REFERENCES `vehiculos` (`Matricula`) ON UPDATE CASCADE,
  CONSTRAINT `ch_Importe` CHECK (((`Importe` >= 15) and (`Importe` <= 600)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `Matricula` char(7) NOT NULL,
  `MarcaModelo` varchar(30) NOT NULL,
  `Impuesto` float NOT NULL DEFAULT '50',
  PRIMARY KEY (`Matricula`),
  CONSTRAINT `ch_Impuesto` CHECK ((`Impuesto` >= 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 12:14:58
