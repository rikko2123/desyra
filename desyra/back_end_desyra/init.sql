-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: desyra_db
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add chart',8,'add_chart'),(30,'Can change chart',8,'change_chart'),(31,'Can delete chart',8,'delete_chart'),(32,'Can view chart',8,'view_chart'),(33,'Can add shipping',9,'add_shipping'),(34,'Can change shipping',9,'change_shipping'),(35,'Can delete shipping',9,'delete_shipping'),(36,'Can view shipping',9,'view_shipping'),(37,'Can add shipping_address',10,'add_shipping_address'),(38,'Can change shipping_address',10,'change_shipping_address'),(39,'Can delete shipping_address',10,'delete_shipping_address'),(40,'Can view shipping_address',10,'view_shipping_address'),(41,'Can add wishlist',11,'add_wishlist'),(42,'Can change wishlist',11,'change_wishlist'),(43,'Can delete wishlist',11,'delete_wishlist'),(44,'Can view wishlist',11,'view_wishlist'),(45,'Can add users',12,'add_users'),(46,'Can change users',12,'change_users'),(47,'Can delete users',12,'delete_users'),(48,'Can view users',12,'view_users'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add products',15,'add_products'),(58,'Can change products',15,'change_products'),(59,'Can delete products',15,'delete_products'),(60,'Can view products',15,'view_products'),(61,'Can add order item',16,'add_orderitem'),(62,'Can change order item',16,'change_orderitem'),(63,'Can delete order item',16,'delete_orderitem'),(64,'Can view order item',16,'view_orderitem'),(65,'Can add img_prod',17,'add_img_prod'),(66,'Can change img_prod',17,'change_img_prod'),(67,'Can delete img_prod',17,'delete_img_prod'),(68,'Can view img_prod',17,'view_img_prod'),(69,'Can add variants',18,'add_variants'),(70,'Can change variants',18,'change_variants'),(71,'Can delete variants',18,'delete_variants'),(72,'Can view variants',18,'view_variants'),(73,'Can add chart_ products',19,'add_chart_products'),(74,'Can change chart_ products',19,'change_chart_products'),(75,'Can delete chart_ products',19,'delete_chart_products'),(76,'Can view chart_ products',19,'view_chart_products'),(77,'Can add category_ products',20,'add_category_products'),(78,'Can change category_ products',20,'change_category_products'),(79,'Can delete category_ products',20,'delete_category_products'),(80,'Can view category_ products',20,'view_category_products'),(81,'Can add wishlist_ products',21,'add_wishlist_products'),(82,'Can change wishlist_ products',21,'change_wishlist_products'),(83,'Can delete wishlist_ products',21,'delete_wishlist_products'),(84,'Can view wishlist_ products',21,'view_wishlist_products');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$HmKWr9tJymnbHzIGOGkkO5$FHZzWu537i0ZYzNU7vl0m16XEU+o6hCiDHm1cf38d/8=','2025-06-30 11:10:43.753667',1,'rikko','','','bigiriccardo2001@gmail.com',1,1,'2025-06-30 11:10:29.413536');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_brand`
--

DROP TABLE IF EXISTS `core_desyra_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_brand` (
  `id_brand` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `logo_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_site` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_brand`
--

LOCK TABLES `core_desyra_brand` WRITE;
/*!40000 ALTER TABLE `core_desyra_brand` DISABLE KEYS */;
INSERT INTO `core_desyra_brand` VALUES (1,'Nike','lel','ESERCIZIO_SALVO_DISIGN_PENNA.webp','https://www.nike.com/it/?cp=10371701324_search_&Macro=-nike-g-10574001737-104726557175-e-c-IT-pure-4',1),(2,'desy','faccio gioielli perche non ho nulla da fare',NULL,'',1),(3,'er rikko','orologi per real man ',NULL,'',1);
/*!40000 ALTER TABLE `core_desyra_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_category`
--

DROP TABLE IF EXISTS `core_desyra_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  KEY `core_desyra_category_parent_id_9412a842_fk_core_desy` (`parent_id`),
  CONSTRAINT `core_desyra_category_parent_id_9412a842_fk_core_desy` FOREIGN KEY (`parent_id`) REFERENCES `core_desyra_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_category`
--

LOCK TABLES `core_desyra_category` WRITE;
/*!40000 ALTER TABLE `core_desyra_category` DISABLE KEYS */;
INSERT INTO `core_desyra_category` VALUES (1,'jewellery','Gioielli unici, pensati per raccontare la tua storia.','Scopri l’essenza della bellezza in ogni dettaglio. I gioielli Desyra nascono dall’incontro tra eleganza senza tempo e design moderno. Ogni creazione è pensata per valorizzare l’identità di chi la indossa, raccontando storie di luce, forma e significato. Realizzati con materiali pregiati e una cura artigianale in ogni fase, i nostri gioielli sono più di un accessorio: sono simboli di stile, emozione e autenticità.',NULL),(2,'ring','Anelli che parlano di te. Minimal, eleganti o audaci: ogni anello Desyra è pensato per celebrare la tua unicità, con linee raffinate e dettagli senza tempo.','Perfetto di stile, emozione e significato. Gli anelli Desyra sono pensati per raccontare chi sei, in ogni gesto. Realizzati con materiali pregiati e una cura artigianale minuziosa, combinano design moderno e sensibilità classica, dando vita a gioielli versatili, sofisticati e ricchi di personalità.',1),(3,'Watches','Orologi di prima qualita','Orologi di prima qualita',NULL),(4,'Uomo','per lui','per lui',3),(5,'Donna','per lei','per lei',3),(6,'Clothes','vestiti','vestiti',NULL),(7,'Sneekers','Sneekers','Sneekers',NULL);
/*!40000 ALTER TABLE `core_desyra_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_category_products`
--

DROP TABLE IF EXISTS `core_desyra_category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_category_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_desyra_category_pro_id_category_id_product_5bdb12fb_uniq` (`id_category`,`id_product`),
  KEY `core_desyra_category_id_product_e36fb2a6_fk_core_desy` (`id_product`),
  CONSTRAINT `core_desyra_category_id_category_c0ef80cb_fk_core_desy` FOREIGN KEY (`id_category`) REFERENCES `core_desyra_category` (`id_category`),
  CONSTRAINT `core_desyra_category_id_product_e36fb2a6_fk_core_desy` FOREIGN KEY (`id_product`) REFERENCES `core_desyra_products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_category_products`
--

LOCK TABLES `core_desyra_category_products` WRITE;
/*!40000 ALTER TABLE `core_desyra_category_products` DISABLE KEYS */;
INSERT INTO `core_desyra_category_products` VALUES (1,2,5);
/*!40000 ALTER TABLE `core_desyra_category_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_chart`
--

DROP TABLE IF EXISTS `core_desyra_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_chart` (
  `id_chart` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id_chart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_chart`
--

LOCK TABLES `core_desyra_chart` WRITE;
/*!40000 ALTER TABLE `core_desyra_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_chart_products`
--

DROP TABLE IF EXISTS `core_desyra_chart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_chart_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantitaty` int NOT NULL,
  `price_snapshot` decimal(4,2) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `id_chart` int NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_desyra_chart_products_id_chart_id_product_e0dc8829_uniq` (`id_chart`,`id_product`),
  KEY `core_desyra_chart_pr_id_product_db97b4e8_fk_core_desy` (`id_product`),
  CONSTRAINT `core_desyra_chart_pr_id_chart_d50d81d1_fk_core_desy` FOREIGN KEY (`id_chart`) REFERENCES `core_desyra_chart` (`id_chart`),
  CONSTRAINT `core_desyra_chart_pr_id_product_db97b4e8_fk_core_desy` FOREIGN KEY (`id_product`) REFERENCES `core_desyra_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_chart_products`
--

LOCK TABLES `core_desyra_chart_products` WRITE;
/*!40000 ALTER TABLE `core_desyra_chart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_chart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_img_prod`
--

DROP TABLE IF EXISTS `core_desyra_img_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_img_prod` (
  `id_img` int NOT NULL AUTO_INCREMENT,
  `alt_text` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main_img` tinyint(1) NOT NULL,
  `created_ad` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `img_path` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  PRIMARY KEY (`id_img`),
  KEY `core_desyra_img_prod_id_category_faccd872_fk_core_desy` (`id_category`),
  KEY `core_desyra_img_prod_id_product_33931335_fk_core_desy` (`id_product`),
  CONSTRAINT `core_desyra_img_prod_id_category_faccd872_fk_core_desy` FOREIGN KEY (`id_category`) REFERENCES `core_desyra_category` (`id_category`),
  CONSTRAINT `core_desyra_img_prod_id_product_33931335_fk_core_desy` FOREIGN KEY (`id_product`) REFERENCES `core_desyra_products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_img_prod`
--

LOCK TABLES `core_desyra_img_prod` WRITE;
/*!40000 ALTER TABLE `core_desyra_img_prod` DISABLE KEYS */;
INSERT INTO `core_desyra_img_prod` VALUES (1,'ring',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/products-anello-in-oro-bianco-e-diamante-da-090-ct-1000x800_6kXnWe0.jpg',5,NULL),(2,'collana',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/collana-pandora-punto-luce-quadrato-blu_19454_zoom.jpg',3,NULL),(3,'lel',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/ORC53-scaled.jpg',6,NULL),(4,'collana',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/1000644239-1-scaled.jpg',3,NULL),(5,'lel',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/gioielli-art-nouveau.jpg',6,NULL),(6,'ee',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/verette-diamanti-i-will-i-do-crivelli-gioielli-gioielli-sposa.webp',4,NULL),(7,'aaa',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/veretta-oro-bianco-diamanti2.png',4,NULL),(8,'sss',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/punto-luce-ciondolo-in-oro-bianco-18k-con-diamante-035-ct-sg27599.webp',7,NULL),(9,'sasa',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/torretta-punto-luce-varie-misure.webp',7,NULL),(10,'rolex',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/nicolas-pinilla-1f8wFF4YSXc-unsplash.jpg',NULL,3),(11,'ddd',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/zoriana-stakhniv-PUVgHyBgZn8-unsplash.jpg',NULL,2),(12,'sss',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/gage-walker-QOOr1WZj62A-unsplash.jpg',NULL,6),(13,'ssss',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/krystal-ng-PrQqQVPzmlw-unsplash.jpg',NULL,1),(14,'ssss',0,NULL,NULL,'https://cdn-api.jetadmin.app/media/static_files/projects/new_app_577/jeff-tumale-SD9Jyl1xNQ4-unsplash.jpg',NULL,7);
/*!40000 ALTER TABLE `core_desyra_img_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_order`
--

DROP TABLE IF EXISTS `core_desyra_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `tax` decimal(6,2) NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_address` int NOT NULL,
  `id_shipping` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `id_shipping` (`id_shipping`),
  KEY `core_desyra_order_id_address_37f514e1_fk_core_desy` (`id_address`),
  KEY `core_desyra_order_id_user_6e47453c_fk_core_desyra_users_id_user` (`id_user`),
  CONSTRAINT `core_desyra_order_id_address_37f514e1_fk_core_desy` FOREIGN KEY (`id_address`) REFERENCES `core_desyra_shipping_address` (`id_address`),
  CONSTRAINT `core_desyra_order_id_shipping_6e4fbfb2_fk_core_desy` FOREIGN KEY (`id_shipping`) REFERENCES `core_desyra_shipping` (`id_shipping`),
  CONSTRAINT `core_desyra_order_id_user_6e47453c_fk_core_desyra_users_id_user` FOREIGN KEY (`id_user`) REFERENCES `core_desyra_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_order`
--

LOCK TABLES `core_desyra_order` WRITE;
/*!40000 ALTER TABLE `core_desyra_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_orderitem`
--

DROP TABLE IF EXISTS `core_desyra_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price_each` decimal(8,2) NOT NULL,
  `id_order` int NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_desyra_orderite_id_order_d7580193_fk_core_desy` (`id_order`),
  KEY `core_desyra_orderite_product_id_a9f6ab77_fk_core_desy` (`product_id`),
  CONSTRAINT `core_desyra_orderite_id_order_d7580193_fk_core_desy` FOREIGN KEY (`id_order`) REFERENCES `core_desyra_order` (`id_order`),
  CONSTRAINT `core_desyra_orderite_product_id_a9f6ab77_fk_core_desy` FOREIGN KEY (`product_id`) REFERENCES `core_desyra_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_orderitem`
--

LOCK TABLES `core_desyra_orderitem` WRITE;
/*!40000 ALTER TABLE `core_desyra_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_products`
--

DROP TABLE IF EXISTS `core_desyra_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL,
  `discount_price` decimal(4,2) DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_aviability` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `id_brand` int NOT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `code` (`code`),
  KEY `core_desyra_products_id_brand_feba9d80_fk_core_desy` (`id_brand`),
  CONSTRAINT `core_desyra_products_id_brand_feba9d80_fk_core_desy` FOREIGN KEY (`id_brand`) REFERENCES `core_desyra_brand` (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_products`
--

LOCK TABLES `core_desyra_products` WRITE;
/*!40000 ALTER TABLE `core_desyra_products` DISABLE KEYS */;
INSERT INTO `core_desyra_products` VALUES (1,'SHOES','deamn','sus',40.00,20.00,'12345678',10,1,0,'2025-06-30 12:24:26.479434','2025-06-30 12:24:26.479434',1),(3,'desy - collana perle','','',1000.00,NULL,'123456789',10,1,0,NULL,NULL,2),(4,'desy - anello dello zebby','','',15000.00,NULL,'159753',12,1,0,NULL,NULL,2),(5,'anello in quarzo','','',59.00,NULL,'123',1,1,0,NULL,NULL,2),(6,'orecchino in diamanti','','',150.00,NULL,'456',89,1,0,NULL,NULL,2),(7,'punto luce','','',99.00,NULL,'789456123',5,1,0,NULL,NULL,2);
/*!40000 ALTER TABLE `core_desyra_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_shipping`
--

DROP TABLE IF EXISTS `core_desyra_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_shipping` (
  `id_shipping` int NOT NULL AUTO_INCREMENT,
  `tracking_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_at` date NOT NULL,
  `delivered_at` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `shipping_cost` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_shipping`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_shipping`
--

LOCK TABLES `core_desyra_shipping` WRITE;
/*!40000 ALTER TABLE `core_desyra_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_shipping_address`
--

DROP TABLE IF EXISTS `core_desyra_shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_shipping_address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_shipping_address`
--

LOCK TABLES `core_desyra_shipping_address` WRITE;
/*!40000 ALTER TABLE `core_desyra_shipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_users`
--

DROP TABLE IF EXISTS `core_desyra_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_letter` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `sing_up_ip` char(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_chart` int DEFAULT NULL,
  `id_address` int DEFAULT NULL,
  `id_wishlist` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_wishlist` (`id_wishlist`),
  UNIQUE KEY `id_chart` (`id_chart`),
  KEY `core_desyra_users_id_address_39972c4f_fk_core_desy` (`id_address`),
  CONSTRAINT `core_desyra_users_id_address_39972c4f_fk_core_desy` FOREIGN KEY (`id_address`) REFERENCES `core_desyra_shipping_address` (`id_address`),
  CONSTRAINT `core_desyra_users_id_chart_6a521902_fk_core_desy` FOREIGN KEY (`id_chart`) REFERENCES `core_desyra_chart` (`id_chart`),
  CONSTRAINT `core_desyra_users_id_wishlist_00190f34_fk_core_desy` FOREIGN KEY (`id_wishlist`) REFERENCES `core_desyra_wishlist` (`id_wishlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_users`
--

LOCK TABLES `core_desyra_users` WRITE;
/*!40000 ALTER TABLE `core_desyra_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_variants`
--

DROP TABLE IF EXISTS `core_desyra_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_variants` (
  `id_variant` int NOT NULL AUTO_INCREMENT,
  `cod_variant` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `discount_price` decimal(4,2) NOT NULL,
  `stock_aviability` int NOT NULL,
  `created_ad` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id_variant`),
  UNIQUE KEY `cod_variant` (`cod_variant`),
  KEY `core_desyra_variants_id_product_a616a1b0_fk_core_desy` (`id_product`),
  CONSTRAINT `core_desyra_variants_id_product_a616a1b0_fk_core_desy` FOREIGN KEY (`id_product`) REFERENCES `core_desyra_products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_variants`
--

LOCK TABLES `core_desyra_variants` WRITE;
/*!40000 ALTER TABLE `core_desyra_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_wishlist`
--

DROP TABLE IF EXISTS `core_desyra_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_wishlist` (
  `id_wishlist` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id_wishlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_wishlist`
--

LOCK TABLES `core_desyra_wishlist` WRITE;
/*!40000 ALTER TABLE `core_desyra_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_desyra_wishlist_products`
--

DROP TABLE IF EXISTS `core_desyra_wishlist_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_desyra_wishlist_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantitaty` int NOT NULL,
  `price_snapshot` decimal(4,2) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `id_product` int NOT NULL,
  `id_wishlist` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_desyra_wishlist_pro_id_wishlist_id_product_9da21486_uniq` (`id_wishlist`,`id_product`),
  KEY `core_desyra_wishlist_id_product_2d7e6b78_fk_core_desy` (`id_product`),
  CONSTRAINT `core_desyra_wishlist_id_product_2d7e6b78_fk_core_desy` FOREIGN KEY (`id_product`) REFERENCES `core_desyra_products` (`id_product`),
  CONSTRAINT `core_desyra_wishlist_id_wishlist_319487d5_fk_core_desy` FOREIGN KEY (`id_wishlist`) REFERENCES `core_desyra_wishlist` (`id_wishlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_desyra_wishlist_products`
--

LOCK TABLES `core_desyra_wishlist_products` WRITE;
/*!40000 ALTER TABLE `core_desyra_wishlist_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_desyra_wishlist_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-06-30 12:23:24.607967','1','Nike',1,'[{\"added\": {}}]',7,1),(2,'2025-06-30 12:24:26.480429','1','SHOES',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core_desyra','brand'),(13,'core_desyra','category'),(20,'core_desyra','category_products'),(8,'core_desyra','chart'),(19,'core_desyra','chart_products'),(17,'core_desyra','img_prod'),(14,'core_desyra','order'),(16,'core_desyra','orderitem'),(15,'core_desyra','products'),(9,'core_desyra','shipping'),(10,'core_desyra','shipping_address'),(12,'core_desyra','users'),(18,'core_desyra','variants'),(11,'core_desyra','wishlist'),(21,'core_desyra','wishlist_products'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-30 08:16:02.608104'),(2,'auth','0001_initial','2025-06-30 08:16:02.960665'),(3,'admin','0001_initial','2025-06-30 08:16:03.057716'),(4,'admin','0002_logentry_remove_auto_add','2025-06-30 08:16:03.063715'),(5,'admin','0003_logentry_add_action_flag_choices','2025-06-30 08:16:03.069715'),(6,'contenttypes','0002_remove_content_type_name','2025-06-30 08:16:03.134070'),(7,'auth','0002_alter_permission_name_max_length','2025-06-30 08:16:03.313671'),(8,'auth','0003_alter_user_email_max_length','2025-06-30 08:16:03.345503'),(9,'auth','0004_alter_user_username_opts','2025-06-30 08:16:03.351059'),(10,'auth','0005_alter_user_last_login_null','2025-06-30 08:16:03.391824'),(11,'auth','0006_require_contenttypes_0002','2025-06-30 08:16:03.392848'),(12,'auth','0007_alter_validators_add_error_messages','2025-06-30 08:16:03.392848'),(13,'auth','0008_alter_user_username_max_length','2025-06-30 08:16:03.439875'),(14,'auth','0009_alter_user_last_name_max_length','2025-06-30 08:16:03.486717'),(15,'auth','0010_alter_group_name_max_length','2025-06-30 08:16:03.502548'),(16,'auth','0011_update_proxy_permissions','2025-06-30 08:16:03.506740'),(17,'auth','0012_alter_user_first_name_max_length','2025-06-30 08:16:03.550037'),(18,'core_desyra','0001_initial','2025-06-30 08:16:03.730451'),(19,'sessions','0001_initial','2025-06-30 08:16:03.768361'),(20,'core_desyra','0002_shipping_shipping_cost_category_order_products_and_more','2025-06-30 10:21:26.467122'),(21,'core_desyra','0003_alter_users_name_alter_users_surname','2025-06-30 11:15:32.509828'),(22,'core_desyra','0004_alter_users_chart_alter_users_shipping_address_and_more','2025-06-30 11:18:37.326143'),(23,'jet_django','0001_initial','2025-06-30 12:49:27.811525'),(24,'jet_django','0002_auto_20181014_2002','2025-06-30 12:49:27.885175'),(25,'jet_django','0003_auto_20191007_2005','2025-06-30 12:49:27.898821'),(26,'jet_django','0004_delete_token','2025-06-30 12:49:27.900064'),(27,'core_desyra','0005_alter_brand_description_alter_brand_logo_path_and_more','2025-07-06 13:49:24.285258'),(28,'core_desyra','0006_alter_brand_description_alter_brand_logo_path_and_more','2025-07-06 13:50:38.820744'),(29,'core_desyra','0007_rename_created_ad_products_created_at_and_more','2025-07-06 13:55:33.873469'),(30,'core_desyra','0008_alter_products_created_at','2025-07-06 13:59:26.312706'),(31,'core_desyra','0009_alter_products_updated_at','2025-07-06 14:04:50.360902'),(32,'core_desyra','0010_alter_img_prod_created_ad_alter_img_prod_updated_at','2025-07-06 14:15:30.825998'),(33,'core_desyra','0011_alter_img_prod_img_path','2025-07-06 14:16:41.692918'),(34,'core_desyra','0012_img_prod_category','2025-07-07 18:50:00.097450'),(35,'core_desyra','0013_alter_img_prod_product','2025-07-07 18:52:19.632946');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3cmx8qollzxomekwoguw90shhx406pbd','.eJxVjEEOgjAQRe_StWmmMFOKS_eeoZlpO4IaSCisjHdXEha6_e-9_zKRt3WIWy1LHLM5G2dOv5twepRpB_nO0222aZ7WZRS7K_ag1V7nXJ6Xw_07GLgO35pLYAk-OSXXcvDoe0FP0KmwBsQCHWgCBQfqUH2DDbXUi1DXIAGZ9wfebzcJ:1uWCPL:7B0op4_YZceGqTaLf2ZYIsb3Rl2W_mA1cJ1tosO4cHc','2025-07-14 11:10:43.756201');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_django_token`
--

DROP TABLE IF EXISTS `jet_django_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jet_django_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_django_token`
--

LOCK TABLES `jet_django_token` WRITE;
/*!40000 ALTER TABLE `jet_django_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_django_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 10:12:37
