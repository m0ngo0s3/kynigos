-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2019 at 03:56 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kynigos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_data`
--

CREATE TABLE `agent_data` (
  `agent_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Agent data';

-- --------------------------------------------------------

--
-- Table structure for table `job_courier`
--

CREATE TABLE `job_courier` (
  `courier_id` int(11) NOT NULL,
  `assigned_agent` int(11) DEFAULT NULL,
  `source` varchar(60) DEFAULT NULL,
  `destination` varchar(60) DEFAULT NULL,
  `status` enum('pending','in progress','completed','cancelled') DEFAULT 'pending',
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data store for courier jobs.';

-- --------------------------------------------------------

--
-- Table structure for table `job_escort`
--

CREATE TABLE `job_escort` (
  `courier_id` int(11) NOT NULL,
  `assigned_agent` int(11) DEFAULT NULL,
  `source` varchar(60) DEFAULT NULL,
  `destination` varchar(60) DEFAULT NULL,
  `status` enum('pending','in progress','completed','cancelled') DEFAULT 'pending',
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job_response`
--

CREATE TABLE `job_response` (
  `courier_id` int(11) NOT NULL,
  `assigned_agent` int(11) DEFAULT NULL,
  `source` varchar(60) DEFAULT NULL,
  `destination` varchar(60) DEFAULT NULL,
  `status` enum('pending','in progress','completed','cancelled') DEFAULT 'pending',
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data for when and where users logged in.';

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `agent_id` varchar(10) NOT NULL,
  `access_level` enum('admin','officer','clerk','manager') NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to store information about users.';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_data`
--
ALTER TABLE `agent_data`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `job_courier`
--
ALTER TABLE `job_courier`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user` (`user_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
