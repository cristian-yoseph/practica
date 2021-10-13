-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ventas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `Id_adm` int(11) NOT NULL,
  `nombre_adm` varchar(25) NOT NULL,
  `apellido_adm` varchar(25) NOT NULL,
  `sexo_amd` char(2) NOT NULL,
  `direccion_adm` varchar(50) NOT NULL,
  `tefefono_adm` char(9) NOT NULL,
  PRIMARY KEY (`Id_adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Cristian','Leoin','M','Pucallpa','938133312');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administraproducto`
--

DROP TABLE IF EXISTS `administraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administraproducto` (
  `id_adm_pro` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `id_adm` int(11) NOT NULL,
  PRIMARY KEY (`id_adm_pro`),
  KEY `fk_productoss` (`id_pro`),
  KEY `fk_administradorr` (`id_adm`),
  CONSTRAINT `fk_administradorr` FOREIGN KEY (`id_adm`) REFERENCES `administrador` (`Id_adm`),
  CONSTRAINT `fk_productoss` FOREIGN KEY (`id_pro`) REFERENCES `produto` (`Id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administraproducto`
--

LOCK TABLES `administraproducto` WRITE;
/*!40000 ALTER TABLE `administraproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `administraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Id_cli` int(11) NOT NULL,
  `nombre_cli` varchar(25) NOT NULL,
  `apellido_cli` varchar(25) NOT NULL,
  `sexo_cli` char(2) NOT NULL,
  `direccion_cli` varchar(50) NOT NULL,
  `tefefono_cli` char(9) NOT NULL,
  PRIMARY KEY (`Id_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id_Comp` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `id_cli` int(11) NOT NULL,
  PRIMARY KEY (`id_Comp`),
  KEY `fk_producto` (`id_pro`),
  KEY `fk_cliente` (`id_cli`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`Id_cli`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`id_pro`) REFERENCES `produto` (`Id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empaquetador`
--

DROP TABLE IF EXISTS `empaquetador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empaquetador` (
  `Id_emp` int(11) NOT NULL,
  `nombre_emp` varchar(25) NOT NULL,
  `apellido_emp` varchar(25) NOT NULL,
  `sexo_emp` char(2) NOT NULL,
  `direccion_emp` varchar(50) NOT NULL,
  `tefefono_emp` char(9) NOT NULL,
  `empleado_Id_em` int(11) NOT NULL,
  PRIMARY KEY (`Id_emp`),
  KEY `fk_empaquetador_empleado1_idx` (`empleado_Id_em`),
  CONSTRAINT `fk_empaquetador_empleado1` FOREIGN KEY (`empleado_Id_em`) REFERENCES `empleado` (`Id_em`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empaquetador`
--

LOCK TABLES `empaquetador` WRITE;
/*!40000 ALTER TABLE `empaquetador` DISABLE KEYS */;
/*!40000 ALTER TABLE `empaquetador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `Id_em` int(11) NOT NULL,
  `nombre_em` varchar(25) NOT NULL,
  `apellido_em` varchar(25) NOT NULL,
  `sexo_em` char(2) NOT NULL,
  `direccion_em` varchar(50) NOT NULL,
  `tefefono_em` char(9) NOT NULL,
  PRIMARY KEY (`Id_em`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Yoseph','Leon','M','pucallpa','938125147');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `Id_pro` int(11) NOT NULL,
  `nombre_pro` varchar(25) NOT NULL,
  `precio_pro` char(2) NOT NULL,
  `fecha_de_ven_pro` date DEFAULT NULL,
  `Id_emp` int(11) NOT NULL,
  PRIMARY KEY (`Id_pro`),
  KEY `fk_Empaquetador` (`Id_emp`),
  CONSTRAINT `fk_Empaquetador` FOREIGN KEY (`Id_emp`) REFERENCES `empaquetador` (`Id_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password_usuario` varchar(45) NOT NULL,
  `tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Cristian Leon','101010','Administrador'),(2,'Yoseph Leon','111111','Empleado'),(3,'Raul Angel','121212','Cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13  0:27:55
