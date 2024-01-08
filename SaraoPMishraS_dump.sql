CREATE DATABASE  IF NOT EXISTS `project_management2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_management2`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: localhost    Database: project_management2
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `account_id` int NOT NULL,
  `Bank_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `Bank_Name` (`Bank_Name`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Bank_Name`) REFERENCES `Bank` (`Bank_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1000000001,'Bank of Metropolis'),(1000000002,'Capital Finance'),(1000000005,'CityScape Bank'),(1000000012,'Crest Financial'),(1000000011,'Empire Banking Group'),(1000000020,'Futurist Financial'),(1000000003,'Golden Trust Bank'),(1000000019,'Guardian Bank'),(1000000015,'Heritage Bank'),(1000000008,'Horizon Financial Services'),(1000000007,'Lakeside Banking Corp'),(1000000013,'Oceanic Bank'),(1000000010,'Peak Commercial Bank'),(1000000006,'Pinnacle Savings'),(1000000016,'Prosperity Financial'),(1000000004,'Riverbank Financial'),(1000000017,'Skyline Banking Corporation'),(1000000018,'Timberland Bank'),(1000000014,'Unity Banking'),(1000000009,'Valley Bank & Trust');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminUsers`
--

DROP TABLE IF EXISTS `AdminUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminUsers` (
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminUsers`
--

LOCK TABLES `AdminUsers` WRITE;
/*!40000 ALTER TABLE `AdminUsers` DISABLE KEYS */;
INSERT INTO `AdminUsers` VALUES ('adminparwazsuraj','psp341');
/*!40000 ALTER TABLE `AdminUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bank` (
  `Bank_Name` varchar(100) NOT NULL,
  `bank_address` varchar(200) NOT NULL,
  `bank_contact` varchar(20) NOT NULL,
  `bank_email` varchar(100) NOT NULL,
  `bank_website` varchar(100) NOT NULL,
  PRIMARY KEY (`Bank_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank`
--

LOCK TABLES `Bank` WRITE;
/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;
INSERT INTO `Bank` VALUES ('Bank of Metropolis','123 City St, Metropolis','123-456-7890','info@metropolisbank.com','www.metropolisbank.com'),('Capital Finance','456 Capital Ave, Springfield','234-567-8901','contact@capitalfinance.com','www.capitalfinance.com'),('CityScape Bank','202 Urban Blvd, Gotham','567-890-1234','info@cityscapebank.com','www.cityscapebank.com'),('Crest Financial','909 Hilltop Ave, Ridgeview','234-567-8901','contact@crestfinancial.com','www.crestfinancial.com'),('Empire Banking Group','808 Empire Blvd, Capital City','123-456-7890','help@empirebanking.com','www.empirebankinggroup.com'),('Futurist Financial','888 Tomorrow St, Futuricity','012-345-6789','info@futuristfinancial.com','www.futuristfinancial.com'),('Golden Trust Bank','789 Gold Rd, El Dorado','345-678-9012','support@goldentrust.com','www.goldentrustbank.com'),('Guardian Bank','777 Guardian Ave, Safetown','901-234-5678','help@guardianbank.com','www.guardianbank.com'),('Heritage Bank','333 Heritage Rd, Oldtown','567-890-1234','contact@heritagebank.com','www.heritagebank.com'),('Horizon Financial Services','505 Sunset Blvd, Horizon City','890-123-4567','contact@horizonfinancial.com','www.horizonfinancialservices.com'),('Lakeside Banking Corp','404 Lakeview Ave, Clearwater','789-012-3456','inquiry@lakesidebanking.com','www.lakesidebankingcorp.com'),('Oceanic Bank','111 Ocean Rd, Seaside','345-678-9012','service@oceanicbank.com','www.oceanicbank.com'),('Peak Commercial Bank','707 Mountain St, Highland','012-345-6789','info@peakbank.com','www.peakcommercialbank.com'),('Pinnacle Savings','303 Highpoint St, Summit','678-901-2345','hello@pinnaclesavings.com','www.pinnaclesavings.com'),('Prosperity Financial','444 Prosper Ave, New Hope','678-901-2345','support@prosperityfinancial.com','www.prosperityfinancial.com'),('Riverbank Financial','101 River Lane, Riverdale','456-789-0123','service@riverbank.com','www.riverbankfinancial.com'),('Skyline Banking Corporation','555 Sky High Rd, Sky City','789-012-3456','inquiry@skylinebanking.com','www.skylinebankingcorp.com'),('Timberland Bank','666 Forest St, Woodland','890-123-4567','service@timberlandbank.com','www.timberlandbank.com'),('Unity Banking','222 Unity St, Unityville','456-789-0123','info@unitybanking.com','www.unitybanking.com'),('Valley Bank & Trust','606 Valley Rd, Greenfield','901-234-5678','support@valleybank.com','www.valleybanktrust.com');
/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Department_Name` varchar(100) NOT NULL,
  `department_budget` decimal(10,0) NOT NULL,
  `department_email` varchar(100) NOT NULL,
  `WorkLocation_name_of_location` varchar(100) NOT NULL,
  PRIMARY KEY (`Department_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Administration',150000,'admin@company.com','Location2'),('Corporate Communications',250000,'corpcomm@company.com','Location3'),('Customer Service',250000,'support@company.com','Location1'),('Finance',500000,'finance@company.com','Location1'),('Human Resources',300000,'hr@company.com','Location2'),('IT',600000,'it@company.com','Location3'),('Legal',200000,'legal@company.com','Location2'),('Logistics',300000,'logistics@company.com','Location2'),('Manufacturing',700000,'manufacturing@company.com','Location3'),('Marketing',400000,'marketing@company.com','Location1'),('Operations',450000,'operations@company.com','Location2'),('Procurement',150000,'procurement@company.com','Location3'),('Product Development',500000,'productdev@company.com','Location1'),('Public Relations',300000,'pr@company.com','Location1'),('Quality Assurance',350000,'qa@company.com','Location1'),('Research and Development',650000,'randd@company.com','Location3'),('Risk Management',400000,'risk@company.com','Location2'),('Sales',550000,'sales@company.com','Location2'),('Strategic Planning',350000,'strategy@company.com','Location3'),('Training and Development',200000,'training@company.com','Location1');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_Id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Hire_Date` date NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  `Department_Name` varchar(100) NOT NULL,
  `WorkLocation_name_of_location` varchar(100) NOT NULL,
  `Bank_Name` varchar(100) NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `username` (`username`),
  KEY `Department_Name` (`Department_Name`),
  KEY `WorkLocation_name_of_location` (`WorkLocation_name_of_location`),
  KEY `Bank_Name` (`Bank_Name`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Department_Name`) REFERENCES `Department` (`Department_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`WorkLocation_name_of_location`) REFERENCES `WorkLocation` (`name_of_location`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`Bank_Name`) REFERENCES `Bank` (`Bank_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'john_doe','paigjdb_1','John','Doe','2023-01-01','New York','NY',55000,'Finance','Location1','Bank of Metropolis',1000000001),(2,'jane_smith','hashed_password_2','Jane','Smith','2023-02-01','Los Angeles','CA',60000,'Human Resources','Location2','Capital Finance',1000000002),(3,'emily_johnson','hashed_password_3','Emily','Johnson','2023-03-01','Chicago','IL',57000,'IT','Location3','Golden Trust Bank',1000000003),(4,'michael_brown','hashed_password_4','Michael','Brown','2023-04-01','Houston','TX',52000,'Marketing','Location1','Riverbank Financial',1000000004),(5,'sarah_davis','hashed_password_5','Sarah','Davis','2023-05-01','Phoenix','AZ',53000,'Sales','Location2','CityScape Bank',1000000005),(6,'william_miller','hashed_password_6','William','Miller','2023-06-01','Philadelphia','PA',58000,'Research and Development','Location3','Pinnacle Savings',1000000006),(7,'jessica_wilson','1','Jessica','Wilson','2023-07-01','San Antonio','TX',56000,'Customer Service','Location1','Lakeside Banking Corp',1000000007),(8,'robert_moore','hashed_password_8','Robert','Moore','2023-08-01','San Diego','CA',59000,'Logistics','Location2','Horizon Financial Services',1000000008),(9,'linda_taylor','hashed_password_9','Linda','Taylor','2023-09-01','Dallas','TX',61000,'Manufacturing','Location3','Valley Bank & Trust',1000000009),(10,'david_anderson','hashed_password_10','David','Anderson','2023-10-01','San Jose','CA',62000,'Quality Assurance','Location1','Peak Commercial Bank',1000000010),(11,'angela_thomas','djbwb_1','Angela','Thomas','2023-01-15','Austin','TX',54000,'Legal','Location2','Empire Banking Group',1000000011),(12,'richard_jackson','hashed_password_12','Richard','Jackson','2023-02-15','Jacksonville','FL',60000,'Procurement','Location3','Crest Financial',1000000012),(14,'christopher_harris','hashed_password_14','Christopher','Harris','2023-04-15','Charlotte','NC',57000,'Operations','Location2','Unity Banking',1000000014),(15,'patricia_martin','hashed_password_15','Patricia','Martin','2023-05-15','San Francisco','CA',63000,'Corporate Communications','Location3','Heritage Bank',1000000015),(16,'james_thompson','hjwdvjh_1','James','Thompson','2023-06-15','Columbus','OH',54000,'Public Relations','Location1','Prosperity Financial',1000000016),(17,'lisa_garcia','hashed_password_17','Lisa','Garcia','2023-07-15','Indianapolis','IN',55000,'Risk Management','Location2','Skyline Banking Corporation',1000000017),(18,'paul_martinez','hashed_password_18','Paul','Martinez','2023-08-15','Fort Worth','TX',60000,'Strategic Planning','Location3','Timberland Bank',1000000018),(19,'nancy_robinson','hashed_password_19','Nancy','Robinson','2023-09-15','El Paso','TX',51000,'Training and Development','Location1','Guardian Bank',1000000019),(20,'steven_clark','kwgdkj_1','Steven','Clark','2023-10-15','Detroit','MI',62000,'Administration','Location2','Futurist Financial',1000000020),(27,'klewngl','default_password','keglk','qkwfl','2023-06-12','kdngk;','lkegfnlkq;',2424,'Corporate Communications','Location13','Crest Financial',24244);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_admin`
--

DROP TABLE IF EXISTS `employee_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_admin` (
  `username` varchar(50) NOT NULL,
  `Employee_Id` int NOT NULL,
  PRIMARY KEY (`Employee_Id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `employee_admin_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_admin_ibfk_2` FOREIGN KEY (`username`) REFERENCES `AdminUsers` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_admin`
--

LOCK TABLES `employee_admin` WRITE;
/*!40000 ALTER TABLE `employee_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_University`
--

DROP TABLE IF EXISTS `Employee_University`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_University` (
  `Employee_Id` int NOT NULL,
  `University_Name` varchar(100) NOT NULL,
  `Degree_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Employee_Id`,`University_Name`),
  KEY `University_Name` (`University_Name`),
  CONSTRAINT `employee_university_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_university_ibfk_2` FOREIGN KEY (`University_Name`) REFERENCES `University` (`University_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_University`
--

LOCK TABLES `Employee_University` WRITE;
/*!40000 ALTER TABLE `Employee_University` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee_University` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Week`
--

DROP TABLE IF EXISTS `Employee_Week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Week` (
  `Employee_Id` int NOT NULL,
  `Week_Number` int NOT NULL,
  `Year` int NOT NULL,
  `date_leave_requested` date NOT NULL,
  `status` enum('Pending','Approved','Declined') NOT NULL DEFAULT 'Pending',
  `number_of_weeks_requested` int NOT NULL,
  PRIMARY KEY (`Employee_Id`,`Week_Number`,`Year`),
  KEY `Week_Number` (`Week_Number`,`Year`),
  CONSTRAINT `employee_week_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_week_ibfk_2` FOREIGN KEY (`Week_Number`, `Year`) REFERENCES `Week` (`Week_Number`, `Year`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Week`
--

LOCK TABLES `Employee_Week` WRITE;
/*!40000 ALTER TABLE `Employee_Week` DISABLE KEYS */;
INSERT INTO `Employee_Week` VALUES (1,49,2023,'2023-12-09','Approved',2),(8,50,2023,'2023-12-14','Approved',6),(10,49,2023,'2023-12-08','Approved',2),(11,41,2023,'2023-10-12','Approved',4),(12,2,2024,'2024-01-10','Approved',3),(16,49,2023,'2023-12-08','Approved',2),(18,48,2023,'2023-12-02','Approved',2);
/*!40000 ALTER TABLE `Employee_Week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `Project_Name` varchar(100) NOT NULL,
  `Project_Description` text NOT NULL,
  `project_budget` decimal(10,0) NOT NULL,
  `project_status` enum('completed','on hold','in progress') NOT NULL,
  PRIMARY KEY (`Project_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('ProjectAtlas','Streamlining manufacturing processes',210000,'on hold'),('ProjectAurora','Revamping the IT infrastructure',250000,'in progress'),('ProjectBlueSky','Research on renewable energy sources',300000,'completed'),('ProjectComet','Developing eco-friendly packaging',95000,'completed'),('ProjectEcho','Improving customer service tools',100000,'completed'),('ProjectGalaxy','Data center upgrade',160000,'on hold'),('ProjectHorizon','Building a new corporate website',70000,'completed'),('ProjectJupiter','Launching a new brand campaign',140000,'in progress'),('ProjectLighthouse','Upgrading the logistics system',220000,'completed'),('ProjectMercury','Market research and analysis',80000,'completed'),('ProjectMeteor','Automation of internal processes',135000,'on hold'),('ProjectNebula','Employee wellness program',50000,'in progress'),('ProjectNeptune','Water conservation initiative',110000,'in progress'),('ProjectNova','Developing new sales channels',120000,'on hold'),('ProjectOdyssey','Employee training and development program',90000,'in progress'),('ProjectOrion','New marketing strategy development',150000,'on hold'),('ProjectPolaris','Expansion into new markets',500000,'in progress'),('ProjectTitan','Developing a new software solution',250000,'in progress'),('ProjectVoyage','Exploring new business opportunities',130000,'on hold'),('ProjectZenith','Designing a new product line',200000,'in progress');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_Department`
--

DROP TABLE IF EXISTS `Project_Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project_Department` (
  `Project_Name` varchar(100) NOT NULL,
  `Department_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Project_Name`,`Department_Name`),
  KEY `Department_Name` (`Department_Name`),
  CONSTRAINT `project_department_ibfk_1` FOREIGN KEY (`Project_Name`) REFERENCES `Project` (`Project_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_department_ibfk_2` FOREIGN KEY (`Department_Name`) REFERENCES `Department` (`Department_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_Department`
--

LOCK TABLES `Project_Department` WRITE;
/*!40000 ALTER TABLE `Project_Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `University`
--

DROP TABLE IF EXISTS `University`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `University` (
  `University_Name` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone_number` varchar(20) NOT NULL,
  `Email_id` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`University_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `University`
--

LOCK TABLES `University` WRITE;
/*!40000 ALTER TABLE `University` DISABLE KEYS */;
INSERT INTO `University` VALUES ('Blue Ridge University','808 Ridge Rd, Blue Mountain','123-456-7890','help@blueridgeuni.com','www.blueridgeuniversity.com'),('Capital City College','456 College Ave, Capital City','234-567-8901','contact@capitalcollege.com','www.capitalcitycollege.com'),('Clearwater College','333 Clearwater Rd, Clearwater','567-890-1234','contact@clearwatercol.com','www.clearwatercollege.com'),('Crestwood College','707 Crestwood Ln, Crestville','012-345-6789','info@crestwoodcollege.com','www.crestwoodcollege.com'),('Eagle Heights University','303 Eagle Ave, Mountain View','678-901-2345','hello@eagleheights.com','www.eagleheightsuniversity.com'),('Forestview Academy','888 Forest Rd, Forestville','012-345-6789','info@forestviewacademy.com','www.forestviewacademy.com'),('Grandview University','789 Grandview Blvd, Springfield','345-678-9012','support@grandviewuni.com','www.grandviewuniversity.com'),('Greenfield Academy','505 Green St, Greenfield','890-123-4567','contact@greenfieldacademy.com','www.greenfieldacademy.com'),('Harborview Institute','101 Harbor Rd, Bay City','456-789-0123','service@harborviewinst.com','www.harborviewinstitute.com'),('Lakeside College','404 Lakeshore Dr, Lakeview','789-012-3456','inquiry@lakesidecol.com','www.lakesidecollege.com'),('Metro State University','123 University St, Metropolis','123-456-7890','info@metrouniversity.com','www.metrouniversity.com'),('Moonlight College','666 Moon St, Moonfield','890-123-4567','service@moonlightcol.com','www.moonlightcollege.com'),('Oakwood University','222 Oak St, Oakville','456-789-0123','info@oakwooduni.com','www.oakwooduniversity.com'),('Pine Valley Institute','909 Pine Valley Blvd, Pineville','234-567-8901','contact@pinevalleyinst.com','www.pinevalleyinstitute.com'),('Riverbank University','202 River St, Riverdale','567-890-1234','info@riverbankuni.com','www.riverbankuniversity.com'),('Seaside University','777 Beach Ave, Seaside','901-234-5678','help@seasideuni.com','www.seasideuniversity.com'),('Silver Lake University','111 Silver Lake Dr, Silver Town','345-678-9012','service@silverlakeuni.com','www.silverlakeuniversity.com'),('Starlight Institute','444 Star Rd, Star City','678-901-2345','support@starlightinst.com','www.starlightinstitute.com'),('Summit University','606 Summit Rd, Hilltop','901-234-5678','support@summituniversity.com','www.summituniversity.com'),('Sunrise University','555 Sunrise Ave, Sunville','789-012-3456','inquiry@sunriseuniversity.com','www.sunriseuniversity.com');
/*!40000 ALTER TABLE `University` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Week`
--

DROP TABLE IF EXISTS `Week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Week` (
  `Week_Number` int NOT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`Week_Number`,`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Week`
--

LOCK TABLES `Week` WRITE;
/*!40000 ALTER TABLE `Week` DISABLE KEYS */;
INSERT INTO `Week` VALUES (1,2023),(2,2023),(2,2024),(3,2023),(4,2023),(5,2023),(5,2024),(6,2023),(7,2023),(8,2023),(9,2023),(10,2023),(11,2023),(12,2023),(13,2023),(14,2023),(15,2023),(15,2024),(16,2023),(17,2023),(18,2023),(19,2023),(19,2024),(20,2023),(24,2023),(28,2023),(39,2023),(41,2023),(48,2023),(49,2023),(50,2023),(51,2023);
/*!40000 ALTER TABLE `Week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkLocation`
--

DROP TABLE IF EXISTS `WorkLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkLocation` (
  `name_of_location` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  PRIMARY KEY (`name_of_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkLocation`
--

LOCK TABLES `WorkLocation` WRITE;
/*!40000 ALTER TABLE `WorkLocation` DISABLE KEYS */;
INSERT INTO `WorkLocation` VALUES ('Location1','New York','NY'),('Location10','San Jose','CA'),('Location11','Austin','TX'),('Location12','Jacksonville','FL'),('Location13','Fort Worth','TX'),('Location14','Columbus','OH'),('Location15','Charlotte','NC'),('Location16','San Francisco','CA'),('Location17','Indianapolis','IN'),('Location18','Seattle','WA'),('Location19','Denver','CO'),('Location2','Los Angeles','CA'),('Location20','Washington','DC'),('Location3','Chicago','IL'),('Location4','Houston','TX'),('Location5','Phoenix','AZ'),('Location6','Philadelphia','PA'),('Location7','San Antonio','TX'),('Location8','San Diego','CA'),('Location9','Dallas','TX');
/*!40000 ALTER TABLE `WorkLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project_management2'
--

--
-- Dumping routines for database 'project_management2'
--
/*!50003 DROP FUNCTION IF EXISTS `next_salary_deposit_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `next_salary_deposit_date`() RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE today DATE;
    DECLARE next_deposit DATE;

    -- Get today's date
    SET today = CURDATE();

    -- Calculate the 1st of the next month
    -- If today is the 1st, it will return today's date
    -- Otherwise, it calculates the 1st of the next month
    SET next_deposit = LAST_DAY(today) + INTERVAL 1 DAY;

    RETURN next_deposit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEmployee`(
    IN _username VARCHAR(50), 
    IN _First_Name VARCHAR(50),
    IN _Last_Name VARCHAR(50), 
    IN _Hire_Date DATE, 
    IN _City VARCHAR(50), 
    IN _State VARCHAR(50), 
    IN _Salary DECIMAL, 
    IN _hashed_password VARCHAR(255),
    IN _Bank_Name VARCHAR(100),
    IN _WorkLocation_name_of_location VARCHAR(100),
    IN _Department_Name VARCHAR(100),
    IN _account_id INT,
    OUT _result INT
)
BEGIN
    DECLARE _usernameExists INT;
    DECLARE _nameExists INT;

    -- Check if the username already exists
    SELECT COUNT(*) INTO _usernameExists FROM Employee WHERE username = _username;

    -- Check if the first name and last name combination already exists
    SELECT COUNT(*) INTO _nameExists FROM Employee WHERE First_Name = _First_Name AND Last_Name = _Last_Name;

    IF _usernameExists > 0 THEN
        SET _result = -2; -- Username already exists
    ELSEIF _nameExists > 0 THEN
        SET _result = -3; -- First name and last name combination already exists
    ELSE
        -- Insert the new employee with the selected department, bank, location, and account ID
        INSERT INTO Employee (username, First_Name, Last_Name, Hire_Date, City, State, Salary, hashed_password, Bank_Name, WorkLocation_name_of_location, Department_Name, account_id) 
        VALUES (_username, _First_Name, _Last_Name, _Hire_Date, _City, _State, _Salary, _hashed_password, _Bank_Name, _WorkLocation_name_of_location, _Department_Name, _account_id);

        IF ROW_COUNT() > 0 THEN
            SET _result = 1; -- Successful insertion
        ELSE
            SET _result = 0; -- Failed insertion
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_upcoming_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_upcoming_salary`(
    IN emp_id INT, 
    IN month_num INT, 
    IN year_num INT, 
    OUT upcoming_salary DECIMAL(10,2)
)
BEGIN
    DECLARE base_salary DECIMAL(10,2);
    DECLARE leave_days INT DEFAULT 0;
    DECLARE leave_days_current_month INT;
    DECLARE leave_days_next_month INT;
    DECLARE deduction_per_day DECIMAL(10,2);
    DECLARE total_deduction DECIMAL(10,2);

    -- Get the base salary of the employee
    SELECT Salary INTO base_salary FROM Employee WHERE Employee_Id = emp_id;

    -- Calculate the number of leave days in the specified month
    SELECT 
        IFNULL(SUM(
            CASE
                WHEN MONTH(date_leave_requested) = month_num AND YEAR(date_leave_requested) = year_num THEN
                    DATEDIFF(LAST_DAY(date_leave_requested), date_leave_requested) + 1
                WHEN MONTH(date_leave_requested + INTERVAL number_of_weeks_requested * 7 DAY) = month_num AND YEAR(date_leave_requested + INTERVAL number_of_weeks_requested * 7 DAY) = year_num THEN
                    DATEDIFF(date_leave_requested + INTERVAL number_of_weeks_requested * 7 DAY, STR_TO_DATE(CONCAT(year_num, '-', month_num, '-01'), '%Y-%m-%d'))
                ELSE 0
            END
        ), 0) INTO leave_days_current_month
    FROM Employee_Week
    WHERE Employee_Id = emp_id AND status = 'Approved';

    -- Calculate deduction per day (3% of daily salary)
    SET deduction_per_day = (base_salary / 30) * 0.03;

    -- Calculate total deduction for the current month
    SET total_deduction = leave_days_current_month * deduction_per_day;

    -- Calculate the upcoming salary after deduction
    SET upcoming_salary = base_salary - total_deduction;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_employee_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_employee_password`(
    IN employee_id INT,
    IN old_password VARCHAR(255),
    IN new_password VARCHAR(255),
    OUT result_message int
)
BEGIN
    DECLARE password_match INT;

    -- Check if the old password matches
    SELECT COUNT(*) INTO password_match
    FROM Employee
    WHERE Employee.Employee_Id= employee_id AND hashed_password = old_password;

    IF password_match = 0 THEN
        SET result_message = 0;
    ELSE
        -- Update the password
        UPDATE employee
        SET hashed_password = new_password
        WHERE Employee.Employee_Id = employee_id;

        SET result_message = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_total_employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_total_employees`(OUT total_employees INT)
BEGIN
    SELECT COUNT(*) INTO total_employees FROM Employee;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee_proc`(IN emp_id INT, OUT result_message VARCHAR(255))
BEGIN
    DECLARE employee_exists INT;

    -- Check if the employee exists
    SELECT COUNT(*) INTO employee_exists FROM Employee WHERE Employee_Id = emp_id;

    -- If the employee exists, proceed with deletion
    IF employee_exists > 0 THEN
        -- Attempt to delete the employee
        DELETE FROM Employee WHERE Employee_Id = emp_id;

        -- Check if the deletion was successful
        IF ROW_COUNT() > 0 THEN
            SET result_message = 'Employee deleted successfully.';
        ELSE
            SET result_message = 'Failed to delete employee.';
        END IF;
    ELSE
        -- Employee does not exist
        SET result_message = 'Employee not found.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_employee_salary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_employee_salary`(IN emp_id INT, IN month_num INT, IN year_num INT, OUT total_salary DECIMAL(10,2))
BEGIN
    DECLARE base_salary DECIMAL(10,2);
    DECLARE leave_days INT;
    DECLARE deduction_per_day DECIMAL(10,2);
    DECLARE total_deduction DECIMAL(10,2);

    -- Get the base salary of the employee
    SELECT Salary INTO base_salary FROM Employee WHERE Employee_Id = emp_id;

    -- Calculate the number of leave days in the specified month
    SELECT IFNULL(SUM(number_of_weeks_requested * 7), 0) INTO leave_days
    FROM Employee_Week
    WHERE Emcheck_total_employeesployee_Id = emp_id AND MONTH(date_leave_requested) = month_num
    AND YEAR(date_leave_requested) = year_num AND status = 'Approved';

    -- Calculate deduction per day (3% of daily salary)
    SET deduction_per_day = (base_salary / 30) * 0.03;

    -- Calculate total deduction
    SET total_deduction = leave_days * deduction_per_day;

    -- Calculate the total salary after deduction
    SET total_salary = base_salary - total_deduction;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_employees_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_employees_count`(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM Employee;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_salaries_sum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_salaries_sum`(OUT total_salaries DECIMAL(15, 2))
BEGIN
    SELECT SUM(Salary) INTO total_salaries FROM Employee;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 15:06:09
