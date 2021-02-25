-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dmedinaDB
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
INSERT INTO `bodega` VALUES (1567628280,'Bodega dmedina','2019-09-04 16:18:00','2019-09-28 21:20:27');
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
INSERT INTO `bodeguero` VALUES (1569720189,'David Medina','2019-09-28 21:23:09','2019-09-28 21:23:09',1567628280);
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
INSERT INTO `chofer` VALUES (6714240,'Juan Medina','1956-01-28 00:00:00','2019-09-28 21:25:12','2019-09-28 21:25:12',NULL,NULL,NULL),(18344821,'Diego Inostroza','1993-11-26 00:00:00','2019-09-28 21:24:06','2019-09-28 21:24:06',NULL,NULL,NULL);
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
INSERT INTO `cliente` VALUES ('61980320','HOSPITAL CLINICO METROP EL CARMEN','2019-09-28 21:31:45','2019-09-28 21:31:45'),('96885930','CLINICA BICENTENERAIO SPA','2019-09-28 21:34:21','2019-09-28 21:34:21'),('99573490','UC CHRISTUS SERVICIOS CLINICOS','2019-09-28 21:36:28','2019-09-28 21:36:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarioRecepcion`
--

LOCK TABLES `comentarioRecepcion` WRITE;
/*!40000 ALTER TABLE `comentarioRecepcion` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
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
INSERT INTO `device` VALUES (6714240,'56950966879','-',6714240),(18344821,'56950966879','-',18344821),(61980320,'56950966879','-',61980320),(96885930,'56950966879','-',96885930),(99573490,'56950966879','-',99573490),(1569720189,'+56950966879','-',1569720189);
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
INSERT INTO `direccion` VALUES (1569720808,'MAIPU','SANTIAGO','METROPOLITANA','CAMINO RINCONADA 1201','2019-09-28 21:33:28','2019-09-28 21:33:28','61980320'),(1569720926,'ESTACION CENTRAL','SANTIAGO','METROPOLITANA','AV BERNARDO OHIGGINS 4850','2019-09-28 21:35:26','2019-09-28 21:35:26','96885930'),(1569721028,'LAS CONDES','SANTIAGO','METROPOLITANA','CAMINO EL ALBA 12351','2019-09-28 21:37:08','2019-09-28 21:37:08','99573490');
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
INSERT INTO `direccionBodega` VALUES (1567628280,'BODEGA DMEDINA','BODEGA DMEDINA','BODEGA DMEDINA','BODEGA DMEDINA','2019-09-04 16:18:00','2019-09-28 21:20:27',1567628280);
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
INSERT INTO `documento` VALUES (189307,52,189307,'2018-12-11 00:00:00',4217717,'96885930'),(189323,52,189323,'2018-12-11 00:00:00',1959335,'96885930'),(189326,52,189326,'2018-12-11 00:00:00',1959335,'96885930'),(189328,52,189328,'2018-12-11 00:00:00',6071142,'96885930'),(189332,52,189332,'2018-12-11 00:00:00',1959335,'96885930'),(189337,52,189337,'2018-12-11 00:00:00',1959335,'96885930'),(189339,52,189339,'2018-12-11 00:00:00',1959335,'96885930'),(189350,52,189350,'2018-12-11 00:00:00',1959335,'96885930'),(189352,52,189352,'2018-12-11 00:00:00',1959335,'96885930'),(197062,52,197062,'2019-02-14 00:00:00',1606500,'96885930'),(197075,52,197075,'2019-02-14 00:00:00',1958740,'96885930'),(197341,52,197341,'2019-02-18 00:00:00',618800,'99573490'),(465934,33,465934,'2019-02-14 00:00:00',2130219,'61980320');
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
INSERT INTO `documento_en_ruta` VALUES (189307,1569724916,NULL),(189323,1569724907,NULL),(189326,1569724907,NULL),(189328,1569724896,NULL),(189332,1569724916,NULL),(189337,1569724925,NULL),(189339,1569724925,NULL),(189350,1569724916,NULL),(189352,1569724907,NULL),(197062,1569724896,NULL),(197075,1569724925,NULL),(197341,1569724934,NULL),(465934,1569724896,NULL);
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
INSERT INTO `ruta` VALUES (523300473,'Nueva ruta demo','MATUTINA',6714240,'2019-10-03 16:31:18','2019-10-03 16:31:18','INICIADO'),(567093596,'123123','MATUTINA',18344821,'2019-10-03 16:32:28','2019-10-03 16:32:28','INICIADO'),(678512805,'Ruta Demo Error','MATUTINA',6714240,'2019-10-03 13:28:28','2019-10-03 13:28:28','INICIADO'),(829521182,'ruta error','MATUTINA',6714240,'2019-10-03 13:34:13','2019-10-03 13:34:13','INICIADO'),(1569724896,'RUTA DEMO 1','MATUTINA',6714240,'2019-09-28 22:41:36','2019-09-28 22:41:36','INICIADO'),(1569724907,'RUTA DEMO 2','TARDE',6714240,'2019-09-28 22:41:47','2019-09-28 22:41:47','INICIADO'),(1569724916,'RUTA DEMO 3','OTROS',18344821,'2019-09-28 22:41:56','2019-09-28 22:41:56','INICIADO'),(1569724925,'RUTA DEMO 4','MATUTINA',18344821,'2019-09-28 22:42:05','2019-09-28 22:42:05','INICIADO'),(1569724934,'RUTA DEMO 5','TARDE',18344821,'2019-09-28 22:42:14','2019-09-28 22:42:14','INICIADO');
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
INSERT INTO `user` VALUES (6714240,'jmedina','6714240','2019-09-28 21:25:12','2019-09-28 21:25:12',3,'david.medina@cebib.cl'),(18344821,'dinostroza','18344821','2019-09-28 21:24:06','2019-09-28 21:24:06',3,'david.medina@cebib.cl'),(61980320,'hcarmen','61980320','2019-09-28 21:31:45','2019-09-28 21:31:45',4,'david.medina@cebib.cl'),(96885930,'cbicentenario','96885930','2019-09-28 21:34:21','2019-09-28 21:34:21',4,'david.medina@cebib.cl'),(99573490,'ucchristus','99573490','2019-09-28 21:36:28','2019-09-28 21:36:28',4,'david.medina@cebib.cl'),(1569720189,'dmedina','dmedina','2019-09-28 21:23:09','2019-09-28 21:23:09',2,'david.medina@cebib.cl');
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
INSERT INTO `vehiculo` VALUES ('PATENTE1','PATENTE1','PATENTE1',2017,'2019-09-04 16:19:46','2019-09-28 21:23:26'),('PATENTE2','PATENTE2','PATENTE2',2006,'2019-09-28 21:24:43','2019-09-28 21:24:43');
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
INSERT INTO `vehiculoAsignado` VALUES ('PATENTE1',18344821,'2019-09-28 21:24:16'),('PATENTE2',6714240,'2019-09-28 21:25:21');
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

-- Dump completed on 2019-10-03 19:24:38
