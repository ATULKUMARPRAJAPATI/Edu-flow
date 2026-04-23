-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: miniproject
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_Code` varchar(10) NOT NULL,
  `Course_Title` varchar(100) DEFAULT NULL,
  `Course_Credit` int DEFAULT NULL,
  `Teacher_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Course_Code`),
  UNIQUE KEY `unique_course` (`Course_Code`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CS101','Database Systems',3,'T001'),('CS102','Operating Systems',3,'T002'),('CS103','Computer Networks',3,'T003'),('CS104','Software Engineering',3,'T004'),('CS105','Data Structures',3,'T005'),('CS106','Artificial Intelligence',3,'T001'),('CS999','Quantum Computing',3,'T001');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_enrollment_count`
--

DROP TABLE IF EXISTS `course_enrollment_count`;
/*!50001 DROP VIEW IF EXISTS `course_enrollment_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `course_enrollment_count` AS SELECT 
 1 AS `Course_Code`,
 1 AS `Total_Enrollments`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_fees`
--

DROP TABLE IF EXISTS `course_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_fees` (
  `Fee_ID` varchar(10) NOT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Semester` int DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  PRIMARY KEY (`Fee_ID`),
  KEY `Course_Code` (`Course_Code`),
  CONSTRAINT `course_fees_ibfk_1` FOREIGN KEY (`Course_Code`) REFERENCES `course` (`Course_Code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_fees`
--

LOCK TABLES `course_fees` WRITE;
/*!40000 ALTER TABLE `course_fees` DISABLE KEYS */;
INSERT INTO `course_fees` VALUES ('F001','CS101',33000.00,1,'2024-08-31'),('F002','CS102',31000.00,1,'2024-08-31'),('F003','CS103',33000.00,1,'2024-08-31'),('F004','CS104',30000.00,1,'2024-08-31'),('F005','CS105',31000.00,1,'2024-08-31');
/*!40000 ALTER TABLE `course_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `Enroll_ID` int NOT NULL,
  `Student_ID` varchar(10) DEFAULT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Enrollment_Date` date DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  `Fee_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Enroll_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Course_Code` (`Course_Code`),
  KEY `Fee_ID` (`Fee_ID`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`Course_Code`) REFERENCES `course` (`Course_Code`),
  CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`Fee_ID`) REFERENCES `course_fees` (`Fee_ID`),
  CONSTRAINT `fk_course` FOREIGN KEY (`Course_Code`) REFERENCES `course` (`Course_Code`),
  CONSTRAINT `fk_student` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1001,'S001','CS101','2024-01-01','A','F001'),(1002,'S002','CS102','2024-01-02','B','F002'),(1003,'S003','CS103','2024-01-03','A','F003'),(1004,'S004','CS104','2024-01-04','B','F004'),(1005,'S005','CS105','2024-01-05','A','F005'),(1006,'S006','CS101','2024-01-06','B','F001'),(1007,'S007','CS102','2024-01-07','A','F002'),(1008,'S008','CS103','2024-01-08','B','F003'),(1009,'S009','CS104','2024-01-09','A','F004'),(1010,'S010','CS105','2024-01-10','B','F005'),(1011,'S001','CS102','2024-01-11','A','F002'),(1012,'S002','CS103','2024-01-12','B','F003'),(1013,'S003','CS104','2024-01-13','A','F004'),(1014,'S004','CS105','2024-01-14','B','F005'),(1015,'S005','CS101','2024-01-15','A','F001'),(1016,'S006','CS102','2024-01-16','B','F002'),(1017,'S007','CS103','2024-01-17','A','F003'),(1018,'S008','CS104','2024-01-18','B','F004'),(1019,'S009','CS105','2024-01-19','A','F005'),(1020,'S010','CS101','2024-01-20','B','F001'),(1021,'S011','CS101','2024-02-01','A','F001'),(1022,'S011','CS103','2024-02-02','B','F003'),(1023,'S012','CS102','2024-02-03','A','F002'),(1024,'S012','CS104','2024-02-04','B','F004'),(1025,'S013','CS101','2024-02-05','A','F001'),(1026,'S013','CS105','2024-02-06','B','F005'),(1027,'S014','CS103','2024-02-07','A','F003'),(1028,'S014','CS104','2024-02-08','B','F004'),(1029,'S015','CS102','2024-02-09','A','F002'),(1030,'S015','CS105','2024-02-10','B','F005'),(1031,'S016','CS101','2026-04-15','F',NULL),(1032,'S018','CS101','2026-04-15','F',NULL),(1033,'S019','CS101','2026-04-15','F',NULL),(2000,'S100','CS101','2026-04-15','F',NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_grade` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NEW.Grade NOT IN ('A','B','C','D','F') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Grade';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_enrollment_insert` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NEW.Grade NOT IN ('A','B','C','D','F') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Grade';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_default_grade` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NEW.Grade IS NULL THEN
        SET NEW.Grade = 'F';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_default_enrollment_date` BEFORE INSERT ON `enrollment` FOR EACH ROW BEGIN
    IF NEW.Enrollment_Date IS NULL THEN
        SET NEW.Enrollment_Date = CURRENT_DATE;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `enrollment_errors`
--

DROP TABLE IF EXISTS `enrollment_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment_errors` (
  `Error_ID` int NOT NULL AUTO_INCREMENT,
  `Student_ID` varchar(10) DEFAULT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Invalid_Grade` varchar(5) DEFAULT NULL,
  `Error_Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Error_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_errors`
--

LOCK TABLES `enrollment_errors` WRITE;
/*!40000 ALTER TABLE `enrollment_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_ID` varchar(10) NOT NULL,
  `Student_Name` varchar(100) DEFAULT NULL,
  `Father_Name` varchar(100) DEFAULT NULL,
  `Father_Mobile` varchar(15) DEFAULT NULL,
  `Mother_Name` varchar(100) DEFAULT NULL,
  `Student_Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('S001','Aarav Sharma','Rajesh Sharma','9876543210','Sunita Sharma','9123456780','aarav@gmail.com','2002-03-15','Delhi'),('S002','Ananya Verma','Suresh Verma','9876543211','Neeta Verma','9123456781','ananya@gmail.com','2001-07-21','Mumbai'),('S003','Rohan Mehta','Vikas Mehta','9876543212','Pooja Mehta','9123456782','rohan@gmail.com','2002-01-10','Ahmedabad'),('S004','Priya Singh','Manoj Singh','9876543213','Kavita Singh','9123456783','priya@gmail.com','2001-11-05','Lucknow'),('S005','Karan Patel','Mahesh Patel','9876543214','Rekha Patel','9123456784','karan@gmail.com','2002-06-18','Surat'),('S006','Sneha Iyer','Ramesh Iyer','9876543215','Latha Iyer','9123456785','sneha@gmail.com','2001-02-25','Chennai'),('S007','Aditya Rao','Sanjay Rao','9876543216','Anita Rao','9123456786','aditya@gmail.com','2002-09-30','Bangalore'),('S008','Pooja Nair','Krishnan Nair','9876543217','Meera Nair','9123456787','pooja@gmail.com','2001-04-14','Kochi'),('S009','Vivek Gupta','Alok Gupta','9876543218','Shalini Gupta','9123456788','vivek@gmail.com','2002-12-02','Jaipur'),('S010','Neha Kapoor','Rohit Kapoor','9876543219','Seema Kapoor','9123456789','neha@gmail.com','2001-08-19','Chandigarh'),('S011','Rahul Malhotra','Amit Malhotra','9880011111','Neena Malhotra','9130011111','rahul@gmail.com','2002-05-12','Pune'),('S012','Kavya Reddy','Ramesh Reddy','9880022222','Sujatha Reddy','9130022222','kavya@gmail.com','2001-10-08','Hyderabad'),('S013','Arjun Das','Suman Das','9880033333','Mita Das','9130033333','arjun@gmail.com','2002-02-17','Kolkata'),('S014','Mehul Jain','Rakesh Jain','9880044444','Poonam Jain','9130044444','mehul@gmail.com','2001-06-29','Indore'),('S015','Nisha Kulkarni','Prakash Kulkarni','9880055555','Smita Kulkarni','9130055555','nisha@gmail.com','2002-11-03','Nagpur'),('S016','Test Student','Test Father',NULL,NULL,'9999999999','test@gmail.com',NULL,NULL),('S017','New Student','New Father',NULL,NULL,'9999999998','newstudent@gmail.com',NULL,NULL),('S018','Test Student','Test Father',NULL,NULL,'9999999990','test18@gmail.com',NULL,NULL),('S019','New Student','New Father',NULL,NULL,'9999999998','newstudent19@gmail.com',NULL,NULL),('S100','John Doe','John Father',NULL,NULL,'8888888888','john@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_details`
--

DROP TABLE IF EXISTS `student_course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_details` (
  `Student_ID` varchar(10) DEFAULT NULL,
  `Student_Name` varchar(100) DEFAULT NULL,
  `Father_Name` varchar(100) DEFAULT NULL,
  `Student_Mobile` varchar(15) DEFAULT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Course_Title` varchar(100) DEFAULT NULL,
  `Teacher_Name` varchar(50) DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_details`
--

LOCK TABLES `student_course_details` WRITE;
/*!40000 ALTER TABLE `student_course_details` DISABLE KEYS */;
INSERT INTO `student_course_details` VALUES ('S001','Aarav Sharma','Rajesh Sharma','9123456780','CS101','Database Systems','Dr. Rajesh Kumar','A'),('S001','Aarav Sharma','Rajesh Sharma','9123456780','CS102','Operating Systems','Dr. Priya Sharma','A'),('S002','Ananya Verma','Suresh Verma','9123456781','CS101','Database Systems','Dr. Rajesh Kumar','B'),('S002','Ananya Verma','Suresh Verma','9123456781','CS103','Computer Networks','Prof. Amit Verma','A'),('S003','Rohan Mehta','Vikas Mehta','9123456782','CS101','Database Systems','Dr. Rajesh Kumar','A'),('S003','Rohan Mehta','Vikas Mehta','9123456782','CS104','Software Engineering','Prof. Rohan Mehta','B'),('S004','Priya Singh','Manoj Singh','9123456783','CS105','Data Structures','Dr. Sneha Iyer','A'),('S004','Priya Singh','Manoj Singh','9123456783','CS101','Database Systems','Dr. Rajesh Kumar','B'),('S005','Karan Patel','Mahesh Patel','9123456784','CS102','Operating Systems','Dr. Priya Sharma','A'),('S005','Karan Patel','Mahesh Patel','9123456784','CS103','Computer Networks','Prof. Amit Verma','B'),('S006','Sneha Iyer','Ramesh Iyer','9123456785','CS104','Software Engineering','Prof. Rohan Mehta','A'),('S006','Sneha Iyer','Ramesh Iyer','9123456785','CS105','Data Structures','Dr. Sneha Iyer','B'),('S007','Aditya Rao','Sanjay Rao','9123456786','CS101','Database Systems','Dr. Rajesh Kumar','A'),('S007','Aditya Rao','Sanjay Rao','9123456786','CS102','Operating Systems','Dr. Priya Sharma','B'),('S008','Pooja Nair','Krishnan Nair','9123456787','CS103','Computer Networks','Prof. Amit Verma','A'),('S008','Pooja Nair','Krishnan Nair','9123456787','CS104','Software Engineering','Prof. Rohan Mehta','B'),('S009','Vivek Gupta','Alok Gupta','9123456788','CS105','Data Structures','Dr. Sneha Iyer','A'),('S009','Vivek Gupta','Alok Gupta','9123456788','CS101','Database Systems','Dr. Rajesh Kumar','B'),('S010','Neha Kapoor','Rohit Kapoor','9123456789','CS102','Operating Systems','Dr. Priya Sharma','A'),('S010','Neha Kapoor','Rohit Kapoor','9123456789','CS103','Computer Networks','Prof. Amit Verma','B'),('S011','Rahul Malhotra','Amit Malhotra','9130011111','CS104','Software Engineering','Prof. Rohan Mehta','A'),('S011','Rahul Malhotra','Amit Malhotra','9130011111','CS105','Data Structures','Dr. Sneha Iyer','B'),('S012','Kavya Reddy','Ramesh Reddy','9130022222','CS101','Database Systems','Dr. Rajesh Kumar','A'),('S012','Kavya Reddy','Ramesh Reddy','9130022222','CS102','Operating Systems','Dr. Priya Sharma','B'),('S013','Arjun Das','Suman Das','9130033333','CS103','Computer Networks','Prof. Amit Verma','A'),('S013','Arjun Das','Suman Das','9130033333','CS104','Software Engineering','Prof. Rohan Mehta','B'),('S014','Mehul Jain','Rakesh Jain','9130044444','CS105','Data Structures','Dr. Sneha Iyer','A'),('S014','Mehul Jain','Rakesh Jain','9130044444','CS101','Database Systems','Dr. Rajesh Kumar','B'),('S015','Nisha Kulkarni','Prakash Kulkarni','9130055555','CS102','Operating Systems','Dr. Priya Sharma','A'),('S015','Nisha Kulkarni','Prakash Kulkarni','9130055555','CS103','Computer Networks','Prof. Amit Verma','B');
/*!40000 ALTER TABLE `student_course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_course_grades`
--

DROP TABLE IF EXISTS `student_course_grades`;
/*!50001 DROP VIEW IF EXISTS `student_course_grades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_course_grades` AS SELECT 
 1 AS `Student_Name`,
 1 AS `Course_Title`,
 1 AS `Grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!50001 DROP VIEW IF EXISTS `student_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_courses` AS SELECT 
 1 AS `Student_Name`,
 1 AS `Course_Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `Teacher_ID` varchar(10) NOT NULL,
  `Teacher_Name` varchar(50) NOT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL,
  PRIMARY KEY (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('T001','Dr. Rajesh Kumar','Professor','rajesh@srm.edu','9988776655','2010-07-01'),('T002','Dr. Priya Sharma','Associate Professor','priya@srm.edu','9988776656','2012-08-15'),('T003','Prof. Amit Verma','Assistant Professor','amit@srm.edu','9988776657','2015-01-10'),('T004','Dr. Sneha Iyer','Professor','sneha@srm.edu','9988776658','2008-11-20'),('T005','Prof. Rohan Mehta','Assistant Professor','rohan@srm.edu','9988776659','2018-06-05');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_students`
--

DROP TABLE IF EXISTS `top_students`;
/*!50001 DROP VIEW IF EXISTS `top_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_students` AS SELECT 
 1 AS `Student_Name`,
 1 AS `Course_Title`,
 1 AS `Grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'miniproject'
--

--
-- Dumping routines for database 'miniproject'
--
/*!50003 DROP FUNCTION IF EXISTS `get_grade_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_grade_count`(course VARCHAR(10)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM enrollment
    WHERE Course_Code = course;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cs101_grades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cs101_grades`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sname VARCHAR(100);
    DECLARE grade VARCHAR(5);
    DECLARE cur CURSOR FOR
        SELECT s.Student_Name, e.Grade
        FROM student s
        JOIN enrollment e ON s.Student_ID = e.Student_ID
        WHERE e.Course_Code = 'CS101';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sname, grade;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT sname AS Student_Name, grade AS Grade;
    END LOOP;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_students`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid VARCHAR(10);

    DECLARE cur CURSOR FOR
        SELECT Student_ID FROM student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sid;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT sid AS Student_ID;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_student_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student_details`(IN sid VARCHAR(10))
BEGIN
    SELECT * 
    FROM student 
    WHERE Student_ID = sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handler_example` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handler_example`()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error occurred during execution' AS ErrorMessage;
    END;

    -- Example statement that could fail
    SELECT * FROM non_existing_table;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_courses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_courses`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cname VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT Course_Title FROM course;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    CREATE TEMPORARY TABLE IF NOT EXISTS course_list (Course_Title VARCHAR(100));

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO cname;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO course_list VALUES (cname);
    END LOOP;
    CLOSE cur;

    SELECT * FROM course_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `simple_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `simple_cursor`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sname VARCHAR(100);
    DECLARE cur CURSOR FOR
        SELECT Student_Name FROM student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sname;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT sname AS Student_Name;
    END LOOP;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `student_course_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_course_count`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sid VARCHAR(10);
    DECLARE sname VARCHAR(100);
    DECLARE course_count INT;

    DECLARE cur CURSOR FOR
        SELECT Student_ID, Student_Name FROM student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sid, sname;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*) INTO course_count
        FROM enrollment
        WHERE Student_ID = sid;

        SELECT sname AS Student_Name, course_count AS Total_Courses;
    END LOOP;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `course_enrollment_count`
--

/*!50001 DROP VIEW IF EXISTS `course_enrollment_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_enrollment_count` AS select `enrollment`.`Course_Code` AS `Course_Code`,count(`enrollment`.`Student_ID`) AS `Total_Enrollments` from `enrollment` group by `enrollment`.`Course_Code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_course_grades`
--

/*!50001 DROP VIEW IF EXISTS `student_course_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_course_grades` AS select `s`.`Student_Name` AS `Student_Name`,`c`.`Course_Title` AS `Course_Title`,`e`.`Grade` AS `Grade` from ((`student` `s` join `enrollment` `e` on((`s`.`Student_ID` = `e`.`Student_ID`))) join `course` `c` on((`e`.`Course_Code` = `c`.`Course_Code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_courses`
--

/*!50001 DROP VIEW IF EXISTS `student_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_courses` AS select `s`.`Student_Name` AS `Student_Name`,`c`.`Course_Title` AS `Course_Title` from ((`student` `s` join `enrollment` `e` on((`s`.`Student_ID` = `e`.`Student_ID`))) join `course` `c` on((`e`.`Course_Code` = `c`.`Course_Code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_students`
--

/*!50001 DROP VIEW IF EXISTS `top_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_students` AS select `s`.`Student_Name` AS `Student_Name`,`c`.`Course_Title` AS `Course_Title`,`e`.`Grade` AS `Grade` from ((`student` `s` join `enrollment` `e` on((`s`.`Student_ID` = `e`.`Student_ID`))) join `course` `c` on((`e`.`Course_Code` = `c`.`Course_Code`))) where (`e`.`Grade` = 'A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-19 23:48:18
