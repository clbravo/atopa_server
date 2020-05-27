-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (armv8l)
--
-- Host: localhost    Database: atopa_app
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
-- Table structure for table `cuestionarios_pregunta`
--

DROP TABLE IF EXISTS `cuestionarios_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` longtext NOT NULL,
  `tipo_pregunta_id` int(11) NOT NULL,
  `tipo_estructura_id` int(11) NOT NULL,
  `grupo_edad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_pregun_tipo_pregunta_id_092be6a6_fk_cuestiona` (`tipo_pregunta_id`),
  KEY `cuestionarios_pregun_tipo_estructura_id_1c6e1f4e_fk_cuestiona` (`tipo_estructura_id`),
  KEY `cuestionarios_pregun_grupo_edad_id_b56b0062_fk_cuestiona` (`grupo_edad_id`),
  CONSTRAINT `cuestionarios_pregun_grupo_edad_id_b56b0062_fk_cuestiona` FOREIGN KEY (`grupo_edad_id`) REFERENCES `cuestionarios_grupo_edad` (`id`),
  CONSTRAINT `cuestionarios_pregun_tipo_estructura_id_1c6e1f4e_fk_cuestiona` FOREIGN KEY (`tipo_estructura_id`) REFERENCES `cuestionarios_tipo_estructura` (`id`),
  CONSTRAINT `cuestionarios_pregun_tipo_pregunta_id_092be6a6_fk_cuestiona` FOREIGN KEY (`tipo_pregunta_id`) REFERENCES `cuestionarios_tipo_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_pregunta`
--

LOCK TABLES `cuestionarios_pregunta` WRITE;
/*!40000 ALTER TABLE `cuestionarios_pregunta` DISABLE KEYS */;
INSERT INTO `cuestionarios_pregunta` VALUES (1,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',1,1,1),(2,'¿Con qué personas prefieres jugar en el recreo?',1,1,1),(3,'¿Qué personas de tu clase echarías de menos si no estuviesen?',1,1,1),(4,'¿Con qué compañeros o compañeras te gustaría sentarte en el aula?',1,1,1),(5,'¿Quiénes son tus mejores amigos?',1,2,1),(6,'¿Qué compañeros o compañeras te parecen más simpáticos?',1,2,1),(7,'¿A qué personas de la clase invitarías a tu cumpleaños?',1,2,1),(8,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',1,1,2),(9,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',1,1,2),(10,'¿Con qué compañeros o compañeras te gustaría sentarte en el aula?',1,1,2),(11,'¿Con qué personas prefieres estar juntos en el recreo?',1,1,2),(12,'¿A qué compañeros o compañeras escogerías para formar un equipo de baloncesto en educación física?',1,1,2),(13,'¿Quiénes son tus mejores amigos y amigas?',1,2,2),(14,'¿A qué personas de la clase invitarías a tu cumpleaños?',1,2,2),(15,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos y amigas de clase, ¿a qué personas de la clase invitarías?',1,2,2),(16,'¿Con qué personas de la clase irías al cine el próximo viernes?',1,2,2),(17,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',1,1,3),(18,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',1,1,3),(19,'¿A qué compañeros o compañeras elegirías para hacer un trabajo en grupo?',1,1,3),(20,'Si tuvieses que escoger un grupo de compañeros y compañeras para hacer una obra de teatro, ¿a quiénes escogerías?',1,1,3),(21,'¿A qué compañeros o compañeras escogerías para formar un equipo de baloncesto en educación física?',1,1,3),(22,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos y amigas de clase, ¿a quiénes invitarías?',1,2,3),(23,'¿Con quién irías al cine el próximo viernes?',1,2,3),(24,'¿A qué compañeros o compañeras pedirías consejo ante un problema personal?',1,2,3),(25,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',1,1,4),(26,'¿Con qué compañeros o compañeras te gustaría quedar para estudiar?',1,1,4),(27,'¿A qué compañeros o compañeras elegirías para hacer un trabajo en grupo?',1,1,4),(28,'¿A qué compañeros o compañeras seguirías en istagram o twitter?',1,2,4),(29,'¿A qué compañeros o compañeras mandarías una solicitud de amistad por facebook?',1,2,4),(30,'¿A qué compañeros o compañeras pedirías consejo ante problemas personales?',1,2,4),(31,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',2,1,1),(32,'¿Con qué personas prefieres NO jugar en el recreo? ¿Por qué?',2,1,1),(33,'¿Con qué compañeros o compañeras NO te gustaría sentarte en el aula? ¿Por qué?',2,1,1),(34,'¿Qué compañeros o compañeras NO te parecen simpáticos? ¿Por qué?',2,2,1),(35,'¿A qué personas de la clase NO invitarías a tu cumpleaños? ¿Por qué?',2,2,1),(36,'¿Con qué compañeros o compañeras prefieres NO encontrarte en un cumpleaños? ¿Por qué?',2,2,1),(37,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',2,1,2),(38,'¿A qué personas NO elegirías para hacer un trabajo de clase? ¿Por qué?',2,1,2),(39,'¿Con qué compañeros o compañeras NO te gustaría sentarte en el aula? ¿Por qué?',2,1,2),(40,'¿Con qué personas prefieres NO estar en el recreo? ¿Por qué?',2,1,2),(41,'¿Qué compañeros o compañeras NO te parecen simpáticos? ¿Por qué?',2,2,2),(42,'¿A qué personas de la clase NO invitarías a tu cumpleaños? ¿Por qué?',2,2,2),(43,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos de clase, ¿a qué personas de la clase NO invitarías? ¿Por qué?',2,2,2),(44,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',2,1,3),(45,'¿A qué personas NO elegirías para hacer un trabajo de clase? ¿Por qué?',2,1,3),(46,'¿A qué compañeros o compañeras NO elegirías para hacer un trabajo en grupo? ¿Por qué?',2,1,3),(47,'Si tuvieses que escoger un grupo de compañeros para hacer una obra de teatro, ¿a quiénes NO escogerías? ¿Por qué?',2,1,3),(48,'¿A qué compañero o compañera NO llamarías para quedar una tarde? ¿Por qué?',2,2,3),(49,'¿A qué compañeros o compañeras NO pedirías consejo ante un problema personal? ¿Por qué?',2,2,3),(50,'¿Con qué personas de la clase NO te gusta trabajar o NO elegirías para hacer un trabajo de clase? ¿Por qué?',2,1,4),(51,'¿Con qué compañeros o compañeras NO te gustaría quedar para estudiar? ¿Por qué?',2,1,4),(52,'¿A qué compañeros o compañeras NO elegirías para hacer un trabajo en grupo? ¿Por qué?',2,1,4),(53,'¿A qué compañeros o compañeras NO seguirías en istagram o twitter? ¿Por qué?',2,2,4),(54,'¿A qué compañeros o compañeras NO mandarías una solicitud de amistad en facebook? ¿Por qué?',2,2,4),(55,'¿A qué compañeros o compañeras NO pedirías consejo ante un problema personal? ¿Por qué?',2,2,4),(56,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',3,1,1),(57,'¿Qué niños o niñas crees que te escogerían para jugar en el recreo?',3,1,1),(58,'¿Qué personas de tu clase crees que te echarían de menos si cambiases de colegio?',3,1,1),(59,'¿Qué compañeros o compañeras crees que quieren sentarse en el aula contigo?',3,1,1),(60,'¿Quién o quiénes crees que te escogen como mejor amigo o mejor amiga?',3,2,1),(61,'¿A qué personas de la clase crees que les pareces simpático?',3,2,1),(62,'¿Quién o quiénes crees que te van a invitar a su cumpleaños?',3,2,1),(63,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',3,1,2),(64,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',3,1,2),(65,'¿Qué compañeros o compañeras crees que quieren sentarse en el aula contigo?',3,1,2),(66,'¿Qué niños o niñas crees que te escogerían para estar juntos en el recreo?',3,1,2),(67,'¿Quién o quiénes crees que te escogen como mejor amigo o mejor amiga?',3,2,2),(68,'¿Quién o quiénes crees que te van a invitar a su cumpleaños?',3,2,2),(69,'¿Qué personas de tu clase crees que te invitarían a una fiesta, una excursión, o un partido?',3,2,2),(70,'¿A qué personas de tu clase crees que les gustaría ir al cine contigo?',3,2,2),(71,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',3,1,3),(72,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',3,1,3),(73,'¿Qué compañeros o compañeras crees que te escogerían para hacer una obra de teatro con ellos?',3,1,3),(74,'¿Qué personas de tu clase crees que te invitarían a una fiesta, a una excursión, o a un partido?',3,2,3),(75,'¿A qué personas de tu clase crees que les gustaría ir al cine el próximo viernes contigo?',3,2,3),(76,'¿Qué compañeros o compañeras crees que te pedirían consejo ante un problema personal?',3,2,3),(77,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',3,1,4),(78,'¿A qué personas de tu clase crees que les gustaría quedar a estudiar contigo?',3,1,4),(79,'¿Quién o quiénes crees que te han elegido para formar un grupo de trabajo?',3,1,4),(80,'¿Qué compañeros o compañeras crees que te seguirían en istagram o twitter?',3,2,4),(81,'¿Qué compañeros o compañeras crees que te mandarían una solicitud de amistad por facebook?',3,2,4),(82,'¿Qué compañeros o compañeras crees que te pedirían consejo ante un problema personal?',3,2,4),(83,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo. ¿Por qué?',4,1,1),(84,'¿Qué niños o niñas crees que NO te escogerían para jugar en el recreo? ¿Por qué?',4,1,1),(85,'¿Qué personas de tu clase crees que NO te echarían de menos si cambiases de colegio?  ¿Por qué?',4,1,1),(86,'¿Qué compañeros o compañeras crees que NO quieren sentarse en el aula contigo?  ¿Por qué?',4,1,1),(87,'¿Quién o quiénes crees que NO te escogen como amigo o amiga?  ¿Por qué?',4,2,1),(88,'¿A qué personas de la clase crees que NO les pareces simpático o simpática?  ¿Por qué?',4,2,1),(89,'¿Quién o quiénes crees que NO te van a invitar a su cumpleaños?  ¿Por qué?',4,2,1),(90,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo.  ¿Por qué?',4,1,2),(91,'¿Quién o quiénes crees que NO te han elegido para hacer un trabajo de aula? ¿Por qué?',4,1,2),(92,'¿Qué compañeros o compañeras crees que NO quieren sentarse en el aula contigo?  ¿Por qué?',4,1,2),(93,'¿Qué niños o niñas crees que NO te escogerían para estar juntos en el recreo?  ¿Por qué?',4,1,2),(94,'¿Quién o quiénes crees que NO te escogen como amigo o amiga?  ¿Por qué?',4,2,2),(95,'¿Quién o quiénes crees que NO te van a invitar a su cumpleaños?  ¿Por qué?',4,2,2),(96,'¿Qué personas de tu clase crees que NO te invitarían a una fiesta, una excursión, o un partido?  ¿Por qué?',4,2,2),(97,'¿Qué personas de tu clase crees que NO les gustaría ir al cine contigo?  ¿Por qué?',4,2,2),(98,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo.  ¿Por qué crees esto?',4,1,3),(99,'¿Quién o quiénes crees que NO te han elegido como compañero o compañera de trabajo?  ¿Por qué?',4,1,3),(100,'¿Qué compañeros o compañeras crees que NO te escogerían para hacer una obra de teatro con ellos?  ¿Por qué?',4,1,3),(101,'¿Qué personas de tu clase crees que NO te invitarían a una fiesta, una excursión, o un partido?  ¿Por qué?',4,2,3),(102,'¿A qué personas de tu clase crees que NO les gustaría ir al cine contigo?  ¿Por qué?',4,2,3),(103,'¿Qué compañeros o compañeras crees que NO te pedirían consejo ante un problema personal?  ¿Por qué?',4,2,3),(104,'¿Quién o quiénes crees que NO te han elegido como compañero o compañera de trabajo?  ¿Por qué?',4,1,4),(105,'¿A qué personas de tu clase crees que NO les gustaría quedar para estudiar contigo?  ¿Por qué?',4,1,4),(106,'¿Quién o quiénes crees que NO te han elegido para formar un grupo de trabajo?  ¿Por qué?',4,1,4),(107,'¿Qué compañeros o compañeras crees que NO te seguirían en instagram o twitter?  ¿Por qué?',4,2,4),(108,'¿Qué compañeros o compañeras crees que NO te mandarían una solicitud de amistad por facebook?  ¿Por qué?',4,2,4),(109,'¿Qué compañeros o compañeras crees que NO te pedirían consejo ante un problema personal?  ¿Por qué?',4,2,4),(110,'Adivina quién es el compañero o compañera más listo o lista de la clase.',5,1,1),(111,'Adivina quién es el niño o la niña al que más quiere la profesora o profesor.',5,1,1),(112,'Adivina quién ayuda más a sus compañeros y compañeras.',5,1,1),(113,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',5,2,1),(114,'Adivina quién es el compañero o compañera más feliz.',5,2,1),(115,'Dime aquel compañero o compañera que es elegido como líder, como niño o niña más popular de la clase.',5,1,2),(116,'Adivina qué compañero o compañera es más inteligente.',5,1,2),(117,'Adivina quién es el compañero o compañera que tiene capacidad para atender y escuchar a los demás.',5,2,2),(118,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',5,2,2),(119,'Adivina quién tiene capacidad para resolver conflictos entre los compañeros y compañeras.',5,2,2),(120,'Dime aquel compañero o compañera que es muy agradable, cordial y realmente bueno o buena para trabajar en equipo.',5,1,3),(121,'Adivina quién es el compañero o compañera que tiene capacidad para resolver conflictos entre los compañeros y compañeras.',5,1,3),(122,'Adivina quién es el compañero o compañera que tiene capacidad para atender y escuchar a los demás.',5,2,3),(123,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',5,2,3),(124,'Dime aquel compañero o compañera que es muy agradable, cordial y realmente bueno o buena para trabajar en equipo. Coopera, ayuda, comparte y respeta los turnos.',5,1,4),(125,'Adivina quién es el compañero o compañera que tiene capacidad para resolver conflictos entre los compañeros y compañeras.',5,1,4),(126,'Dime aquel compañero o compañera que crees que tiene más seguidores en twitter o instagram.',5,2,4),(127,'Dime aquel compañero o compañera que crees que tiene más amigos en facebook.',5,2,4),(128,'Adivina quién es el compañero o compañera que sabe comunicarse mejor y que le entienden y escuchen con más facilidad.',5,2,4),(129,'Adivina quién es el o la que menos sabe en clase.',6,1,1),(130,'Adivina quién es el niño o la niña al que menos quiere la profesora o el profesor.',6,1,1),(131,'Adivina quién molesta más a sus compañeros y compañeras.',6,1,1),(132,'Adivina quién es el compañero o compañera que tiene menos amigos y amigas.',6,2,1),(133,'Adivina quién es el compañero o compañera más triste.',6,2,1),(134,'Dime aquel compañero o compañera que molesta más a los demás.',6,1,2),(135,'Dime aquel compañero o compañera que no comparte ni respeta a los demás.',6,1,2),(137,'Dime aquel compañero o compañera que se mete con los demás.',6,2,2),(138,'Dime aquel compañero o compañera que cuando llega a los grupos molesta, no comparte ni respeta, e intenta que todos hagan las cosas a su manera.',6,1,3),(139,'Dime aquel compañero o compañera que siempre pide ayuda para hacer cualquier cosa, incluso antes de haberlo intentado.',6,1,3),(140,'Dime aquel compañero o compañera que es muy tímido o tímida con los demás, siempre juega o trabaja solo o sola y es más difícil llegar a conocer.',6,2,3),(141,'Dime aquel compañero o compañera que empieza las peleas, se mete con los demás, les empuja o les pega.',6,2,3),(142,'Dime aquel compañero o compañera que cuando llega a los grupos molesta, no comparte ni respeta, e intenta que todos hagan las cosas a su manera.',6,1,4),(143,'Dime aquel compañero o compañera que siempre pide ayuda para hacer cualquiera cosa, incluso antes de haberlo intentado.',6,1,4),(144,'Dime aquel compañero o compañera que crees que tiene menos seguidores en twitter o instagram.',6,2,4),(145,'Dime aquel compañero o compañera que crees que tiene menos amigos en facebook.',6,2,4),(146,'Adivina quién es el compañero o compañera que tiene problemas para comunicarse.',6,2,4),(147,'Dime quién es el compañero o compañera que trolea en las redes sociales para reírse de los demás.',6,2,4),(148,'Si pudieses invitar a una fiesta, una excursión, un partido a algunos amigos o amigas de clase, ¿a quién o quiénes NO invitarías? ¿Por qué?',4,2,3),(150,'Adivina quién es más maleducado o maleducada con los compañeros y compañeras.',6,2,2);
/*!40000 ALTER TABLE `cuestionarios_pregunta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-04  0:45:25
