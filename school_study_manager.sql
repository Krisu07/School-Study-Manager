-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19.02.2024 klo 10:06
-- Palvelimen versio: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_study_manager`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Topic` varchar(100) DEFAULT NULL,
  `Teacher` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `course`
--

INSERT INTO `course` (`CourseID`, `Name`, `Topic`, `Teacher`) VALUES
(101, 'Introduction to Programming', 'Computer Science', 'John Teacher'),
(102, 'Database Management', 'Computer Science', 'Leena Teacher'),
(103, 'Web Development', 'Computer Science', 'Anna Instructor'),
(104, 'Data Structures and Algorithms', 'Computer Science', 'Mike Professor');

-- --------------------------------------------------------

--
-- Rakenne taululle `enrollment`
--

CREATE TABLE `enrollment` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Grade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `enrollment`
--

INSERT INTO `enrollment` (`EnrollmentID`, `StudentID`, `CourseID`, `Grade`) VALUES
(1, 1, 101, '5'),
(2, 1, 102, '4'),
(3, 2, 101, '3'),
(4, 2, 102, '5'),
(5, 3, 101, '4'),
(6, 4, 103, '4.5');

-- --------------------------------------------------------

--
-- Rakenne taululle `schoolexpenses`
--

CREATE TABLE `schoolexpenses` (
  `ExpenseID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ExpenseAmount` decimal(10,2) DEFAULT NULL,
  `ExpenseDate` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `schoolexpenses`
--

INSERT INTO `schoolexpenses` (`ExpenseID`, `StudentID`, `ExpenseAmount`, `ExpenseDate`, `Description`) VALUES
(1, 1, 250.00, '2024-02-15', 'Textbooks'),
(2, 2, 150.00, '2024-02-10', 'Stationery'),
(3, 3, 300.00, '2024-02-20', 'Lab equipment');

-- --------------------------------------------------------

--
-- Rakenne taululle `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `student`
--

INSERT INTO `student` (`StudentID`, `Firstname`, `Lastname`, `Birthdate`, `Gender`) VALUES
(1, 'Matti', 'Meikäläinen', '2000-05-15', 'Male'),
(2, 'Maija', 'Mallikas', '2001-08-20', 'Female'),
(3, 'John', 'Doe', '1999-03-25', 'Male'),
(4, 'Jane', 'Smith', '2000-11-12', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `schoolexpenses`
--
ALTER TABLE `schoolexpenses`
  ADD PRIMARY KEY (`ExpenseID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Rajoitteet taululle `schoolexpenses`
--
ALTER TABLE `schoolexpenses`
  ADD CONSTRAINT `schoolexpenses_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
