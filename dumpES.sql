-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: esanhueza
-- ------------------------------------------------------
-- Server version	5.5.62-0+deb8u1

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
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodega` (
  `idbodega` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `createdBodega` datetime NOT NULL,
  `modifiedBodega` datetime NOT NULL,
  PRIMARY KEY (`idbodega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1569721088,'Bodega esanhueza','2019-09-28 21:38:08','2019-09-28 21:38:08');
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodeguero`
--

DROP TABLE IF EXISTS `bodeguero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodeguero` (
  `idbodeguero` int(11) NOT NULL,
  `nombreBodeguero` varchar(45) NOT NULL,
  `createdBodeguero` varchar(45) NOT NULL,
  `modifiedBodeguero` varchar(45) NOT NULL,
  `bodega` int(11) NOT NULL,
  PRIMARY KEY (`idbodeguero`),
  KEY `fk_bodeguero_bodega1_idx` (`bodega`),
  CONSTRAINT `fk_bodeguero_bodega1` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`idbodega`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodeguero`
--

LOCK TABLES `bodeguero` WRITE;
/*!40000 ALTER TABLE `bodeguero` DISABLE KEYS */;
INSERT INTO `bodeguero` VALUES (1569722126,'Sergio Canales','2019-09-28 21:55:26','2019-09-28 21:55:26',1569721088);
/*!40000 ALTER TABLE `bodeguero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chofer` (
  `rutChofer` int(11) NOT NULL,
  `nombre` varchar(450) NOT NULL,
  `fechaNaciemiento` datetime NOT NULL,
  `createdChofer` datetime NOT NULL,
  `modifiedChofer` datetime NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `ultimaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`rutChofer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES (13234569,'Francisco Sanhueza','1991-10-10 00:00:00','2019-09-28 22:04:36','2019-09-28 22:04:36',NULL,NULL,NULL),(15993323,'David Sanhueza','1985-04-17 00:00:00','2019-09-28 22:01:33','2019-09-28 22:01:33',-35.4455102,-71.6804986,'2019-10-01 02:56:14'),(18334221,'Ricardo Beltran','1993-02-18 00:00:00','2019-09-28 22:02:25','2019-09-28 22:02:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `rutCliente` varchar(45) NOT NULL,
  `nombreCliente` varchar(450) NOT NULL,
  `createdClient` datetime NOT NULL,
  `modifiedClient` datetime NOT NULL,
  PRIMARY KEY (`rutCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('60910000','UNIVERSIDAD DE CHILE','2019-09-28 22:06:38','2019-09-28 22:06:38'),('61608204','HOSPITAL SAN JUAN DE DIOS','2019-09-28 22:07:45','2019-09-28 22:07:45'),('96530470','CLINICA DAVILA','2019-09-28 22:07:16','2019-09-28 22:07:16');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarioRecepcion`
--

DROP TABLE IF EXISTS `comentarioRecepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarioRecepcion` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRecepcion` varchar(450) NOT NULL,
  `comentarioPedido` varchar(4500) NOT NULL,
  `fechaComentario` datetime NOT NULL,
  `tipoComentario` varchar(45) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `receptor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcomentario`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarioRecepcion`
--

LOCK TABLES `comentarioRecepcion` WRITE;
/*!40000 ALTER TABLE `comentarioRecepcion` DISABLE KEYS */;
INSERT INTO `comentarioRecepcion` VALUES (29,'','','2019-10-01 02:49:09','','Entregado','Productos recibidos correctamente.','erivk'),(30,'','','2019-10-01 02:49:34','','Entregado','Productos recibidos correctamente.','hola w');
/*!40000 ALTER TABLE `comentarioRecepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobante` (
  `idcomprobante` int(11) NOT NULL AUTO_INCREMENT,
  `idruta` int(11) DEFAULT NULL,
  `iddocumento` int(11) DEFAULT NULL,
  `nombreComprobante` varchar(450) NOT NULL,
  `fechaComprobante` datetime NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcomprobante`),
  UNIQUE KEY `path` (`path`),
  KEY `idruta` (`idruta`),
  KEY `iddocumento` (`iddocumento`),
  CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`idruta`) REFERENCES `documento_en_ruta` (`ruta`),
  CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`iddocumento`) REFERENCES `documento_en_ruta` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES (28,1569723032,197280,'IMG-20190928-WA0000.jpg','2019-10-01 02:49:09','5d92e912f0c76'),(29,1569723061,189356,'IMG-20190924-WA0001.jpg','2019-10-01 02:49:34','5d92e92f13324');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `iddevice` int(11) NOT NULL,
  `numberDevice` varchar(45) NOT NULL,
  `tokenAcces` varchar(450) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`iddevice`),
  KEY `fk_device_user1_idx` (`user`),
  CONSTRAINT `fk_device_user1` FOREIGN KEY (`user`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (13234569,'56950966879','-',13234569),(15993323,'56950966879','-',15993323),(18334221,'56950966879','-',18334221),(60910000,'56950966879','-',60910000),(61608204,'56950966879','-',61608204),(96530470,'56950966879','-',96530470),(1569722126,'56950966879','-',1569722126);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `iddireccion` int(11) NOT NULL,
  `comuna` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `direccionValue` varchar(450) NOT NULL,
  `createdDireccion` datetime NOT NULL,
  `modifiedDireccion` datetime NOT NULL,
  `cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`iddireccion`),
  KEY `fk_direccion_cliente1_idx` (`cliente`),
  CONSTRAINT `fk_direccion_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`rutCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1569722903,'INDEPENDENCIA','SANTIAGO','METROPOLITANA','SANTOS DUMONT 999','2019-09-28 22:08:23','2019-09-28 22:08:23','60910000'),(1569722936,'SANTIAGO','SANTIAGO','METROPOLITANA','HUERFANOS 3255','2019-09-28 22:08:56','2019-09-28 22:08:56','61608204'),(1569722971,'SANTIAGO','RECOLETA','METROPOLITANA','RECOLETA 464','2019-09-28 22:09:31','2019-09-28 22:09:31','96530470');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccionBodega`
--

DROP TABLE IF EXISTS `direccionBodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccionBodega` (
  `iddireccionBodega` int(11) NOT NULL,
  `comuna` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `bodega` int(11) NOT NULL,
  PRIMARY KEY (`iddireccionBodega`),
  KEY `fk_direccionBodega_bodega1_idx` (`bodega`),
  CONSTRAINT `fk_direccionBodega_bodega1` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`idbodega`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccionBodega`
--

LOCK TABLES `direccionBodega` WRITE;
/*!40000 ALTER TABLE `direccionBodega` DISABLE KEYS */;
INSERT INTO `direccionBodega` VALUES (1569721088,'PROVINCIA','DIRECCION','COMUNA','CIUDAD','2019-09-28 21:38:08','2019-09-28 21:38:08',1569721088);
/*!40000 ALTER TABLE `direccionBodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `iddocumento` int(11) NOT NULL,
  `tipoDocumento` int(11) NOT NULL,
  `folio` int(11) NOT NULL,
  `fechaEmision` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `rutReceptor` varchar(45) NOT NULL,
  PRIMARY KEY (`iddocumento`),
  KEY `fk_documento_cliente1_idx` (`rutReceptor`),
  CONSTRAINT `fk_documento_cliente1` FOREIGN KEY (`rutReceptor`) REFERENCES `cliente` (`rutCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (189356,52,189356,'2018-12-11 00:00:00',434945,'60910000'),(197280,52,197280,'2019-02-18 00:00:00',45886400,'61608204'),(452266,33,452266,'2018-12-11 00:00:00',2261000,'96530470');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento_en_ruta`
--

DROP TABLE IF EXISTS `documento_en_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_en_ruta` (
  `documento` int(11) NOT NULL,
  `ruta` int(11) NOT NULL,
  `comentario` int(11) DEFAULT NULL,
  PRIMARY KEY (`documento`,`ruta`),
  KEY `fk_documento_has_ruta_ruta1_idx` (`ruta`),
  KEY `fk_documento_has_ruta_documento1_idx` (`documento`),
  KEY `fk_documento_en_ruta_comentarioRecepcion1_idx` (`comentario`),
  CONSTRAINT `documento_en_ruta_ibfk_1` FOREIGN KEY (`comentario`) REFERENCES `comentarioRecepcion` (`idcomentario`) ON DELETE SET NULL,
  CONSTRAINT `fk_documento_has_ruta_documento1` FOREIGN KEY (`documento`) REFERENCES `documento` (`iddocumento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_documento_has_ruta_ruta1` FOREIGN KEY (`ruta`) REFERENCES `ruta` (`idrutas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento_en_ruta`
--

LOCK TABLES `documento_en_ruta` WRITE;
/*!40000 ALTER TABLE `documento_en_ruta` DISABLE KEYS */;
INSERT INTO `documento_en_ruta` VALUES (452266,1569723022,NULL),(197280,1569723032,29),(189356,1569723061,30);
/*!40000 ALTER TABLE `documento_en_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geoPoint`
--

DROP TABLE IF EXISTS `geoPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geoPoint` (
  `idgeopoint` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `createdPoint` datetime NOT NULL,
  `modifiedPoint` datetime NOT NULL,
  `direccion` int(11) DEFAULT NULL,
  `rutCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idgeopoint`),
  KEY `fk_geoPoint_direccion1_idx` (`direccion`),
  KEY `rutCliente` (`rutCliente`),
  CONSTRAINT `fk_geoPoint_direccion1` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`iddireccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `geoPoint_ibfk_1` FOREIGN KEY (`rutCliente`) REFERENCES `cliente` (`rutCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geoPoint`
--

LOCK TABLES `geoPoint` WRITE;
/*!40000 ALTER TABLE `geoPoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `geoPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nameRol` varchar(45) NOT NULL,
  `createRol` datetime NOT NULL,
  `modifiedRol` datetime NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'root','2018-11-28 22:34:31','2018-11-28 22:34:31'),(2,'BODEGUERO','2018-11-28 22:34:44','2018-11-28 22:34:44'),(3,'CHOFER','2018-11-28 22:34:51','2018-11-28 22:34:51'),(4,'CLIENTE','2018-12-15 18:34:50','2018-12-15 18:34:50'),(5,'RECEPCIONISTA','2019-01-06 14:49:35','2019-01-06 14:49:35');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `idrutas` int(11) NOT NULL,
  `nombreRuta` varchar(450) NOT NULL,
  `jornadaRuta` varchar(45) NOT NULL,
  `rutChofer` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `modifiedRuta` datetime NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idrutas`),
  KEY `fk_ruta_chofer1_idx` (`rutChofer`),
  CONSTRAINT `fk_ruta_chofer1` FOREIGN KEY (`rutChofer`) REFERENCES `chofer` (`rutChofer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1569723022,'RUTA DEMO 1','MATUTINA',13234569,'2019-09-28 22:10:22','2019-09-28 22:10:22','INICIADO'),(1569723032,'RUTA DEMO 2','TARDE',15993323,'2019-09-28 22:10:32','2019-09-28 22:10:32','TERMINADO'),(1569723061,'RUTA DEMO 4','TARDE',15993323,'2019-09-28 22:11:01','2019-09-28 22:11:01','TERMINADO'),(1569909310,'Ruta testing envio de imÃ¡genes','MaÃ±ana',15993323,'2019-10-01 01:55:10','2019-10-01 01:56:19','INICIADO'),(1569909406,'Ruta testing envio de imÃ¡genes 2','MATUTINA',15993323,'2019-10-01 01:56:46','2019-10-01 01:56:46','INICIADO'),(1569909480,'Ruta testing envio de imÃ¡genes 3','MATUTINA',15993323,'2019-10-01 01:58:00','2019-10-01 01:58:00','INICIADO'),(1569909547,'Ruta testing envio de imÃ¡genes 4','Tarde',15993323,'2019-10-01 01:59:07','2019-10-01 02:00:35','INICIADO');
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `idticket` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTicket` varchar(450) NOT NULL,
  `motivoTicket` varchar(450) NOT NULL,
  `descripcionTicket` varchar(4500) NOT NULL,
  `creacionTicket` datetime NOT NULL,
  `modifiedTicket` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idticket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `nameUser` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createdUser` datetime NOT NULL,
  `modifiedUser` datetime NOT NULL,
  `rol_user` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `fk_user_rol1_idx` (`rol_user`),
  CONSTRAINT `fk_user_rol1` FOREIGN KEY (`rol_user`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (13234569,'fsanhueza','13234569','2019-09-28 22:04:36','2019-09-28 22:04:36',3,'david.medina@cebib.cl'),(15993323,'dsanhueza','15993323','2019-09-28 22:01:33','2019-09-28 22:01:33',3,'david.medina@cebib.cl'),(18334221,'rbeltran','18334221','2019-09-28 22:02:25','2019-09-28 22:02:25',3,'david.medina@cebib.cl'),(60910000,'uchile','60910000','2019-09-28 22:06:38','2019-09-28 22:06:38',4,'david.medina@cebib.cl'),(61608204,'hsanjuan','61608204','2019-09-28 22:07:45','2019-09-28 22:07:45',4,'david.medina@cebib.cl'),(96530470,'cdavila','96530470','2019-09-28 22:07:16','2019-09-28 22:07:16',4,'david.medina@cebib.cl'),(1569722126,'scanales','scanales','2019-09-28 21:55:26','2019-09-28 21:55:26',2,'david.medina@cebib.cl');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `patente` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `anoVehiculo` int(11) NOT NULL,
  `createdVehiculo` datetime NOT NULL,
  `modifiedVehiculo` datetime NOT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('PATENTE1','PATENTE1','PATENTE1',2018,'2019-09-28 21:59:15','2019-09-28 21:59:15'),('PATENTE2','PATENTE2','PATENTE2',1992,'2019-09-28 21:59:28','2019-09-28 21:59:28'),('PATENTE3','PATENTE3','PATENTE3',2013,'2019-09-28 22:00:31','2019-09-28 22:00:31');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculoAsignado`
--

DROP TABLE IF EXISTS `vehiculoAsignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculoAsignado` (
  `vehiculo_patente` varchar(45) NOT NULL,
  `chofer_rutChofer` int(11) NOT NULL,
  `fechaAsignacion` datetime NOT NULL,
  PRIMARY KEY (`vehiculo_patente`,`chofer_rutChofer`),
  KEY `fk_vehiculo_has_chofer_chofer1_idx` (`chofer_rutChofer`),
  KEY `fk_vehiculo_has_chofer_vehiculo1_idx` (`vehiculo_patente`),
  CONSTRAINT `fk_vehiculo_has_chofer_chofer1` FOREIGN KEY (`chofer_rutChofer`) REFERENCES `chofer` (`rutChofer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculo_has_chofer_vehiculo1` FOREIGN KEY (`vehiculo_patente`) REFERENCES `vehiculo` (`patente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculoAsignado`
--

LOCK TABLES `vehiculoAsignado` WRITE;
/*!40000 ALTER TABLE `vehiculoAsignado` DISABLE KEYS */;
INSERT INTO `vehiculoAsignado` VALUES ('PATENTE1',13234569,'2019-10-03 11:07:06'),('PATENTE2',15993323,'2019-10-03 11:07:09'),('PATENTE3',18334221,'2019-10-03 11:07:15');
/*!40000 ALTER TABLE `vehiculoAsignado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-03 19:24:47
