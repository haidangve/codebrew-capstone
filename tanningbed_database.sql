-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tanningbedapp
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `ClientFirstName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ClientLastName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ClientTanID` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ClientPhoneNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ClientActive` tinyint NOT NULL,
  PRIMARY KEY (`ClientID`),
  UNIQUE KEY `ClientTanID` (`ClientTanID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'John','Smith','SMI009','555-1234',1),(2,'Jane','Johnson','JOH014','555-5678',1),(3,'Alice','Doe','DOE007','555-9012',1),(4,'John','Smith','SMI001','555-1001',1),(5,'Alice','Brown','BRO002','555-1002',1),(6,'Mike','Jones','JON003','555-1003',1),(7,'Laura','Clark','CLA004','555-1004',1),(8,'Tom','Davis','DAV005','555-1005',1),(9,'edz','vivas','VIV001','306-555-6666',1),(10,'Jeth','Puerta','PUE001','306-555-1234',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientlogon`
--

DROP TABLE IF EXISTS `clientlogon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientlogon` (
  `ClientID` int NOT NULL,
  `ClientPin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  CONSTRAINT `clientlogon_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientlogon`
--

LOCK TABLES `clientlogon` WRITE;
/*!40000 ALTER TABLE `clientlogon` DISABLE KEYS */;
INSERT INTO `clientlogon` VALUES (1,'$2y$10$DvFmu1A9DzoTEg8Jv1xWMu8RVFAv7AWO5r/eRjQbRGRii5.xejF2G'),(2,'$2y$10$EUmS80DJxZr28uMLMonGI.UD1IaybWopXMCZmD0GpLjmt7Izr1wxO'),(3,'$2y$10$QF8.oCYjM6kRXq7rNzIjvOjDTzzCpkxIQdschIKsgb0zV2JaA0vGm'),(4,'123456'),(5,'123456'),(6,'123456'),(7,'123456'),(8,'123456'),(9,'123456'),(10,'123456');
/*!40000 ALTER TABLE `clientlogon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientminutes`
--

DROP TABLE IF EXISTS `clientminutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientminutes` (
  `ClientID` int NOT NULL,
  `TotalAvailableMinutes` int NOT NULL,
  PRIMARY KEY (`ClientID`),
  CONSTRAINT `clientminutes_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientminutes`
--

LOCK TABLES `clientminutes` WRITE;
/*!40000 ALTER TABLE `clientminutes` DISABLE KEYS */;
INSERT INTO `clientminutes` VALUES (1,140),(2,200),(3,150),(4,100),(5,100),(6,100),(7,100),(8,100),(9,120),(10,115);
/*!40000 ALTER TABLE `clientminutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minutesaddedtoclient`
--

DROP TABLE IF EXISTS `minutesaddedtoclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minutesaddedtoclient` (
  `MinutesAddedID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ClientID` int NOT NULL,
  `MinutesAddedDate` date NOT NULL,
  `MinutesAddedTime` time NOT NULL,
  `MinutesAddedForClient` int NOT NULL,
  PRIMARY KEY (`MinutesAddedID`),
  KEY `ClientID` (`ClientID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `minutesaddedtoclient_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`),
  CONSTRAINT `minutesaddedtoclient_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minutesaddedtoclient`
--

LOCK TABLES `minutesaddedtoclient` WRITE;
/*!40000 ALTER TABLE `minutesaddedtoclient` DISABLE KEYS */;
INSERT INTO `minutesaddedtoclient` VALUES (1,3,1,'2025-05-06','10:00:00',50),(2,4,2,'2025-05-06','11:00:00',30);
/*!40000 ALTER TABLE `minutesaddedtoclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `PermissionID` int NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `PermissionDescription` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`PermissionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'ManageClients','Can add, edit, and delete clients'),(2,'ManageSessions','Can start, end, and view tanning sessions'),(3,'User Mgt','Manage user profiles and credentials'),(4,'Session Control','Control tanning sessions'),(5,'Role & Permission','Manage admin roles and permissions');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionlevel`
--

DROP TABLE IF EXISTS `permissionlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissionlevel` (
  `UserRoleID` int NOT NULL,
  `PermissionID` int NOT NULL,
  `LevelGranted` tinyint NOT NULL,
  PRIMARY KEY (`UserRoleID`,`PermissionID`),
  KEY `PermissionID` (`PermissionID`),
  CONSTRAINT `permissionlevel_ibfk_1` FOREIGN KEY (`UserRoleID`) REFERENCES `userrole` (`UserRoleID`),
  CONSTRAINT `permissionlevel_ibfk_2` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionlevel`
--

LOCK TABLES `permissionlevel` WRITE;
/*!40000 ALTER TABLE `permissionlevel` DISABLE KEYS */;
INSERT INTO `permissionlevel` VALUES (1,1,1),(2,1,1),(2,2,1),(3,1,1),(3,3,1),(4,1,1),(4,4,1),(5,1,1),(5,2,1),(5,4,1),(6,1,1),(6,2,1),(6,3,1),(6,4,1),(6,5,1),(7,1,1),(7,5,1),(8,1,1),(8,4,1),(9,1,1),(9,3,1),(9,4,1),(10,1,1),(10,3,1);
/*!40000 ALTER TABLE `permissionlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randomnumbers`
--

DROP TABLE IF EXISTS `randomnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randomnumbers` (
  `RandomNumberKey` int NOT NULL AUTO_INCREMENT,
  `LastNameCharacters` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastNumberUsed` int NOT NULL,
  PRIMARY KEY (`RandomNumberKey`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randomnumbers`
--

LOCK TABLES `randomnumbers` WRITE;
/*!40000 ALTER TABLE `randomnumbers` DISABLE KEYS */;
INSERT INTO `randomnumbers` VALUES (1,'SMI',8),(2,'JOH',13),(3,'DOE',6),(4,'VIV',1),(5,'PUE',1),(6,'GAR',1),(7,'MIL',2),(8,'NGU',3),(9,'TUR',4),(10,'MOR',5),(11,'BEN',6),(12,'PAT',7),(13,'JOH',8),(14,'ROM',10),(15,'PAR',10);
/*!40000 ALTER TABLE `randomnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanningsession`
--

DROP TABLE IF EXISTS `tanningsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanningsession` (
  `TanningSessionID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int NOT NULL,
  `TanningSessionStartDate` date NOT NULL,
  `TanningSessionStartTime` time NOT NULL,
  `TanningSessionTimeEntered` int NOT NULL,
  `TanningSessionStartDelay` int NOT NULL,
  PRIMARY KEY (`TanningSessionID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `tanningsession_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanningsession`
--

LOCK TABLES `tanningsession` WRITE;
/*!40000 ALTER TABLE `tanningsession` DISABLE KEYS */;
INSERT INTO `tanningsession` VALUES (1,1,'2025-05-06','10:30:00',20,5),(2,2,'2025-05-06','11:30:00',15,3);
/*!40000 ALTER TABLE `tanningsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserFirstName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserLastName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserPortalLogonID` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserPhoneNumber` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserRoleID` int NOT NULL,
  `UserActive` tinyint NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserPortalLogonID` (`UserPortalLogonID`),
  KEY `UserRoleID` (`UserRoleID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserRoleID`) REFERENCES `userrole` (`UserRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1001,'Alice','Garcia','GAR001','306-111-1001',1,1),(1002,'Bob','Miller','MIL002','306-111-1002',2,1),(1003,'Cara','Nguyen','NGU003','306-111-1003',3,1),(1004,'David','Turner','TUR004','306-111-1004',4,1),(1005,'Ella','Morales','MOR005','306-111-1005',5,1),(1006,'Frank','Bennett','BEN006','306-111-1006',6,1),(1007,'Gina','Patel','PAT007','306-111-1007',7,1),(1008,'Hank','Johnson','JOH008','306-111-1008',8,1),(1009,'Ivy','Romero','ROM009','306-111-1009',9,1),(1010,'Jake','Park','PAR010','306-111-1010',10,1),(1011,'Joe','Roms','ROM010','306-563-1122',5,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraction`
--

DROP TABLE IF EXISTS `useraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraction` (
  `UserActionID` int NOT NULL AUTO_INCREMENT,
  `UserActionTaken` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`UserActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraction`
--

LOCK TABLES `useraction` WRITE;
/*!40000 ALTER TABLE `useraction` DISABLE KEYS */;
INSERT INTO `useraction` VALUES (1,'Login'),(2,'Logout');
/*!40000 ALTER TABLE `useraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogon`
--

DROP TABLE IF EXISTS `userlogon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogon` (
  `UserID` int NOT NULL,
  `UserPin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `userlogon_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogon`
--

LOCK TABLES `userlogon` WRITE;
/*!40000 ALTER TABLE `userlogon` DISABLE KEYS */;
INSERT INTO `userlogon` VALUES (3,'$2y$10$3/upt9OT4negVxX7y/oDcuLusuZaeqwPr0oDHoKf1AdiqLv049PaK'),(4,'$2y$10$J7wUCrCw5CgwD/.nnfIa..E9n4qowELEonKJumlqF0muwHQ06L/9m'),(5,'$2y$10$MQWIzYjSdwijVbZa8Efu7u3Hzi1sV.TDDsGK6tCUUh2d8afMQNdNi'),(101,'111111'),(102,'222222'),(103,'333333'),(104,'444444'),(105,'555555'),(106,'666666'),(107,'777777'),(108,'888888'),(109,'999999'),(110,'000000'),(1001,'111111'),(1002,'222222'),(1003,'333333'),(1004,'444444'),(1005,'555555'),(1006,'666666'),(1007,'777777'),(1008,'888888'),(1009,'999999'),(1010,'000000'),(1011,'123456');
/*!40000 ALTER TABLE `userlogon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogontracking`
--

DROP TABLE IF EXISTS `userlogontracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogontracking` (
  `UserLogonTrackingID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `UserActionDate` date NOT NULL,
  `UserActionTime` time NOT NULL,
  `UserActionID` int NOT NULL,
  `ActionOn` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`UserLogonTrackingID`),
  KEY `UserID` (`UserID`),
  KEY `UserActionID` (`UserActionID`),
  CONSTRAINT `userlogontracking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `userlogontracking_ibfk_2` FOREIGN KEY (`UserActionID`) REFERENCES `useraction` (`UserActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogontracking`
--

LOCK TABLES `userlogontracking` WRITE;
/*!40000 ALTER TABLE `userlogontracking` DISABLE KEYS */;
INSERT INTO `userlogontracking` VALUES (1,3,'2025-05-06','09:00:00',1,'Portal'),(2,4,'2025-05-06','09:15:00',1,'Portal');
/*!40000 ALTER TABLE `userlogontracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `UserRoleID` int NOT NULL AUTO_INCREMENT,
  `UserRoleTitle` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Viewer'),(2,'Minutes Manager'),(3,'User Manager'),(4,'Session Controller'),(5,'Session & Minutes Mgr'),(6,'Super Admin'),(7,'Role Manager'),(8,'Ops Admin'),(9,'User Ops Admin'),(10,'HR Admin');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30  8:53:32
