-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2025 at 07:01 PM
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
-- Database: `bankmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` int(255) NOT NULL,
  `account_type` enum('Savings','Current') NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `customer_name`, `customer_email`, `account_type`, `balance`) VALUES
(1, 'Omi sayed', 0, 'Current', 6952.00),
(3, '', 0, 'Savings', 7100.00),
(4, 'safi sorkar', 0, 'Current', 2427.00),
(5, '', 0, 'Savings', 0.00),
(7, '', 0, 'Savings', 0.00),
(8, 'Omi sayed', 0, 'Savings', 0.00),
(9, 'Omi sayed', 0, 'Current', 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminId` int(100) NOT NULL,
  `full_name` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` int(15) NOT NULL,
  `role` varchar(100) NOT NULL,
  `employee_id` int(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `security_question` varchar(100) NOT NULL,
  `default_language` varchar(100) NOT NULL,
  `time_zone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminId`, `full_name`, `username`, `email`, `password`, `phone_number`, `role`, `employee_id`, `address`, `security_question`, `default_language`, `time_zone`) VALUES
(12, 'Asad', 'asad', 'asadmim70@gmail.com', '$2y$10$bum4sf.8BcU.p1JjjSRs0eEEj6vfjsF2ICM3NoiGtiSmNDJbCru/a', 1304396884, 'super_admin', 121, 'rajshahi', 'school_name', 'english', 'gmt'),
(13, 'Masud', 'masud', 'masud@gmail.com', '$2y$10$ZJEDEryfGkUH0RxcLGby4uSYUOC49HmQyJxQBww2ccFxBXl6Jju16', 1521771420, 'super_admin', 123, 'dhaka', 'pet_name', 'english', 'gmt'),
(15, 'Md.Asad-uz-zaman', 'asad', 'asad@gmail.com', '$2y$10$R3F7ysJSZfk0Wx5tpHcmcuyz4lV5fyYOmyO2lqbAhAiKO./Bxl7Kq', 1304396884, 'super_admin', 121, 'rajshahi', 'pet_name', 'english', 'gmt'),
(16, 'Ratul khan', 'Ratul', 'ratul@gmail.com', '$2y$10$QpBCl3PGDz.wCAo45Yq92.uF3IcfUslDjo9xJaRMj0GQOg9oa9/6O', 1521771420, 'super_admin', 111, 'dhaka', 'pet_name', 'english', 'gmt'),
(17, 'Md.Asad-uz-zaman', 'asad', 'asad@gmail.com', '$2y$10$u/oQDhzJUObM36zEZx.9peN/Ov1ugWMXj5SS6GObq4nqsSJjiyzLK', 1304396884, 'super_admin', 121, 'rajshahi', 'pet_name', 'english', 'gmt'),
(19, 'MD.MAHMUDUL HASAN', 'Mahmud', 'mahmud@gmail.com', '$2y$10$Yd6VAz4g4TSvqKbDyrLMWun4nQzVzF/bhaQXyTiiZfMduXjYgp.Ua', 1566834512, 'system_admin', 123, 'Rajshahi,Bangladesh', 'birth_city', 'english', 'gmt'),
(21, 'Rongon Saha', 'Rongon', 'rongonkumar27@gmail.com', '$2y$10$hIdKXLkDjGSOe8OcGBl..OXqZ82huSlbjZXqGEplAZ7Un.kKd18hu', 1772866428, 'super_admin', 12, 'Dhaka, Bangladesh', 'pet_name', 'english', 'gmt'),
(22, 'Md. Imtiaz', 'imtiaz', 'imtiaz@gmail.com', '$2y$10$IMgKiWqBBPd5zYGkl/riWu8KKoHJcpxCyZKsKaMQC5YqBVCL//5gW', 1304396884, 'super_admin', 112, 'rajshahi', 'pet_name', 'english', 'gmt'),
(23, 'tasnim mollik', 'tasnim', 'tasnim@gmail.com', '$2y$10$mrM/msItDONZDhxSUrMNg.wHQqvImU56hZjy/7smNlXxToxuYrujO', 1521771420, 'super_admin', 123, 'dhaka', 'pet_name', 'english', 'gmt');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `service_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `customer_id`, `employee_id`, `appointment_date`, `appointment_time`, `service_type`) VALUES
(1, 12, 2, '2025-01-17', '00:00:00', 'Account Assistance'),
(2, 2, 3, '2025-01-18', '16:01:00', 'Loan Consultation'),
(3, 0, 0, '0000-00-00', '00:00:00', 'Loan Consultation'),
(4, 2, 1, '2025-03-31', '03:04:00', 'Loan Consultation'),
(5, 1, 2, '2025-11-11', '04:05:00', 'Loan Consultation');

-- --------------------------------------------------------

--
-- Table structure for table `bankaccount`
--

CREATE TABLE `bankaccount` (
  `AccountId` int(100) NOT NULL,
  `CustomerId` int(200) NOT NULL,
  `AccountType` varchar(100) NOT NULL,
  `Balance` int(100) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bankaccount`
--

INSERT INTO `bankaccount` (`AccountId`, `CustomerId`, `AccountType`, `Balance`, `CreatedDate`) VALUES
(1, 3, 'Savings', 228750, '2025-01-29 20:44:08.000000'),
(2, 4, 'Business', 168000, '2025-01-29 21:24:56.000000');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(100) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Phone` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `Name`, `Email`, `password`, `Phone`) VALUES
(3, 'Rongon Saha', 'rongonkumar27@gmail.com', '1234qwer', 1772866428),
(4, 'faysal kabir', 'faysal@gmail.com', '1234qwer', 1754655627);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(100) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Gender` enum('male','female','','') NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `reset_token` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `Name`, `Email`, `Password`, `Gender`, `Phone`, `NID`, `DOB`, `reset_token`) VALUES
(6, 'Omi Sayed', 'safisorkar35@gmail.com', '12345678', 'male', '', '', NULL, NULL),
(8, 'nur', 'nur@gmail.com', 'asdfgh@', 'male', '', '', NULL, NULL),
(9, 'Masum', 'masum@gmail.com', 'asdfgh@', 'male', '', '', NULL, NULL),
(14, 'Asad Zaman', 'asad@gmail.com', '$2y$10$qvPAzx84tXCMPfaCOa9rW.D9KtyZV2aA5eyrl46.gaK/iyuGKmwkC', 'male', '01304396884', '1213121231', '2001-12-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `Message` text NOT NULL,
  `Rating` int(11) DEFAULT NULL CHECK (`Rating` between 1 and 5),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackId`, `CustomerId`, `Message`, `Rating`, `CreatedAt`) VALUES
(2, 4, 'good', 3, '2025-01-29 16:28:53'),
(3, 4, 'very bad service. need to improve', 1, '2025-01-29 16:36:39'),
(4, 4, 'very bad service need to improve', 1, '2025-01-29 16:36:54'),
(5, 4, 'satisfied', 5, '2025-01-29 17:47:35'),
(6, 3, 'good service', 5, '2025-01-30 14:07:16'),
(7, 3, 'very poor service', 1, '2025-01-30 14:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `LoanId` int(100) NOT NULL,
  `CustomerId` int(100) NOT NULL,
  `Amount` decimal(65,0) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `InterestRate` decimal(65,0) NOT NULL,
  `LoanTerm` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`LoanId`, `CustomerId`, `Amount`, `Status`, `InterestRate`, `LoanTerm`) VALUES
(1, 3, 5000, 'Approved', 0, 12),
(2, 3, 5000, 'Approved', 0, 12),
(3, 4, 50000, 'Approved', 0, 12),
(4, 3, 100000, 'Approved', 0, 12),
(5, 3, 500000, 'Declined', 0, 12),
(6, 3, 100000, 'Approved', 0, 12),
(7, 4, 100000, 'Approved', 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_term` varchar(50) NOT NULL,
  `loan_type` varchar(50) NOT NULL,
  `loan_status` enum('Pending','Approved','Rejected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `customer_id`, `loan_amount`, `loan_term`, `loan_type`, `loan_status`) VALUES
(1, 1, 12.00, 'm', 'Personal', 'Rejected'),
(2, 2, 20.00, '1 years', 'Personal', 'Approved'),
(3, 1, 30000.00, '1 years', 'Personal', 'Rejected'),
(4, 0, 0.00, '', 'Personal', 'Pending'),
(5, 0, 0.00, '', 'Personal', 'Pending'),
(6, 0, 0.00, '', 'Personal', 'Pending'),
(7, 0, 0.00, '', 'Personal', 'Pending'),
(8, 12, 500.00, '2', 'Personal', 'Pending'),
(9, 2, 300.00, '2', 'Personal', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `MerchantId` int(100) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `BusinessName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`MerchantId`, `Name`, `Email`, `Password`, `BusinessName`) VALUES
(16, 'Rangon Kumar Shaha', '22-46585-1@student.aiub.edu', '1234qwer', 'Food Business'),
(17, 'Imtiaz', 'imtiaz1@gmail.com', 'asdfgh@', 'Food'),
(19, 'sam', 'sam@gmai.com', 'asdfgh@', 'food'),
(20, 'rifat', 'rifat@gmail.com', 'asdfgh@', 'food'),
(27, 'masum', 'masum@gmail.com', 'asdfgh@', 'ss'),
(29, 'rita', 'rita@gmail.com', 'asdfgh@', 'food'),
(33, 'asad', 'asad@gmail.com', 'asdfgh@', 'food');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(100) NOT NULL,
  `AccountId` int(200) NOT NULL,
  `Amount` int(100) NOT NULL,
  `TransactionType` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `InitiatedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `AccountId`, `Amount`, `TransactionType`, `Date`, `InitiatedBy`) VALUES
(1, 5, 5000, 'Credit', '2025-01-29', 'Rongon'),
(2, 1, 50000, '', '2025-01-29', 'faysal'),
(3, 1, 5000, '', '2025-01-29', 'faysal'),
(4, 1, 5000, '', '2025-01-29', 'faysal'),
(5, 1, 5000, '', '2025-01-29', 'faysal'),
(6, 1, 5000, '', '2025-01-29', 'faysal'),
(7, 1, 5000, '', '2025-01-29', 'faysal'),
(8, 1, 5000, '', '2025-01-29', 'faysal'),
(9, 1, 5000, '', '2025-01-29', 'faysal'),
(10, 1, 5000, '', '2025-01-29', 'faysal'),
(11, 1, 5000, '', '2025-01-29', 'faysal'),
(12, 2, 10000, '', '2025-01-29', 'Rongon'),
(13, 1, 5000, '', '2025-01-30', 'Rongon'),
(14, 1, 5000, '', '2025-01-30', 'Rongon'),
(15, 1, 4000, '', '2025-01-31', 'Rongon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminId`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD PRIMARY KEY (`AccountId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`LoanId`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`MerchantId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bankaccount`
--
ALTER TABLE `bankaccount`
  MODIFY `AccountId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `MerchantId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
