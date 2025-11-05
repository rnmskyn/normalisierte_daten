-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: online_shop
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

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
-- Table structure for table `bestellung`
--

DROP TABLE IF EXISTS `bestellung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestellung` (
  `bestellnummer` int NOT NULL,
  `datum` date DEFAULT NULL,
  `kundennummer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versandkosten` decimal(10,2) DEFAULT NULL,
  `gesamtkosten` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`bestellnummer`),
  KEY `kundennummer` (`kundennummer`),
  CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`bestellnummer`) REFERENCES `warenkorb` (`bestellnummer`),
  CONSTRAINT `bestellung_ibfk_2` FOREIGN KEY (`kundennummer`) REFERENCES `kunden` (`kundennummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellung`
--

LOCK TABLES `bestellung` WRITE;
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
INSERT INTO `bestellung` VALUES (1001,'2025-01-15','K001',5.99,1231.49),(1002,'2025-01-16','K002',5.99,1295.99),(1003,'2025-01-17','K001',4.99,49.99),(1004,'2025-01-18','K003',12.99,2662.99),(1005,'2025-01-19','K004',9.99,709.99),(1006,'2025-01-20','K002',4.99,30.49),(1007,'2025-01-21','K005',7.99,293.99),(1008,'2025-02-01','K001',9.99,359.99),(1009,'2025-02-02','K003',9.99,1209.99),(1010,'2025-02-03','K006',4.99,159.99),(1011,'2025-02-04','K007',15.99,2565.99),(1012,'2025-02-05','K005',5.99,160.99),(1013,'2025-02-06','K002',4.99,99.99),(1014,'2025-02-07','K008',5.99,119.99),(1015,'2025-02-08','K008',5.99,67.99),(1016,'2025-02-09','K009',9.99,919.98),(1017,'2025-02-10','K010',9.99,1259.99),(1018,'2025-02-11','K001',7.99,222.99),(1019,'2025-02-12','K006',5.99,160.99),(1020,'2025-02-13','K008',5.99,136.99);
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hersteller`
--

DROP TABLE IF EXISTS `hersteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hersteller` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `land` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hersteller`
--

LOCK TABLES `hersteller` WRITE;
/*!40000 ALTER TABLE `hersteller` DISABLE KEYS */;
INSERT INTO `hersteller` VALUES ('AudioPro','Deutschland'),('ConnectIt','China'),('Dell','USA'),('GamerX','Taiwan'),('HP','USA'),('Logi','Schweiz'),('Nvidia','USA'),('TechCorp','USA'),('ViewSonic','USA');
/*!40000 ALTER TABLE `hersteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden` (
  `kundennummer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vorname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nachname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strasse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hausnummer` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plz` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stadt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`kundennummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES ('K001','Max','Mustermann','Musterstraße','1','12345','Musterstadt','Deutschland'),('K002','Erika','Mustermann','Beispielweg','5','54321','Beispielhausen','Deutschland'),('K003','Peter','Meier','Hauptplatz','10','4020','Linz','Österreich'),('K004','Anna','Schmidt','Bahnhofstrasse','15','8001','Zürich','Schweiz'),('K005','Lukas','Weber','Seestraße','8','10117','Berlin','Deutschland'),('K006','Sophie','Müller','Am Markt','7','20095','Hamburg','Deutschland'),('K007','Jonas','Fischer','Rue du Rhône','1','1204','Genf','Schweiz'),('K008','Maria','Huber','Mariahilfer Str.','5','1060','Wien','Österreich'),('K009','Stefan','Bauer','Schlossallee','42','80539','München','Deutschland'),('K010','Laura','Keller','Limmatquai','1','8001','Zürich','Schweiz');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkte`
--

DROP TABLE IF EXISTS `produkte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkte` (
  `produktnummer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bezeichnung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hersteller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`produktnummer`),
  KEY `hersteller` (`hersteller`),
  CONSTRAINT `produkte_ibfk_1` FOREIGN KEY (`hersteller`) REFERENCES `hersteller` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkte`
--

LOCK TABLES `produkte` WRITE;
/*!40000 ALTER TABLE `produkte` DISABLE KEYS */;
INSERT INTO `produkte` VALUES ('P01','Laptop Pro','TechCorp'),('P02','Wireless Maus','Logi'),('P03','USB-C Hub','ConnectIt'),('P04','Gaming PC','GamerX'),('P05','Mechanische Tastatur','GamerX'),('P06','Monitor 27 Zoll','ViewSonic'),('P07','Drucker','HP'),('P08','Druckerpatronen','HP'),('P09','Webcam HD','Logi'),('P10','Externes Mikrofon','AudioPro'),('P11','4K Monitor','Dell'),('P12','Grafikkarte RTX 4070','Nvidia');
/*!40000 ALTER TABLE `produkte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warenkorb`
--

DROP TABLE IF EXISTS `warenkorb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warenkorb` (
  `bestellnummer` int NOT NULL,
  `produktnummer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menge` int DEFAULT NULL,
  `preis` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`bestellnummer`,`produktnummer`),
  KEY `produktnummer` (`produktnummer`),
  CONSTRAINT `warenkorb_ibfk_1` FOREIGN KEY (`produktnummer`) REFERENCES `produkte` (`produktnummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warenkorb`
--

LOCK TABLES `warenkorb` WRITE;
/*!40000 ALTER TABLE `warenkorb` DISABLE KEYS */;
INSERT INTO `warenkorb` VALUES (1001,'P01',1,1200.00),(1001,'P02',1,25.50),(1002,'P01',1,1200.00),(1002,'P03',2,45.00),(1003,'P03',1,45.00),(1004,'P04',1,2500.00),(1004,'P05',1,150.00),(1005,'P06',2,350.00),(1006,'P02',1,25.50),(1007,'P02',1,26.00),(1007,'P07',1,180.00),(1007,'P08',3,30.00),(1008,'P06',1,350.00),(1009,'P01',1,1200.00),(1010,'P09',1,60.00),(1010,'P10',1,95.00),(1011,'P04',1,95.00),(1012,'P05',1,2550.00),(1013,'P10',1,155.00),(1014,'P02',2,26.00),(1014,'P09',1,62.00),(1015,'P09',1,62.00),(1016,'P11',1,750.00),(1016,'P12',1,159.99),(1017,'P01',1,1250.00),(1018,'P07',1,185.00),(1018,'P08',1,30.00),(1019,'P05',1,155.00),(1020,'P02',1,26.00),(1020,'P03',1,45.00),(1020,'P09',1,60.00);
/*!40000 ALTER TABLE `warenkorb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 18:41:11
