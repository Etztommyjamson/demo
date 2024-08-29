-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2024 at 08:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qr_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblassign_course`
--

CREATE TABLE `tblassign_course` (
  `id` int NOT NULL,
  `lecturer_id` int NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `level` varchar(20) NOT NULL,
  `program` varchar(3) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `session` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblassign_course`
--

INSERT INTO `tblassign_course` (`id`, `lecturer_id`, `course_code`, `level`, `program`, `semester`, `session`) VALUES
(1, 13, 'com 411', 'HND II', 'FT', 'First Semester', '2023-2024'),
(6, 13, 'com 415', 'HND II', 'FT', 'First Semester', '2023-2024'),
(7, 16, 'com 415', 'HND II', 'FT', 'First Semester', '2023-2024'),
(8, 16, 'com 426', 'HND II', 'FT', 'First Semester', '2023-2024');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `id` int NOT NULL,
  `matricno` varchar(100) NOT NULL,
  `lecturer_id` int NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `_date` varchar(20) NOT NULL,
  `time_in` varchar(20) NOT NULL,
  `time_out` varchar(20) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `qr_code` varchar(50) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`id`, `matricno`, `lecturer_id`, `course_code`, `_date`, `time_in`, `time_out`, `session`, `semester`, `qr_code`, `date_added`) VALUES
(1, '2017070510872', 13, 'com 411', '26 Mar 2024', '10:59 AM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 09:59:47'),
(2, '2017070510872', 13, 'com 411', '27 Mar 2024', '11:11 AM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 10:11:48'),
(3, '2017070510872', 13, 'com 411', '28 Mar 2024', '11:12 AM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 10:12:10'),
(4, '2017070510126', 13, 'com 411', '28 Mar 2024', '11:45 AM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 10:45:19'),
(5, '2017070510126', 16, 'com 415', '28 Mar 2024', '12:07 PM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 11:07:33'),
(6, '2017070510872', 16, 'com 415', '28 Mar 2024', '12:10 PM', '', '2023-2024', 'First Semester', NULL, '2024-03-28 11:10:24'),
(7, '2017070510872', 16, 'com 426', '13 May 2024', '12:44 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-13 11:44:51'),
(8, '2017070510126', 16, 'com 426', '13 May 2024', '12:45 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-13 11:45:00'),
(9, '2017070510872', 16, 'com 415', '13 May 2024', '12:49 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-13 11:49:18'),
(10, '2017070510126', 16, 'com 415', '13 May 2024', '12:49 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-13 11:49:26'),
(11, '2017070510872', 13, 'com 411', '16 May 2024', '12:33 AM', '', '2023-2024', 'First Semester', NULL, '2024-05-15 23:33:18'),
(12, '2017070510126', 13, 'com 411', '16 May 2024', '12:35 AM', '', '2023-2024', 'First Semester', NULL, '2024-05-15 23:35:24'),
(13, '2017070510126', 16, 'com 426', '21 May 2024', '3:14 AM', '', '2023-2024', 'First Semester', NULL, '2024-05-21 02:14:12'),
(14, '2017070510126', 16, 'com 415', '28 May 2024', '12:59 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-28 11:59:25'),
(15, '2017070510872', 16, 'com 415', '28 May 2024', '12:59 PM', '', '2023-2024', 'First Semester', NULL, '2024-05-28 11:59:47'),
(16, '2017070510872', 16, 'com 415', '09 Jul 2024', '7:55 AM', '', '2023-2024', 'First Semester', NULL, '2024-07-09 06:55:13'),
(17, '2017070510126', 16, 'com 415', '09 Jul 2024', '9:01 PM', '9:01 PM', '2023-2024', 'First Semester', NULL, '2024-07-09 20:01:32'),
(19, '2017070510126', 16, 'com 426', '09 Jul 2024', '9:22 PM', '9:22 PM', '2023-2024', 'First Semester', 'CB70C6637498', '2024-07-09 20:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblcode`
--

CREATE TABLE `tblcode` (
  `id` int NOT NULL,
  `lecturer_id` int NOT NULL,
  `course_id` int NOT NULL,
  `code` varchar(100) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `session` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblcode`
--

INSERT INTO `tblcode` (`id`, `lecturer_id`, `course_id`, `code`, `date`, `time`, `course_code`, `session`, `semester`, `created_at`) VALUES
(2, 16, 7, 'A283D37', '2024-07-09', '9:00 PM', 'com 415', '2023-2024', 'First Semester', '2024-07-09 20:00:17'),
(3, 16, 8, 'CB70C6637498', '2024-07-09', '9:02 PM', 'com 426', '2023-2024', 'First Semester', '2024-07-09 20:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `id` int NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `unit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`id`, `course_code`, `course_title`, `unit`) VALUES
(1, 'com 411', 'introduction to php', 3),
(3, 'com 415', 'seminar', 2),
(4, 'com 426', 'ethical hacking', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int NOT NULL,
  `matricno` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `program` varchar(5) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `faculty` varchar(10) DEFAULT NULL,
  `password` text NOT NULL,
  `picture` varchar(100) NOT NULL,
  `usertype` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `matricno`, `fullname`, `email`, `phone`, `gender`, `level`, `program`, `department`, `faculty`, `password`, `picture`, `usertype`, `status`) VALUES
(1, NULL, 'afolabi temidayo timothy', 'afolabi8120@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '03d258c7ef5f', '428e248a83.jpg', 'Admin', 'Active'),
(13, 'STAFF-001', 'adetunji oreoluwa ayomide', 'ore@gmail.com', '09077474473', '', '', '', '', '', '03d258c7ef5f', '597242cb34.jpg', 'Lecturer', 'Active'),
(14, '2017070510126', 'afolabi temidayo timothy', 'afonikodemus@gmail.com', '08080949669', 'Male', 'HND II', 'FT', 'Computer Science', 'FSC', '1d0e6a4c35a6', '179b6e7425.jpg', 'Student', 'Active'),
(15, '2017070510872', 'ajayi gideon ayanfe', 'gideon@gmail.com', '08090949660', 'Male', 'HND II', 'FT', 'Computer Science', 'FSC', '9763ccd9f34d', 'abde4f9d69.jpg', 'Student', 'Active'),
(16, 'STAFF-002', 'babalola funmilayo', 'babalola@gmail.com', '08098949669', '', '', '', '', '', '03d258c7ef5f', '189f7aded4.jpg', 'Lecturer', 'Active'),
(17, '201523207069', 'afenifere yusuf', 'afe@gmail.com', '09073681917', 'Male', 'HND II', 'FT', 'Computer Science', 'FSC', 'b478af7091b7', 'fdc07185e7.jpg', 'Student', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblassign_course`
--
ALTER TABLE `tblassign_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcode`
--
ALTER TABLE `tblcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblassign_course`
--
ALTER TABLE `tblassign_course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblcode`
--
ALTER TABLE `tblcode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
