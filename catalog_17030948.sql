-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2019 at 07:28 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalog_17030948`
--

-- --------------------------------------------------------

--
-- Table structure for table `companyhead`
--

CREATE TABLE `companyhead` (
  `HeadName` varchar(30) NOT NULL,
  `Landline` varchar(30) NOT NULL,
  `Mobile` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companyhead`
--

INSERT INTO `companyhead` (`HeadName`, `Landline`, `Mobile`, `Email`) VALUES
('Summit Shakya', '014444444', '7418529630', 'summitshakya@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(30) NOT NULL,
  `DeptHead` varchar(30) NOT NULL,
  `DeptDescription` varchar(100) NOT NULL,
  `NumberOfProjects` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DeptID`, `DeptName`, `DeptHead`, `DeptDescription`, `NumberOfProjects`) VALUES
(1, 'Production', 'Sujan Mahat', 'The production department works for development of products.', '5 tasks '),
(2, 'Marketing', 'Lijen Basnet', 'This department works for the betterment of the business.', '2 tasks '),
(3, 'Accounting', 'Rehana Shrestha', 'This department works for maintaining the accounting records of the company.', '2 tasks '),
(4, 'Human Resource Management', 'Siron Rana', 'This department works for management of available human resources in the company.', '1 tasks '),
(5, 'Research And Development', 'Malina Joshi', 'This department works for betterment of available services and development of new services.', '1 tasks ');

-- --------------------------------------------------------

--
-- Table structure for table `onestopitcompany`
--

CREATE TABLE `onestopitcompany` (
  `Name` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  `PostBox` varchar(10) NOT NULL,
  `Phone1` varchar(25) NOT NULL,
  `Phone2` varchar(10) DEFAULT NULL,
  `Website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onestopitcompany`
--

INSERT INTO `onestopitcompany` (`Name`, `City`, `State`, `PostBox`, `Phone1`, `Phone2`, `Website`) VALUES
('One Stop IT Company', 'Lalitpur', 'State-3', '0234', '015555555', '015454545', 'www.onestopit.com');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `StaffID` varchar(5) NOT NULL,
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(50) NOT NULL,
  `StaffName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`StaffID`, `DeptID`, `DeptName`, `StaffName`) VALUES
('ST01', 1, 'Production', 'Sudip'),
('ST02', 1, 'Production', 'Tejashwi'),
('ST03', 1, 'Production', 'Bibek'),
('ST04', 2, 'Accounting', 'Sulav'),
('ST05', 2, 'Accounting', 'Angel'),
('ST06', 3, 'Marketing', 'Ayusha'),
('ST07', 4, 'Human Resource Management', 'Salin'),
('ST08', 4, 'Human Resource Management', 'Kunjal'),
('ST09', 5, 'Research And Development', 'Kashish'),
('ST10', 5, 'Research And Development', 'Nimesh');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
