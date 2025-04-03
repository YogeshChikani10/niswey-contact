-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2025 at 10:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niswey_contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(3, 'Joseph', '+90 985 88888', 'joshep@yopmail.com', 'Berlin', '2025-04-03 20:50:04', '2025-04-03 21:51:27'),
(4, 'John Doe', '+90 333 8859342', 'john@example.com', '123 Main St, City A', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(5, 'Jane Smith', '+91 987 6543210', 'jane@example.com', '456 Elm St, City B', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(6, 'Michael Johnson', '+44 203 1234567', 'michael@example.com', '789 Oak St, City C', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(7, 'Emma Williams', '+61 423 876543', 'emma@example.com', '101 Pine St, City D', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(8, 'Olivia Brown', '+49 151 23456789', 'olivia@example.com', '202 Cedar St, City E', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(9, 'Liam Davis', '+1 555 1234567', 'liam@example.com', '303 Birch St, City F', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(10, 'Noah Wilson', '+33 6 12345678', 'noah@example.com', '404 Maple St, City G', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(11, 'Ava Moore', '+81 80 1234 5678', 'ava@example.com', '505 Walnut St, City H', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(12, 'Isabella Taylor', '+82 10 9876 5432', 'isabella@example.com', '606 Chestnut St, City I', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(13, 'Elijah Anderson', '+91 81234 56789', 'elijah@example.com', '707 Poplar St, City J', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(14, 'Sophia Martinez', '+55 21 98765 4321', 'sophia@example.com', '808 Cypress St, City K', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(15, 'James Clark', '+39 347 1234567', 'james@example.com', '909 Spruce St, City L', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(16, 'Benjamin Lewis', '+66 81 234 5678', 'benjamin@example.com', '1010 Ash St, City M', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(17, 'Mia Walker', '+31 6 12345678', 'mia@example.com', '1111 Redwood St, City N', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(18, 'Lucas Hall', '+86 138 00138000', 'lucas@example.com', '1212 Magnolia St, City O', '2025-04-03 22:32:08', '2025-04-03 22:32:08'),
(20, 'Ryan Cooper', '+1 212 5551234', 'ryan.cooper@usmail.com', '12 Broadway, New York', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(21, 'Lily Parker', '+44 20 7766554', 'lily.parker@ukmail.co.uk', '88 Queen St, London', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(22, 'Aiden Patel', '+91 9876543211', 'aiden.patel@inmail.com', '22 MG Road, Mumbai', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(23, 'Emily Scott', '+61 2 99887766', 'emily.scott@au.com', '45 Harbor St, Sydney', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(24, 'Daniel Kim', '+82 2 44556677', 'daniel.kim@krmail.kr', '78 Han River Rd, Seoul', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(25, 'Hannah Li', '+86 10 22334455', 'hannah.li@cn.com', '19 Silk Road, Beijing', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(26, 'Jake Foster', '+27 11 66554433', 'jake.foster@za.com', '102 Market St, Johannesburg', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(27, 'Sophie Nguyen', '+65 87654321', 'sophie.nguyen@sgmail.com', '11 Orchard Lane, Singapore', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(28, 'Lucas Evans', '+49 30 66778899', 'lucas.evans@de.com', '53 Alexanderplatz, Berlin', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(29, 'Zara Khan', '+971 4 33221100', 'zara.khan@uaemail.ae', '27 Palm Jumeirah, Dubai', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(30, 'Ethan Bennett', '+33 1 99887766', 'ethan.bennett@frmail.fr', '20 Champs-Élysées, Paris', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(31, 'Mia Torres', '+34 91 77665544', 'mia.torres@esmail.es', '55 Gran Via, Madrid', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(32, 'Leo Silva', '+55 21 44332211', 'leo.silva@brmail.com', '101 Copacabana, Rio', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(33, 'Chloe Wong', '+852 28987654', 'chloe.wong@hkmail.hk', '60 Victoria Park, Hong Kong', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(34, 'Nathan Brown', '+7 495 22446688', 'nathan.brown@ru.com', '100 Red Square, Moscow', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(35, 'Alice Dubois', '+41 22 11223344', 'alice.dubois@chmail.ch', '14 Lake Road, Geneva', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(36, 'Samira Ali', '+20 2 66778899', 'samira.ali@egmail.com', '5 Nile St, Cairo', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(37, 'Victor Schmidt', '+32 2 55443322', 'victor.schmidt@belmail.be', '30 Grand Place, Brussels', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(38, 'Isla Murphy', '+353 1 99887766', 'isla.murphy@ie.com', '22 St. Patrick\'s St, Dublin', '2025-04-03 22:40:17', '2025-04-03 22:40:17'),
(39, 'Oscar Rivera', '+52 55 33221144', 'oscar.rivera@mx.com', '77 Reforma Ave, Mexico City', '2025-04-03 22:40:17', '2025-04-03 22:40:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
