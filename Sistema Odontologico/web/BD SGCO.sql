CREATE DATABASE  IF NOT EXISTS `db_sistema_odotologico` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_sistema_odotologico`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_sistema_odotologico
-- ------------------------------------------------------
-- Server version	5.5.34

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
-- Table structure for table `t_accion`
--

DROP TABLE IF EXISTS `t_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_accion` (
  `id_accion` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_accion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_accion`
--

LOCK TABLES `t_accion` WRITE;
/*!40000 ALTER TABLE `t_accion` DISABLE KEYS */;
INSERT INTO `t_accion` VALUES (2,'Endodoncia'),(4,'Limpieza Dental'),(5,'Tartrectomía '),(6,'Puente');
/*!40000 ALTER TABLE `t_accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_atencion`
--

DROP TABLE IF EXISTS `t_atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_atencion` (
  `id_atencion` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `id_campana` int(11) NOT NULL,
  `c_observaciones` text,
  PRIMARY KEY (`id_atencion`),
  KEY `fk_atencion_canpana001_idx` (`id_campana`),
  KEY `fk_atencion_paciente_idx` (`id_paciente`),
  KEY `fk_atencion_personal001_idx` (`id_personal`),
  CONSTRAINT `fk_atencion_campana` FOREIGN KEY (`id_campana`) REFERENCES `t_campana` (`id_campana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `t_paciente` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_personal` FOREIGN KEY (`id_personal`) REFERENCES `t_personal` (`id_personal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_atencion`
--

LOCK TABLES `t_atencion` WRITE;
/*!40000 ALTER TABLE `t_atencion` DISABLE KEYS */;
INSERT INTO `t_atencion` VALUES (42,1,1006,28,'Ninguna'),(43,2,1005,28,'Mal Aliento'),(44,3,1005,28,'Caries Blanca se realizo Limpieza'),(45,4,1005,28,'Se realizo tratectonia'),(46,5,1006,28,'Limpieza Bucal'),(47,6,1006,29,'Se Realizo una Limpieza dental y se receto limpieza periodica');
/*!40000 ALTER TABLE `t_atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_atencion_accion`
--

DROP TABLE IF EXISTS `t_atencion_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_atencion_accion` (
  `id_atencion` int(11) NOT NULL,
  `id_accion` int(11) NOT NULL,
  PRIMARY KEY (`id_atencion`,`id_accion`),
  KEY `fk_atencion_accion01_idx` (`id_accion`),
  CONSTRAINT `fk_atencion_accion1` FOREIGN KEY (`id_atencion`) REFERENCES `t_atencion` (`id_atencion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_accion2` FOREIGN KEY (`id_accion`) REFERENCES `t_accion` (`id_accion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_atencion_accion`
--

LOCK TABLES `t_atencion_accion` WRITE;
/*!40000 ALTER TABLE `t_atencion_accion` DISABLE KEYS */;
INSERT INTO `t_atencion_accion` VALUES (42,2),(43,2),(44,2),(46,2),(45,4),(47,4),(42,5),(43,5),(45,5),(47,5),(44,6);
/*!40000 ALTER TABLE `t_atencion_accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_atencion_problema`
--

DROP TABLE IF EXISTS `t_atencion_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_atencion_problema` (
  `id_atencion` int(11) NOT NULL,
  `id_problema` int(11) NOT NULL,
  PRIMARY KEY (`id_atencion`,`id_problema`),
  KEY `fk_atencion_problema02` (`id_problema`),
  CONSTRAINT `fk_atencion_problema1` FOREIGN KEY (`id_atencion`) REFERENCES `t_atencion` (`id_atencion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_problema2` FOREIGN KEY (`id_problema`) REFERENCES `t_problema` (`id_problema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_atencion_problema`
--

LOCK TABLES `t_atencion_problema` WRITE;
/*!40000 ALTER TABLE `t_atencion_problema` DISABLE KEYS */;
INSERT INTO `t_atencion_problema` VALUES (42,2),(43,2),(44,2),(45,2),(47,2),(44,3),(46,3),(42,4),(43,4),(45,5),(47,5);
/*!40000 ALTER TABLE `t_atencion_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_campana`
--

DROP TABLE IF EXISTS `t_campana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_campana` (
  `id_campana` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(45) DEFAULT NULL,
  `c_contacto` varchar(45) DEFAULT NULL,
  `c_fecha` date DEFAULT NULL,
  `c_lugar` varchar(45) DEFAULT NULL,
  `c_observacion` varchar(45) DEFAULT NULL,
  `c_conclusion` varchar(45) DEFAULT NULL,
  `c_estado` char(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`id_campana`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_campana`
--

LOCK TABLES `t_campana` WRITE;
/*!40000 ALTER TABLE `t_campana` DISABLE KEYS */;
INSERT INTO `t_campana` VALUES (19,'Cusco Mayo 2013','Omar García','2013-05-01','Plazoleta de Santiago',NULL,NULL,'F'),(20,'Acomayo Junio 2013','Jacinto Perez Lopez','2013-04-01','Plaza de Aramas de Acomayo',NULL,NULL,'F'),(21,'Anta Julio 2013','Oscar Pelaez Quispe','2012-02-16','Palza de Armas Anta',NULL,NULL,'F'),(22,'Calca Agosto 2013','Oscar Acurio Gomez','2012-02-16','Plaza de Armas Calca',NULL,NULL,'F'),(23,'Canas Setiembre 2013','Pedro Ramirez Pumayali','2012-02-16','Plaza de Armas Canas',NULL,NULL,'F'),(24,'Canchis Octubre 2013','Jose Quiñones Pari','2012-02-16','Plaza de Armas Canchis',NULL,NULL,'F'),(25,'Chumbivilcas Noviembre 2013','Honorato Acurio Huaman','2012-02-16','Plaza de Armas Chumbivilcas',NULL,NULL,'F'),(26,'Espinar Diciembre 2013','Dante Condori Huaman','2012-02-16','Plaza de Armas Espinar',NULL,NULL,'F'),(27,'La Convención Enero 2014','David Illa Bellota','2012-02-16','Plaza de Armas de la Convención',NULL,NULL,'P'),(28,'Paruro Febrero 2014','Kevin Sillca Ayme','2012-02-16','Plaza Armas Paruro',NULL,NULL,'P'),(29,'Paucartambo Marzo 2014','David Muñoz Muñoz','2014-03-16','Plaza de Aramas S/N Paucatambo',NULL,NULL,'P');
/*!40000 ALTER TABLE `t_campana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_campana_personal`
--

DROP TABLE IF EXISTS `t_campana_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_campana_personal` (
  `id_campana` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_campana`,`id_personal`),
  KEY `fk_campana_personal02_idx` (`id_personal`),
  CONSTRAINT `fk_campana_personal01` FOREIGN KEY (`id_campana`) REFERENCES `t_campana` (`id_campana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_campana_personal02` FOREIGN KEY (`id_personal`) REFERENCES `t_personal` (`id_personal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_campana_personal`
--

LOCK TABLES `t_campana_personal` WRITE;
/*!40000 ALTER TABLE `t_campana_personal` DISABLE KEYS */;
INSERT INTO `t_campana_personal` VALUES (29,1005),(28,1006),(29,1006),(28,1007),(29,1008),(29,1012),(29,1013);
/*!40000 ALTER TABLE `t_campana_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_campana_recurso`
--

DROP TABLE IF EXISTS `t_campana_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_campana_recurso` (
  `id_campana` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `c_cantidad` int(11) DEFAULT NULL,
  `c_costo_unitario` double DEFAULT NULL,
  PRIMARY KEY (`id_campana`,`id_recurso`),
  KEY `fk_campana_recurso2_idx` (`id_recurso`),
  CONSTRAINT `fk_campana_recurso1` FOREIGN KEY (`id_campana`) REFERENCES `t_campana` (`id_campana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_campana_recurso2` FOREIGN KEY (`id_recurso`) REFERENCES `t_recurso` (`id_recurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_campana_recurso`
--

LOCK TABLES `t_campana_recurso` WRITE;
/*!40000 ALTER TABLE `t_campana_recurso` DISABLE KEYS */;
INSERT INTO `t_campana_recurso` VALUES (27,4,4,45),(27,5,10,2),(27,7,4,30),(28,4,4,50),(28,5,2,1.5),(28,7,5,30),(28,9,200,0.7),(29,7,5,30),(29,10,3,12);
/*!40000 ALTER TABLE `t_campana_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_documentacion`
--

DROP TABLE IF EXISTS `t_documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_documentacion` (
  `id_documentacion` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(45) DEFAULT NULL,
  `c_ruta` text,
  PRIMARY KEY (`id_documentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_documentacion`
--

LOCK TABLES `t_documentacion` WRITE;
/*!40000 ALTER TABLE `t_documentacion` DISABLE KEYS */;
INSERT INTO `t_documentacion` VALUES (1,'Formato de Recetas','../docs/dni carlos.docx'),(2,'Ficha de Atención','../docs/Anglolab S.A. - Impresión de Resultados.pdf'),(3,'Solicitud de Campaña','../docs/Evolución Histórica.docx'),(4,'Contrato de Trabajo','../docs/UAP Virtual.docx'),(5,'Acta de Aceptación del Sistema','../docs/documentos.pdf');
/*!40000 ALTER TABLE `t_documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_paciente`
--

DROP TABLE IF EXISTS `t_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_paciente` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombres` varchar(45) DEFAULT NULL,
  `c_apellidos` varchar(45) DEFAULT NULL,
  `c_fecha_nac` date DEFAULT NULL,
  `c_dni` varchar(8) DEFAULT NULL,
  `c_sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_paciente`
--

LOCK TABLES `t_paciente` WRITE;
/*!40000 ALTER TABLE `t_paciente` DISABLE KEYS */;
INSERT INTO `t_paciente` VALUES (1,'Marco Cesar','Miranda Tovar','2012-02-16','45458745','M'),(2,'Alberto','Miranda Quispe','2012-02-16','78451289','M'),(3,'Juanita','Pari Barreda','2012-02-07','12345678','F'),(4,'Milagros','Arenas Huaman','2012-02-14','67876823','F'),(5,'Pedro','Peres Vela','2012-02-16','45504680','F'),(6,'David','Guevara Gonzalez','1990-03-14','78945612','M');
/*!40000 ALTER TABLE `t_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_personal`
--

DROP TABLE IF EXISTS `t_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombres` varchar(45) DEFAULT NULL,
  `c_apellidos` varchar(45) DEFAULT NULL,
  `c_fecha_nac` date DEFAULT NULL,
  `c_dni` varchar(45) DEFAULT NULL,
  `c_telefono` varchar(45) DEFAULT NULL,
  `c_direccion` varchar(45) DEFAULT NULL,
  `c_tipo` varchar(45) DEFAULT NULL,
  `c_estado` char(1) DEFAULT 'A',
  `c_contrasena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_personal`
--

LOCK TABLES `t_personal` WRITE;
/*!40000 ALTER TABLE `t_personal` DISABLE KEYS */;
INSERT INTO `t_personal` VALUES (1001,'Carlos ','Pumayali Santiago','1988-11-21','45504660','223813','Av Guardia Civil 502','Administrador','A','123456'),(1002,'Soporte','QuicklySoft','2012-02-15','23456712','956895623','Av Guardia Civil 502','Administrador','I','123456'),(1003,'Estefany ','Escobar Cosso','2012-02-16','78542145','984999057','Av Guardia Civil 502','Secretaria','A','123456'),(1004,'Raquel','Puma Ayme','2012-02-16','21548754','984999057','Av Guardia Civil 502','Secretaria','A','123456'),(1005,'Jean Carlos','Mayhua','2012-02-16','12345678','385784512','Av. Las Palmeras E-8','Odontologo','A','null'),(1006,'Joao','Cornejo Valencia','2012-02-14','89562356','984562389','Av Guardia Civil 502','Odontologo','A',''),(1007,'Leslie','Flores Branco','2012-02-16','45504660','984785421','Av los Cerecos  89','Colaborador','A','null'),(1008,'Percy','Arebalo Rojas','2012-02-16','89653256','984999057','Av Machupicchu H-6','Colaborador','A','null'),(1009,'Oscar','Ramirez Vega','2012-02-16','98562387','984652356','Calle Cipreses B45 -Wanchaq','Practicante','A','null'),(1010,'Juan','Perez Calo','2012-02-07','54879856','984562378','Jr los Rosales B-30','Practicante','A','null'),(1011,'Henry','Ticona Nina','1998-07-22','45504660','956895623','Av. Los Rosales E-9','Practicante','A','null'),(1012,'Oscar','Sabina Guzman','2012-02-16','89562356','984562356','Los sauces e-12','Practicante','A','null'),(1013,'Gladys','Tovar Acuña','2012-02-16','23917051','984776127','Av. Machupicchu H-6','Practicante','A','null');
/*!40000 ALTER TABLE `t_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_problema`
--

DROP TABLE IF EXISTS `t_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_problema` (
  `id_problema` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_problema`
--

LOCK TABLES `t_problema` WRITE;
/*!40000 ALTER TABLE `t_problema` DISABLE KEYS */;
INSERT INTO `t_problema` VALUES (1,'Caries'),(2,'Enfermedad de Encias'),(3,'Maloclusión'),(4,'Halitosis'),(5,'Bruxismo');
/*!40000 ALTER TABLE `t_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_recurso`
--

DROP TABLE IF EXISTS `t_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_recurso` (
  `id_recurso` int(11) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(45) DEFAULT NULL,
  `c_medida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_recurso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_recurso`
--

LOCK TABLES `t_recurso` WRITE;
/*!40000 ALTER TABLE `t_recurso` DISABLE KEYS */;
INSERT INTO `t_recurso` VALUES (4,'Dentina','Frasco 1 Litro'),(5,'Violeta','Frasco 500 ml'),(7,'Fluor','Frasco 500 ml'),(9,'Cepillo','Unidad'),(10,'Algodon Esteril','Caja');
/*!40000 ALTER TABLE `t_recurso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-14 21:40:17
