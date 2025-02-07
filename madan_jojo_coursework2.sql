-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 06:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `madan_jojo_coursework2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `SessionID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `FeePrepaid` char(1) DEFAULT NULL CHECK (`FeePrepaid` in ('Y','N'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `SessionID`, `CustomerID`, `FeePrepaid`) VALUES
(1, 1, 1, 'N'),
(2, 1, 2, 'N'),
(3, 1, 3, 'Y'),
(4, 1, 4, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `ConsoleID` int(11) NOT NULL,
  `ConsoleName` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`ConsoleID`, `ConsoleName`, `Quantity`) VALUES
(1, 'Xbox 360', 3),
(2, 'PS3', 2),
(3, 'PS2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `MemberTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `DateOfBirth`, `MemberTypeID`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneshwor, KTM', '2015-03-01', 1),
(2, 'Bill', 'Gates', 'Maitidevi, KTM', '2001-12-10', 2),
(3, 'Elon', 'Musk', 'Putalisadak, KTM', '2003-07-20', 2),
(4, 'Kamala', 'Harris', 'Kapan, KTM', '1973-05-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `FloorID` int(11) NOT NULL,
  `FloorName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`FloorID`, `FloorName`) VALUES
(1, 'Ground Floor'),
(2, 'First Floor');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `GameID` int(11) NOT NULL,
  `GameName` varchar(50) DEFAULT NULL,
  `ConsoleID` int(11) DEFAULT NULL,
  `PEGIRating` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`GameID`, `GameName`, `ConsoleID`, `PEGIRating`) VALUES
(1, 'Elden Ring', 1, 'PG'),
(2, 'Final Fantasy VII Rebirth', 2, 'PG'),
(3, 'Destiny 2', 3, 'PG'),
(4, 'Tekken 8', 2, 'PG');

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `MachineID` int(11) NOT NULL,
  `GameID` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `FloorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`MachineID`, `GameID`, `Year`, `FloorID`) VALUES
(1, 1, 2010, 1),
(2, 2, 2013, 1),
(3, 3, 2004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membershiptypes`
--

CREATE TABLE `membershiptypes` (
  `MemberTypeID` int(11) NOT NULL,
  `MemberType` varchar(20) DEFAULT NULL,
  `Fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membershiptypes`
--

INSERT INTO `membershiptypes` (`MemberTypeID`, `MemberType`, `Fee`) VALUES
(1, 'Standard', 1500.00),
(2, 'Premium', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SessionID` int(11) NOT NULL,
  `Day` varchar(20) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `FloorID` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SessionID`, `Day`, `StartTime`, `EndTime`, `Type`, `FloorID`, `Price`) VALUES
(1, 'Sunday', '09:00:00', '21:00:00', 'Free Play', 1, 1500.00),
(2, 'Sunday', '09:00:00', '21:00:00', 'Free Play', 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`) VALUES
(1, 'Sagar', 'Aryal'),
(2, 'Bikesh', 'Khagdi'),
(3, 'Saroj', 'Sapkota');

-- --------------------------------------------------------

--
-- Table structure for table `staffroles`
--

CREATE TABLE `staffroles` (
  `SessionID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffroles`
--

INSERT INTO `staffroles` (`SessionID`, `StaffID`, `Role`) VALUES
(1, 1, 'Cafe'),
(1, 2, 'Maintenance'),
(1, 3, 'Counter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`ConsoleID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`FloorID`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`GameID`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`MachineID`),
  ADD KEY `GameID` (`GameID`);

--
-- Indexes for table `membershiptypes`
--
ALTER TABLE `membershiptypes`
  ADD PRIMARY KEY (`MemberTypeID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `staffroles`
--
ALTER TABLE `staffroles`
  ADD PRIMARY KEY (`SessionID`,`StaffID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `machines_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`);

--
-- Constraints for table `staffroles`
--
ALTER TABLE `staffroles`
  ADD CONSTRAINT `staffroles_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `sessions` (`SessionID`),
  ADD CONSTRAINT `staffroles_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
