-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: inventory5
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baku`
--

DROP TABLE IF EXISTS `baku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baku` (
  `id_baku` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama_baku` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `produsen` varchar(50) DEFAULT NULL,
  `stok` double NOT NULL,
  `stok_limit` int(11) NOT NULL,
  PRIMARY KEY (`id_baku`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baku`
--

LOCK TABLES `baku` WRITE;
/*!40000 ALTER TABLE `baku` DISABLE KEYS */;
INSERT INTO `baku` VALUES (3,'fdsfdf','sdfdf','dfdfd',0,100);
/*!40000 ALTER TABLE `baku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_baku`
--

DROP TABLE IF EXISTS `input_baku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_baku` (
  `id_input` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_baku` bigint(20) NOT NULL,
  `id_supplier` bigint(20) NOT NULL,
  `qty_input` double NOT NULL,
  `tgl_input` date NOT NULL,
  `h_stokInput` int(11) NOT NULL,
  `nama_baku` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `produsen` varchar(50) DEFAULT NULL,
  `id_user` bigint(20) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expired` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `fifo` double NOT NULL,
  PRIMARY KEY (`id_input`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_baku`
--

LOCK TABLES `input_baku` WRITE;
/*!40000 ALTER TABLE `input_baku` DISABLE KEYS */;
/*!40000 ALTER TABLE `input_baku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_items`
--

DROP TABLE IF EXISTS `input_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_items` (
  `id_input` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(11) DEFAULT NULL,
  `id_supplier` bigint(11) DEFAULT NULL,
  `qty_input` int(11) NOT NULL,
  `kb_input` int(11) NOT NULL,
  `tgl_input` date NOT NULL,
  `h_stokInput` int(11) NOT NULL,
  `nama_item` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `id_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id_input`),
  KEY `id_items` (`id_item`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_items`
--

LOCK TABLES `input_items` WRITE;
/*!40000 ALTER TABLE `input_items` DISABLE KEYS */;
INSERT INTO `input_items` VALUES (1,1,1,100,10,'2021-05-22',100,'beras','beras','100gram','beras',2);
/*!40000 ALTER TABLE `input_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` bigint(11) NOT NULL AUTO_INCREMENT,
  `nama_item` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `kb` int(11) NOT NULL,
  `stok_limit` int(11) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'beras','beras','100gram','beras',80,9,2);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output_baku`
--

DROP TABLE IF EXISTS `output_baku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output_baku` (
  `id_output` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_baku` bigint(20) NOT NULL,
  `qty_output` double NOT NULL,
  `tgl_output` date NOT NULL,
  `h_stokOutput` int(11) NOT NULL,
  `nama_baku` varchar(100) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `produsen` varchar(50) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `id_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id_output`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output_baku`
--

LOCK TABLES `output_baku` WRITE;
/*!40000 ALTER TABLE `output_baku` DISABLE KEYS */;
/*!40000 ALTER TABLE `output_baku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output_items`
--

DROP TABLE IF EXISTS `output_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output_items` (
  `id_output` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_item` bigint(11) DEFAULT NULL,
  `qty_output` int(11) NOT NULL,
  `kb_output` int(11) NOT NULL,
  `tgl_output` date NOT NULL,
  `h_stokOutput` int(11) NOT NULL,
  `nama_item` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `id_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id_output`),
  KEY `id_items` (`id_item`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output_items`
--

LOCK TABLES `output_items` WRITE;
/*!40000 ALTER TABLE `output_items` DISABLE KEYS */;
INSERT INTO `output_items` VALUES (1,1,20,1,'2021-05-22',80,'beras','beras','100gram','beras','tes',2);
/*!40000 ALTER TABLE `output_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id_supplier` bigint(11) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(100) NOT NULL,
  `kontak` varchar(30) DEFAULT NULL,
  `transaksi_terakhir` date DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'supplier1','0888888','2021-05-22');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_baku`
--

DROP TABLE IF EXISTS `suppliers_baku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers_baku` (
  `id_supplier` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(100) NOT NULL,
  `kontak` varchar(30) DEFAULT NULL,
  `transaksi_terakhir` date DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_baku`
--

LOCK TABLES `suppliers_baku` WRITE;
/*!40000 ALTER TABLE `suppliers_baku` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers_baku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_baku`
--

DROP TABLE IF EXISTS `transaksi_baku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_baku` (
  `id_tb` bigint(20) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `stok_masuk` double NOT NULL,
  `stok_keluar` double NOT NULL,
  `sisa_stok` double NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `id_baku` bigint(20) NOT NULL,
  PRIMARY KEY (`id_tb`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_baku`
--

LOCK TABLES `transaksi_baku` WRITE;
/*!40000 ALTER TABLE `transaksi_baku` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi_baku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_items`
--

DROP TABLE IF EXISTS `transaksi_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_items` (
  `id_ti` bigint(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `stok_masuk` int(11) NOT NULL,
  `kb_masuk` int(11) NOT NULL,
  `stok_keluar` int(11) NOT NULL,
  `kb_keluar` int(11) NOT NULL,
  `sisa_stok` int(11) DEFAULT NULL,
  `sisa_kb` int(11) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `id_item` bigint(11) NOT NULL,
  PRIMARY KEY (`id_ti`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_items`
--

LOCK TABLES `transaksi_items` WRITE;
/*!40000 ALTER TABLE `transaksi_items` DISABLE KEYS */;
INSERT INTO `transaksi_items` VALUES (1,'2021-05-22',100,10,20,1,80,9,NULL,1);
/*!40000 ALTER TABLE `transaksi_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` bigint(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'superadmin','superadmin@superadmin.com','17c4520f6cfd1ab53d8745e84681eb49','superadmin'),(13,'Administrator','admin@admin.com','0192023a7bbd73250516f069df18b500','superadmin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-22 20:05:12
