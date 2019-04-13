-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2018 at 10:47 AM
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
-- Table structure for table `miesto`
--

CREATE TABLE `miesto` (
  `idMiesto` int(11) NOT NULL,
  `stat` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `okres` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `mesto` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `ulica` varchar(20) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `miesto`
--

INSERT INTO `miesto` (`idMiesto`, `stat`, `okres`, `mesto`, `ulica`) VALUES
(1, 'Slovensko', 'Bratislava I', 'Bratislava', 'Kvetná'),
(2, 'Slovensko', 'Nitra', 'Nitra', 'Hlinku'),
(3, 'Slovensko', 'Bratislava II', 'Bratislava', 'Karlová'),
(4, 'Slovensko', 'Poprad', 'Poprad', 'Park'),
(5, 'Slovensko', 'Bratislava IV', 'Bratislava', 'Orechová'),
(6, 'Slovensko', 'Nitra', 'Nitra', 'Štadión'),
(7, 'Slovensko', 'Košice III', 'Košice', 'Stúrová');

-- --------------------------------------------------------

--
-- Table structure for table `organizator`
--

CREATE TABLE `organizator` (
  `idOrganizator` int(11) NOT NULL,
  `idUdalost` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `organizator`
--

INSERT INTO `organizator` (`idOrganizator`, `idUdalost`, `idPouzivatel`) VALUES
(1, 1, 1),
(2, 2, 10),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 10),
(7, 7, 1);

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

--
-- Dumping data for table `pouzivatel`
--

INSERT INTO `pouzivatel` (`idPouzivatel`, `email`, `meno`, `heslo`, `token`, `stav`, `timestamp`) VALUES
(1, 'admin@udalosti.sk', 'Administrátor', '$2y$10$NmNkOGEzN2M2Y2NhOTI0MeugQeCr/EZmHk9VJIcOn2F8Yx9988Vou', '', 'akceptovane', '2018-10-06 18:54:22'),
(2, 'jakub@gmail.com', 'Jakub', '$2y$10$NzQ4NzZiZjhiOWQ1YTU4OOpU22wN4EsIrn0CDNWjCVQbhBYk5H.6G', '', 'akceptovane', '2018-10-06 19:01:47'),
(3, 'zuzka@gmail.com', 'Zuzka', '$2y$10$YjhhM2IyOWUxNTk5YjliZOMmQhoSmRloU4KPseo3Kjn7rV.1P3xP6', '', 'akceptovane', '2018-10-06 19:02:10'),
(4, 'dominika@gmail.com', 'Dominika', '$2y$10$NjU0ZmVkODhjZGRiMTdkZebXeHdEoHUtCRFSQNW/J47we7Kh2x61K', '', 'akceptovane', '2018-10-06 19:02:43'),
(5, 'peter@gmail.com', 'Peter', '$2y$10$ZDVlNWViZGQwMzQ0NTQwZ.OEVi7FhdXay/Fr4eltt3EUXT1z0la9W', '', 'akceptovane', '2018-10-06 19:03:03'),
(6, 'michal@gmail.com', 'MIchal', '$2y$10$NzY0ZTE3NzcyY2RhZWRhM.cdqFREdyWvfopKUe6ZqHeFVMIRSFlai', '', 'akceptovane', '2018-10-06 19:03:17'),
(7, 'veronika@gmail.com', 'Veronika', '$2y$10$YWY3ZDJiZWNhMTRmYTFhYuoJyeR6y5E6FgJMlXlpAVyemMdwj7Rmq', '', 'akceptovane', '2018-10-06 19:03:37'),
(8, 'bence@gmail.com', 'Bence', '$2y$10$NTgyMWI5NTUwZWQ3MzY2YuM5Qo760ziAptS74CrQtpeOw7.KohzH6', '', 'akceptovane', '2018-10-06 19:03:57'),
(9, 'denis@gmail.com', 'Denis', '$2y$10$Y2M3OTk1YmFlMTE2MDAzZ.QhJMpX1mknHvQ0tEORhvhcTg7jIwHum', '', 'akceptovane', '2018-10-06 19:04:11'),
(10, 'mesto@nitra.sk', 'Ondrej', '$2y$10$NDlkMzhmMmU0M2Q0MmM4Z.cxG/ov84AX.fif3ENOgJwL..b3hIyla', '', 'akceptovane', '2018-11-11 09:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `rola`
--

CREATE TABLE `rola` (
  `idRola` int(11) NOT NULL,
  `nazov` varchar(20) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `rola`
--

INSERT INTO `rola` (`idRola`, `nazov`) VALUES
(1, 'admin'),
(2, 'pouzivatel'),
(3, 'organizator');

-- --------------------------------------------------------

--
-- Table structure for table `rola_pouzivatela`
--

CREATE TABLE `rola_pouzivatela` (
  `idRolaPouzivatela` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL,
  `idRola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `rola_pouzivatela`
--

INSERT INTO `rola_pouzivatela` (`idRolaPouzivatela`, `idPouzivatel`, `idRola`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `udalost`
--

CREATE TABLE `udalost` (
  `idUdalost` int(11) NOT NULL,
  `idMiesto` int(11) NOT NULL,
  `obrazok` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `nazov` varchar(30) COLLATE utf8_slovak_ci NOT NULL,
  `datum` date NOT NULL,
  `cas` time NOT NULL,
  `vstupenka` double NOT NULL,
  `stav` enum('prijate','odmietnute','neprecitane') COLLATE utf8_slovak_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `udalost`
--

INSERT INTO `udalost` (`idUdalost`, `idMiesto`, `obrazok`, `nazov`, `datum`, `cas`, `vstupenka`, `stav`, `timestamp`) VALUES
(1, 1, 'uploads/7c9938a4b68f89225866ab1f20e62a5c.jpg', 'Deň Filmov', '2019-09-13', '20:00:00', 5, 'prijate', '2018-10-06 19:07:04'),
(2, 2, 'uploads/9a2e3413e949b4a0fd8bf1b68210f33f.jpg', 'Dni Pizze', '2019-11-15', '15:00:00', 8, 'prijate', '2018-10-06 19:08:30'),
(3, 3, 'uploads/930057fefa36ebda43a01cb8b046b676.jpg', 'Gamers', '2019-12-27', '17:30:00', 20, 'prijate', '2018-10-06 19:09:34'),
(4, 4, 'uploads/ab1a3c6d6257df7221458c80fe11474d.jpg', 'Let Balónom', '2019-10-27', '14:00:00', 50, 'prijate', '2018-10-06 19:11:00'),
(5, 5, 'uploads/1dfbdff468da03b4cab8a2aa72cc7c58.jpg', 'SlovakiaRing', '2019-10-11', '08:00:00', 15, 'prijate', '2018-10-06 19:12:19'),
(6, 6, 'uploads/58b53b3e67c650b10374b7fc8d9e3fef.jpg', 'Triatlon', '2019-10-10', '12:00:00', 10, 'prijate', '2018-10-06 19:13:22'),
(7, 7, 'uploads/54975e730267f66476b7326409df1a8f.jpg', 'Výstava Aut', '2019-11-01', '10:00:00', 3, 'prijate', '2018-10-06 19:14:31');

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
-- AUTO_INCREMENT for table `miesto`
--
ALTER TABLE `miesto`
  MODIFY `idMiesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `organizator`
--
ALTER TABLE `organizator`
  MODIFY `idOrganizator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pouzivatel`
--
ALTER TABLE `pouzivatel`
  MODIFY `idPouzivatel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `idRola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rola_pouzivatela`
--
ALTER TABLE `rola_pouzivatela`
  MODIFY `idRolaPouzivatela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `udalost`
--
ALTER TABLE `udalost`
  MODIFY `idUdalost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zaujem`
--
ALTER TABLE `zaujem`
  MODIFY `idZaujem` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
