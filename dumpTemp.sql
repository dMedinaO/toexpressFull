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

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1551067539,'BODEGA 01','2019-02-25 01:05:39','2019-02-25 01:05:39'),(1565792135,'Bustos Central','2019-08-14 10:15:35','2019-08-14 10:15:35');
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
INSERT INTO `bodeguero` VALUES (1551067564,'BODEGUERO01','2019-02-25 01:06:04','2019-02-25 01:06:04',1551067539),(1551067585,'BODEGUERO02','2019-02-25 01:06:25','2019-02-25 01:06:25',1551067539),(1565792188,'Paulo','2019-08-14 10:16:28','2019-08-14 10:16:28',1565792135);
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
INSERT INTO `chofer` VALUES (18228843,'CHOFER01','1992-03-15 00:00:00','2019-02-25 01:07:47','2019-02-25 01:07:47',-35.4460865,-71.6819441,'2019-09-28 07:26:03'),(18344821,'CHOFER02','1993-11-26 00:00:00','2019-02-25 01:08:16','2019-02-25 01:08:16',-35.4331,-71.3623,'2019-07-24 18:34:32'),(19570908,'Gonzalo Perez','1994-01-01 00:00:00','2019-08-14 10:11:04','2019-08-14 10:22:15',NULL,NULL,NULL),(99999999,'CHOFER4','1992-04-04 00:00:00','2019-07-18 05:27:41','2019-07-18 05:27:53',-35.4323,-71.3323,'2019-07-24 18:21:03');
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
INSERT INTO `cliente` VALUES ('60910000','UNIVERSIDAD DE CHILE','2019-02-27 20:16:50','2019-02-27 20:17:05'),('61608204','HOSPITAL SAN JUAN DE DIOS','2019-02-27 20:23:46','2019-02-27 20:23:46'),('61980320','HOSPITAL CLINICO METROP. EL CARMEN','2019-02-25 01:10:43','2019-02-25 01:10:43'),('96530470','CLINICA DAVILA','2019-02-27 20:19:44','2019-02-27 20:19:44'),('96885930','CLINICA BICENTENERAIO SPA','2019-02-27 20:21:12','2019-02-27 20:21:12'),('99573490','UC CHRISTUS SERVICIOS CLINICOS','2019-02-27 20:17:48','2019-02-27 20:17:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarioRecepcion`
--

LOCK TABLES `comentarioRecepcion` WRITE;
/*!40000 ALTER TABLE `comentarioRecepcion` DISABLE KEYS */;
INSERT INTO `comentarioRecepcion` VALUES (7,'','','2019-07-18 10:47:17','','Entregado','Productos recibidos correctamente.','tedt'),(15,'','','2019-07-18 13:25:51','','Entregado','Productos recibidos correctamente.','test'),(16,'','','2019-07-18 13:26:43','','Entregado','Productos recibidos correctamente.','tu'),(17,'','','2019-07-19 02:12:37','','Entregado','Productos recibidos correctamente.','tedt'),(20,'','','2019-07-19 02:43:54','','Entregado','Productos recibidos correctamente.','test foto'),(21,'','','2019-08-13 10:08:37','','Entregado','Productos recibidos correctamente.','Juan Carlos'),(22,'','','2019-08-13 10:09:02','','Entregado','Productos recibidos correctamente.','Juan Carlos'),(23,'','','2019-08-13 10:09:24','','Entregado','Productos recibidos correctamente.','Juan Carlos'),(24,'','','2019-08-13 10:10:15','','Entregado','Productos recibidos correctamente.','Juan Carlos dos'),(25,'','','2019-08-13 10:14:14','','Entregado','Productos recibidos correctamente.','qqqq'),(26,'','','2019-08-13 10:16:29','','Entregado','Productos recibidos correctamente.','David '),(27,'','','2019-08-13 10:17:06','','Parcial','Productos no solicitados','David'),(28,'','','2019-08-14 11:45:08','','Entregado','Productos recibidos correctamente.','bodeguero'),(29,'','','2019-08-30 04:44:45','','Entregado','Productos recibidos correctamente.','testing'),(30,'','','2019-09-11 03:50:55','','Entregado','Productos recibidos correctamente.','jjyjj'),(31,'','','2019-09-11 03:50:55','','Entregado','Productos recibidos correctamente.','jjyjj');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES (20,56766667,1445719,'08867207-e939-4e7a-a97a-7e1b323b9f628487221593559369275.jpg','2019-08-13 10:08:37','5d52c53cf12cd'),(21,56766667,6076814,'934e0ae1-20ff-4bf1-9917-bc4e80e75a165966963747524245767.jpg','2019-08-13 10:09:02','5d52c545d3b95'),(22,56766667,7725940,'b1faa85e-004e-4447-a960-8065ecea5b698504946482324177028.jpg','2019-08-13 10:09:24','5d52c54a52ca9'),(23,56766667,7163392,'e6cf33db-cde1-4034-9d7a-05c1bc32f7ab2246818300142423341.jpg','2019-08-13 10:10:15','5d52c54f89839'),(24,466925767,4301643,'bac4d61e-74e3-4c35-947b-45814ea8d0095585589268642866297.jpg','2019-08-13 10:14:14','5d52c6ee16e35'),(25,466925767,8538763,'5bc66677-9695-4461-81f3-437ac99e889a3197309432858521880.jpg','2019-08-13 10:16:29','5d52c6f33de41'),(26,466925767,9998658,'89b39653-8429-44f3-aee0-89a27c8ebdc24250223691840520814.jpg','2019-08-13 10:17:06','5d52c6f87aa2c'),(27,797360695,703356,'edd02298-e972-4636-b0c3-07a3f547c62b3339943680151562955.jpg','2019-08-14 11:45:08','5d541e7cb682d'),(28,797360695,2166390,'IMG-20190821-WA0005.jpg','2019-08-30 04:44:45','5d68e213732da'),(29,88680945,2299498,'b2c215c0-57b5-4cc0-b2af-13177edbb98b4064357852649116746.jpg','2019-09-11 03:50:55','5d7899a33ae52'),(30,797360695,3682470,'b2c215c0-57b5-4cc0-b2af-13177edbb98b4064357852649116746.jpg','2019-09-11 03:50:55','5d7899a5596e6');
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
INSERT INTO `device` VALUES (18228843,'+56950966879','-',18228843),(18344821,'+56950966879','-',18344821),(19345786,'0','-',19570908),(60910000,'0','-',60910000),(61608204,'+56950966879','-',61608204),(61980320,'+56950966879','-',61980320),(96530470,'0','-',96530470),(96885930,'0','-',96885930),(99573490,'0','-',99573490),(99999999,'56950966879','-',99999999),(1551067564,'+56950966879','-',1551067564),(1551067585,'+56950966879','-',1551067585),(1565792188,'68445559','-',1565792188);
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
INSERT INTO `direccion` VALUES (1551067894,'MAIPU','SANTIAGO','METROPOLITANA','CAMINO RINCONADA 1201','2019-02-25 01:11:34','2019-02-25 01:11:34','61980320'),(1551309510,'INDEPENDENCIA','SANTIAGO','METROPOLITANA','SANTOS DUMONT 999','2019-02-27 20:18:30','2019-02-27 20:18:30','60910000'),(1551309552,'SANTIAGO','SANTIAGO','METROPOLITANA','CAMINO EL ALBA 12351','2019-02-27 20:19:12','2019-02-27 20:19:12','99573490'),(1551309616,'RECOLETA','SANTIAGO','METROPOLITANA','RECOLETA 464','2019-02-27 20:20:16','2019-02-27 20:20:16','96530470'),(1551309753,'ESTACION CENTRAL','SANTIAGO','METROPOLITANA','AV BERNARDO OHIGGINS 4850 ','2019-02-27 20:22:33','2019-02-27 20:22:33','96885930'),(1551309850,'SANTIAGO','SANTIAGO','METROPOLITANA','HUERFANOS 3255','2019-02-27 20:24:10','2019-02-27 20:24:10','61608204');
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
INSERT INTO `direccionBodega` VALUES (1551067539,'PROVINCIA','DIRECCION','COMUNA','CIUDAD','2019-02-25 01:05:39','2019-02-25 01:05:39',1551067539),(1565792135,'SANTIAGO','BUSTOS 2166','PROVIDENCIA','SANTIAGO','2019-08-14 10:15:35','2019-08-14 10:15:35',1565792135);
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
INSERT INTO `documento` VALUES (90135,52,189307,'2018-12-11 00:00:00',4217717,'96885930'),(122540,52,189326,'2018-12-11 00:00:00',1959335,'96885930'),(327375,52,197280,'2019-02-18 00:00:00',45886400,'61608204'),(703356,52,189339,'2018-12-11 00:00:00',1959335,'96885930'),(786792,52,196981,'2019-02-13 00:00:00',1666000,'61980320'),(1261216,52,189337,'2018-12-11 00:00:00',1959335,'96885930'),(1445719,52,189323,'2018-12-11 00:00:00',1959335,'96885930'),(2050944,52,189337,'2018-12-11 00:00:00',1959335,'96885930'),(2166390,52,189332,'2018-12-11 00:00:00',1959335,'96885930'),(2299498,52,197075,'2019-02-14 00:00:00',1958740,'96885930'),(2704120,52,189356,'2018-12-11 00:00:00',434945,'60910000'),(2958026,52,189339,'2018-12-11 00:00:00',1959335,'96885930'),(3139477,52,189323,'2018-12-11 00:00:00',1959335,'96885930'),(3145266,52,189352,'2018-12-11 00:00:00',1959335,'96885930'),(3287300,52,196981,'2019-02-13 00:00:00',1666000,'61980320'),(3533924,52,189328,'2018-12-11 00:00:00',6071142,'96885930'),(3682470,52,197075,'2019-02-14 00:00:00',1958740,'96885930'),(4301643,52,196981,'2019-02-13 00:00:00',1666000,'61980320'),(4384522,52,197341,'2019-02-18 00:00:00',618800,'99573490'),(4500470,52,197280,'2019-02-18 00:00:00',45886400,'61608204'),(4989761,52,189328,'2018-12-11 00:00:00',6071142,'96885930'),(5082439,52,189332,'2018-12-11 00:00:00',1959335,'96885930'),(5381009,52,197075,'2019-02-14 00:00:00',1958740,'96885930'),(5512471,52,189350,'2018-12-11 00:00:00',1959335,'96885930'),(5854523,52,189350,'2018-12-11 00:00:00',1959335,'96885930'),(5988377,52,197062,'2019-02-14 00:00:00',1606500,'96885930'),(6076814,52,189337,'2018-12-11 00:00:00',1959335,'96885930'),(6244864,52,189307,'2018-12-11 00:00:00',4217717,'96885930'),(6270339,52,197341,'2019-02-18 00:00:00',618800,'99573490'),(6461299,52,197280,'2019-02-18 00:00:00',45886400,'61608204'),(6648353,52,189339,'2018-12-11 00:00:00',1959335,'96885930'),(6827530,52,189356,'2018-12-11 00:00:00',434945,'60910000'),(7163392,33,465934,'2019-02-14 00:00:00',2130219,'61980320'),(7208367,52,189352,'2018-12-11 00:00:00',1959335,'96885930'),(7590260,52,197062,'2019-02-14 00:00:00',1606500,'96885930'),(7608457,33,452266,'2018-12-11 00:00:00',2261000,'96530470'),(7680659,52,197280,'2019-02-18 00:00:00',45886400,'61608204'),(7725940,52,189352,'2018-12-11 00:00:00',1959335,'96885930'),(8097923,33,452266,'2018-12-11 00:00:00',2261000,'96530470'),(8538763,52,189307,'2018-12-11 00:00:00',4217717,'96885930'),(8716721,52,189323,'2018-12-11 00:00:00',1959335,'96885930'),(9085808,52,189332,'2018-12-11 00:00:00',1959335,'96885930'),(9464027,33,465934,'2019-02-14 00:00:00',2130219,'61980320'),(9518095,33,465934,'2019-02-14 00:00:00',2130219,'61980320'),(9998658,52,189328,'2018-12-11 00:00:00',6071142,'96885930');
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
INSERT INTO `documento_en_ruta` VALUES (90135,449545235,NULL),(122540,88680945,NULL),(327375,88680945,NULL),(786792,449545235,NULL),(1261216,449545235,NULL),(2050944,88680945,NULL),(2704120,449545235,NULL),(2958026,88680945,NULL),(3139477,449545235,NULL),(3145266,449545235,NULL),(3287300,88680945,NULL),(3533924,449545235,NULL),(4384522,88680945,NULL),(4500470,88680945,NULL),(4989761,88680945,NULL),(5082439,88680945,NULL),(5512471,88680945,NULL),(5854523,449545235,NULL),(5988377,449545235,NULL),(6244864,88680945,NULL),(6270339,449545235,NULL),(6461299,449545235,NULL),(6827530,88680945,NULL),(7208367,88680945,NULL),(7590260,88680945,NULL),(7608457,88680945,NULL),(7680659,449545235,NULL),(8097923,449545235,NULL),(8716721,88680945,NULL),(9464027,88680945,NULL),(9518095,449545235,NULL),(1445719,56766667,21),(6076814,56766667,22),(7725940,56766667,23),(7163392,56766667,24),(4301643,466925767,25),(8538763,466925767,26),(9998658,466925767,27),(703356,797360695,28),(2166390,797360695,29),(2299498,88680945,30),(3682470,797360695,31);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geoPoint`
--

LOCK TABLES `geoPoint` WRITE;
/*!40000 ALTER TABLE `geoPoint` DISABLE KEYS */;
INSERT INTO `geoPoint` VALUES (7,-70.6275243,-33.4663385,'2019-08-13 10:12:31','2019-08-13 10:12:31',NULL,'61980320'),(8,-70.6275243,-33.4663385,'2019-08-13 10:12:31','2019-08-13 10:12:31',NULL,'61980320'),(9,-70.6275668,-33.4663288,'2019-08-13 10:19:20','2019-08-13 10:19:20',NULL,'96885930'),(10,-70.6275668,-33.4663288,'2019-08-13 10:19:36','2019-08-13 10:19:36',NULL,'96885930'),(11,-71.6804986,-35.4455102,'2019-10-01 01:48:20','2019-10-01 01:48:20',NULL,'61608204');
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
INSERT INTO `ruta` VALUES (56766667,'Ruta demo DI','MATUTINA',18228843,'2019-08-13 10:06:47','2019-08-13 10:06:47','TERMINADO'),(88680945,'asdf','OTROS',19570908,'2019-08-14 11:25:29','2019-08-14 11:25:29','EN PROCESO'),(449545235,'prueba 3','TARDE',18344821,'2019-08-14 11:11:13','2019-08-14 11:11:13','INICIADO'),(466925767,'Ruta DM','MATUTINA',18228843,'2019-08-13 10:05:26','2019-08-13 10:05:26','TERMINADO'),(797360695,'prueba bici','MATUTINA',18228843,'2019-08-14 10:31:33','2019-08-14 10:31:33','TERMINADO'),(1565792917,'Prueba 01','MATUTINA',19570908,'2019-08-14 10:28:37','2019-08-14 10:28:37','INICIADO'),(1565795112,'prueba 2','TARDE',18228843,'2019-08-14 11:05:12','2019-08-14 11:05:12','INICIADO');
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
INSERT INTO `user` VALUES (18228843,'chofer01','18228843','2019-02-25 01:07:47','2019-02-25 01:07:47',3,'david.medina@cebib.cl'),(18344821,'dinostroza','18344821','2019-02-25 01:08:17','2019-02-25 01:08:17',3,'david.medina@cebib.cl'),(19570908,'Gonzalo ','1234','2019-08-14 10:11:04','2019-08-14 10:22:15',3,'0'),(60910000,'uchile','60910000','2019-02-27 20:16:50','2019-02-27 20:17:05',4,'-'),(61608204,'hsanjuan','61608204','2019-02-27 20:23:46','2019-02-27 20:23:46',4,'davidmoandres.10@gmail.com'),(61980320,'elcarmenhp','61980320','2019-02-25 01:10:44','2019-02-25 01:10:44',4,'david.medina@cebib.cl'),(81457301,'Erick Sanhueza','test','2019-06-24 11:36:25','2019-06-24 11:36:25',3,'ericko.sanhueza@gmail.com'),(96530470,'cdavila','96530470','2019-02-27 20:19:44','2019-02-27 20:19:44',4,'-'),(96885930,'cbicentenario','96885930','2019-02-27 20:21:12','2019-02-27 20:21:12',4,'-'),(99573490,'ucchristus','99573490','2019-02-27 20:17:48','2019-02-27 20:17:48',4,'-'),(99999999,'99999999','99999999','2019-07-18 05:27:41','2019-07-18 05:27:53',3,'-'),(1551067564,'bodeguero01','nuevaClave','2019-02-25 01:06:04','2019-02-27 09:22:54',2,'dmedina@angular.cl'),(1551067585,'bodeguero02','bodeguero02','2019-02-25 01:06:25','2019-02-25 01:06:25',2,'david.medina@cebib.cl'),(1565792188,'paulo','1234','2019-08-14 10:16:28','2019-08-14 10:17:43',2,'0');
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
INSERT INTO `vehiculo` VALUES ('BICI','BICI','XT1',2019,'2019-08-14 10:11:37','2019-08-14 10:11:37'),('PATENTE1','MARCA1','MODELO1',2017,'2019-02-25 01:06:57','2019-02-25 01:06:57'),('PATENTE2','MARCA2','MODELO2',2018,'2019-02-25 01:07:14','2019-02-25 01:07:14'),('PATENTE3','MARCA3','MODELO3',2016,'2019-07-18 05:28:20','2019-07-18 05:28:20');
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
INSERT INTO `vehiculoAsignado` VALUES ('BICI',19570908,'2019-08-14 10:13:06'),('PATENTE1',18228843,'2019-02-25 01:08:36'),('PATENTE2',18344821,'2019-02-25 01:08:40'),('PATENTE3',99999999,'2019-07-18 05:28:32');
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

-- Dump completed on 2019-10-03 19:25:45
