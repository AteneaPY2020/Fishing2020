-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fishingdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL COMMENT '"Alimentos", "Moda", "Ecologia", "Ciencia y tecnologia", "Social", "Salud", "Academico", "Entretenimiento", "Infantil", "Belleza", "Otra"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimento'),(2,'Moda'),(3,'Ecologia'),(4,'Ciencia y tecnologia'),(5,'Social'),(6,'Salud'),(7,'Academico'),(8,'Entretenimiento'),(9,'Infantil'),(10,'Belleza'),(11,'Otra');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprendimiento`
--

DROP TABLE IF EXISTS `emprendimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprendimiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(45) NOT NULL COMMENT '"Huevo", "Pez dorado", "Tiburon"',
  `descripcion` varchar(500) NOT NULL,
  `historia` varchar(500) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `foto` longblob,
  `eslogan` varchar(45) DEFAULT NULL,
  `inversion_inicial` double DEFAULT NULL,
  `fecha_fundacion` date NOT NULL,
  `venta_año_anterior` double DEFAULT NULL,
  `oferta_porcentaje` double DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprendimiento`
--

LOCK TABLES `emprendimiento` WRITE;
/*!40000 ALTER TABLE `emprendimiento` DISABLE KEYS */;
INSERT INTO `emprendimiento` VALUES (1,'Puseria Mary','Tiburon','Negocio familiar que vende pupusas','','mary@pusas.sv','22555555',NULL,'Barriga llena, corazón contento',0,'0000-00-00',0,0,'','','',''),(2,'Crown','Pez dorado','Venta de accesorios','','crown@diademas.com','23456789',NULL,'Ninnas bonitas con diadema',0,'0000-00-00',0,0,'','','','');
/*!40000 ALTER TABLE `emprendimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_emprendimiento` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_especialidad_emprendimiento1_idx` (`id_emprendimiento`),
  KEY `fk_especialidad_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_especialidad_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_especialidad_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,1,1),(2,2,2),(3,2,10);
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundadores`
--

DROP TABLE IF EXISTS `fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) NOT NULL,
  `curriculum` varchar(500) NOT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fundadores_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_fundadores_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundadores`
--

LOCK TABLES `fundadores` WRITE;
/*!40000 ALTER TABLE `fundadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardado`
--

DROP TABLE IF EXISTS `guardado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inversionista` int NOT NULL,
  `id_publicacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guardado_inversionista1_idx` (`id_inversionista`),
  KEY `fk_guardado_publicacion1_idx` (`id_publicacion`),
  CONSTRAINT `fk_guardado_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`),
  CONSTRAINT `fk_guardado_publicacion1` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardado`
--

LOCK TABLES `guardado` WRITE;
/*!40000 ALTER TABLE `guardado` DISABLE KEYS */;
INSERT INTO `guardado` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `guardado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especificaciones` varchar(500) NOT NULL,
  `oferta` double NOT NULL,
  `porcentaje` double NOT NULL,
  `fecha` date NOT NULL,
  `id_emprendimiento` int NOT NULL,
  `id_inversionista` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historial_emprendimiento1_idx` (`id_emprendimiento`),
  KEY `fk_historial_inversionista1_idx` (`id_inversionista`),
  CONSTRAINT `fk_historial_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`),
  CONSTRAINT `fk_historial_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interes`
--

DROP TABLE IF EXISTS `interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_inversionista` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_interes_inversionista1_idx` (`id_inversionista`),
  KEY `fk_interes_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_interes_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_interes_inversionista1` FOREIGN KEY (`id_inversionista`) REFERENCES `inversionista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interes`
--

LOCK TABLES `interes` WRITE;
/*!40000 ALTER TABLE `interes` DISABLE KEYS */;
INSERT INTO `interes` VALUES (1,1,1),(2,1,4),(3,1,8),(4,2,1),(5,2,2),(6,2,3),(7,2,9);
/*!40000 ALTER TABLE `interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inversionista`
--

DROP TABLE IF EXISTS `inversionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inversionista` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `biografia` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tipo` tinyint NOT NULL COMMENT '"0-Individuo", "1-Empresa"',
  `foto` longblob,
  `pais` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inversionista`
--

LOCK TABLES `inversionista` WRITE;
/*!40000 ALTER TABLE `inversionista` DISABLE KEYS */;
INSERT INTO `inversionista` VALUES (1,'Mark Cuban','Dueño de los Dallas Maveriks','mark@$$.com',0,NULL,'','','',''),(2,'Lori Greiner','Mi patrimonio es de 70 millones ;)','lori@baby.com',0,NULL,'','','','');
/*!40000 ALTER TABLE `inversionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_venta`
--

DROP TABLE IF EXISTS `medios_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medios_venta` varchar(45) DEFAULT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medios_venta_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_medios_venta_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_venta`
--

LOCK TABLES `medios_venta` WRITE;
/*!40000 ALTER TABLE `medios_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medios_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_cliente`
--

DROP TABLE IF EXISTS `perfil_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_cliente_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_cliente`
--

LOCK TABLES `perfil_cliente` WRITE;
/*!40000 ALTER TABLE `perfil_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `foto` longblob,
  `descripcion` varchar(300) NOT NULL,
  `costo_unitario` double NOT NULL,
  `precio_venta` double NOT NULL,
  `patente` tinyint NOT NULL,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productost_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_productost_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `video` longblob,
  `foto` longblob,
  `id_emprendimiento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publicacion_emprendimiento1_idx` (`id_emprendimiento`),
  CONSTRAINT `fk_publicacion_emprendimiento1` FOREIGN KEY (`id_emprendimiento`) REFERENCES `emprendimiento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,'Le traigo ricas pupusas con los mejores ingredientes',NULL,NULL,1),(2,'Tengo diademas hechas a mano, mi amor, a un precio accesible ',NULL,NULL,2);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaccion`
--

DROP TABLE IF EXISTS `reaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reaccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `id_publicacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reaccion_publicacion1_idx` (`id_publicacion`),
  CONSTRAINT `fk_reaccion_publicacion1` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaccion`
--

LOCK TABLES `reaccion` WRITE;
/*!40000 ALTER TABLE `reaccion` DISABLE KEYS */;
INSERT INTO `reaccion` VALUES (1,2,1),(2,1,2);
/*!40000 ALTER TABLE `reaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21 11:04:03
