-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: QLBongDa
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BANGXH`
--

DROP TABLE IF EXISTS `BANGXH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BANGXH` (
  `MACLB` varchar(5) NOT NULL,
  `NAM` int NOT NULL,
  `VONG` int NOT NULL,
  `SOTRAN` int NOT NULL,
  `THANG` int NOT NULL,
  `HOA` int NOT NULL,
  `THUA` int NOT NULL,
  `HIEUSO` varchar(5) NOT NULL,
  `DIEM` int NOT NULL,
  `HANG` int NOT NULL,
  PRIMARY KEY (`MACLB`,`NAM`,`VONG`),
  CONSTRAINT `bangxh_ibfk_1` FOREIGN KEY (`MACLB`) REFERENCES `CAULACBO` (`MACLB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BANGXH`
--

LOCK TABLES `BANGXH` WRITE;
/*!40000 ALTER TABLE `BANGXH` DISABLE KEYS */;
INSERT INTO `BANGXH` VALUES ('BBD',2009,1,1,1,0,0,'3-0',3,1),('GDT',2009,1,1,0,1,0,'2-2',1,3),('KKH',2009,1,1,0,1,0,'1-1',1,2),('SDN',2009,1,1,0,0,1,'1-2',0,5),('TPY',2009,1,1,0,0,1,'0-3',0,4);
/*!40000 ALTER TABLE `BANGXH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAULACBO`
--

DROP TABLE IF EXISTS `CAULACBO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAULACBO` (
  `MACLB` varchar(5) NOT NULL,
  `TENCLB` varchar(100) NOT NULL,
  `MASAN` varchar(5) NOT NULL,
  `MATINH` varchar(5) NOT NULL,
  PRIMARY KEY (`MACLB`),
  KEY `MATINH` (`MATINH`),
  KEY `MASAN` (`MASAN`),
  CONSTRAINT `caulacbo_ibfk_1` FOREIGN KEY (`MATINH`) REFERENCES `TINH` (`MATINH`),
  CONSTRAINT `caulacbo_ibfk_2` FOREIGN KEY (`MASAN`) REFERENCES `SANVD` (`MASAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAULACBO`
--

LOCK TABLES `CAULACBO` WRITE;
/*!40000 ALTER TABLE `CAULACBO` DISABLE KEYS */;
INSERT INTO `CAULACBO` VALUES ('BBD','BECAMEX BÌNH DƯƠNG','GD','BD'),('GDT','GẠCH ĐỒNG TÂM','LA','LA'),('HAGL','HOÀNG ANH GIA LAI','PL','GL'),('KKH','KHATOCO KHÁNH HOÀ','NT','KH'),('SDN','SHB ĐÀ NẴNG','CL','DN'),('TPY','THÉP PHÚ YÊN','TH','PY');
/*!40000 ALTER TABLE `CAULACBO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAUTHU`
--

DROP TABLE IF EXISTS `CAUTHU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAUTHU` (
  `MACT` int NOT NULL AUTO_INCREMENT,
  `HOTEN` varchar(100) NOT NULL,
  `VITRI` varchar(20) NOT NULL,
  `NGAYSINH` datetime DEFAULT NULL,
  `DIACHI` varchar(200) DEFAULT NULL,
  `MACLB` varchar(5) NOT NULL,
  `MAQG` varchar(5) NOT NULL,
  `SO` int NOT NULL,
  PRIMARY KEY (`MACT`),
  KEY `MAQG` (`MAQG`),
  KEY `MACLB` (`MACLB`),
  CONSTRAINT `cauthu_ibfk_1` FOREIGN KEY (`MAQG`) REFERENCES `QUOCGIA` (`MAQG`),
  CONSTRAINT `cauthu_ibfk_3` FOREIGN KEY (`MACLB`) REFERENCES `CAULACBO` (`MACLB`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAUTHU`
--

LOCK TABLES `CAUTHU` WRITE;
/*!40000 ALTER TABLE `CAUTHU` DISABLE KEYS */;
INSERT INTO `CAUTHU` VALUES (2,'Nguyễn Vũ Phong','Tiền vệ','1990-02-20 00:00:00',NULL,'BBD','VN',17),(3,'Nguyễn Công Vinh','Tiền đạo','1990-03-10 00:00:00',NULL,'HAGL','VN',9),(4,'Trần Tấn Tài','Tiền vệ','1990-11-12 00:00:00',NULL,'BBD','VN',8),(5,'Phan Hồng Sơn','Thủ Môn','1990-03-10 00:00:00',NULL,'HAGL','VN',1),(6,'Ronaldo','Tiền vệ','1990-12-12 00:00:00',NULL,'SDN','BRA',7),(7,'Ronaldinho','Tiền vệ','1990-12-12 00:00:00',NULL,'SDN','BRA',8),(8,'Trần Văn Santos','Thủ môn','1987-12-12 00:00:00',NULL,'HAGL','ANH',3);
/*!40000 ALTER TABLE `CAUTHU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HLV_CLB`
--

DROP TABLE IF EXISTS `HLV_CLB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HLV_CLB` (
  `MAHLV` varchar(5) NOT NULL,
  `MACLB` varchar(5) NOT NULL,
  `VAITRO` varchar(200) NOT NULL,
  PRIMARY KEY (`MAHLV`,`MACLB`),
  KEY `MACLB` (`MACLB`),
  CONSTRAINT `hlv_clb_ibfk_1` FOREIGN KEY (`MAHLV`) REFERENCES `HUANLUYENVIEN` (`MAHLV`),
  CONSTRAINT `hlv_clb_ibfk_2` FOREIGN KEY (`MACLB`) REFERENCES `CAULACBO` (`MACLB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HLV_CLB`
--

LOCK TABLES `HLV_CLB` WRITE;
/*!40000 ALTER TABLE `HLV_CLB` DISABLE KEYS */;
INSERT INTO `HLV_CLB` VALUES ('HLV01','BBD','HLV Chính'),('HLV02','SDN','HLV Chính'),('HLV03','HAGL','HLV Chính'),('HLV04','KKH','HLV Chính'),('HLV05','GDT','HLV Chính'),('HLV06','BBD','HLV Thủ Môn');
/*!40000 ALTER TABLE `HLV_CLB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HUANLUYENVIEN`
--

DROP TABLE IF EXISTS `HUANLUYENVIEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HUANLUYENVIEN` (
  `MAHLV` varchar(5) NOT NULL,
  `TENHLV` varchar(100) NOT NULL,
  `NGAYSINH` datetime DEFAULT NULL,
  `DIACHI` varchar(200) DEFAULT NULL,
  `DIENTHOAI` varchar(20) DEFAULT NULL,
  `MAQG` varchar(5) NOT NULL,
  PRIMARY KEY (`MAHLV`),
  KEY `MAQG` (`MAQG`),
  CONSTRAINT `huanluyenvien_ibfk_1` FOREIGN KEY (`MAQG`) REFERENCES `QUOCGIA` (`MAQG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HUANLUYENVIEN`
--

LOCK TABLES `HUANLUYENVIEN` WRITE;
/*!40000 ALTER TABLE `HUANLUYENVIEN` DISABLE KEYS */;
INSERT INTO `HUANLUYENVIEN` VALUES ('HLV01','Vital','1955-10-15 00:00:00','','123456789','BDN'),('HLV02','Lê Huỳnh Đức','1972-05-25 00:00:00',NULL,'01234567899','VN'),('HLV03','Kiatisuk',NULL,NULL,'123123123213','THA'),('HLV04','Hoàng Anh Tuấn','1970-10-06 00:00:00',NULL,'9099123123','VN'),('HLV05','Trần Công Minh','1973-07-07 00:00:00',NULL,'123123123','VN'),('HLV06','Trần Văn Phúc','1965-02-03 00:00:00',NULL,'09099999009','VN');
/*!40000 ALTER TABLE `HUANLUYENVIEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUOCGIA`
--

DROP TABLE IF EXISTS `QUOCGIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QUOCGIA` (
  `MAQG` varchar(5) NOT NULL,
  `TENQG` varchar(60) NOT NULL,
  PRIMARY KEY (`MAQG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUOCGIA`
--

LOCK TABLES `QUOCGIA` WRITE;
/*!40000 ALTER TABLE `QUOCGIA` DISABLE KEYS */;
INSERT INTO `QUOCGIA` VALUES ('ANH','Anh Quốc'),('BDN','Bồ Đào Nha'),('BRA','Bra-xin'),('ITA','Ý'),('TBN','Tây Ban Nha'),('THA','Thái Lan'),('VN','Việt Nam');
/*!40000 ALTER TABLE `QUOCGIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SANVD`
--

DROP TABLE IF EXISTS `SANVD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SANVD` (
  `MASAN` varchar(5) NOT NULL,
  `TENSAN` varchar(100) NOT NULL,
  `DIACHI` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MASAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SANVD`
--

LOCK TABLES `SANVD` WRITE;
/*!40000 ALTER TABLE `SANVD` DISABLE KEYS */;
INSERT INTO `SANVD` VALUES ('CL','Chi Lăng','127 Võ Văn Tần, Đà Nẵng'),('GD','Gò Đậu','123 QL1, TX Thủ Dầu Một, Bình Dương'),('LA','Long An','102 Hùng Vương, Tp Tân An, Long An'),('NT','Nha Trang','128 Phan Chu Trinh, Nha Trang, Khánh Hoà'),('PL','Pleiku','22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai'),('TH','Tuy Hoà','57 Trường Chinh, Tuy Hoà, Phú Yên');
/*!40000 ALTER TABLE `SANVD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TINH`
--

DROP TABLE IF EXISTS `TINH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TINH` (
  `MATINH` varchar(5) NOT NULL,
  `TENTINH` varchar(100) NOT NULL,
  PRIMARY KEY (`MATINH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TINH`
--

LOCK TABLES `TINH` WRITE;
/*!40000 ALTER TABLE `TINH` DISABLE KEYS */;
INSERT INTO `TINH` VALUES ('BD','Bình Dương'),('DN','Đà Nẵng'),('GL','Gia Lai'),('KH','Khánh Hoà'),('LA','Long An'),('PY','Phú Yên');
/*!40000 ALTER TABLE `TINH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANDAU`
--

DROP TABLE IF EXISTS `TRANDAU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANDAU` (
  `MATRAN` int NOT NULL AUTO_INCREMENT,
  `NAM` int NOT NULL,
  `VONG` int NOT NULL,
  `NGAYTD` datetime NOT NULL,
  `MACLB1` varchar(5) NOT NULL,
  `MACLB2` varchar(5) NOT NULL,
  `MASAN` varchar(5) NOT NULL,
  `KETQUA` varchar(5) NOT NULL,
  PRIMARY KEY (`MATRAN`),
  KEY `MACLB1` (`MACLB1`),
  KEY `MACLB2` (`MACLB2`),
  KEY `MASAN` (`MASAN`),
  CONSTRAINT `trandau_ibfk_2` FOREIGN KEY (`MASAN`) REFERENCES `SANVD` (`MASAN`),
  CONSTRAINT `trandau_ibfk_3` FOREIGN KEY (`MACLB1`) REFERENCES `CAULACBO` (`MACLB`),
  CONSTRAINT `trandau_ibfk_4` FOREIGN KEY (`MACLB2`) REFERENCES `CAULACBO` (`MACLB`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANDAU`
--

LOCK TABLES `TRANDAU` WRITE;
/*!40000 ALTER TABLE `TRANDAU` DISABLE KEYS */;
INSERT INTO `TRANDAU` VALUES (1,2009,1,'2009-02-07 00:00:00','BBD','SDN','GD','3-0'),(2,2009,1,'2009-02-07 00:00:00','KKH','GDT','NT','1-1'),(3,2009,2,'2009-02-16 00:00:00','SDN','KKH','CL','2-2'),(4,2009,2,'2009-02-16 00:00:00','TPY','BBD','TH','5-0'),(5,2009,3,'2009-03-01 00:00:00','TPY','GDT','TH','0-2');
/*!40000 ALTER TABLE `TRANDAU` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 11:15:46
