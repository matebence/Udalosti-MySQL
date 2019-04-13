-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2018 at 03:42 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udalosti`
--

-- --------------------------------------------------------

--
-- Table structure for table `cennik`
--

CREATE TABLE `cennik` (
  `idCennik` int(11) NOT NULL,
  `vaha` int(11) NOT NULL,
  `suma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `miesto`
--

CREATE TABLE `miesto` (
  `idMiesto` int(11) NOT NULL,
  `stat` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `okres` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `mesto` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `ulica` varchar(20) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizator`
--

CREATE TABLE `organizator` (
  `idOrganizator` int(11) NOT NULL,
  `idUdalost` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pouzivatel`
--

CREATE TABLE `pouzivatel` (
  `idPouzivatel` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_slovak_ci NOT NULL,
  `meno` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `heslo` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `token` text COLLATE utf8_slovak_ci NOT NULL,
  `stav` enum('akceptovane','blokovane','neprecitane') COLLATE utf8_slovak_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rola`
--

CREATE TABLE `rola` (
  `idRola` int(11) NOT NULL,
  `nazov` varchar(20) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rola_pouzivatela`
--

CREATE TABLE `rola_pouzivatela` (
  `idRolaPouzivatela` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL,
  `idRola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `udalost`
--

CREATE TABLE `udalost` (
  `idUdalost` int(11) NOT NULL,
  `idCennik` int(11) NOT NULL,
  `idMiesto` int(11) NOT NULL,
  `obrazok` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `nazov` varchar(30) COLLATE utf8_slovak_ci NOT NULL,
  `datum` date NOT NULL,
  `cas` time NOT NULL,
  `vstupenka` double NOT NULL,
  `stav` enum('prijate','odmietnute','neprecitane') COLLATE utf8_slovak_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zaujem`
--

CREATE TABLE `zaujem` (
  `idZaujem` int(11) NOT NULL,
  `idUdalost` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cennik`
--
ALTER TABLE `cennik`
  ADD PRIMARY KEY (`idCennik`);

--
-- Indexes for table `miesto`
--
ALTER TABLE `miesto`
  ADD PRIMARY KEY (`idMiesto`);

--
-- Indexes for table `organizator`
--
ALTER TABLE `organizator`
  ADD PRIMARY KEY (`idOrganizator`);

--
-- Indexes for table `pouzivatel`
--
ALTER TABLE `pouzivatel`
  ADD PRIMARY KEY (`idPouzivatel`);

--
-- Indexes for table `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`idRola`);

--
-- Indexes for table `rola_pouzivatela`
--
ALTER TABLE `rola_pouzivatela`
  ADD PRIMARY KEY (`idRolaPouzivatela`);

--
-- Indexes for table `udalost`
--
ALTER TABLE `udalost`
  ADD PRIMARY KEY (`idUdalost`);

--
-- Indexes for table `zaujem`
--
ALTER TABLE `zaujem`
  ADD PRIMARY KEY (`idZaujem`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cennik`
--
ALTER TABLE `cennik`
  MODIFY `idCennik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `miesto`
--
ALTER TABLE `miesto`
  MODIFY `idMiesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizator`
--
ALTER TABLE `organizator`
  MODIFY `idOrganizator` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pouzivatel`
--
ALTER TABLE `pouzivatel`
  MODIFY `idPouzivatel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `idRola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rola_pouzivatela`
--
ALTER TABLE `rola_pouzivatela`
  MODIFY `idRolaPouzivatela` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `udalost`
--
ALTER TABLE `udalost`
  MODIFY `idUdalost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zaujem`
--
ALTER TABLE `zaujem`
  MODIFY `idZaujem` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
