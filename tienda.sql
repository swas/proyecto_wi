-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.53-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tienda
--

CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

--
-- Definition of table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
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

--
-- Dumping data for table `articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`idArticulo`,`tituloCD`,`precio`,`cantidad`,`urlImagen`,`categoria`,`anho`,`autor`) VALUES 
 (1,'Los 40 principales','14.95',1,'/ProyectoWI/imagenes/40principales.jpg','Pop-Rock Español',2011,'Varios'),
 (2,'2 Fast 2 Furious','12.56',20,'/ProyectoWI/imagenes/2Fast.jpg','Bandas Sonoras',2003,'Varios'),
 (3,'The Ultimate Collection/Greates Hits','19.95',6,'/ProyectoWI/imagenes/Bon.jpg','Pop-Rock Internacional',2010,'Bon Jovi'),
 (4,'The Kings of Limbs','13.5',10,'/ProyectoWI/imagenes/Limbs.jpg','Pop-Rock Internacional',2011,'Radiohead'),
 (5,'Lo mejor de Los Tres Tenores','19.95',20,'/ProyectoWI/imagenes/Tenores.jpg','Clasico',2011,'José Carreras, Plácido Domingo, Pavarotti'),
 (6,'Michael','11.95',3,'/ProyectoWI/imagenes/Michael.jpg','Dance',2010,'Michael Jackson'),
 (7,'Recovery','15.95',20,'/ProyectoWI/imagenes/Recovery.jpg','Rap/Hip-Hop',2010,'Eminem'),
 (8,'Celtica','21.85',20,'/ProyectoWI/imagenes/Celtica.jpg','Chill Out',2009,'Varios'),
 (9,'B.S.O. Slumdog Millionaire','5.95',18,'/ProyectoWI/imagenes/Slumdog.jpg','Bandas Sonoras',2008,'Varios'),
 (10,'Wailin','12.0',10,'/ProyectoWI/imagenes/Wailen.jpg','Jazz-Blues',2009,'Mabern, Harold'),
 (11,'15 Year (Edicion Especial)','19.95',20,'/ProyectoWI/imagenes/15.jpg','Flamenco y Cancion',2008,'Soler, Pastora'),
 (12,'La mia opera','21.85',20,'/ProyectoWI/imagenes/Opera.jpg','Musicas del Mundo',2010,'Albano'),
 (13,'Terra de galegos','19.95',11,'/ProyectoWI/imagenes/Terras.jpg','Regional',2009,'Fuxan os ventos'),
 (14,'Fofito y los Juegos de la calle','25.95',20,'/ProyectoWI/imagenes/Fofito.jpg','Infantil',2008,'Fofito');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
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

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`,`correoElectronico`,`pass`,`nombre`,`apellidos`,`direccion`,`telefono`,`numTarjeta`,`estado`,`dni`,`tipoUsuario`) VALUES 
 ('A654237364','admin@gmail.com','admin','null','null','null','null','null',4,'null',4),
 ('C123123123','p@p.com','p','p','p','w','123123123','1234123412341234',1,'12341234R',0),
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `idArticulo` int(10) unsigned NOT NULL,
  `idUsuario` varchar(50) NOT NULL,
  `comentario` varchar(450) NOT NULL,
  KEY `idArticulo` (`idArticulo`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentarios`
--

/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` (`idArticulo`,`idUsuario`,`comentario`) VALUES 
 (6,'C666101010','Esta realmente bien!'),
 (8,'C666101010','Esta bien!'),
 (6,'C666101010','Me gusta mucho'),
 (9,'C617819609','Muy buen CD!\r\n'),
 (1,'C617819609','Muy buen CD!'),
 (13,'C123123123','Muy ');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;


--
-- Definition of table `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `idUsuario` varchar(50) NOT NULL,
  `preciototal` decimal(6,2) NOT NULL,
  `idArticulo` int(10) unsigned NOT NULL,
  KEY `iUsuario` (`idUsuario`),
  KEY `iArticulo` (`idArticulo`),
  CONSTRAINT `iArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `iUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compra`
--

/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` (`idUsuario`,`preciototal`,`idArticulo`) VALUES 
 ('C666101010','19.95',13),
 ('C666101010','65.55',8),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','21.85',8),
 ('C666101010','5.95',9),
 ('C666101010','5.95',9),
 ('C666101010','19.95',11),
 ('C666101010','25.95',14),
 ('C666101010','12.56',2),
 ('C666101010','12.56',2),
 ('C666101010','19.95',3),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','19.95',13),
 ('C666101010','11.95',6),
 ('C675849392','39.90',13),
 ('C617819609','5.95',9),
 ('C617819609','14.95',1),
 ('C123123123','19.95',13);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;


--
-- Definition of table `movie_actors`
--

DROP TABLE IF EXISTS `movie_actors`;
CREATE TABLE `movie_actors` (
  `movieID` int(11) DEFAULT NULL,
  `actorID` varchar(255) DEFAULT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `ranking` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_actors`
--

/*!40000 ALTER TABLE `movie_actors` DISABLE KEYS */;
INSERT INTO `movie_actors` (`movieID`,`actorID`,`actorName`,`ranking`) VALUES 
 (1,'bill_farmer','Bill Farmer',20),
 (1,'don_rickles','Don Rickles',3),
 (1,'erik_von_detten','Erik von Detten',13),
 (1,'greg-berg','Greg Berg',17),
 (1,'jack_angel','Jack Angel',6),
 (1,'jan_rabson','Jan Rabson',19),
 (1,'jim_varney','Jim Varney',4),
 (1,'joan_cusack','Joan Cusack',24),
 (1,'joe-ranft','Joe Ranft',16),
 (1,'john_morris','John Morris',23),
 (1,'john_ratzenberger','John Ratzenberger',12),
 (1,'kendall_cunningham','Kendall Cunningham',21),
 (1,'laurie_metcalf','Laurie Metcalf',8),
 (1,'patrick_pinney','Patrick Pinney',9),
 (1,'penn_jillette','Penn Jillette',15),
 (1,'philip_proctor','Philip Proctor',11),
 (1,'r_lee_ermey','R. Lee Ermey',14),
 (1,'sarah_freeman','Sarah Freeman',22),
 (1,'scott_mcafee','Scott McAfee',18),
 (1,'sherry_lynn','Sherry Lynn',7),
 (1,'tim_allen','Tim Allen',2),
 (1,'tom_hanks','Tom Hanks',1),
 (1,'wallace_shawn','Wallace Shawn',5),
 (2,'1135379-peter_bryant','Peter Bryant',16),
 (2,'adam_hannbyrd','Adam Hann-Byrd',13),
 (2,'bebe_neuwirth','Bebe Neuwirth',5),
 (2,'bonnie_hunt','Bonnie Hunt',2),
 (2,'bradley_pierce','Bradley Pierce',4),
 (2,'darryl_henriques','Darryl Henriques',14),
 (2,'david_alan_grier','David Alan Grier',11),
 (2,'david_hyde_pierce','David Hyde Pierce',18),
 (2,'gillian_barber','Gillian Barber',7),
 (2,'james_handy','James Handy',12),
 (2,'jonathan_hyde','Jonathan Hyde',6),
 (2,'kirsten_dunst','Kirsten Dunst',3),
 (2,'laura_bell_bundy','Laura Bell Bundy',17),
 (2,'lloyd_berry','Lloyd Berry',8),
 (2,'malcolm_stewart','Malcolm Stewart',15),
 (2,'patricia_clarkson','Patricia Clarkson',9),
 (2,'robin_driscoll','Robin Driscoll',10),
 (2,'robin_williams','Robin Williams',1),
 (3,'annmargret','Ann-Margret',3),
 (3,'buck_henry','Buck Henry',8),
 (3,'buffy_sedlachek','Buffy Sedlachek',13),
 (3,'burgess_meredith','Burgess Meredith',4),
 (3,'christopher_mcdonald','Christopher McDonald',9),
 (3,'daryl_hannah','Daryl Hannah',5),
 (3,'isabell_oconnor','Isabell Monk',12),
 (3,'jack_lemmon','Jack Lemmon',1),
 (3,'joe_howard','Joe Howard',10),
 (3,'john_carroll_lynch','John Carroll Lynch',15),
 (3,'kevin_pollak','Kevin Pollak',6),
 (3,'ollie_osterberg','Ollie Osterberg',11),
 (3,'ossie_davis','Ossie Davis',7),
 (3,'sharon_howard_field','Sharon Howard-Field',14),
 (3,'steve_cochran','Steve Cochran',16),
 (3,'walter_matthau','Walter Matthau',2),
 (4,'1026174-leon','Leon',12),
 (4,'angela_bassett','Angela Bassett',2),
 (4,'brandon-hammond','Brandon Hammond',19),
 (4,'dennis_haysbert','Dennis Haysbert',6),
 (4,'donald_faison','Donald Faison',11),
 (4,'ezra_swerdlow','Ezra Swerdlow',17),
 (4,'giancarlo_esposito','Giancarlo Esposito',10),
 (4,'graham_galloway','Graham Galloway',18),
 (4,'gregory_hines','Gregory Hines',5),
 (4,'jeffrey_d_sams','Jeffrey D. Sams',20),
 (4,'lamont_johnson','Lamont Johnson',16),
 (4,'lela_rochon','Lela Rochon',4),
 (4,'loretta_devine','Loretta Devine',3),
 (4,'michael_beach','Michael Beach',7),
 (4,'mykelti_williamson','Mykelti Williamson',15),
 (4,'starletta_dupois','Starletta DuPois',9),
 (4,'wendell_pierce','Wendell Pierce',13),
 (4,'wesley_snipes','Wesley Snipes',14),
 (4,'whitney_houston','Whitney Houston',1),
 (4,'wren_t_brown','Wren T. Brown',8),
 (5,'ann-walker','Ann Walker',24),
 (5,'annie_meyers_shyer','Annie Meyers-Shyer',12),
 (5,'april_ortiz','April Ortiz',21),
 (5,'bd_wong','B.D. Wong',15),
 (5,'caroline_lagerfelt','Caroline Lagerfelt',10),
 (5,'diane_keaton','Diane Keaton',2),
 (5,'eugene_levy','Eugene Levy',20),
 (5,'george_newbern','George Newbern',5),
 (5,'hallie_meyersshyer','Hallie Meyers-Shyer',13),
 (5,'harris_laskaway','Harris Laskaway',23),
 (5,'janeadamsii','Jane Adams (II)',26),
 (5,'jonathan_emerson','Jonathan Emerson',18),
 (5,'kate-mcgregor-stewart','Kate McGregor-Stewart',11),
 (5,'kc_colwell','K.C. Colwell',25),
 (5,'kieran_culkin','Kieran Culkin',6),
 (5,'kimberly_williams','Kimberly Williams',4),
 (5,'linda_de_scenna','Linda de Scenna',17),
 (5,'martin_short','Martin Short',3),
 (5,'mychael_bates','Mychael Bates',7),
 (5,'peter_michael_goetz','Peter Michael Goetz',9),
 (5,'seth_kaplan','Seth Kaplan',19),
 (5,'shannon_kennedy','Shannon Kennedy',22),
 (5,'steve_martin','Steve Martin',1);
/*!40000 ALTER TABLE `movie_actors` ENABLE KEYS */;


--
-- Definition of table `movie_countries`
--

DROP TABLE IF EXISTS `movie_countries`;
CREATE TABLE `movie_countries` (
  `movieID` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_countries`
--

/*!40000 ALTER TABLE `movie_countries` DISABLE KEYS */;
INSERT INTO `movie_countries` (`movieID`,`country`) VALUES 
 (2,'USA'),
 (3,'USA'),
 (4,'USA'),
 (5,'USA'),
 (6,'USA'),
 (7,'USA'),
 (8,'USA'),
 (9,'USA'),
 (10,'UK'),
 (11,'USA'),
 (12,'USA'),
 (13,'USA'),
 (14,'USA'),
 (15,'USA'),
 (16,'USA'),
 (17,'USA'),
 (18,'USA'),
 (19,'USA'),
 (20,'USA'),
 (21,'USA'),
 (22,'USA'),
 (23,'USA'),
 (24,'USA'),
 (25,'France'),
 (26,'USA'),
 (27,'USA'),
 (28,'UK'),
 (29,'France'),
 (30,'France'),
 (31,'USA'),
 (32,'USA'),
 (33,'USA'),
 (34,'Australia'),
 (35,'UK'),
 (36,'UK'),
 (37,'USA'),
 (38,'USA'),
 (39,'USA'),
 (40,'South Africa'),
 (41,'UK'),
 (42,'USA'),
 (43,'USA'),
 (44,'USA'),
 (45,'USA'),
 (46,'USA'),
 (47,'Japan'),
 (48,'USA'),
 (49,'Canada'),
 (50,'USA'),
 (52,'USA'),
 (53,'Italy'),
 (54,'USA'),
 (55,'USA'),
 (56,'USA'),
 (57,'USA'),
 (58,'Italy'),
 (59,'Canada'),
 (60,'USA'),
 (61,'USA'),
 (62,'USA'),
 (63,'USA'),
 (64,'USA'),
 (65,'USA'),
 (66,'USA'),
 (67,'USA'),
 (68,'France'),
 (69,'USA'),
 (70,'USA'),
 (71,'USA'),
 (72,'USA'),
 (73,'UK'),
 (74,'USA'),
 (75,'USA'),
 (76,'Canada'),
 (77,'Germany'),
 (78,'USA'),
 (79,'USA'),
 (80,'Iran'),
 (81,'USA'),
 (82,'Netherlands'),
 (83,'USA'),
 (84,'USA'),
 (85,'USA'),
 (86,'USA'),
 (87,'USA'),
 (88,'New Zealand'),
 (89,'USA'),
 (90,'USA'),
 (92,'USA'),
 (93,'USA'),
 (94,'USA'),
 (95,'USA'),
 (96,'UK'),
 (97,'France'),
 (98,'USA'),
 (99,'UK'),
 (100,'USA'),
 (101,'USA'),
 (102,'USA'),
 (103,'USA');
/*!40000 ALTER TABLE `movie_countries` ENABLE KEYS */;


--
-- Definition of table `movie_directors`
--

DROP TABLE IF EXISTS `movie_directors`;
CREATE TABLE `movie_directors` (
  `movieID` int(11) DEFAULT NULL,
  `directorID` varchar(255) DEFAULT NULL,
  `directorName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_directors`
--

/*!40000 ALTER TABLE `movie_directors` DISABLE KEYS */;
INSERT INTO `movie_directors` (`movieID`,`directorID`,`directorName`) VALUES 
 (2,'joe_johnston','Joe Johnston'),
 (3,'donald_petrie','Donald Petrie'),
 (4,'forest_whitaker','Forest Whitaker'),
 (5,'charles_shyer','Charles Shyer'),
 (6,'michael_mann','Michael Mann'),
 (7,'billy_wilder','Billy Wilder'),
 (8,'1052316-peter_hewitt','Peter Hewitt'),
 (9,'peter_hyams','Peter Hyams'),
 (10,'martin_campbell','Martin Campbell'),
 (11,'rob_reiner','Rob Reiner'),
 (12,'mel_brooks','Mel Brooks'),
 (13,'simon_wells','Simon Wells'),
 (14,'oliver_stone','Oliver Stone'),
 (15,'renny_harlin','Renny Harlin'),
 (16,'martin_scorsese','Martin Scorsese'),
 (17,'ang_lee','Ang Lee'),
 (18,'alexandre_rockwell','Alexandre Rockwell'),
 (19,'steve_oedekerk','Steve Oedekerk'),
 (20,'joseph_ruben','Joseph Ruben'),
 (21,'barry_sonnenfeld','Barry Sonnenfeld'),
 (22,'jon_amiel','Jon Amiel'),
 (23,'1165744-james_mcteigue','James McTeigue'),
 (24,'victor_salva','Victor Salva'),
 (25,'mike_figgis','Mike Figgis'),
 (26,'oliver_parker','Oliver Parker'),
 (27,'lesli_linka_glatter','Lesli Linka Glatter'),
 (28,'roger_michell','Roger Michell'),
 (29,'jeanpierre_jeunet','Jean-Pierre Jeunet'),
 (30,'zhang_yimou','Yimou Zhang'),
 (31,'john_n_smith','John N. Smith'),
 (32,'siddharth_randeria','Siddharth Randeria'),
 (33,'jeanjacques_annaud','Jean-Jacques Annaud'),
 (34,'chris_noonan','Chris Noonan'),
 (35,'christopher_hampton','Christopher Hampton'),
 (36,'tim_robbins','Tim Robbins'),
 (37,'stephan_low','Stephan Low'),
 (38,'andy_tennant','Andy Tennant'),
 (39,'andras-solyom','Andras Solyom'),
 (40,'darrell_roodt','Darrell Roodt'),
 (41,'richard_loncraine','Richard Loncraine'),
 (42,'albert_hughes','Albert Hughes'),
 (43,'michael_hoffman','Michael Hoffman'),
 (44,'paul_anderson','Paul W.S. Anderson'),
 (45,'len_wiseman','Len Wiseman'),
 (46,'jocelyn_moorhouse','Jocelyn Moorhouse'),
 (47,'akira_kurosawa','Akira Kurosawa'),
 (48,'mike-gabriel','Mike Gabriel'),
 (49,'patricia_rozema','Patricia Rozema'),
 (50,'bryan_singer','Bryan Singer'),
 (52,'woody_allen','Woody Allen'),
 (53,'gianni_amelio','Gianni Amelio'),
 (54,'holly_goldberg_sloan','Holly Goldberg Sloan'),
 (55,'garry_marshall','Garry Marshall'),
 (56,'robert_tinnell','Robert Tinnell'),
 (57,'jodie_foster','Jodie Foster'),
 (58,'michael_radford','Michael Radford'),
 (59,'robert_lepage','Robert Lepage'),
 (60,'frank_oz','Frank Oz'),
 (61,'sara_botsford','Sara Botsford'),
 (62,'stephen_herek','Stephen Herek'),
 (63,'paris-barclay','Paris Barclay'),
 (64,'bill_bennett','Bill Bennett'),
 (65,'jason_bloom','Jason Bloom'),
 (66,'farhad_mann','Farhad Mann'),
 (67,'james_foley','James Foley'),
 (68,'josiane_balasko','Josiane Balasko'),
 (69,'marek_koterski','Marek Koterski'),
 (70,'robert_rodriguez','Robert Rodriguez'),
 (71,'andrew_sipes','Andrew Sipes'),
 (72,'jesse_dylan','Jesse Dylan'),
 (73,'bille_august','Bille August'),
 (74,'michael_goldenberg','Michael Goldenberg'),
 (75,'steve_miner','Steve Miner'),
 (76,'christian_duguay','Christian Duguay'),
 (77,'susanne_ofteringer','Susanne Ofteringer'),
 (78,'sean_penn','Sean Penn'),
 (79,'brian_gibson','Brian Gibson'),
 (80,'jafar_panahi','Jafar Panahi'),
 (81,'gary_fleder','Gary Fleder'),
 (82,'marleen_gorris','Marleen Gorris'),
 (83,'1146513-tim_reid','Tim Reid'),
 (84,'henry_jaglom','Henry Jaglom'),
 (85,'philip_haas','Philip Haas'),
 (86,'director-ridley-scott','Director Ridley Scott'),
 (87,'ken_kwapis','Ken Kwapis'),
 (88,'1178642-jonathan_king','Jonathan King'),
 (89,'john_badham','John Badham'),
 (90,'john_duigan','John Duigan'),
 (92,'stephen_frears','Stephen Frears'),
 (93,'wes_craven','Wes Craven'),
 (94,'ted_demme','Ted Demme'),
 (95,'john_woo','John Woo'),
 (96,'kenneth_branagh','Kenneth Branagh'),
 (97,'mathieu_kassovitz','Mathieu Kassovitz'),
 (98,'henry_jaglom','Henry Jaglom'),
 (99,'nick_broomfield','Nick Broomfield'),
 (100,'harold_becker','Harold Becker'),
 (101,'wes_anderson','Wes Anderson'),
 (102,'1040953-nick_castle','Nick Castle'),
 (103,'john_dahl','John Dahl');
/*!40000 ALTER TABLE `movie_directors` ENABLE KEYS */;


--
-- Definition of table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
CREATE TABLE `movie_genres` (
  `movieID` int(11) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_genres`
--

/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` (`movieID`,`genre`) VALUES 
 (1,'Animation'),
 (1,'Children'),
 (1,'Comedy'),
 (1,'Fantasy'),
 (2,'Adventure'),
 (2,'Children'),
 (2,'Fantasy'),
 (3,'Comedy'),
 (3,'Romance'),
 (4,'Comedy'),
 (4,'Drama'),
 (4,'Romance'),
 (5,'Comedy'),
 (6,'Action'),
 (6,'Crime'),
 (6,'Thriller'),
 (7,'Comedy'),
 (7,'Romance'),
 (8,'Adventure'),
 (8,'Children'),
 (9,'Action'),
 (10,'Action'),
 (10,'Adventure'),
 (10,'Thriller'),
 (11,'Comedy'),
 (11,'Drama'),
 (11,'Romance'),
 (12,'Comedy'),
 (12,'Horror'),
 (13,'Animation'),
 (13,'Children'),
 (14,'Drama'),
 (15,'Action'),
 (15,'Adventure'),
 (15,'Romance'),
 (16,'Crime'),
 (16,'Drama'),
 (17,'Comedy'),
 (17,'Drama'),
 (17,'Romance'),
 (18,'Comedy'),
 (18,'Drama'),
 (18,'Thriller'),
 (19,'Comedy'),
 (20,'Action'),
 (20,'Comedy'),
 (20,'Crime'),
 (20,'Drama'),
 (20,'Thriller'),
 (21,'Action'),
 (21,'Comedy'),
 (21,'Drama'),
 (22,'Crime'),
 (22,'Drama'),
 (22,'Horror'),
 (22,'Mystery'),
 (22,'Thriller'),
 (23,'Action'),
 (23,'Crime'),
 (23,'Thriller'),
 (24,'Drama'),
 (24,'Sci-Fi'),
 (25,'Drama'),
 (25,'Romance'),
 (26,'Drama'),
 (27,'Drama'),
 (28,'Drama'),
 (28,'Romance'),
 (29,'Adventure'),
 (29,'Drama'),
 (29,'Fantasy'),
 (29,'Mystery'),
 (29,'Sci-Fi'),
 (30,'Crime'),
 (30,'Drama'),
 (31,'Drama'),
 (32,'Sci-Fi'),
 (32,'Thriller'),
 (33,'Adventure'),
 (33,'IMAX'),
 (33,'Romance'),
 (34,'Children'),
 (34,'Comedy'),
 (34,'Drama'),
 (34,'Fantasy'),
 (35,'Drama'),
 (35,'Romance'),
 (36,'Crime'),
 (36,'Drama'),
 (37,'Documentary'),
 (37,'IMAX'),
 (38,'Comedy'),
 (39,'Comedy'),
 (39,'Romance'),
 (40,'Drama'),
 (41,'Drama'),
 (41,'War'),
 (42,'Action'),
 (42,'Crime'),
 (42,'Drama');
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;


--
-- Definition of table `movie_locations`
--

DROP TABLE IF EXISTS `movie_locations`;
CREATE TABLE `movie_locations` (
  `movieID` int(11) DEFAULT NULL,
  `location1` varchar(255) DEFAULT NULL,
  `location2` varchar(255) DEFAULT NULL,
  `location3` varchar(255) DEFAULT NULL,
  `location4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_locations`
--

/*!40000 ALTER TABLE `movie_locations` DISABLE KEYS */;
INSERT INTO `movie_locations` (`movieID`,`location1`,`location2`,`location3`,`location4`) VALUES 
 (2,'Canada','British Columbia',' ',' '),
 (2,'Canada','British Columbia','Delta',' '),
 (2,'Canada','British Columbia','Delta','Tsawwassen'),
 (2,'Canada','British Columbia','Maple Ridge',' '),
 (2,'Canada','British Columbia','Vancouver',' '),
 (2,'USA','Maine',' ',' '),
 (2,'USA','Maine','Kennebunk',' '),
 (2,'USA','Maine','North Berwick',' '),
 (2,'USA','New Hampshire',' ',' '),
 (2,'USA','New Hampshire','Keene',' '),
 (2,'USA','New Hampshire','Keene','Main Street'),
 (2,'USA','New Hampshire','Swanzey',' '),
 (3,'USA','California','Burbank','Stage 16, Warner Brothers Burbank Studios - 4000 Warner Boulevard'),
 (3,'USA','Minnesota','Center City',' '),
 (3,'USA','Minnesota','Chanhassen','Paisley Park'),
 (3,'USA','Minnesota','Chanhassen','Paisley Park Studios - 7801 Audubon Road'),
 (3,'USA','Minnesota','Faribault',' '),
 (3,'USA','Minnesota','Red Wing',' '),
 (3,'USA','Minnesota','Rockford','Lake Rebecca'),
 (3,'USA','Minnesota','South St. Paul','Divine Redeemer Hospital - 724 19th Avenue N.'),
 (3,'USA','Minnesota','St. Paul','Hyacinth Avenue E & Frank Street'),
 (3,'USA','Minnesota','Stillwater',' '),
 (4,'USA','Arizona','Chandler',' '),
 (4,'USA','Arizona','Fountain Hills',' '),
 (4,'USA','Arizona','Paradise Valley','Hermosa Inn - 5532 N. Palo Cristi Road'),
 (4,'USA','Arizona','Phoenix',' '),
 (4,'USA','Utah','Monument Valley',' '),
 (5,'USA','California','Altadena',' '),
 (5,'USA','California','Pasadena',' '),
 (5,'USA','California','Pasadena','843 S. El Molino Avenue'),
 (5,'USA','California','Whittier',' '),
 (6,'USA','California','Beverly Hills','Kate Mantilini - 9101 Wilshire Boulevard'),
 (6,'USA','California','El Segundo','Interstate 105'),
 (6,'USA','California','Gardena','Metro Green Line, Marine/Redondo Station - 2406 Marine Avenue'),
 (6,'USA','California','Long Beach','Harbor Place Tower - 525 E. Seaside Way'),
 (6,'USA','California','Los Angeles',' '),
 (6,'USA','California','Los Angeles','444 S. Flower Street, Downtown'),
 (6,'USA','California','Los Angeles','5th Street, Flower Street and Figueroa Street.'),
 (6,'USA','California','Los Angeles','Angeleno Hotel - 170 N. Church Lane'),
 (6,'USA','California','Los Angeles','Centinela Drive-In Theater - 5700 Centinela Avenue, Westchester'),
 (6,'USA','California','Los Angeles','Far East Bank - 350 S. Grand Avenue'),
 (6,'USA','California','Los Angeles','Los Angeles Airport Hilton and Towers - 5711 W. Century Blvd., Westchester'),
 (6,'USA','California','Los Angeles','Los Angeles Harbor, San Pedro'),
 (6,'USA','California','Los Angeles','Los Angeles International Airport - 1 World Way'),
 (6,'USA','California','Los Angeles','San Pedro'),
 (6,'USA','California','Los Angeles','Venice'),
 (6,'USA','California','Los Angeles','Venice Blvd. and Interstate 110'),
 (6,'USA','California','Los Angeles','Westin Bonaventure Hotel & Suites - 404 S. Figueroa Street, Downtown'),
 (6,'USA','California','Malibu',' '),
 (6,'USA','California','Santa Monica','Pacific Ocean Park'),
 (6,'USA','California','Santa Monica','Zenzero Restaurant - 1535 Ocean Avenue'),
 (7,'USA','New York','Long Island',' '),
 (7,'USA','New York','Long Island','Glen Cove'),
 (8,'USA','Alabama',' ',' '),
 (8,'USA','Alabama','Decatur',' '),
 (8,'USA','Alabama','Huntsville',' '),
 (8,'USA','Alabama','Mooresville',' '),
 (9,'USA','New York','Middletown','Galleria Mall'),
 (9,'USA','Pennsylvania','Pittsburgh',' '),
 (9,'USA','Pennsylvania','Pittsburgh','600 Grant Street'),
 (9,'USA','Pennsylvania','Pittsburgh','Mellon Arena - 66 Mario Lemieux Place'),
 (9,'USA','Pennsylvania','Pittsburgh','Mount Washington'),
 (9,'USA','Pennsylvania','Pittsburgh','Station Square - 100 W. Station Square Drive'),
 (10,'France',' ',' ',' '),
 (10,'France','Alpes-Maritimes',' ',' '),
 (10,'France','Alpes-Maritimes','French Riviera',' '),
 (10,'France','Alpes-Maritimes','Grand Corniche',' '),
 (10,'France','Alpes-Maritimes','Grasse',' '),
 (10,'France','Alpes-Maritimes','Greolieres',' '),
 (10,'France','Alpes-Maritimes','Greolieres-les-neiges',' '),
 (10,'France','Bouches-du-Rhöne',' ',' '),
 (10,'France','Bouches-du-Rhöne','Thorenc',' '),
 (10,'Monaco',' ',' ',' '),
 (10,'Monaco','Monte Carlo',' ',' '),
 (10,'Monaco','Monte Carlo','Casino Square',' '),
 (10,'Monaco','Monte Carlo','Casino de Monte Carlo',' '),
 (10,'Monaco','Monte Carlo','Monaco-Ville',' '),
 (10,'Monaco','Monte Carlo','Monaco-Ville','Fort Antoine'),
 (10,'Monaco','Monte Carlo','Monaco-Ville','Rooftop Theatre, Fort Antoine'),
 (10,'Monaco','Monte Carlo','Monte Carlo Bay',' '),
 (10,'Monaco','Monte Carlo','Monte Carlo Bay Hotel and Resort - 40 Avenue Princesse Grace',' '),
 (10,'Monaco','Monte Carlo','Place du Casino','Hotel de Paris'),
 (10,'Puerto Rico',' ',' ',' '),
 (10,'Puerto Rico','Arecibo',' ',' '),
 (10,'Puerto Rico','Arecibo','Arecibo Observatory',' '),
 (10,'Puerto Rico','Coast',' ',' '),
 (10,'Puerto Rico','Manatí',' ',' '),
 (10,'Puerto Rico','Manatí','Laguna Tortuguero Beach',' '),
 (10,'Puerto Rico','Vega Baja',' ',' '),
 (10,'Puerto Rico','Vega Baja','Ciénaga de Cibuco Farm',' '),
 (10,'Russia',' ',' ',' '),
 (10,'Russia','St. Petersburg',' ',' '),
 (10,'Russia','St. Petersburg','Admiralteysky',' '),
 (10,'Russia','St. Petersburg','Admiralteysky','Bronze Horseman'),
 (10,'Russia','St. Petersburg','Decembrists Square',' '),
 (10,'Russia','St. Petersburg','Dvortsovaya Square',' '),
 (10,'Russia','St. Petersburg','Hermitage',' '),
 (10,'Russia','St. Petersburg','Moika Canal',' '),
 (10,'Russia','St. Petersburg','Moika Embankment',' '),
 (10,'Russia','St. Petersburg','Neva Embankment',' ');
/*!40000 ALTER TABLE `movie_locations` ENABLE KEYS */;


--
-- Definition of table `movie_tags`
--

DROP TABLE IF EXISTS `movie_tags`;
CREATE TABLE `movie_tags` (
  `movieID` int(11) DEFAULT NULL,
  `tagID` int(11) DEFAULT NULL,
  `tagWeight` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_tags`
--

/*!40000 ALTER TABLE `movie_tags` DISABLE KEYS */;
INSERT INTO `movie_tags` (`movieID`,`tagID`,`tagWeight`) VALUES 
 (1,13,3),
 (1,25,3),
 (1,55,3),
 (1,60,1),
 (1,146,1),
 (1,326,10),
 (1,351,1),
 (1,362,1),
 (1,382,2),
 (1,459,2),
 (1,465,17),
 (1,501,1),
 (1,528,1),
 (1,605,2),
 (1,672,1),
 (1,752,2),
 (1,819,1),
 (1,896,2),
 (1,900,9),
 (1,1290,1),
 (1,1925,1),
 (1,2049,1),
 (1,2119,5),
 (1,2293,4),
 (1,2481,1),
 (1,4339,1),
 (1,4342,1),
 (1,4924,1),
 (1,5289,1),
 (1,6323,1),
 (1,6535,1),
 (1,6675,1),
 (1,7705,1),
 (1,10376,1),
 (1,10420,1),
 (1,10422,1),
 (1,11344,1),
 (1,11477,1),
 (1,14562,1),
 (1,15045,1),
 (1,15123,1),
 (1,15170,1),
 (2,13,2),
 (2,117,3),
 (2,146,3),
 (2,413,1),
 (2,438,2),
 (2,488,8),
 (2,742,1),
 (2,1224,1),
 (2,1843,1),
 (2,1944,1),
 (2,2057,3),
 (2,2381,1),
 (2,2732,1),
 (2,5045,1),
 (2,9621,1),
 (2,10382,1),
 (2,10654,1),
 (2,14371,1),
 (3,380,1),
 (3,2724,1),
 (3,3196,1),
 (3,3242,1),
 (3,7444,2),
 (3,13668,1),
 (5,125,1),
 (5,747,1),
 (5,752,2),
 (5,1646,2),
 (5,2724,1),
 (5,4294,2),
 (5,4946,2),
 (5,4953,1),
 (6,351,1),
 (6,528,1),
 (6,587,1),
 (6,638,1),
 (6,662,1),
 (6,675,2),
 (6,1149,1),
 (6,1218,1),
 (6,1277,2),
 (6,1974,1),
 (6,2393,1),
 (6,2538,1),
 (6,3008,2),
 (6,3013,1),
 (6,4446,1),
 (6,5032,1),
 (6,6323,1),
 (6,6800,1),
 (6,6988,1),
 (6,7052,1),
 (6,8891,1),
 (6,8982,1),
 (6,13128,1),
 (6,15248,1),
 (7,415,3),
 (7,747,5);
/*!40000 ALTER TABLE `movie_tags` ENABLE KEYS */;


--
-- Definition of table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `imdbID` int(11) DEFAULT NULL,
  `spanishTitle` varchar(255) DEFAULT NULL,
  `imdbPictureURL` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `rtID` varchar(255) DEFAULT NULL,
  `rtAllCriticsRating` int(11) DEFAULT NULL,
  `rtAllCriticsNumReviews` int(11) DEFAULT NULL,
  `rtAllCriticsNumFresh` int(11) DEFAULT NULL,
  `rtAllCriticsNumRotten` int(11) DEFAULT NULL,
  `rtAllCriticsScore` int(11) DEFAULT NULL,
  `rtTopCriticsRating` float DEFAULT NULL,
  `rtTopCriticsNumReviews` int(11) DEFAULT NULL,
  `rtTopCriticsNumFresh` int(11) DEFAULT NULL,
  `rtTopCriticsNumRotten` int(11) DEFAULT NULL,
  `rtTopCriticsScore` int(11) DEFAULT NULL,
  `rtAudienceRating` float DEFAULT NULL,
  `rtAudienceNumRatings` int(11) DEFAULT NULL,
  `rtAudienceScore` int(11) DEFAULT NULL,
  `rtPictureURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`,`title`,`imdbID`,`spanishTitle`,`imdbPictureURL`,`year`,`rtID`,`rtAllCriticsRating`,`rtAllCriticsNumReviews`,`rtAllCriticsNumFresh`,`rtAllCriticsNumRotten`,`rtAllCriticsScore`,`rtTopCriticsRating`,`rtTopCriticsNumReviews`,`rtTopCriticsNumFresh`,`rtTopCriticsNumRotten`,`rtTopCriticsScore`,`rtAudienceRating`,`rtAudienceNumRatings`,`rtAudienceScore`,`rtPictureURL`) VALUES 
 (2,'Jumanji',113497,'Jumanji','http://ia.media-imdb.com/images/M/MV5BMzM5NjE1OTMxNV5BMl5BanBnXkFtZTcwNDY2MzEzMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'1068044-jumanji',6,28,13,15,46,5.8,5,2,3,40,3.2,44587,61,'http://content8.flixster.com/movie/56/79/73/5679734_det.jpg'),
 (3,'Grumpy Old Men',107050,'Dos viejos gruñones','http://ia.media-imdb.com/images/M/MV5BMTI5MTgyMzE0OF5BMl5BanBnXkFtZTYwNzAyNjg5._V1._SX214_CR0,0,214,314_.jpg',1993,'grumpy_old_men',6,36,24,12,66,7,6,5,1,83,3.2,10489,66,'http://content6.flixster.com/movie/25/60/256020_det.jpg'),
 (4,'Waiting to Exhale',114885,'Esperando un respiro','http://ia.media-imdb.com/images/M/MV5BMTczMTMyMTgyM15BMl5BanBnXkFtZTcwOTc4OTQyMQ@@._V1._SY314_CR4,0,214,314_.jpg',1995,'waiting_to_exhale',6,25,14,11,56,5.5,11,5,6,45,3.3,5666,79,'http://content9.flixster.com/movie/10/94/17/10941715_det.jpg'),
 (5,'Father of the Bride Part II',113041,'Vuelve el padre de la novia (Ahora también abuelo)','http://ia.media-imdb.com/images/M/MV5BMTg1NDc2MjExOF5BMl5BanBnXkFtZTcwNjU1NDAzMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'father_of_the_bride_part_ii',5,19,9,10,47,5.4,5,1,4,20,3,13761,64,'http://content8.flixster.com/movie/25/54/255426_det.jpg'),
 (6,'Heat',113277,'Heat','http://ia.media-imdb.com/images/M/MV5BMTM1NDc4ODkxNV5BMl5BanBnXkFtZTcwNTI4ODE3MQ@@._V1._SY314_CR1,0,214,314_.jpg',1995,'1068182-heat',8,58,50,8,86,7.2,17,14,3,82,3.9,42785,92,'http://content9.flixster.com/movie/26/80/268099_det.jpg'),
 (7,'Sabrina',47437,'Sabrina','http://ia.media-imdb.com/images/M/MV5BMTYyNDM1NTQ5Nl5BMl5BanBnXkFtZTcwMTA5NjEwMg@@._V1._SY314_CR50,0,214,314_.jpg',1954,'1018047-sabrina',7,31,28,3,90,7.2,5,5,0,100,3.8,12812,87,'http://content7.flixster.com/movie/10/93/36/10933669_det.jpg'),
 (8,'Tom and Huck',112302,'Tom y Huck','http://ia.media-imdb.com/images/M/MV5BMTUxNDYzMDY1OV5BMl5BanBnXkFtZTcwNDA2MzYxMQ@@._V1._SY314_CR2,0,214,314_.jpg',1995,'tom_and_huck',4,8,2,6,25,0,2,1,1,50,2.7,2649,45,'http://content9.flixster.com/movie/26/16/261691_det.jpg'),
 (9,'Sudden Death',114576,'Sudden Death: muerte súbita','http://ia.media-imdb.com/images/M/MV5BMTcwMTU2OTMxNV5BMl5BanBnXkFtZTcwMzg3MTYyMQ@@._V1._SY314_CR0,0,214,314_.jpg',1995,'1068470-sudden_death',5,32,17,15,53,5.6,9,5,4,55,2.6,3626,40,'http://content8.flixster.com/movie/27/91/279122_det.jpg'),
 (10,'GoldenEye',113189,'GoldenEye','http://ia.media-imdb.com/images/M/MV5BNTE1OTExNjU1M15BMl5BanBnXkFtZTcwMTQzNjAwMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'goldeneye',7,41,33,8,80,6.2,11,7,4,63,3.4,28260,78,'http://content9.flixster.com/movie/26/66/266699_det.jpg'),
 (11,'The American President',112346,'El presidente y Miss Wade','http://ia.media-imdb.com/images/M/MV5BMTI5NDU2NDYzOF5BMl5BanBnXkFtZTYwNDk5MDI5._V1._SY314_CR5,0,214,314_.jpg',1995,'american_president',7,49,44,5,89,7.2,18,16,2,88,3.2,8320,71,'http://content7.flixster.com/movie/25/42/254205_det.jpg'),
 (12,'Dracula: Dead and Loving It',112896,'Drácula, un muerto muy contento y feliz','http://ia.media-imdb.com/images/M/MV5BMTc3MjI0NjA0Nl5BMl5BanBnXkFtZTcwNDYwODUyMQ@@._V1._SY314_CR18,0,214,314_.jpg',1995,'dracula_dead_and_loving_it',3,35,3,32,8,3.7,10,2,8,20,2.8,10078,52,'http://content8.flixster.com/movie/10/89/17/10891774_det.jpg'),
 (13,'Balto',112453,'Balto. La leyenda del perro esquimal','http://ia.media-imdb.com/images/M/MV5BMTU4NTE3NDU1MF5BMl5BanBnXkFtZTYwMjg5Mjk5._V1._SY216_CR37,0,214,216_.jpg',1995,'balto',6,12,6,6,50,0,4,1,3,25,3.2,9195,66,'http://content7.flixster.com/movie/25/16/251605_det.jpg'),
 (14,'Nixon',113987,'Nixon','http://ia.media-imdb.com/images/M/MV5BMTQ4ODUxNTU2OV5BMl5BanBnXkFtZTcwOTIwODMyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'nixon',7,56,42,14,75,6.1,18,12,6,66,3.5,3256,72,'http://content6.flixster.com/movie/28/30/283016_det.jpg'),
 (15,'Cutthroat Island',112760,'La isla de las Cabezas Cortadas','http://ia.media-imdb.com/images/M/MV5BNjI5MjI5Njk3Ml5BMl5BanBnXkFtZTcwNTQwMTYyMQ@@._V1._SY216_CR39,0,214,216_.jpg',1995,'cutthroat_island',4,31,14,17,45,4.7,6,3,3,50,2.6,3350,42,'http://content6.flixster.com/movie/25/69/256908_det.jpg'),
 (16,'Casino',112641,'Casino, de Scorsese','http://ia.media-imdb.com/images/M/MV5BMTQ0NDk5NDc5OF5BMl5BanBnXkFtZTYwMDYyNDA5._V1._SX214_CR0,0,214,314_.jpg',1995,'1067987-casino',7,58,47,11,81,6.3,16,11,5,68,3.9,66463,91,'http://content8.flixster.com/movie/10/87/61/10876102_det.jpg'),
 (17,'Sense and Sensibility',114388,'Sentido y sensibilidad','http://ia.media-imdb.com/images/M/MV5BMTQzNjk2OTk3Nl5BMl5BanBnXkFtZTcwNzczNjYyMQ@@._V1._SY314_CR7,0,214,314_.jpg',1995,'1068832-sense_and_sensibility',8,49,48,1,97,8.1,14,13,1,92,3.8,32782,88,'http://content6.flixster.com/movie/11/12/50/11125040_det.jpg'),
 (18,'Four Rooms',113101,'Four Rooms','http://ia.media-imdb.com/images/M/MV5BMTcwOTMzODQ5MV5BMl5BanBnXkFtZTcwNjgyMjAwMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'four_rooms',4,42,6,36,14,2.9,11,0,11,0,3.5,14266,72,'http://content7.flixster.com/movie/93/49/77/9349773_det.jpg'),
 (19,'Ace Ventura: When Nature Calls',112281,'Ace Ventura, operación África','http://ia.media-imdb.com/images/M/MV5BMjA0NTc4OTk1Ml5BMl5BanBnXkFtZTcwNjA0NTQzMQ@@._V1._SY314_CR17,0,214,314_.jpg',1995,'ace_ventura_when_nature_calls',4,25,9,16,36,0,3,1,2,33,3.2,87306,73,'http://content7.flixster.com/movie/10/94/18/10941853_det.jpg'),
 (20,'Money Train',113845,'Asalto al tren del dinero','http://ia.media-imdb.com/images/M/MV5BNDEwNzcyNjkzNl5BMl5BanBnXkFtZTcwNzQyMzYxMQ@@._V1._SY314_CR4,0,214,314_.jpg',1995,'money_train',4,24,4,20,16,4.5,5,1,4,20,2.7,5263,38,'http://content9.flixster.com/movie/11/12/51/11125103_det.jpg'),
 (21,'Get Shorty',113161,'Cómo conquistar Hollywood','http://ia.media-imdb.com/images/M/MV5BMTIzMzk3NDgwNV5BMl5BanBnXkFtZTcwMDEzNDcyMQ@@._V1._SY314_CR17,0,214,314_.jpg',1995,'get_shorty',8,49,42,7,85,8.4,14,14,0,100,3.2,10155,63,'http://content7.flixster.com/movie/98/65/89/9865893_det.jpg'),
 (22,'Copycat',112722,'Copycat: copia mortal','http://ia.media-imdb.com/images/M/MV5BMTI5NTU4MDk0MF5BMl5BanBnXkFtZTcwNDIwMTYyMQ@@._V1._SY216_CR35,0,214,216_.jpg',1995,'1065837-copycat',7,32,24,8,75,7.4,5,4,1,80,3.1,5628,58,'http://content9.flixster.com/movie/27/27/272723_det.jpg'),
 (23,'Ninja Assassin',1186367,'Ninja Assassin','http://ia.media-imdb.com/images/M/MV5BMTcxNDYzMjU1Ml5BMl5BanBnXkFtZTcwMTYzOTM3Mg@@._V1._SX214_CR0,0,214,314_.jpg',2009,'1198524-ninja_assassin',4,106,27,79,25,4.6,20,6,14,30,3.4,107023,58,'http://content6.flixster.com/movie/10/89/12/10891232_det.jpg'),
 (24,'Powder',114168,'Powder - pura energía','http://ia.media-imdb.com/images/M/MV5BMTIwMTQ3MjY2M15BMl5BanBnXkFtZTcwMTQ0NDUyMQ@@._V1._SX99_SY140_.jpg',1995,'powder',5,19,9,10,47,4.9,5,0,5,0,3.1,6650,67,'http://content7.flixster.com/movie/25/59/255901_det.jpg'),
 (25,'Leaving Las Vegas',113627,'Leaving Las Vegas','http://ia.media-imdb.com/images/M/MV5BMTIzOTEzMzQwNF5BMl5BanBnXkFtZTcwNjE0MTYyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'leaving_las_vegas',8,45,40,5,88,8.1,11,11,0,100,3.6,12742,82,'http://content7.flixster.com/movie/10/90/25/10902561_det.jpg'),
 (26,'Othello',114057,'Otelo','http://ia.media-imdb.com/images/M/MV5BMTIxMzA2ODk2NV5BMl5BanBnXkFtZTcwMzQ4ODIyMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'1069707-othello',6,38,26,12,68,6.1,11,7,4,63,3.3,2018,66,'http://content6.flixster.com/movie/10/92/98/10929892_det.jpg'),
 (27,'Now and Then',114011,'Amigas para siempre','http://ia.media-imdb.com/images/M/MV5BMTY4MjMwNzA1NF5BMl5BanBnXkFtZTcwNzEwNTYyMQ@@._V1._SY314_CR4,0,214,314_.jpg',1995,'now_and_then',5,16,3,13,18,5.2,5,1,4,20,3.5,17168,78,'http://content6.flixster.com/movie/55/36/64/5536644_det.jpg'),
 (28,'Persuasion',114117,'Persuasión','http://ia.media-imdb.com/images/M/MV5BNTQ2NDkxNzUwNF5BMl5BanBnXkFtZTcwMzE4NTcyMQ@@._V1._SY314_CR14,0,214,314_.jpg',1995,'1066528-persuasion',8,23,19,4,82,8.5,9,9,0,100,3.9,7968,82,'http://content6.flixster.com/movie/11/12/73/11127360_det.jpg'),
 (29,'La cité des enfants perdus',112682,'La ciudad de los niños perdidos','http://ia.media-imdb.com/images/M/MV5BMTI4MDc0ODgyMV5BMl5BanBnXkFtZTcwNjAzMzAyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'city_of_lost_children',7,33,27,6,81,7.2,7,5,2,71,4,22420,89,'http://content6.flixster.com/movie/26/78/267824_det.jpg'),
 (30,'Yao a yao yao dao waipo qiao',115012,'La joya de Shangai','http://ia.media-imdb.com/images/M/MV5BMTgyMzAwOTQyNF5BMl5BanBnXkFtZTcwNDU1MjgxMQ@@._V1._SY314_CR1,0,214,314_.jpg',1995,'shanghai_triad',7,21,18,3,85,0,4,3,1,75,3.6,1061,70,'http://content8.flixster.com/movie/10/90/31/10903162_det.jpg'),
 (31,'Dangerous Minds',112792,'Mentes peligrosas','http://ia.media-imdb.com/images/M/MV5BMTI3NDIyMjIyM15BMl5BanBnXkFtZTYwMzA3NjU5._V1._SY314_CR1,0,214,314_.jpg',1995,'dangerous_minds',5,37,11,26,29,5,12,5,7,41,3.1,12136,66,'http://content7.flixster.com/movie/26/98/269813_det.jpg'),
 (32,'Twelve Monkeys',114746,'Twelve monkeys: doce monos','http://ia.media-imdb.com/images/M/MV5BMTQwNzg2OTUzMV5BMl5BanBnXkFtZTYwMTg4ODU5._V1._SX214_CR0,0,214,314_.jpg',1995,'prem-no-public-issue',0,0,0,0,0,0,0,0,0,0,0,0,0,'http://content6.flixster.com/movie/10/93/02/10930244_det.jpg'),
 (33,'Wings of Courage',114952,'Las alas del coraje','http://ia.media-imdb.com/images/M/MV5BMTc3ODY1MjA3OF5BMl5BanBnXkFtZTcwODgzOTgyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,' ',0,4,2,2,50,0,2,1,1,50,0,0,0,'http://content7.flixster.com/movie/10/97/83/10978341_det.jpg'),
 (34,'Babe',112431,'Babe, el cerdito valiente','http://ia.media-imdb.com/images/M/MV5BMTIwNzY2OTIzN15BMl5BanBnXkFtZTcwNjcxODAzMQ@@._V1._SY314_CR6,0,214,314_.jpg',1995,'1065598-babe',8,54,53,1,98,8.2,11,11,0,100,3,22954,54,'http://content7.flixster.com/movie/25/32/253205_det.jpg'),
 (35,'Carrington',112637,'Carrington','http://ia.media-imdb.com/images/M/MV5BMTI5NjcxMjc4MV5BMl5BanBnXkFtZTcwOTEzMDYxMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'carrington',6,19,9,10,47,7.4,5,4,1,80,3.5,781,68,'http://content7.flixster.com/movie/28/00/280009_det.jpg'),
 (36,'Dead Man Walking',112818,'Pena de muerte (Dead Man Walking)','http://ia.media-imdb.com/images/M/MV5BOTUxMDg5NTAzMF5BMl5BanBnXkFtZTcwNTYyOTYyMQ@@._V1._SY314_CR4,0,214,314_.jpg',1995,'1068779-dead_man_walking',8,53,50,3,94,7.9,20,18,2,90,3.6,15450,81,'http://content6.flixster.com/movie/10/88/77/10887764_det.jpg'),
 (37,'Across the Sea of Time',112286,'Across the Sea of Time','http://ia.media-imdb.com/images/M/MV5BNTQyMTE3MzY4Nl5BMl5BanBnXkFtZTcwMzY5MTAyMQ@@._V1._SX78_SY140_.jpg',1995,'across_the_sea_of_time',0,4,2,2,50,0,1,0,1,0,2.9,237,27,'http://content6.flixster.com/movie/10/90/58/10905808_det.jpg'),
 (38,'It Takes Two',113442,'Dos por el precio de una','http://ia.media-imdb.com/images/M/MV5BMTcyMjY3NzkwMV5BMl5BanBnXkFtZTcwNzE1NjUyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'1067137-it_takes_two',4,24,2,22,8,4.6,8,2,6,25,2.9,16311,63,'http://content7.flixster.com/movie/25/74/257417_det.jpg'),
 (39,'Clueless',112697,'Clueless: fuera de onda','http://ia.media-imdb.com/images/M/MV5BNjQxNTA1NjE5Ml5BMl5BanBnXkFtZTYwOTMwNzE5._V1._SY314_CR3,0,214,314_.jpg',1995,'school_of_senses',0,0,0,0,0,0,0,0,0,0,0,0,0,'http://content8.flixster.com/movie/10/85/01/10850110_det.jpg'),
 (40,'Cry, the Beloved Country',112749,'Llanto por la tierra amada','http://ia.media-imdb.com/images/M/MV5BMTcwMDU1OTEwOF5BMl5BanBnXkFtZTcwMTg5NjEyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'1068781-cry_the_beloved_country',7,13,10,3,76,0,4,3,1,75,3.5,520,66,'http://content6.flixster.com/movie/10/89/59/10895996_det.jpg'),
 (41,'Richard III',114279,'Ricardo III (Richard III)','http://ia.media-imdb.com/images/M/MV5BMjEzMjAxOTQzMV5BMl5BanBnXkFtZTcwMTYyNjIyMQ@@._V1._SY314_CR0,0,214,314_.jpg',1995,'1068177-richard_iii',8,43,41,2,95,7.6,11,10,1,90,3.7,1552,82,'http://content7.flixster.com/movie/26/89/268909_det.jpg'),
 (42,'Dead Presidents',112819,'Dinero para quemar','http://ia.media-imdb.com/images/M/MV5BMzE0NTI0MTM5MV5BMl5BanBnXkFtZTcwMzYwMTYyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'dead_presidents',6,31,14,17,45,6.3,12,7,5,58,3.3,4475,75,'http://content7.flixster.com/movie/26/95/269521_det.jpg'),
 (43,'Restoration',114272,'Restauración','http://ia.media-imdb.com/images/M/MV5BMTI5MDM4OTQ0Ml5BMl5BanBnXkFtZTcwMzU2MTYyMQ@@._V1._SY314_CR1,0,214,314_.jpg',1995,'1069339-restoration',6,31,21,10,67,6.4,10,6,4,60,3.3,1103,56,'http://content6.flixster.com/movie/27/04/270404_det.jpg'),
 (44,'Mortal Kombat',113855,'Mortal Kombat','http://ia.media-imdb.com/images/M/MV5BMTI3MzM0ODE4Nl5BMl5BanBnXkFtZTcwMDA3MTgyMQ@@._V1._SY314_CR18,0,214,314_.jpg',1995,'mortal_kombat',4,26,9,17,34,3.9,6,2,4,33,2.8,18291,55,'http://content9.flixster.com/movie/25/63/256395_det.jpg'),
 (45,'Live Free or Die Hard',337978,'La jungla 4.0','http://ia.media-imdb.com/images/M/MV5BNDQxMDE1OTg4NV5BMl5BanBnXkFtZTcwMTMzOTQzMw@@._V1._SX214_CR0,0,214,314_.jpg',2007,'live_free_or_die_hard',7,197,161,36,81,6.7,38,30,8,78,3.9,1145097,86,'http://content8.flixster.com/movie/10/93/34/10933482_det.jpg'),
 (46,'How to Make an American Quilt',113347,'Donde reside el amor','http://ia.media-imdb.com/images/M/MV5BNzY3NTQ0NTM0NV5BMl5BanBnXkFtZTcwODkwMzgxMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'how_to_make_an_american_quilt',6,22,11,11,50,7.6,6,5,1,83,3.2,2626,58,'http://content8.flixster.com/movie/10/86/75/10867514_det.jpg'),
 (47,'Shichinin no samurai',47478,'Los siete samurais','http://ia.media-imdb.com/images/M/MV5BNzg5Mzk5Nzc0NF5BMl5BanBnXkFtZTcwNjg3MDQzMQ@@._V1._SY314_CR4,0,214,314_.jpg',1954,'1018639-seven_samurai',9,49,49,0,100,8.6,10,10,0,100,4.5,29509,97,'http://content7.flixster.com/movie/39/91/08/3991085_det.jpg'),
 (48,'Pocahontas',114148,'Pocahontas','http://ia.media-imdb.com/images/M/MV5BMTM5NDI5MzAwOV5BMl5BanBnXkFtZTcwODcwMjgyMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'1063452-pocahontas',6,49,27,22,55,6.6,14,10,4,71,3.2,37858,63,'http://content6.flixster.com/movie/25/15/251508_det.jpg'),
 (49,'When Night Is Falling',114916,'Cuando cae la noche','http://ia.media-imdb.com/images/M/MV5BMTI2OTU5MDMzN15BMl5BanBnXkFtZTcwMTkxNTEzMQ@@._V1._SY314_CR2,0,214,314_.jpg',1995,'when_night_is_falling',6,16,8,8,50,0,4,1,3,25,3.9,1132,83,'http://content6.flixster.com/movie/10/89/77/10897780_det.jpg'),
 (50,'The Usual Suspects',114814,'Sospechosos habituales','http://ia.media-imdb.com/images/M/MV5BMTg0NzIyMTA3M15BMl5BanBnXkFtZTcwMDQ3MjI3Mw@@._V1._SX214_CR0,0,214,314_.jpg',1995,'usual_suspects',8,47,41,6,87,6.9,14,12,2,85,4.2,109588,95,'http://content7.flixster.com/movie/24/63/48/2463485_det.jpg'),
 (52,'Mighty Aphrodite',113819,'Poderosa Afrodita','http://ia.media-imdb.com/images/M/MV5BMTUzMzE3Nzg5Ml5BMl5BanBnXkFtZTcwNTIxNDEyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'mighty_aphrodite',7,33,25,8,75,7.2,6,4,2,66,3.3,4866,69,'http://content7.flixster.com/movie/10/84/18/10841893_det.jpg'),
 (53,'Lamerica',110299,'Lamerica','http://ia.media-imdb.com/images/M/MV5BMTk0MTI5MjU3MF5BMl5BanBnXkFtZTcwMjMzODUyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1994,'lamerica',8,10,9,1,90,0,1,1,0,100,3.9,239,82,'http://content6.flixster.com/movie/29/78/297800_det.jpg'),
 (54,'The Big Green',112499,'Somos los peores','http://ia.media-imdb.com/images/M/MV5BMTMwODc3MDk3Nl5BMl5BanBnXkFtZTcwMTE5NTUyMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'big_green',3,5,0,5,0,0,1,0,1,0,2.7,2596,47,'http://content7.flixster.com/movie/25/93/259305_det.jpg'),
 (55,'Georgia Rule',791304,'Georgia Rule','http://ia.media-imdb.com/images/M/MV5BMTM2MDc3MTI0Nl5BMl5BanBnXkFtZTcwMzQ4ODU0MQ@@._V1._SX214_CR0,0,214,314_.jpg',2007,'georgia_rule',4,116,20,96,17,3.4,30,2,28,6,3,64056,55,'http://content8.flixster.com/movie/63/82/23/6382238_det.jpg'),
 (56,'Kids of the Round Table',113541,'Los chicos de la tabla redonda','http://ia.media-imdb.com/images/M/MV5BMTEwMTM0MzI3OTheQTJeQWpwZ15BbWU3MDQzNTQ2MTE@._V1._SX214_CR0,0,214,314_.jpg',1997,'kids-of-the-round-table',0,0,0,0,0,0,0,0,0,0,0,0,0,'http://content7.flixster.com/movie/10/85/20/10852069_det.jpg'),
 (57,'Home for the Holidays',113321,'A casa por vacaciones','http://ia.media-imdb.com/images/M/MV5BMjExMTMyNzU4MV5BMl5BanBnXkFtZTcwMzIwMDkxMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'1066169-home_for_the_holidays',6,44,28,16,63,5.7,11,5,6,45,3.4,3045,69,'http://content6.flixster.com/movie/25/43/254392_det.jpg'),
 (58,'Il postino',110877,'El cartero (y Pablo Neruda)','http://ia.media-imdb.com/images/M/MV5BMTkxNTc5NjE0NV5BMl5BanBnXkFtZTcwMTI2MTYyMQ@@._V1._SY301_CR1,0,214,301_.jpg',1994,'il_postino',8,25,23,2,92,0,4,4,0,100,4.1,5794,92,'http://content8.flixster.com/movie/10/86/74/10867406_det.jpg'),
 (59,'Le confessionnal',112714,'Le confessionnal','http://ia.media-imdb.com/images/M/MV5BMTk2MDE1MTYyNl5BMl5BanBnXkFtZTcwMzc3NDEzMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'confessional',0,1,1,0,100,0,0,0,0,0,0,0,0,'http://images.rottentomatoescdn.com/images/defaults/poster_default.gif'),
 (60,'The Indian in the Cupboard',113419,'La llave mágica','http://ia.media-imdb.com/images/M/MV5BMTk0NjQ5NzQxMl5BMl5BanBnXkFtZTcwMDc5NjUyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'indian_in_the_cupboard',6,19,13,6,68,0,2,1,1,50,2.7,5127,41,'http://content9.flixster.com/movie/25/78/257803_det.jpg'),
 (61,'Eye for an Eye',116260,'Eye for an eye: ojo por ojo','http://ia.media-imdb.com/images/M/MV5BMTUwMzc5NTk0NF5BMl5BanBnXkFtZTYwOTYyMzU5._V1._SX214_CR0,0,214,314_.jpg',1996,'1101753-eye',0,0,0,0,0,0,0,0,0,0,0,0,0,'http://content8.flixster.com/movie/10/99/01/10990146_det.jpg'),
 (62,'Mr. Hollands Opus',113862,'Profesor Holland','http://ia.media-imdb.com/images/M/MV5BMTUxODUxOTk2M15BMl5BanBnXkFtZTcwODk2NDYxMQ@@._V1._SY314_CR4,0,214,314_.jpg',1995,'mr_hollands_opus',7,26,19,7,73,7.5,6,5,1,83,3.5,9569,79,'http://content8.flixster.com/movie/10/58/42/10584210_det.jpg'),
 (63,'Dont Be a Menace to South Central While Drinking Your Juice in the Hood',116126,'Los colegas del barrio','http://ia.media-imdb.com/images/M/MV5BMTA3NjQ1Mzg4NTReQTJeQWpwZ15BbWU3MDcwNTQwMzE@._V1._SY314_CR3,0,214,314_.jpg',1996,'dont_be_a_menace',5,24,7,17,29,5.6,7,3,4,42,0,0,0,'http://content8.flixster.com/movie/28/69/286926_det.jpg'),
 (64,'Two If by Sea',118002,'Corazones robados','http://ia.media-imdb.com/images/M/MV5BMTY5MDcxNjY5MV5BMl5BanBnXkFtZTYwNDMxMTk5._V1._SX214_CR0,0,214,314_.jpg',1996,'two_if_by_sea',4,27,3,24,11,0,4,0,4,0,2.6,1608,29,'http://content6.flixster.com/movie/27/80/278004_det.jpg'),
 (65,'Bio-Dome',115683,'Bio-Dome','http://ia.media-imdb.com/images/M/MV5BMTc4NDg0ODQ4Ml5BMl5BanBnXkFtZTcwNDM4MDUyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1996,'biodome',2,21,1,20,4,2,7,0,7,0,2.6,8972,51,'http://content6.flixster.com/movie/25/94/259420_det.jpg'),
 (66,'Lawnmower Man 2: Beyond Cyberspace',116839,'El cortador de césped II: más allá del ciberespacio','http://ia.media-imdb.com/images/M/MV5BMTg1MjM3OTEyNF5BMl5BanBnXkFtZTcwOTQ5MDEyMQ@@._V1._SY314_CR2,0,214,314_.jpg',1996,'lawnmower_man_2_jobes_war',3,9,1,8,11,0,3,1,2,33,2.1,952,18,'http://content7.flixster.com/movie/10/86/80/10868017_det.jpg'),
 (67,'Two Bits',114753,'Two Bits','http://ia.media-imdb.com/images/M/MV5BMTY4NjA1Mzc2N15BMl5BanBnXkFtZTcwODI2NjYxMQ@@._V1._SY314_CR2,0,214,314_.jpg',1995,'two-bits',5,10,4,6,40,0,4,1,3,25,3.3,685,54,'http://content6.flixster.com/movie/26/66/266612_det.jpg'),
 (68,'Gazon maudit',113149,'Felpudo maldito','http://ia.media-imdb.com/images/M/MV5BMTU5NjI5NDQ2MV5BMl5BanBnXkFtZTcwMDkzMzcxMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'french_twist',6,10,5,5,50,0,4,1,3,25,3.4,597,58,'http://content7.flixster.com/movie/27/76/277609_det.jpg'),
 (69,'Friday',113118,'A tope en viernes','http://ia.media-imdb.com/images/M/MV5BMTkxNjA2MjE0Nl5BMl5BanBnXkFtZTcwMjM3NzYzMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'nothing_funny',0,0,0,0,0,0,0,0,0,0,0,0,0,'http://content7.flixster.com/movie/10/88/03/10880345_det.jpg'),
 (70,'From Dusk Till Dawn',116367,'Abierto hasta el amanecer','http://ia.media-imdb.com/images/M/MV5BMTI0NzM0MzE4MV5BMl5BanBnXkFtZTcwNjgwODg0MQ@@._V1._SY314_CR3,0,214,314_.jpg',1996,'from_dusk_till_dawn',6,43,27,16,62,4.9,10,5,5,50,3.4,36073,75,'http://content9.flixster.com/movie/62/82/01/6282011_det.jpg'),
 (71,'Fair Game',113010,'Caza legal','http://ia.media-imdb.com/images/M/MV5BMTQ4NjM0MDI1OF5BMl5BanBnXkFtZTcwMDQ1ODMyMQ@@._V1._SY314_CR12,0,214,314_.jpg',1995,'1065868-fair_game',2,24,3,21,12,3.1,8,1,7,12,2.1,1761,16,'http://content8.flixster.com/movie/27/69/276994_det.jpg'),
 (72,'Kicking & Screaming',384642,'Un entrenador genial','http://ia.media-imdb.com/images/M/MV5BMTA5Njk1MjEzMzZeQTJeQWpwZ15BbWU3MDY3NjY4MjE@._V1._SX214_CR0,0,214,314_.jpg',2005,'kicking_and_screaming',5,137,57,80,41,5,31,12,19,38,3,14260,51,'http://content9.flixster.com/movie/24/97/249715_det.jpg'),
 (73,'Les misérables',119683,'Los miserables','http://ia.media-imdb.com/images/M/MV5BMTQ5Mzc5NDQ2Nl5BMl5BanBnXkFtZTcwNzUxNTIyMQ@@._V1._SY314_CR4,0,214,314_.jpg',1998,'1083326-les_miserables',7,41,31,10,75,6.6,11,6,5,54,3.6,7310,81,'http://content9.flixster.com/movie/25/51/255107_det.jpg'),
 (74,'Bed of Roses',115644,'Mil ramos de rosas','http://ia.media-imdb.com/images/M/MV5BMjg4MzcxMzk3M15BMl5BanBnXkFtZTcwNzkzOTMyMQ@@._V1._SY314_CR9,0,214,314_.jpg',1996,'bed_of_roses',5,14,3,11,21,5.2,5,1,4,20,3.2,3163,66,'http://content9.flixster.com/movie/25/92/259203_det.jpg'),
 (75,'Big Bully',115676,'Mi querido enemigo','http://ia.media-imdb.com/images/M/MV5BMTM5OTk4OTA0MV5BMl5BanBnXkFtZTcwNjg1MjQyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1996,'big_bully',3,7,0,7,0,0,2,0,2,0,2.4,1459,23,'http://content9.flixster.com/movie/26/51/265195_det.jpg'),
 (76,'Screamers',114367,'Asesinos cibernéticos','http://ia.media-imdb.com/images/M/MV5BMTY5NTQzMDkyMF5BMl5BanBnXkFtZTcwOTg1MTcyMQ@@._V1._SY314_CR0,0,214,314_.jpg',1995,'1069696-screamers',5,30,9,21,30,4.9,9,2,7,22,3,2070,45,'http://content7.flixster.com/movie/27/23/272301_det.jpg'),
 (77,'Nico Icon',113973,'Nico Icon','http://ia.media-imdb.com/images/M/MV5BNTY2MDM2NzcyM15BMl5BanBnXkFtZTcwMjk3MzcyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'nico_icon',7,13,11,2,84,8,5,4,1,80,4,87,85,'http://content9.flixster.com/movie/10/84/77/10847739_det.jpg'),
 (78,'The Crossing Guard',112744,'Cruzando la oscuridad','http://ia.media-imdb.com/images/M/MV5BMTQ4NDM4MTA0Nl5BMl5BanBnXkFtZTcwNzkxMjEyMQ@@._V1._SY314_CR1,0,214,314_.jpg',1995,'crossing_guard',7,27,20,7,74,0,4,2,2,50,3.3,2170,56,'http://content7.flixster.com/movie/27/69/276905_det.jpg'),
 (79,'The Juror',116731,'Coacción a un jurado','http://ia.media-imdb.com/images/M/MV5BMTgwOTc5MjYzNl5BMl5BanBnXkFtZTcwMjYzMTYyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1996,'juror',4,19,3,16,15,4.3,6,1,5,16,2.8,2266,39,'http://content6.flixster.com/movie/27/93/279316_det.jpg'),
 (80,'Badkonake sefid',112445,'El globo blanco','http://ia.media-imdb.com/images/M/MV5BMTQ0MTAxMjMxOF5BMl5BanBnXkFtZTcwODU4NjEyMQ@@._V1._SX77_SY140_.jpg',1995,'white_balloon',7,20,16,4,80,6.6,8,6,2,75,4,547,86,'http://content9.flixster.com/movie/54/93/06/5493067_det.jpg'),
 (81,'Things to Do in Denver When Youre Dead',114660,'Cosas que hacer en Denver cuando estás muerto','http://ia.media-imdb.com/images/M/MV5BMTgxODc5NzYzNl5BMl5BanBnXkFtZTcwOTg0MjkxMQ@@._V1._SY314_CR8,0,214,314_.jpg',1995,'things_to_do_in_denver_when_youre_dead',5,27,9,18,33,5.5,5,1,4,20,3.5,3197,72,'http://content8.flixster.com/movie/27/06/270606_det.jpg'),
 (82,'Antonia',112379,'Antonia','http://ia.media-imdb.com/images/M/MV5BMTgwNjkwOTQ5NV5BMl5BanBnXkFtZTcwNjc3ODAyMQ@@._V1._SY314_CR1,0,214,314_.jpg',1995,'antonias_line',7,25,16,9,64,7.8,10,9,1,90,4.2,1707,90,'http://content6.flixster.com/movie/28/20/282096_det.jpg'),
 (83,'Once Upon a Time... When We Were Colored',114039,'Once Upon a Time... When We Were Colored','http://ia.media-imdb.com/images/M/MV5BMTI4NDk2MDcyNV5BMl5BanBnXkFtZTcwMTQxNTMyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'once-upon-a-timewhen-we-were-colored',7,14,10,4,71,7.9,5,5,0,100,3.7,414,76,'http://content8.flixster.com/movie/10/92/29/10922994_det.jpg'),
 (84,'Last Summer in the Hamptons',113612,'Last Summer in the Hamptons','http://ia.media-imdb.com/images/M/MV5BMTY2OTM4MDI2OV5BMl5BanBnXkFtZTcwNTQxMTYxMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'last_summer_in_the_hamptons',6,15,9,6,60,0,2,2,0,100,3.3,89,47,'http://content8.flixster.com/movie/92/06/07/9206078_det.jpg'),
 (85,'Angels and Insects',112365,'Ángeles & insectos','http://ia.media-imdb.com/images/M/MV5BOTgwMTExNjk2M15BMl5BanBnXkFtZTcwNzQxNTEzMQ@@._V1._SY314_CR2,0,214,314_.jpg',1995,'angels_and_insects',7,20,14,6,70,8.1,5,5,0,100,3.3,635,62,'http://content6.flixster.com/movie/10/89/39/10893928_det.jpg'),
 (86,'White Squall',118158,'Tormenta blanca (White Squall)','http://ia.media-imdb.com/images/M/MV5BMTI5NjIzMTI5OV5BMl5BanBnXkFtZTcwMjY0MzAyMQ@@._V1._SY314_CR2,0,214,314_.jpg',1996,'white_squall',6,30,19,11,63,6.3,10,7,3,70,3.2,3184,62,'http://content9.flixster.com/movie/10/90/52/10905259_det.jpg'),
 (87,'Dunston Checks In',116151,'Mi colega Dunston','http://ia.media-imdb.com/images/M/MV5BMTM2OTI4ODAxMl5BMl5BanBnXkFtZTcwODUzMzYyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1996,'dunston_checks_in',4,15,1,14,6,0,4,1,3,25,2.5,2935,39,'http://content8.flixster.com/movie/10/85/22/10852206_det.jpg'),
 (88,'Black Sheep',779982,'Ovejas asesinas','http://ia.media-imdb.com/images/M/MV5BNzcwMTA1MjEzMl5BMl5BanBnXkFtZTcwNzE0MzQ0MQ@@._V1._SX214_CR0,0,214,314_.jpg',2006,'black_sheep',6,87,61,26,70,6.3,21,15,6,71,3.2,19454,54,'http://content6.flixster.com/movie/58/07/67/5807672_det.jpg'),
 (89,'Nick of Time',113972,'Nick of time: a la hora señalada','http://ia.media-imdb.com/images/M/MV5BMjEyMTk0ODYzM15BMl5BanBnXkFtZTYwNzQ4Mjg5._V1._SX150_SY220_.jpg',1995,'nick_of_time',5,28,8,20,28,3.8,5,0,5,0,3.1,10563,54,'http://content9.flixster.com/movie/10/84/01/10840163_det.jpg'),
 (90,'The Journey of August King',113490,'The Journey of August King','http://ia.media-imdb.com/images/M/MV5BMjA2MTMxMDQyMV5BMl5BanBnXkFtZTcwMDEzMzcyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1995,'journey_of_august_king',6,7,4,3,57,0,2,1,1,50,3.1,286,54,'http://content8.flixster.com/movie/26/54/265406_det.jpg'),
 (92,'Mary Reilly',117002,'Mary Reilly','http://ia.media-imdb.com/images/M/MV5BMTcxODgwNTM5MF5BMl5BanBnXkFtZTcwNTM0MjMyMQ@@._V1._SY314_CR2,0,214,314_.jpg',1996,'mary_reilly',4,41,11,30,26,4.6,9,2,7,22,2.8,3733,41,'http://content6.flixster.com/movie/27/56/275628_det.jpg'),
 (93,'Vampire in Brooklyn',114825,'Un vampiro suelto en Brooklyn','http://ia.media-imdb.com/images/M/MV5BMTI1MTQ3NzE0MV5BMl5BanBnXkFtZTcwNDAwNzIyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1995,'vampire_in_brooklyn',4,28,3,25,10,3.1,9,0,9,0,2.4,6122,37,'http://content7.flixster.com/movie/10/88/64/10886457_det.jpg'),
 (94,'Beautiful Girls',115639,'Beautiful Girls','http://ia.media-imdb.com/images/M/MV5BMTI4NjU0NDM0NV5BMl5BanBnXkFtZTYwODU5MjY5._V1._SY314_CR1,0,214,314_.jpg',1996,'beautiful_girls',7,46,36,10,78,6.3,14,9,5,64,3.6,4674,79,'http://content7.flixster.com/movie/10/84/53/10845361_det.jpg'),
 (95,'Broken Arrow',115759,'Broken Arrow: alarma nuclear','http://ia.media-imdb.com/images/M/MV5BMjE0NjIwODI0Nl5BMl5BanBnXkFtZTcwMDM5MDYyMQ@@._V1._SX214_CR0,0,214,314_.jpg',1996,'1069241-broken_arrow',6,29,16,13,55,6.1,6,3,3,50,2.9,12489,51,'http://content6.flixster.com/movie/27/12/271208_det.jpg'),
 (96,'In the Bleak Midwinter',113403,'En lo más crudo del crudo invierno','http://ia.media-imdb.com/images/M/MV5BMTIyMDEwMDAyMl5BMl5BanBnXkFtZTYwOTUwNTk4._V1._SX214_CR0,0,214,314_.jpg',1995,'midwinters_tale',7,19,17,2,89,0,3,2,1,66,4.1,309,88,'http://content6.flixster.com/movie/52/63/38/5263388_det.jpg'),
 (97,'La haine',113247,'El odio','http://ia.media-imdb.com/images/M/MV5BMTc1ODkwNTI0OV5BMl5BanBnXkFtZTcwNDA2MjEyMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'hate',8,14,14,0,100,0,4,4,0,100,4.3,11987,95,'http://content8.flixster.com/movie/10/84/15/10841502_det.jpg'),
 (98,'Going Shopping',295605,'Going Shopping','http://ia.media-imdb.com/images/M/MV5BMTc5MTQ3MzA0M15BMl5BanBnXkFtZTcwNzk4MDE0MQ@@._V1._SY314_CR3,0,214,314_.jpg',2005,'going_shopping',5,29,12,17,41,5,15,5,10,33,2.8,691,37,'http://content8.flixster.com/movie/25/02/250226_det.jpg'),
 (99,'Heidi Fleiss: Hollywood Madam',113283,'Heidi Fleiss: Hollywood Madam','http://ia.media-imdb.com/images/M/MV5BMTc4NDc5NzQzNF5BMl5BanBnXkFtZTcwMDUyODkxMQ@@._V1._SY314_CR5,0,214,314_.jpg',1995,'heidi_fleiss_hollywood_madam',8,7,5,2,71,8.8,5,4,1,80,3,281,46,'http://content7.flixster.com/movie/30/49/304921_det.jpg'),
 (100,'City Hall',115907,'City Hall. La sombra de la corrupción','http://ia.media-imdb.com/images/M/MV5BMTQxNzEzMzQwN15BMl5BanBnXkFtZTcwOTk5MDYyMQ@@._V1._SY292_CR1,0,214,292_.jpg',1996,'city_hall',6,22,12,10,54,7,6,3,3,50,3,2730,42,'http://content8.flixster.com/movie/27/59/275902_det.jpg'),
 (101,'Bottle Rocket',115734,'Ladrón que roba a otro ladrón','http://ia.media-imdb.com/images/M/MV5BMTk1ODI3NzA2NV5BMl5BanBnXkFtZTcwNTI0MTEyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1996,'bottle_rocket',7,42,33,9,78,6.1,9,5,4,55,3.7,16217,80,'http://content6.flixster.com/movie/26/73/267324_det.jpg'),
 (102,'Mr. Wrong',117102,'Mr. Wrong','http://ia.media-imdb.com/images/M/MV5BMTM0MTAxMjcyMl5BMl5BanBnXkFtZTcwMTIzMTEyMQ@@._V1._SY314_CR3,0,214,314_.jpg',1996,'mr_wrong',3,28,1,27,3,3.1,8,0,8,0,2.4,1544,29,'http://content8.flixster.com/movie/10/92/04/10920478_det.jpg'),
 (103,'Unforgettable',118040,'Escondido en la memoria','http://ia.media-imdb.com/images/M/MV5BNDM1MDg5MzY4OV5BMl5BanBnXkFtZTcwMDM5NjgyMQ@@._V1._SY314_CR2,0,214,314_.jpg',1996,'unforgettable',4,26,6,20,23,0,4,0,4,0,3,358,36,'http://content8.flixster.com/movie/11/13/35/11133586_det.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;


--
-- Definition of table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`,`value`) VALUES 
 (2,'police'),
 (3,'boxing'),
 (4,'painter'),
 (5,'whale'),
 (6,'medieval'),
 (7,'funny'),
 (8,'almodovar'),
 (9,'finnish'),
 (10,'brothers quay'),
 (11,'satoshi kon'),
 (12,'robots'),
 (13,'time travel'),
 (15,'dreamdontcatch'),
 (16,'excellent characters'),
 (17,'seriously scary'),
 (18,'frightfully accurate political commentary'),
 (19,'very moving'),
 (21,'bill murray'),
 (22,'bruce campbell'),
 (23,'wes anderson'),
 (24,'dystopia'),
 (25,'tim allen'),
 (27,'great movie'),
 (28,'fav 06'),
 (29,'overrated'),
 (31,'watch again'),
 (34,'satire'),
 (35,'computers'),
 (36,'cold war'),
 (37,'not a war movie'),
 (38,'ghosts/afterlife'),
 (39,'inspiring'),
 (40,'not seen it'),
 (41,'sexy'),
 (42,'gothic'),
 (43,'no good'),
 (44,'awsome'),
 (45,'revolutionary'),
 (46,'horrible'),
 (47,'oddly moving'),
 (48,'not at cml'),
 (49,'comic book'),
 (50,'nicholas cage'),
 (51,'available at cml'),
 (52,'horro'),
 (53,'crime'),
 (54,'serial killer'),
 (55,'comedy'),
 (56,'sam raimi'),
 (57,'horror'),
 (58,'hannibal lecter'),
 (59,'johnny depp'),
 (60,'fun'),
 (61,'woody allen'),
 (62,'vampire'),
 (64,'surreal'),
 (66,'strange'),
 (67,'mystery'),
 (68,'stupid as hell'),
 (69,'drugs'),
 (70,'spooky'),
 (71,'easygoing'),
 (72,'lynch'),
 (73,'pacino'),
 (74,'action'),
 (75,'garbage'),
 (76,'idiotic'),
 (77,'masterpiece'),
 (78,'bad acting'),
 (79,'bad ending'),
 (80,'ghosts'),
 (81,'profoundly annoying'),
 (83,'worst movie ever'),
 (85,'awful'),
 (86,'best movie ever'),
 (87,'badly acted'),
 (88,'terrible screenplay'),
 (89,'existentialism'),
 (90,'slow'),
 (91,'cheap'),
 (92,'complicated'),
 (93,'nudity (topless)'),
 (94,'dialogue<3'),
 (95,'sexy ladies'),
 (96,'superbad'),
 (97,'edward norton'),
 (98,'bunker'),
 (99,'surrealism'),
 (100,'gulf war'),
 (101,'mildly funny'),
 (102,'biopic'),
 (103,'english literature'),
 (104,'heist'),
 (105,'television industry'),
 (106,'abuse'),
 (107,'midlife crisis'),
 (108,'possibly homosexual'),
 (109,'eric blair'),
 (110,'espionage'),
 (111,'childish');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


--
-- Definition of table `user_ratedmovies`
--

DROP TABLE IF EXISTS `user_ratedmovies`;
CREATE TABLE `user_ratedmovies` (
  `userID` varchar(50) NOT NULL,
  `movieID` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `date_day` int(11) DEFAULT NULL,
  `date_month` int(11) DEFAULT NULL,
  `date_year` int(11) DEFAULT NULL,
  `date_hour` int(11) DEFAULT NULL,
  `date_minute` int(11) DEFAULT NULL,
  `date_second` float DEFAULT NULL,
   PRIMARY KEY (`userID`,`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_ratedmovies`
--

/*!40000 ALTER TABLE `user_ratedmovies` DISABLE KEYS */;
INSERT INTO `user_ratedmovies` (`userID`,`movieID`,`rating`,`date_day`,`date_month`,`date_year`,`date_hour`,`date_minute`,`date_second`) VALUES 
 (75,32,5,29,10,2006,23,23,44),
 (75,110,4,29,10,2006,23,30,8),
 (75,160,2,29,10,2006,23,16,52),
 (75,163,4,29,10,2006,23,29,30),
 (75,165,5,29,10,2006,23,25,15),
 (75,173,4,29,10,2006,23,17,37),
 (75,296,5,29,10,2006,23,24,49),
 (75,353,4,29,10,2006,23,17,0),
 (75,420,2,29,10,2006,23,16,42),
 (75,589,4,29,10,2006,23,28,21),
 (75,653,3,29,10,2006,23,17,5),
 (75,832,5,29,10,2006,23,17,49),
 (75,920,1,29,10,2006,23,17,8),
 (75,996,5,29,10,2006,23,26,17),
 (75,1036,4,29,10,2006,23,24,45),
 (75,1127,4,29,10,2006,23,28,52),
 (75,1215,5,29,10,2006,23,28,56),
 (75,1233,4,29,10,2006,23,30,5),
 (75,1304,3,29,10,2006,23,16,56),
 (75,1370,4,29,10,2006,23,25,11),
 (75,1374,4,29,10,2006,23,17,20),
 (75,1485,4,29,10,2006,23,17,46),
 (75,1527,5,29,10,2006,23,24,1),
 (75,1917,3,29,10,2006,23,26,3),
 (75,2011,2,29,10,2006,23,16,39),
 (75,2054,2,29,10,2006,23,17,33),
 (75,2058,4,29,10,2006,23,29,25),
 (75,2490,4,29,10,2006,23,29,35),
 (75,2571,5,29,10,2006,23,30,50),
 (75,2640,3,29,10,2006,23,17,56),
 (75,2688,3,29,10,2006,23,22,26),
 (75,2700,5,29,10,2006,23,17,52),
 (75,2762,4,29,10,2006,23,24,54),
 (75,2959,5,29,10,2006,23,30,12),
 (75,3258,2,29,10,2006,23,26,8),
 (75,3793,3,29,10,2006,23,29,16),
 (75,3889,3,29,10,2006,23,22,43),
 (75,3994,4,29,10,2006,23,25,24),
 (75,4993,4,29,10,2006,23,30,34),
 (75,5107,3,29,10,2006,23,26,11),
 (75,5833,3,29,10,2006,23,29,51),
 (75,5952,4,29,10,2006,23,30,40),
 (75,6213,4,29,10,2006,23,26,21),
 (75,6225,1,29,10,2006,23,21,25),
 (75,6333,4,29,10,2006,23,28,12),
 (75,7000,4,29,10,2006,23,25,8),
 (75,7007,5,29,10,2006,23,24,15),
 (75,7153,4,29,10,2006,23,30,36),
 (75,32029,5,29,10,2006,23,25,18),
 (75,32587,5,29,10,2006,23,24,51),
 (75,33437,4,29,10,2006,23,28,48),
 (75,39052,4,29,10,2006,23,28,44),
 (75,45431,4,29,10,2006,23,25,58),
 (75,45722,5,29,10,2006,23,29,46),
 (78,17,4,10,10,2004,15,34,55),
 (78,29,5,16,4,2007,4,57,48),
 (78,32,5,7,5,2004,23,32,18),
 (78,41,5,10,10,2004,15,56,39),
 (78,82,4,7,5,2004,23,20,36),
 (78,101,5,9,7,2004,2,27,41),
 (78,110,4,11,7,2004,11,44,24),
 (78,111,4,16,4,2007,2,25,10),
 (78,150,4,13,8,2004,2,43,53),
 (78,162,5,9,7,2004,2,27,32),
 (78,198,3,7,5,2004,22,47,9),
 (78,223,5,11,7,2004,11,53,50),
 (78,235,4,9,7,2004,2,34,25),
 (78,260,4,21,10,2004,2,36,2),
 (78,272,5,7,5,2004,22,47,31),
 (78,296,5,8,5,2004,6,46,26),
 (78,305,2,10,10,2004,15,56,26),
 (78,314,4,7,5,2004,23,19,17),
 (78,318,4,9,7,2004,2,34,43),
 (78,327,4,11,7,2004,11,0,50),
 (78,356,4,11,7,2004,12,5,34),
 (78,357,5,11,7,2004,11,58,45),
 (78,468,4,7,5,2004,22,48,20),
 (78,480,3,11,7,2004,10,55,19),
 (78,497,4,7,5,2004,23,14,33),
 (78,509,5,10,10,2004,15,40,24),
 (78,515,4,7,5,2004,23,19,56),
 (78,527,4,7,5,2004,23,3,41),
 (78,541,5,7,5,2004,23,4,5),
 (78,562,5,15,11,2004,21,55,33),
 (78,589,4,9,7,2004,2,34,47),
 (78,590,4,9,7,2004,2,21,12),
 (78,608,5,7,5,2004,23,3,50),
 (78,671,4,9,7,2004,2,34,34),
 (78,720,5,9,7,2004,2,24,58),
 (78,728,4,9,7,2004,2,34,20),
 (78,741,5,16,4,2007,4,58,9),
 (78,745,5,7,5,2004,22,48,10),
 (78,750,5,7,5,2004,23,3,45),
 (78,760,4,11,7,2004,11,43,19),
 (78,778,5,7,5,2004,23,32,6),
 (78,780,3,7,5,2004,23,44,48),
 (78,800,4,9,7,2004,2,34,31),
 (78,858,4,9,7,2004,2,27,50),
 (78,903,4,9,7,2004,2,34,55),
 (78,904,5,9,7,2004,2,28,1);
/*!40000 ALTER TABLE `user_ratedmovies` ENABLE KEYS */;


--
-- Definition of table `user_ratedmovies_timestamps`
--

DROP TABLE IF EXISTS `user_ratedmovies_timestamps`;
CREATE TABLE `user_ratedmovies_timestamps` (
  `userID` int(11) DEFAULT NULL,
  `movieID` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_ratedmovies_timestamps`
--

/*!40000 ALTER TABLE `user_ratedmovies_timestamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ratedmovies_timestamps` ENABLE KEYS */;


--
-- Definition of table `user_taggedmovies`
--

DROP TABLE IF EXISTS `user_taggedmovies`;
CREATE TABLE `user_taggedmovies` (
  `userID` int(11) DEFAULT NULL,
  `movieID` int(11) DEFAULT NULL,
  `tagID` int(11) DEFAULT NULL,
  `date_day` int(11) DEFAULT NULL,
  `date_month` int(11) DEFAULT NULL,
  `date_year` int(11) DEFAULT NULL,
  `date_hour` int(11) DEFAULT NULL,
  `date_minute` int(11) DEFAULT NULL,
  `date_second` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_taggedmovies`
--

/*!40000 ALTER TABLE `user_taggedmovies` DISABLE KEYS */;
INSERT INTO `user_taggedmovies` (`userID`,`movieID`,`tagID`,`date_day`,`date_month`,`date_year`,`date_hour`,`date_minute`,`date_second`) VALUES 
 (78,4223,5264,16,4,2007,4,43,45),
 (127,1343,1544,28,8,2007,3,42,27),
 (127,1343,12330,28,8,2007,3,42,27),
 (127,2080,1451,28,8,2007,3,42,47),
 (127,2080,1574,28,8,2007,3,42,47),
 (127,2953,4121,28,8,2007,3,45,44),
 (127,2953,11860,28,8,2007,3,45,44),
 (127,4270,914,28,8,2007,3,45,9),
 (127,4270,5215,28,8,2007,3,45,9),
 (127,4447,7,28,8,2007,3,44,23),
 (127,4447,1996,28,8,2007,3,44,23),
 (127,4447,2571,28,8,2007,3,44,23),
 (127,5679,742,28,8,2007,3,44,7),
 (127,6934,1537,28,8,2007,3,43,57),
 (127,6934,1538,28,8,2007,3,43,57),
 (127,6934,9062,28,8,2007,3,43,57),
 (127,7147,146,28,8,2007,3,43,28),
 (127,7147,150,28,8,2007,3,43,28),
 (127,7147,1878,28,8,2007,3,43,28),
 (127,7147,2596,28,8,2007,3,43,28),
 (127,7147,13087,28,8,2007,3,43,28),
 (127,8622,55,28,8,2007,3,44,57),
 (127,8622,11371,28,8,2007,3,44,57),
 (127,8622,13086,28,8,2007,3,44,57),
 (170,47830,93,30,10,2006,12,52,56),
 (175,2819,11407,30,8,2007,4,37,0),
 (175,51540,79,21,10,2007,20,8,53),
 (190,741,712,30,6,2006,22,41,47),
 (190,1274,712,30,6,2006,22,42,19),
 (190,2116,410,15,2,2006,21,59,29),
 (190,2810,712,30,6,2006,22,42,5),
 (190,3000,712,30,6,2006,22,39,5),
 (190,3997,410,15,2,2006,20,33,50),
 (190,4993,410,15,2,2006,21,57,36),
 (190,5039,410,15,2,2006,20,33,42),
 (190,5069,712,30,6,2006,22,40,15),
 (190,5072,712,16,4,2008,19,1,0),
 (190,5146,712,30,6,2006,22,39,46),
 (190,5618,712,30,6,2006,22,39,11),
 (190,5690,712,30,6,2006,22,40,35),
 (190,5952,410,15,2,2006,21,57,48),
 (190,5971,712,30,6,2006,22,39,38),
 (190,6283,712,30,6,2006,22,40,10),
 (190,6350,712,30,6,2006,22,40,2),
 (190,6857,712,30,6,2006,22,42,8),
 (190,7099,712,30,6,2006,22,39,19),
 (190,7153,410,15,2,2006,20,32,34),
 (190,8607,712,30,6,2006,22,42,14),
 (190,26662,712,30,6,2006,22,41,51),
 (190,27728,712,16,4,2008,19,0,36),
 (190,31184,712,16,4,2008,19,0,5),
 (190,31658,712,30,6,2006,22,39,29),
 (190,31660,712,30,6,2006,22,40,26),
 (267,6365,186,10,10,2007,22,53,54),
 (325,628,6331,1,3,2007,11,6,11),
 (325,30818,5074,29,7,2007,0,55,27),
 (325,34162,6333,11,6,2006,4,58,58),
 (325,45720,6333,1,3,2007,10,55,42),
 (325,51084,876,1,3,2007,10,56,20),
 (383,6270,280,24,12,2007,7,37,48),
 (383,6270,669,24,12,2007,7,38,18),
 (383,27741,7181,25,10,2006,5,25,2),
 (383,45175,753,25,10,2006,5,26,6),
 (476,1136,1181,15,2,2006,1,23,25),
 (477,1188,5609,28,8,2007,16,32,40),
 (477,1188,5610,28,8,2007,16,32,40),
 (477,1267,5588,28,8,2007,16,30,56),
 (477,1267,5593,28,8,2007,16,30,56),
 (477,1274,5611,28,8,2007,16,46,20),
 (477,1597,5599,28,8,2007,16,30,2),
 (477,1608,5597,28,8,2007,16,45,36),
 (477,1690,5031,28,8,2007,16,29,52),
 (477,1918,5582,28,8,2007,16,31,55),
 (477,2023,5583,28,8,2007,16,30,17),
 (477,2023,5590,28,8,2007,16,30,17),
 (477,2947,5595,28,8,2007,16,30,28),
 (477,3755,5581,28,8,2007,16,31,37),
 (477,3755,5591,28,8,2007,16,31,37),
 (477,4262,5586,28,8,2007,16,35,42),
 (477,4310,5603,28,8,2007,16,35,21),
 (477,5618,5608,28,8,2007,16,36,3),
 (477,5679,5580,28,8,2007,16,33,53),
 (477,6934,5584,28,8,2007,16,33,45),
 (477,7147,5598,28,8,2007,16,33,5),
 (477,7147,5602,28,8,2007,16,33,22),
 (477,8977,5596,28,8,2007,16,47,2),
 (477,32587,5601,28,8,2007,16,34,16),
 (477,32587,5612,28,8,2007,16,34,16),
 (477,48774,5585,28,8,2007,17,2,4),
 (477,54001,5589,28,8,2007,16,50,48),
 (493,3683,289,13,8,2008,21,17,26),
 (498,1244,5879,28,8,2007,17,47,12),
 (498,1297,615,28,8,2007,17,43,29),
 (498,1297,1510,28,8,2007,17,43,29),
 (498,1297,5875,28,8,2007,17,43,29),
 (498,1297,5877,28,8,2007,17,43,29),
 (498,1297,5883,28,8,2007,17,43,29),
 (498,3814,61,28,8,2007,17,45,30),
 (498,3814,701,28,8,2007,17,45,31),
 (498,3814,5872,28,8,2007,17,45,31);
/*!40000 ALTER TABLE `user_taggedmovies` ENABLE KEYS */;


--
-- Definition of table `user_taggedmovies_timestamps`
--

DROP TABLE IF EXISTS `user_taggedmovies_timestamps`;
CREATE TABLE `user_taggedmovies_timestamps` (
  `userID` int(11) DEFAULT NULL,
  `movieID` int(11) DEFAULT NULL,
  `tagID` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_taggedmovies_timestamps`
--

/*!40000 ALTER TABLE `user_taggedmovies_timestamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_taggedmovies_timestamps` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
