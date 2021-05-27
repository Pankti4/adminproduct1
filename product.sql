-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2021 at 03:53 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, 'Dairy Product', '1', '2021-05-12 11:02:14', '0000-00-00 00:00:00'),
(2, 'Beverages', '1', '2021-05-12 11:01:36', '0000-00-00 00:00:00'),
(4, 'Baking Goods', '1', '2021-05-12 14:22:20', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `state_id`, `name`, `status`, `created`, `updated`) VALUES
(1, 0, 1, 'Sydney', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 2, 'Perth', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 4, 'Basel', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 5, 'Winterthur', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 6, 'Geneva', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 0, 7, 'Castile', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 0, 8, 'Canary', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 0, 9, 'Basque', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 0, 10, 'Liverpool', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 0, 11, 'London', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 0, 12, 'Manchester', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 0, 13, 'New York', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 14, 'Los Angeles', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 0, 15, 'Houston', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, 'Australia', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Switzerland', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Spain', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'United Kingdom', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'India', '1', '2021-05-11 14:20:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active | 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `created`, `modified`, `status`) VALUES
(3, 'abc', '2021-05-07 09:30:55', '2021-05-07 09:30:55', 1),
(4, 'xyz', '2021-05-07 09:32:47', '2021-05-07 09:32:47', 1),
(5, 'xyz', '2021-05-07 09:41:05', '2021-05-07 09:41:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uploaded_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `gallery_id`, `file_name`, `uploaded_on`) VALUES
(6, 3, 'Screenshot_2021-05-03_133942.png', '2021-05-07 09:30:55'),
(7, 3, 'Screenshot_2021-05-03_141505.png', '2021-05-07 09:30:56'),
(8, 4, 'Screenshot_2021-04-19_144457.png', '2021-05-07 09:32:47'),
(9, 4, 'Screenshot_2021-05-03_133842.png', '2021-05-07 09:32:47'),
(10, 5, 'wp_1b.jpg', '2021-05-07 09:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pin`
--

CREATE TABLE `pin` (
  `id` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `ls_cod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pin`
--

INSERT INTO `pin` (`id`, `pincode`, `ls_cod`) VALUES
(1, 12209, 'Germany'),
(2, 5021, 'Maxico'),
(3, 5023, 'Maxico'),
(4, 8737, 'Brazil'),
(5, 21240, 'Finland'),
(6, 98128, 'USA'),
(7, 8737, 'Brazil'),
(8, 90110, 'Finland'),
(9, 70112, 'United States'),
(10, 380, 'Finland');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 0=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `subcategory_id`, `created`, `updated`, `status`) VALUES
(2, 'Product1', 2, 1, '2021-05-12 18:31:13', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `status`, `created`, `updated`) VALUES
(1, 1, 'New South Wales', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'Victoria', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'Queenland', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 'Bern', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 'Uri', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 'Zug', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 3, 'Aragon', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 3, 'Cantabria', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 3, 'Ceuta', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 4, 'Angus', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 4, 'BFPO', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 5, 'California', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 5, 'Georgia', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 5, 'Hawaii', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `st_id` int(11) NOT NULL,
  `st_name` varchar(50) NOT NULL,
  `co_id` int(11) NOT NULL,
  `sta_id` int(11) NOT NULL,
  `ci_id` int(11) NOT NULL,
  `location` varchar(500) NOT NULL,
  `time` datetime NOT NULL,
  `contact_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:Blocked, 1:Active',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `name`, `category_id`, `status`, `created`, `updated`) VALUES
(1, 'cheeses', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'eggs', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'milk', 1, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'coffee', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'juice', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'soda', 2, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'sandwich loaves', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'dinner rolls', 3, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `userName` varchar(120) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `userName`, `password`) VALUES
(1, 'admin', 'Test@12345');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(200) DEFAULT NULL,
  `lastName` varchar(200) DEFAULT NULL,
  `emailId` varchar(200) DEFAULT NULL,
  `mobileNumber` char(12) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `isActive` int(1) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `firstName`, `lastName`, `emailId`, `mobileNumber`, `userPassword`, `regDate`, `isActive`, `lastUpdationDate`) VALUES
(4, 'Abc', 'Xyz', 'abc@xyz.com', '1234567908', 'Test@123', '2018-12-25 18:43:33', 1, NULL),
(5, 'Isha', 'Bhatt', 'isha1@gmail.com', '1234567896', 'Isha@1234', '2021-04-29 08:33:10', 1, '2021-05-11 06:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `CustomerID` int(11) NOT NULL,
  `PostalCode` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`CustomerID`, `PostalCode`) VALUES
(1, '12209'),
(2, '5021'),
(3, '5023'),
(4, 'WA1 1DP'),
(5, '08737-363'),
(6, '01-012'),
(7, '21240'),
(8, '98128'),
(9, '08737-363'),
(10, '90110'),
(11, '70112'),
(12, '00380'),
(13, '7803'),
(14, 'ON L4M 3B1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pin`
--
ALTER TABLE `pin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `test3` (`co_id`),
  ADD KEY `test4` (`sta_id`),
  ADD KEY `test5` (`ci_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pin`
--
ALTER TABLE `pin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
