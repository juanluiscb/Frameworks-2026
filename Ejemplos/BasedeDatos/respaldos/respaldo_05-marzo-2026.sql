-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: controlcaseta
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB-1:10.5.5+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora_acceso`
--

DROP TABLE IF EXISTS `bitacora_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora_acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_acceso`
--

LOCK TABLES `bitacora_acceso` WRITE;
/*!40000 ALTER TABLE `bitacora_acceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(120) NOT NULL,
  `no_exterior` int(11) NOT NULL,
  `interior` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  `tipo_vivienda` enum('casa_habitacion','rentada','negocio','Airbnb','desocupada') DEFAULT 'casa_habitacion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_visita`
--

DROP TABLE IF EXISTS `qr_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr_visita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qr_generado` varchar(255) DEFAULT NULL,
  `id_direccion` int(11) NOT NULL,
  `usos_maximos` int(2) DEFAULT NULL,
  `usos_actuales` int(2) NOT NULL,
  `fecha_generacion` timestamp NULL DEFAULT NULL,
  `fecha_expira` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qr_visita_pk_2` (`qr_generado`),
  KEY `qr_visita_direccion_id_fk` (`id_direccion`),
  CONSTRAINT `qr_visita_direccion_id_fk` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_visita`
--

LOCK TABLES `qr_visita` WRITE;
/*!40000 ALTER TABLE `qr_visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vecino`
--

DROP TABLE IF EXISTS `tipo_vecino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vecino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_vecino` varchar(80) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vecino`
--

LOCK TABLES `tipo_vecino` WRITE;
/*!40000 ALTER TABLE `tipo_vecino` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_vecino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vecino`
--

DROP TABLE IF EXISTS `vecino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vecino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `apaterno` varchar(80) DEFAULT NULL,
  `amatero` varchar(80) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `tipo_vecino_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vecino`
--

LOCK TABLES `vecino` WRITE;
/*!40000 ALTER TABLE `vecino` DISABLE KEYS */;
/*!40000 ALTER TABLE `vecino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vecino_paga_direccion`
--

DROP TABLE IF EXISTS `vecino_paga_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vecino_paga_direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vecino` int(11) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `fecha_paga` date DEFAULT NULL,
  `fecha_paga_inicio` date DEFAULT NULL,
  `fecha_paga_termina` date DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vecino_paga_direccion_direccion_id_fk` (`id_direccion`),
  KEY `vecino_paga_direccion_vecino_id_fk` (`id_vecino`),
  CONSTRAINT `vecino_paga_direccion_direccion_id_fk` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id`),
  CONSTRAINT `vecino_paga_direccion_vecino_id_fk` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vecino_paga_direccion`
--

LOCK TABLES `vecino_paga_direccion` WRITE;
/*!40000 ALTER TABLE `vecino_paga_direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `vecino_paga_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(6) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` int(4) DEFAULT NULL,
  `color` varchar(60) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehiculo_pk_2` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-05 15:05:50
