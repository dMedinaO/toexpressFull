-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dbLogistica
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

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'root','2018-11-28 22:34:31','2018-11-28 22:34:31'),(2,'BODEGUERO','2018-11-28 22:34:44','2018-11-28 22:34:44'),(3,'CHOFER','2018-11-28 22:34:51','2018-11-28 22:34:51'),(4,'CLIENTE','2018-12-15 18:34:50','2018-12-15 18:34:50'),(5,'RECEPCIONISTA','2019-01-06 14:49:35','2019-01-06 14:49:35');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

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
