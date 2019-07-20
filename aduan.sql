-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2019 at 03:48 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `aduan`
--

CREATE TABLE `aduan` (
  `idaduan` int(11) NOT NULL,
  `idtenant` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kategori` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isiaduan` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateentry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datefinisihed` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datatenant`
--

CREATE TABLE `datatenant` (
  `idtenant` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namatenant` varchar(56) COLLATE utf8_unicode_ci DEFAULT NULL,
  `luastenant` float DEFAULT NULL,
  `jenistenant` varchar(62) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamattenant` varchar(666) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailtenant` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomorhp` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userlevel` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `userlevel`) VALUES
('admin', '123', 5),
('oji', '123', 4),
('tenant', '123', 1),
('tenant2', '123', 1),
('tenant3', '123', 1),
('tenant4', '123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aduan`
--
ALTER TABLE `aduan`
  ADD PRIMARY KEY (`idaduan`),
  ADD KEY `idtenant` (`idtenant`);

--
-- Indexes for table `datatenant`
--
ALTER TABLE `datatenant`
  ADD PRIMARY KEY (`idtenant`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aduan`
--
ALTER TABLE `aduan`
  MODIFY `idaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aduan`
--
ALTER TABLE `aduan`
  ADD CONSTRAINT `aduan_ibfk_1` FOREIGN KEY (`idtenant`) REFERENCES `datatenant` (`idtenant`);

--
-- Constraints for table `datatenant`
--
ALTER TABLE `datatenant`
  ADD CONSTRAINT `datatenant_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
