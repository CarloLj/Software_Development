-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: miniproyecto
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

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
-- Table structure for table `accesorios`
--

DROP TABLE IF EXISTS `accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipoaccesorio` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorios`
--

LOCK TABLES `accesorios` WRITE;
/*!40000 ALTER TABLE `accesorios` DISABLE KEYS */;
INSERT INTO `accesorios` VALUES (1,'Deluxxe Misc','Rolex','Relox'),(2,'Miximo Deluxe','Gucci','Bracalete de oro');
/*!40000 ALTER TABLE `accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_accesorios`
--

DROP TABLE IF EXISTS `inventario_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_accesorios` (
  `idsucursal` int(11) NOT NULL,
  `idaccesorio` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idaccesorio` (`idaccesorio`),
  CONSTRAINT `inventario_accesorios_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  CONSTRAINT `inventario_accesorios_ibfk_2` FOREIGN KEY (`idaccesorio`) REFERENCES `accesorios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_accesorios`
--

LOCK TABLES `inventario_accesorios` WRITE;
/*!40000 ALTER TABLE `inventario_accesorios` DISABLE KEYS */;
INSERT INTO `inventario_accesorios` VALUES (1,1,6,3),(1,2,10,4);
/*!40000 ALTER TABLE `inventario_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_ropadeportiva`
--

DROP TABLE IF EXISTS `inventario_ropadeportiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_ropadeportiva` (
  `idsucursal` int(11) NOT NULL,
  `idropadeportiva` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idropadeportiva` (`idropadeportiva`),
  CONSTRAINT `inventario_ropadeportiva_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  CONSTRAINT `inventario_ropadeportiva_ibfk_2` FOREIGN KEY (`idropadeportiva`) REFERENCES `ropadeportiva` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_ropadeportiva`
--

LOCK TABLES `inventario_ropadeportiva` WRITE;
/*!40000 ALTER TABLE `inventario_ropadeportiva` DISABLE KEYS */;
INSERT INTO `inventario_ropadeportiva` VALUES (1,1,6,1),(1,2,7,2);
/*!40000 ALTER TABLE `inventario_ropadeportiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_zapatos`
--

DROP TABLE IF EXISTS `inventario_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_zapatos` (
  `idsucursal` int(11) NOT NULL,
  `idzapato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idzapato` (`idzapato`),
  CONSTRAINT `inventario_zapatos_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  CONSTRAINT `inventario_zapatos_ibfk_2` FOREIGN KEY (`idzapato`) REFERENCES `zapatos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_zapatos`
--

LOCK TABLES `inventario_zapatos` WRITE;
/*!40000 ALTER TABLE `inventario_zapatos` DISABLE KEYS */;
INSERT INTO `inventario_zapatos` VALUES (1,1,10,1),(1,2,10,2);
/*!40000 ALTER TABLE `inventario_zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropadeportiva`
--

DROP TABLE IF EXISTS `ropadeportiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ropadeportiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipoprenda` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropadeportiva`
--

LOCK TABLES `ropadeportiva` WRITE;
/*!40000 ALTER TABLE `ropadeportiva` DISABLE KEYS */;
INSERT INTO `ropadeportiva` VALUES (1,'Spring tee','Adidas','Playera'),(2,'Coffee tee','Nike','Playera deportiva');
/*!40000 ALTER TABLE `ropadeportiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'carlo','123');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapatos`
--

DROP TABLE IF EXISTS `zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zapatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipozapato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapatos`
--

LOCK TABLES `zapatos` WRITE;
/*!40000 ALTER TABLE `zapatos` DISABLE KEYS */;
INSERT INTO `zapatos` VALUES (1,'Zapaton','Maximus Invictus','Bota alta'),(2,'Zapatin','Maximus Invictus','Tacon bajo'),(3,'Maximus VIII','Boroni','Zapato lustrosos');
/*!40000 ALTER TABLE `zapatos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-03  1:59:31
