-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2023 at 02:52 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aamir`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CAT_ID`, `CAT_NAME`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_ID` int(11) NOT NULL,
  `CUS_NAME` varchar(20) NOT NULL,
  `CUS_PHONE` varchar(10) NOT NULL,
  `CUS_CITY` varchar(30) NOT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUS_ID`, `CUS_NAME`, `CUS_PHONE`, `CUS_CITY`, `CUS_GENDER`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `ORD_ID` int(11) NOT NULL,
  `ORD_AMOUNT` int(11) NOT NULL,
  `ORD_DATE` date DEFAULT NULL,
  `CUS_ID` int(11) NOT NULL,
  `PRICING_ID` int(11) NOT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  KEY `PRICING_ID` (`PRICING_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORD_ID`, `ORD_AMOUNT`, `ORD_DATE`, `CUS_ID`, `PRICING_ID`) VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14),
(117, 6000, '2023-05-02', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `PRO_ID` int(11) NOT NULL,
  `PRO_NAME` varchar(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int(11) NOT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `CAT_ID` (`CAT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PRO_ID`, `PRO_NAME`, `PRO_DESC`, `CAT_ID`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `RAT_ID` int(11) NOT NULL,
  `ORD_ID` int(11) NOT NULL,
  `RAT_RATSTARS` int(11) NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  KEY `ORD_ID` (`ORD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`RAT_ID`, `ORD_ID`, `RAT_RATSTARS`) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `SUPP_ID` int(11) NOT NULL,
  `SUPP_NAME` varchar(50) NOT NULL,
  `SUPP_CITY` varchar(50) DEFAULT NULL,
  `SUPP_PHONE` varchar(10) NOT NULL,
  PRIMARY KEY (`SUPP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SUPP_ID`, `SUPP_NAME`, `SUPP_CITY`, `SUPP_PHONE`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_pricing`
--

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `PRICING_ID` int(11) NOT NULL,
  `PRO_ID` int(11) NOT NULL,
  `SUPP_ID` int(11) NOT NULL,
  `SUPP_PRICE` int(11) DEFAULT '0',
  PRIMARY KEY (`PRICING_ID`),
  KEY `PRO_ID` (`PRO_ID`),
  KEY `SUPP_ID` (`SUPP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_pricing`
--

INSERT INTO `supplier_pricing` (`PRICING_ID`, `PRO_ID`, `SUPP_ID`, `SUPP_PRICE`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);
