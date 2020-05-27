-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: db    Database: atopa_app
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add user_test',8,'add_user_test'),(30,'Can change user_test',8,'change_user_test'),(31,'Can delete user_test',8,'delete_user_test'),(32,'Can view user_test',8,'view_user_test'),(33,'Can add grupo_edad',9,'add_grupo_edad'),(34,'Can change grupo_edad',9,'change_grupo_edad'),(35,'Can delete grupo_edad',9,'delete_grupo_edad'),(36,'Can view grupo_edad',9,'view_grupo_edad'),(37,'Can add pictos',10,'add_pictos'),(38,'Can change pictos',10,'change_pictos'),(39,'Can delete pictos',10,'delete_pictos'),(40,'Can view pictos',10,'view_pictos'),(41,'Can add pregunta',11,'add_pregunta'),(42,'Can change pregunta',11,'change_pregunta'),(43,'Can delete pregunta',11,'delete_pregunta'),(44,'Can view pregunta',11,'view_pregunta'),(45,'Can add tipo_estructura',12,'add_tipo_estructura'),(46,'Can change tipo_estructura',12,'change_tipo_estructura'),(47,'Can delete tipo_estructura',12,'delete_tipo_estructura'),(48,'Can view tipo_estructura',12,'view_tipo_estructura'),(49,'Can add tipo_pregunta',13,'add_tipo_pregunta'),(50,'Can change tipo_pregunta',13,'change_tipo_pregunta'),(51,'Can delete tipo_pregunta',13,'delete_tipo_pregunta'),(52,'Can view tipo_pregunta',13,'view_tipo_pregunta'),(53,'Can add test',14,'add_test'),(54,'Can change test',14,'change_test'),(55,'Can delete test',14,'delete_test'),(56,'Can view test',14,'view_test'),(57,'Can add preguntas_test',15,'add_preguntas_test'),(58,'Can change preguntas_test',15,'change_preguntas_test'),(59,'Can delete preguntas_test',15,'delete_preguntas_test'),(60,'Can view preguntas_test',15,'view_preguntas_test'),(61,'Can add pictos questions',16,'add_pictosquestions'),(62,'Can change pictos questions',16,'change_pictosquestions'),(63,'Can delete pictos questions',16,'delete_pictosquestions'),(64,'Can view pictos questions',16,'view_pictosquestions'),(65,'Can add respuesta',17,'add_respuesta'),(66,'Can change respuesta',17,'change_respuesta'),(67,'Can delete respuesta',17,'delete_respuesta'),(68,'Can view respuesta',17,'view_respuesta');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_usuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('57dceb585ca83e7e8acaec6bfaeb5e65931af229','2020-05-22 08:54:34.913853',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_grupo_edad`
--

DROP TABLE IF EXISTS `cuestionarios_grupo_edad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_grupo_edad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupoedad` varchar(30) NOT NULL,
  `franjaedad` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_grupo_edad`
--

LOCK TABLES `cuestionarios_grupo_edad` WRITE;
/*!40000 ALTER TABLE `cuestionarios_grupo_edad` DISABLE KEYS */;
INSERT INTO `cuestionarios_grupo_edad` VALUES (1,'Educación Primaria (6-8)','6-8'),(2,'Educación Primaria (9-11)','9-11'),(3,'Educación Secundaria (12-14)','12-14'),(4,'Bachillerato - FP (15-18)','15-18');
/*!40000 ALTER TABLE `cuestionarios_grupo_edad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_pictos`
--

DROP TABLE IF EXISTS `cuestionarios_pictos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_pictos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` longtext NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_pictos`
--

LOCK TABLES `cuestionarios_pictos` WRITE;
/*!40000 ALTER TABLE `cuestionarios_pictos` DISABLE KEYS */;
INSERT INTO `cuestionarios_pictos` VALUES (1,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzMzMDY0LnBuZw==','recreo'),(2,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzM0MTgucG5n','interrogacion'),(3,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzcwNjIucG5n','compaero'),(4,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzIxOTE3LnBuZw==','gustar'),(5,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzIyMDA1LnBuZw==','no gustar'),(6,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzY1MzcucG5n','jugar'),(7,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzk4MTQucG5n','aula'),(8,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzI2MzY4LnBuZw==','rechazar'),(9,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzg2NjIucG5n','pensar'),(10,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzI0NzYzLnBuZw==','por que'),(11,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzU1MjYucG5n','no'),(12,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzExMjg3LnBuZw==','invitar'),(13,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzY2MjUucG5n','tu'),(14,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzY5MDIucG5n','antipatico'),(15,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzEzMzU4LnBuZw==','quienes'),(16,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzExMTYzLnBuZw==','adivina'),(17,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzEwMjc2LnBuZw==','quien'),(18,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzU1MDgucG5n','mas'),(19,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzQ1NzAucG5n','ayudar'),(20,'http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzI4NDU5LnBuZw==','molestar');
/*!40000 ALTER TABLE `cuestionarios_pictos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_pictosquestions`
--

DROP TABLE IF EXISTS `cuestionarios_pictosquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_pictosquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `picto_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_pictos_picto_id_c9be9c15_fk_cuestiona` (`picto_id`),
  KEY `cuestionarios_pictos_question_id_a16e8851_fk_cuestiona` (`question_id`),
  CONSTRAINT `cuestionarios_pictos_picto_id_c9be9c15_fk_cuestiona` FOREIGN KEY (`picto_id`) REFERENCES `cuestionarios_pictos` (`id`),
  CONSTRAINT `cuestionarios_pictos_question_id_a16e8851_fk_cuestiona` FOREIGN KEY (`question_id`) REFERENCES `cuestionarios_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_pictosquestions`
--

LOCK TABLES `cuestionarios_pictosquestions` WRITE;
/*!40000 ALTER TABLE `cuestionarios_pictosquestions` DISABLE KEYS */;
INSERT INTO `cuestionarios_pictosquestions` VALUES (1,1,2,4),(2,2,4,4),(3,3,3,4),(4,4,7,4),(5,1,2,33),(6,2,11,33),(7,3,5,33),(8,4,3,33),(9,5,7,33),(10,1,2,57),(11,2,15,57),(12,3,9,57),(13,4,13,57),(14,5,6,57),(15,1,2,84),(16,2,15,84),(17,3,9,84),(18,4,8,84),(19,5,6,84),(20,1,16,112),(21,2,17,112),(22,3,18,112),(23,4,19,112),(24,5,3,112),(25,1,16,131),(26,2,17,131),(27,3,18,131),(28,4,20,131),(29,5,3,131);
/*!40000 ALTER TABLE `cuestionarios_pictosquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_pregunta`
--

DROP TABLE IF EXISTS `cuestionarios_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` longtext NOT NULL,
  `grupo_edad_id` int(11) NOT NULL,
  `tipo_estructura_id` int(11) NOT NULL,
  `tipo_pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_pregun_tipo_estructura_id_1c6e1f4e_fk_cuestiona` (`tipo_estructura_id`),
  KEY `cuestionarios_pregun_tipo_pregunta_id_4b8af090_fk_cuestiona` (`tipo_pregunta_id`),
  KEY `cuestionarios_pregun_grupo_edad_id_b56b0062_fk_cuestiona` (`grupo_edad_id`),
  CONSTRAINT `cuestionarios_pregun_grupo_edad_id_b56b0062_fk_cuestiona` FOREIGN KEY (`grupo_edad_id`) REFERENCES `cuestionarios_grupo_edad` (`id`),
  CONSTRAINT `cuestionarios_pregun_tipo_estructura_id_1c6e1f4e_fk_cuestiona` FOREIGN KEY (`tipo_estructura_id`) REFERENCES `cuestionarios_tipo_estructura` (`id`),
  CONSTRAINT `cuestionarios_pregun_tipo_pregunta_id_4b8af090_fk_cuestiona` FOREIGN KEY (`tipo_pregunta_id`) REFERENCES `cuestionarios_tipo_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_pregunta`
--

LOCK TABLES `cuestionarios_pregunta` WRITE;
/*!40000 ALTER TABLE `cuestionarios_pregunta` DISABLE KEYS */;
INSERT INTO `cuestionarios_pregunta` VALUES (1,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',1,1,1),(2,'¿Con qué personas prefieres jugar en el recreo?',1,1,1),(3,'¿Qué personas de tu clase echarías de menos si no estuviesen?',1,1,1),(4,'¿Con qué compañeros o compañeras te gustaría sentarte en el aula?',1,1,1),(5,'¿Quiénes son tus mejores amigos?',1,2,1),(6,'¿Qué compañeros o compañeras te parecen más simpáticos?',1,2,1),(7,'¿A qué personas de la clase invitarías a tu cumpleaños?',1,2,1),(8,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',2,1,1),(9,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',2,1,1),(10,'¿Con qué compañeros o compañeras te gustaría sentarte en el aula?',2,1,1),(11,'¿Con qué personas prefieres estar juntos en el recreo?',2,1,1),(12,'¿A qué compañeros o compañeras escogerías para formar un equipo de baloncesto en educación física?',2,1,1),(13,'¿Quiénes son tus mejores amigos y amigas?',2,2,1),(14,'¿A qué personas de la clase invitarías a tu cumpleaños?',2,2,1),(15,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos y amigas de clase, ¿a qué personas de la clase invitarías?',2,2,1),(16,'¿Con qué personas de la clase irías al cine el próximo viernes?',2,2,1),(17,'¿Quiénes son los compañeros o compañeras de tu clase con los que te gustaría seguir el curso que viene?',3,1,1),(18,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',3,1,1),(19,'¿A qué compañeros o compañeras elegirías para hacer un trabajo en grupo?',3,1,1),(20,'Si tuvieses que escoger un grupo de compañeros y compañeras para hacer una obra de teatro, ¿a quiénes escogerías?',3,1,1),(21,'¿A qué compañeros o compañeras escogerías para formar un equipo de baloncesto en educación física?',3,1,1),(22,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos y amigas de clase, ¿a quiénes invitarías?',3,2,1),(23,'¿Con quién irías al cine el próximo viernes?',3,2,1),(24,'¿A qué compañeros o compañeras pedirías consejo ante un problema personal?',3,2,1),(25,'¿Con qué personas de la clase prefieres trabajar o elegirías para hacer un trabajo de clase?',4,1,1),(26,'¿Con qué compañeros o compañeras te gustaría quedar para estudiar?',4,1,1),(27,'¿A qué compañeros o compañeras elegirías para hacer un trabajo en grupo?',4,1,1),(28,'¿A qué compañeros o compañeras seguirías en istagram o twitter?',4,2,1),(29,'¿A qué compañeros o compañeras mandarías una solicitud de amistad por facebook?',4,2,1),(30,'¿A qué compañeros o compañeras pedirías consejo ante problemas personales?',4,2,1),(31,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',1,1,2),(32,'¿Con qué personas prefieres NO jugar en el recreo? ¿Por qué?',1,1,2),(33,'¿Con qué compañeros o compañeras NO te gustaría sentarte en el aula? ¿Por qué?',1,1,2),(34,'¿Qué compañeros o compañeras NO te parecen simpáticos? ¿Por qué?',1,2,2),(35,'¿A qué personas de la clase NO invitarías a tu cumpleaños? ¿Por qué?',1,2,2),(36,'¿Con qué compañeros o compañeras prefieres NO encontrarte en un cumpleaños? ¿Por qué?',1,2,2),(37,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',2,1,2),(38,'¿A qué personas NO elegirías para hacer un trabajo de clase? ¿Por qué?',2,1,2),(39,'¿Con qué compañeros o compañeras NO te gustaría sentarte en el aula? ¿Por qué?',2,1,2),(40,'¿Con qué personas prefieres NO estar en el recreo? ¿Por qué?',2,1,2),(41,'¿Qué compañeros o compañeras NO te parecen simpáticos? ¿Por qué?',2,2,2),(42,'¿A qué personas de la clase NO invitarías a tu cumpleaños? ¿Por qué?',2,2,2),(43,'Si pudieras invitar a una fiesta, una excursión, un partido a algunos amigos de clase, ¿a qué personas de la clase NO invitarías? ¿Por qué?',2,2,2),(44,'¿Quiénes son los compañeros o compañeras de tu clase con los que NO te gustaría seguir el curso que viene? ¿Por qué?',3,1,2),(45,'¿A qué personas NO elegirías para hacer un trabajo de clase? ¿Por qué?',3,1,2),(46,'¿A qué compañeros o compañeras NO elegirías para hacer un trabajo en grupo? ¿Por qué?',3,1,2),(47,'Si tuvieses que escoger un grupo de compañeros para hacer una obra de teatro, ¿a quiénes NO escogerías? ¿Por qué?',3,1,2),(48,'¿A qué compañero o compañera NO llamarías para quedar una tarde? ¿Por qué?',3,2,2),(49,'¿A qué compañeros o compañeras NO pedirías consejo ante un problema personal? ¿Por qué?',3,2,2),(50,'¿Con qué personas de la clase NO te gusta trabajar o NO elegirías para hacer un trabajo de clase? ¿Por qué?',4,1,2),(51,'¿Con qué compañeros o compañeras NO te gustaría quedar para estudiar? ¿Por qué?',4,1,2),(52,'¿A qué compañeros o compañeras NO elegirías para hacer un trabajo en grupo? ¿Por qué?',4,1,2),(53,'¿A qué compañeros o compañeras NO seguirías en istagram o twitter? ¿Por qué?',4,2,2),(54,'¿A qué compañeros o compañeras NO mandarías una solicitud de amistad en facebook? ¿Por qué?',4,2,2),(55,'¿A qué compañeros o compañeras NO pedirías consejo ante un problema personal? ¿Por qué?',4,2,2),(56,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',1,1,3),(57,'¿Qué niños o niñas crees que te escogerían para jugar en el recreo?',1,1,3),(58,'¿Qué personas de tu clase crees que te echarían de menos si cambiases de colegio?',1,1,3),(59,'¿Qué compañeros o compañeras crees que quieren sentarse en el aula contigo?',1,1,3),(60,'¿Quién o quiénes crees que te escogen como mejor amigo o mejor amiga?',1,2,3),(61,'¿A qué personas de la clase crees que les pareces simpático?',1,2,3),(62,'¿Quién o quiénes crees que te van a invitar a su cumpleaños?',1,2,3),(63,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',2,1,3),(64,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',2,1,3),(65,'¿Qué compañeros o compañeras crees que quieren sentarse en el aula contigo?',2,1,3),(66,'¿Qué niños o niñas crees que te escogerían para estar juntos en el recreo?',2,1,3),(67,'¿Quién o quiénes crees que te escogen como mejor amigo o mejor amiga?',2,2,3),(68,'¿Quién o quiénes crees que te van a invitar a su cumpleaños?',2,2,3),(69,'¿Qué personas de tu clase crees que te invitarían a una fiesta, una excursión, o un partido?',2,2,3),(70,'¿A qué personas de tu clase crees que les gustaría ir al cine contigo?',2,2,3),(71,'Adivina los compañeros o compañeras que habrán puesto que les gustaría seguir el curso que viene contigo.',3,1,3),(72,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',3,1,3),(73,'¿Qué compañeros o compañeras crees que te escogerían para hacer una obra de teatro con ellos?',3,1,3),(74,'¿Qué personas de tu clase crees que te invitarían a una fiesta, a una excursión, o a un partido?',3,2,3),(75,'¿A qué personas de tu clase crees que les gustaría ir al cine el próximo viernes contigo?',3,2,3),(76,'¿Qué compañeros o compañeras crees que te pedirían consejo ante un problema personal?',3,2,3),(77,'¿Quién o quiénes crees que te han elegido para hacer un trabajo de aula?',4,1,3),(78,'¿A qué personas de tu clase crees que les gustaría quedar a estudiar contigo?',4,1,3),(79,'¿Quién o quiénes crees que te han elegido para formar un grupo de trabajo?',4,1,3),(80,'¿Qué compañeros o compañeras crees que te seguirían en istagram o twitter?',4,2,3),(81,'¿Qué compañeros o compañeras crees que te mandarían una solicitud de amistad por facebook?',4,2,3),(82,'¿Qué compañeros o compañeras crees que te pedirían consejo ante un problema personal?',4,2,3),(83,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo. ¿Por qué?',1,1,4),(84,'¿Qué niños o niñas crees que NO te escogerían para jugar en el recreo? ¿Por qué?',1,1,4),(85,'¿Qué personas de tu clase crees que NO te echarían de menos si cambiases de colegio?  ¿Por qué?',1,1,4),(86,'¿Qué compañeros o compañeras crees que NO quieren sentarse en el aula contigo?  ¿Por qué?',1,1,4),(87,'¿Quién o quiénes crees que NO te escogen como amigo o amiga?  ¿Por qué?',1,2,4),(88,'¿A qué personas de la clase crees que NO les pareces simpático o simpática?  ¿Por qué?',1,2,4),(89,'¿Quién o quiénes crees que NO te van a invitar a su cumpleaños?  ¿Por qué?',1,2,4),(90,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo.  ¿Por qué?',2,1,4),(91,'¿Quién o quiénes crees que NO te han elegido para hacer un trabajo de aula? ¿Por qué?',2,1,4),(92,'¿Qué compañeros o compañeras crees que NO quieren sentarse en el aula contigo?  ¿Por qué?',2,1,4),(93,'¿Qué niños o niñas crees que NO te escogerían para estar juntos en el recreo?  ¿Por qué?',2,1,4),(94,'¿Quién o quiénes crees que NO te escogen como amigo o amiga?  ¿Por qué?',2,2,4),(95,'¿Quién o quiénes crees que NO te van a invitar a su cumpleaños?  ¿Por qué?',2,2,4),(96,'¿Qué personas de tu clase crees que NO te invitarían a una fiesta, una excursión, o un partido?  ¿Por qué?',2,2,4),(97,'¿Qué personas de tu clase crees que NO les gustaría ir al cine contigo?  ¿Por qué?',2,2,4),(98,'Adivina los compañeros o compañeras que habrán puesto que NO les gustaría seguir el curso que viene contigo.  ¿Por qué crees esto?',3,1,4),(99,'¿Quién o quiénes crees que NO te han elegido como compañero o compañera de trabajo?  ¿Por qué?',3,1,4),(100,'¿Qué compañeros o compañeras crees que NO te escogerían para hacer una obra de teatro con ellos?  ¿Por qué?',3,1,4),(101,'¿Qué personas de tu clase crees que NO te invitarían a una fiesta, una excursión, o un partido?  ¿Por qué?',3,2,4),(102,'¿A qué personas de tu clase crees que NO les gustaría ir al cine contigo?  ¿Por qué?',3,2,4),(103,'¿Qué compañeros o compañeras crees que NO te pedirían consejo ante un problema personal?  ¿Por qué?',3,2,4),(104,'¿Quién o quiénes crees que NO te han elegido como compañero o compañera de trabajo?  ¿Por qué?',4,1,4),(105,'¿A qué personas de tu clase crees que NO les gustaría quedar para estudiar contigo?  ¿Por qué?',4,1,4),(106,'¿Quién o quiénes crees que NO te han elegido para formar un grupo de trabajo?  ¿Por qué?',4,1,4),(107,'¿Qué compañeros o compañeras crees que NO te seguirían en instagram o twitter?  ¿Por qué?',4,2,4),(108,'¿Qué compañeros o compañeras crees que NO te mandarían una solicitud de amistad por facebook?  ¿Por qué?',4,2,4),(109,'¿Qué compañeros o compañeras crees que NO te pedirían consejo ante un problema personal?  ¿Por qué?',4,2,4),(110,'Adivina quién es el compañero o compañera más listo o lista de la clase.',1,1,5),(111,'Adivina quién es el niño o la niña al que más quiere la profesora o profesor.',1,1,5),(112,'Adivina quién ayuda más a sus compañeros y compañeras.',1,1,5),(113,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',1,2,5),(114,'Adivina quién es el compañero o compañera más feliz.',1,2,5),(115,'Dime aquel compañero o compañera que es elegido como líder, como niño o niña más popular de la clase.',2,1,5),(116,'Adivina qué compañero o compañera es más inteligente.',2,1,5),(117,'Adivina quién es el compañero o compañera que tiene capacidad para atender y escuchar a los demás.',2,2,5),(118,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',2,2,5),(119,'Adivina quién tiene capacidad para resolver conflictos entre los compañeros y compañeras.',2,2,5),(120,'Dime aquel compañero o compañera que es muy agradable, cordial y realmente bueno o buena para trabajar en equipo.',3,1,5),(121,'Adivina quién es el compañero o compañera que tiene capacidad para resolver conflictos entre los compañeros y compañeras.',3,1,5),(122,'Adivina quién es el compañero o compañera que tiene capacidad para atender y escuchar a los demás.',3,2,5),(123,'Adivina quién es el compañero o compañera que tiene más amigos y amigas.',3,2,5),(124,'Dime aquel compañero o compañera que es muy agradable, cordial y realmente bueno o buena para trabajar en equipo. Coopera, ayuda, comparte y respeta los turnos.',4,1,5),(125,'Adivina quién es el compañero o compañera que tiene capacidad para resolver conflictos entre los compañeros y compañeras.',4,1,5),(126,'Dime aquel compañero o compañera que crees que tiene más seguidores en twitter o instagram.',4,2,5),(127,'Dime aquel compañero o compañera que crees que tiene más amigos en facebook.',4,2,5),(128,'Adivina quién es el compañero o compañera que sabe comunicarse mejor y que le entienden y escuchen con más facilidad.',4,2,5),(129,'Adivina quién es el o la que menos sabe en clase.',1,1,6),(130,'Adivina quién es el niño o la niña al que menos quiere la profesora o el profesor.',1,1,6),(131,'Adivina quién molesta más a sus compañeros y compañeras.',1,1,6),(132,'Adivina quién es el compañero o compañera que tiene menos amigos y amigas.',1,2,6),(133,'Adivina quién es el compañero o compañera más triste.',1,2,6),(134,'Dime aquel compañero o compañera que molesta más a los demás.',2,1,6),(135,'Dime aquel compañero o compañera que no comparte ni respeta a los demás.',2,1,6),(137,'Dime aquel compañero o compañera que se mete con los demás.',2,2,6),(138,'Dime aquel compañero o compañera que cuando llega a los grupos molesta, no comparte ni respeta, e intenta que todos hagan las cosas a su manera.',3,1,6),(139,'Dime aquel compañero o compañera que siempre pide ayuda para hacer cualquier cosa, incluso antes de haberlo intentado.',3,1,6),(140,'Dime aquel compañero o compañera que es muy tímido o tímida con los demás, siempre juega o trabaja solo o sola y es más difícil llegar a conocer.',3,2,6),(141,'Dime aquel compañero o compañera que empieza las peleas, se mete con los demás, les empuja o les pega.',3,2,6),(142,'Dime aquel compañero o compañera que cuando llega a los grupos molesta, no comparte ni respeta, e intenta que todos hagan las cosas a su manera.',4,1,6),(143,'Dime aquel compañero o compañera que siempre pide ayuda para hacer cualquiera cosa, incluso antes de haberlo intentado.',4,1,6),(144,'Dime aquel compañero o compañera que crees que tiene menos seguidores en twitter o instagram.',4,2,6),(145,'Dime aquel compañero o compañera que crees que tiene menos amigos en facebook.',4,2,6),(146,'Adivina quién es el compañero o compañera que tiene problemas para comunicarse.',4,2,6),(147,'Dime quién es el compañero o compañera que trolea en las redes sociales para reírse de los demás.',4,2,6),(148,'Si pudieses invitar a una fiesta, una excursión, un partido a algunos amigos o amigas de clase, ¿a quién o quiénes NO invitarías? ¿Por qué?',3,2,4),(150,'Adivina quién es más maleducado o maleducada con los compañeros y compañeras.',2,2,6);
/*!40000 ALTER TABLE `cuestionarios_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_preguntas_test`
--

DROP TABLE IF EXISTS `cuestionarios_preguntas_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_preguntas_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_pregun_pregunta_id_15d31095_fk_cuestiona` (`pregunta_id`),
  KEY `cuestionarios_pregun_test_id_e7ce9d94_fk_cuestiona` (`test_id`),
  CONSTRAINT `cuestionarios_pregun_pregunta_id_15d31095_fk_cuestiona` FOREIGN KEY (`pregunta_id`) REFERENCES `cuestionarios_pregunta` (`id`),
  CONSTRAINT `cuestionarios_pregun_test_id_e7ce9d94_fk_cuestiona` FOREIGN KEY (`test_id`) REFERENCES `cuestionarios_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_preguntas_test`
--

LOCK TABLES `cuestionarios_preguntas_test` WRITE;
/*!40000 ALTER TABLE `cuestionarios_preguntas_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuestionarios_preguntas_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_test`
--

DROP TABLE IF EXISTS `cuestionarios_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(32) NOT NULL,
  `first_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuestionarios_test_first_id_d5fd2d35_fk_cuestionarios_test_id` (`first_id`),
  CONSTRAINT `cuestionarios_test_first_id_d5fd2d35_fk_cuestionarios_test_id` FOREIGN KEY (`first_id`) REFERENCES `cuestionarios_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_test`
--

LOCK TABLES `cuestionarios_test` WRITE;
/*!40000 ALTER TABLE `cuestionarios_test` DISABLE KEYS */;
INSERT INTO `cuestionarios_test` VALUES (1,'Inicial',NULL);
/*!40000 ALTER TABLE `cuestionarios_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_tipo_estructura`
--

DROP TABLE IF EXISTS `cuestionarios_tipo_estructura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_tipo_estructura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(3) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_tipo_estructura`
--

LOCK TABLES `cuestionarios_tipo_estructura` WRITE;
/*!40000 ALTER TABLE `cuestionarios_tipo_estructura` DISABLE KEYS */;
INSERT INTO `cuestionarios_tipo_estructura` VALUES (1,'F','Formal'),(2,'I','Informal');
/*!40000 ALTER TABLE `cuestionarios_tipo_estructura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarios_tipo_pregunta`
--

DROP TABLE IF EXISTS `cuestionarios_tipo_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionarios_tipo_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(3) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarios_tipo_pregunta`
--

LOCK TABLES `cuestionarios_tipo_pregunta` WRITE;
/*!40000 ALTER TABLE `cuestionarios_tipo_pregunta` DISABLE KEYS */;
INSERT INTO `cuestionarios_tipo_pregunta` VALUES (1,'PGP','Percepción del grupo positiva'),(2,'PGN','Percepción del grupo negativa'),(3,'PPP','Percepción propia positiva'),(4,'PPN','Percepción propia negativa'),(5,'AAP','Asociación de atributos positiva'),(6,'AAN','Asociación de atributos negativa');
/*!40000 ALTER TABLE `cuestionarios_tipo_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_usuarios_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(4,'contenttypes','contenttype'),(9,'cuestionarios','grupo_edad'),(10,'cuestionarios','pictos'),(16,'cuestionarios','pictosquestions'),(11,'cuestionarios','pregunta'),(15,'cuestionarios','preguntas_test'),(14,'cuestionarios','test'),(12,'cuestionarios','tipo_estructura'),(13,'cuestionarios','tipo_pregunta'),(17,'resultados','respuesta'),(5,'sessions','session'),(7,'usuarios','user'),(8,'usuarios','user_test');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'cuestionarios','0001_initial','2020-05-22 08:50:10.813797'),(2,'contenttypes','0001_initial','2020-05-22 08:50:11.111623'),(3,'contenttypes','0002_remove_content_type_name','2020-05-22 08:50:11.179874'),(4,'auth','0001_initial','2020-05-22 08:50:11.240319'),(5,'auth','0002_alter_permission_name_max_length','2020-05-22 08:50:11.388845'),(6,'auth','0003_alter_user_email_max_length','2020-05-22 08:50:11.394839'),(7,'auth','0004_alter_user_username_opts','2020-05-22 08:50:11.401277'),(8,'auth','0005_alter_user_last_login_null','2020-05-22 08:50:11.407657'),(9,'auth','0006_require_contenttypes_0002','2020-05-22 08:50:11.410963'),(10,'auth','0007_alter_validators_add_error_messages','2020-05-22 08:50:11.416708'),(11,'auth','0008_alter_user_username_max_length','2020-05-22 08:50:11.422563'),(12,'auth','0009_alter_user_last_name_max_length','2020-05-22 08:50:11.428542'),(13,'auth','0010_alter_group_name_max_length','2020-05-22 08:50:11.440555'),(14,'auth','0011_update_proxy_permissions','2020-05-22 08:50:11.449784'),(15,'usuarios','0001_initial','2020-05-22 08:50:11.551926'),(16,'admin','0001_initial','2020-05-22 08:50:11.864871'),(17,'admin','0002_logentry_remove_auto_add','2020-05-22 08:50:11.958442'),(18,'admin','0003_logentry_add_action_flag_choices','2020-05-22 08:50:11.968104'),(19,'authtoken','0001_initial','2020-05-22 08:50:11.996539'),(20,'authtoken','0002_auto_20160226_1747','2020-05-22 08:50:12.108712'),(21,'resultados','0001_initial','2020-05-22 08:50:12.139516'),(22,'sessions','0001_initial','2020-05-22 08:50:12.250993');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados_respuesta`
--

DROP TABLE IF EXISTS `resultados_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` json NOT NULL,
  `alumno_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resultados_respuesta_alumno_id_99cb40d0_fk_usuarios_user_id` (`alumno_id`),
  KEY `resultados_respuesta_pregunta_id_5bc01c02_fk_cuestiona` (`pregunta_id`),
  CONSTRAINT `resultados_respuesta_alumno_id_99cb40d0_fk_usuarios_user_id` FOREIGN KEY (`alumno_id`) REFERENCES `usuarios_user` (`id`),
  CONSTRAINT `resultados_respuesta_pregunta_id_5bc01c02_fk_cuestiona` FOREIGN KEY (`pregunta_id`) REFERENCES `cuestionarios_preguntas_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados_respuesta`
--

LOCK TABLES `resultados_respuesta` WRITE;
/*!40000 ALTER TABLE `resultados_respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultados_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_user`
--

DROP TABLE IF EXISTS `usuarios_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `email_colegio` varchar(254) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `colegio` varchar(100) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `validado` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_user`
--

LOCK TABLES `usuarios_user` WRITE;
/*!40000 ALTER TABLE `usuarios_user` DISABLE KEYS */;
INSERT INTO `usuarios_user` VALUES (1,'pbkdf2_sha256$36000$A0rEvoM4BkSd$DAelfd5bs4TVYHXp8x2rbm6mIUsFDuUmkZ2fc9uokeU=','0000-00-00 00:00:00.000000',1,'participa@atopa.es','participa@atopa.es','admin','admin','admin','2020-03-01 11:59:12.978349','admin','11111111A','admin',1,0,1),(2,'pbkdf2_sha256$180000$7RLgGg7gfHur$SDpD+tYXmTtHIJXTX0X8UJ+W6rLnmswxHy2lDCO71WA=',NULL,0,'andrea.ct.750@gmail.com','andrea.ct.750@gmail.com','andrea','Andrea','Carballo','2020-05-22 08:53:04.880915','','19789456K','Uvigo',1,1,1),(6,'pbkdf2_sha256$180000$LFa9NCPDNdge$mFZJ0ezQqXlp4xj+s2tHo3XdIrhDVERTlYBS4nbbrKI=',NULL,0,'','','None-1','á','á','2020-05-22 08:56:16.154293','','',NULL,0,0,1),(7,'pbkdf2_sha256$180000$vVlSpYOdMdOQ$ox/4TY0Q6VG688zfVTeNAL0bFVqC7julkcwFVeyhMTM=',NULL,0,'','','None-2','b','b','2020-05-22 08:56:16.252384','','',NULL,0,0,1),(8,'pbkdf2_sha256$180000$KxhZexF3SBZ0$XXm8Pb6+uY55XJGmVVt3YqTGE5x6ixEnrLbDo8t99R8=',NULL,0,'','','None-3','c','c','2020-05-22 08:56:16.354235','','',NULL,0,0,1);
/*!40000 ALTER TABLE `usuarios_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_user_groups`
--

DROP TABLE IF EXISTS `usuarios_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_user_groups_user_id_group_id_7ca6624e_uniq` (`user_id`,`group_id`),
  KEY `usuarios_user_groups_group_id_ce48ebfd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuarios_user_groups_group_id_ce48ebfd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `usuarios_user_groups_user_id_327741ca_fk_usuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_user_groups`
--

LOCK TABLES `usuarios_user_groups` WRITE;
/*!40000 ALTER TABLE `usuarios_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_user_test`
--

DROP TABLE IF EXISTS `usuarios_user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_user_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_user_test_user_id_test_id_799e73d2_uniq` (`user_id`,`test_id`),
  KEY `usuarios_user_test_test_id_d24fefc4_fk_cuestionarios_test_id` (`test_id`),
  CONSTRAINT `usuarios_user_test_test_id_d24fefc4_fk_cuestionarios_test_id` FOREIGN KEY (`test_id`) REFERENCES `cuestionarios_test` (`id`),
  CONSTRAINT `usuarios_user_test_user_id_5b1bb2da_fk_usuarios_user_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_user_test`
--

LOCK TABLES `usuarios_user_test` WRITE;
/*!40000 ALTER TABLE `usuarios_user_test` DISABLE KEYS */;
INSERT INTO `usuarios_user_test` VALUES (1,1,2);
/*!40000 ALTER TABLE `usuarios_user_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_user_user_permissions`
--

DROP TABLE IF EXISTS `usuarios_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_user_user_permi_user_id_permission_id_801d2da9_uniq` (`user_id`,`permission_id`),
  KEY `usuarios_user_user_p_permission_id_32dd035e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuarios_user_user_p_permission_id_32dd035e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuarios_user_user_p_user_id_6770e840_fk_usuarios_` FOREIGN KEY (`user_id`) REFERENCES `usuarios_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_user_user_permissions`
--

LOCK TABLES `usuarios_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuarios_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22 10:16:01
