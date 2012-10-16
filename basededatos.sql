CREATE DATABASE  IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tienda`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `idArticulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tituloCD` varchar(100) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `urlImagen` varchar(100) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `anho` int(10) unsigned NOT NULL,
  `autor` varchar(45) NOT NULL,
  PRIMARY KEY (`idArticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'Los 40 principales','14.95',1,'/ProyectoWI/imagenes/40principales.jpg','Pop-Rock Español',2011,'Varios'),(2,'2 Fast 2 Furious','12.56',20,'/ProyectoWI/imagenes/2Fast.jpg','Bandas Sonoras',2003,'Varios'),(3,'The Ultimate Collection/Greates Hits','19.95',6,'/ProyectoWI/imagenes/Bon.jpg','Pop-Rock Internacional',2010,'Bon Jovi'),(4,'The Kings of Limbs','13.5',10,'/ProyectoWI/imagenes/Limbs.jpg','Pop-Rock Internacional',2011,'Radiohead'),(5,'Lo mejor de Los Tres Tenores','19.95',20,'/ProyectoWI/imagenes/Tenores.jpg','Clasico',2011,'José Carreras, Plácido Domingo, Pavarotti'),(6,'Michael','11.95',3,'/ProyectoWI/imagenes/Michael.jpg','Dance',2010,'Michael Jackson'),(7,'Recovery','15.95',20,'/ProyectoWI/imagenes/Recovery.jpg','Rap/Hip-Hop',2010,'Eminem'),(8,'Celtica','21.85',20,'/ProyectoWI/imagenes/Celtica.jpg','Chill Out',2009,'Varios'),(9,'B.S.O. Slumdog Millionaire','5.95',18,'/ProyectoWI/imagenes/Slumdog.jpg','Bandas Sonoras',2008,'Varios'),(10,'Wailin','12.0',10,'/ProyectoWI/imagenes/Wailen.jpg','Jazz-Blues',2009,'Mabern, Harold'),(11,'15 Year (Edicion Especial)','19.95',20,'/ProyectoWI/imagenes/15.jpg','Flamenco y Cancion',2008,'Soler, Pastora'),(12,'La mia opera','21.85',20,'/ProyectoWI/imagenes/Opera.jpg','Musicas del Mundo',2010,'Albano'),(13,'Terra de galegos','19.95',11,'/ProyectoWI/imagenes/Terras.jpg','Regional',2009,'Fuxan os ventos'),(14,'Fofito y los Juegos de la calle','25.95',20,'/ProyectoWI/imagenes/Fofito.jpg','Infantil',2008,'Fofito');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` varchar(50) NOT NULL,
  `correoElectronico` varchar(100) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `numTarjeta` varchar(45) NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `dni` varchar(9) NOT NULL,
  `tipoUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('A654237364','admin@gmail.com','admin','null','null','null','null','null',4,'null',4),('C123123123','p@p.com','p','p','p','w','123123123','1234123412341234',1,'12341234R',0),('C617819609','pablo.rock70@gmail.com','pablo','Pablo','Pico Barro','Rua Pelamios n17 portal 3 1M','617819609','1234567890123456',1,'44492314X',0),('C654323232','antoniodav.fornis@rai.usc.es','ricardo','Ricardo','Fuentes Fuentes','Calle del Sol','654323232','1234123412341234',2,'12345667P',0),('C666101010','pablo_rock70@hotmail.com','pepe','Pepe','Garcia Lopez','Santiago de Chile 23','666101010','1234123412341234',1,'32716453I',1),('C675849392','antoniodav.fornis@gmail.com','jose','Jose','Gomez Gomez','Rosalia de Castro','675849392','1234123412341234',2,'34343434I',0),('C675858585','antoniodav.fornis@hotmail.com','juan','Juan','Lopez Rodriguez','Santiago de Chile 105','675858585','1234123412341234',2,'12312356O',0),('C678878789','antoniodav.fornis@yahoo.com','antonio','Antonio','Pico Pico','Santiago de Chile','678878789','1234123412341234',2,'12312323J',0),('C685904923','pablo.rock70@hotmail.com','hector','Hector','Gonzalez Gonzalez','Rua do Horreo','685904923','1234123412341234',3,'34563456O',0),('C981891733','antoniodav.fornis@usc.es','pepe','antonio','Fornis','Calle Alcalde Lorenzo','981891733','1234567890123456',2,'44492314X',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idArticulo` int(10) unsigned NOT NULL,
  `idUsuario` varchar(50) NOT NULL,
  `comentario` varchar(450) NOT NULL,
  KEY `idArticulo` (`idArticulo`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (6,'C666101010','Esta realmente bien!'),(8,'C666101010','Esta bien!'),(6,'C666101010','Me gusta mucho'),(9,'C617819609','Muy buen CD!\r\n'),(1,'C617819609','Muy buen CD!'),(13,'C123123123','Muy ');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `idUsuario` varchar(50) NOT NULL,
  `preciototal` decimal(6,2) NOT NULL,
  `idArticulo` int(10) unsigned NOT NULL,
  KEY `iUsuario` (`idUsuario`),
  KEY `iArticulo` (`idArticulo`),
  CONSTRAINT `iArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `iUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('C666101010',19.95,13),('C666101010',65.55,8),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',21.85,8),('C666101010',5.95,9),('C666101010',5.95,9),('C666101010',19.95,11),('C666101010',25.95,14),('C666101010',12.56,2),('C666101010',12.56,2),('C666101010',19.95,3),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',19.95,13),('C666101010',11.95,6),('C675849392',39.90,13),('C617819609',5.95,9),('C617819609',14.95,1),('C123123123',19.95,13);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-10 18:00:28
