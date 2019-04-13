-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Júl 28. 17:07
-- Kiszolgáló verziója: 10.1.19-MariaDB
-- PHP verzió: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `udalosti`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cennik`
--

CREATE TABLE `cennik` (
  `idCennik` int(11) NOT NULL,
  `vaha` int(11) NOT NULL,
  `suma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pouzivatel`
--

CREATE TABLE `pouzivatel` (
  `idPouzivatel` int(11) NOT NULL,
  `meno` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_slovak_ci NOT NULL,
  `pohlavie` enum('m','z') COLLATE utf8_slovak_ci NOT NULL,
  `obrazok` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `heslo` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `idTelefonu` text COLLATE utf8_slovak_ci NOT NULL,
  `token` text COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pozvanka`
--

CREATE TABLE `pozvanka` (
  `idPozvanka` int(11) NOT NULL,
  `idUdalost` int(11) NOT NULL,
  `idPouzivatelAkcia` int(11) NOT NULL,
  `idPouzivatelOdpoved` int(11) NOT NULL,
  `precitana` tinyint(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rola`
--

CREATE TABLE `rola` (
  `idRola` int(11) NOT NULL,
  `nazov` varchar(20) COLLATE utf8_slovak_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rola_pouzivatela`
--

CREATE TABLE `rola_pouzivatela` (
  `idRolaPouzivatela` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL,
  `idRola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `udalost`
--

CREATE TABLE `udalost` (
  `idUdalost` int(11) NOT NULL,
  `idCennik` int(11) NOT NULL,
  `obrazok` varchar(128) COLLATE utf8_slovak_ci NOT NULL,
  `nazov` varchar(30) COLLATE utf8_slovak_ci NOT NULL,
  `datum` date NOT NULL,
  `cas` time NOT NULL,
  `stat` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `okres` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `mesto` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vztah`
--

CREATE TABLE `vztah` (
  `idVztah` int(11) NOT NULL,
  `idPouzivatelAkcia` int(11) NOT NULL,
  `idPouzivatelOdpoved` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `akcia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zaujem`
--

CREATE TABLE `zaujem` (
  `idZaujem` int(11) NOT NULL,
  `idUdalost` int(11) NOT NULL,
  `idPouzivatel` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cennik`
--
ALTER TABLE `cennik`
  ADD PRIMARY KEY (`idCennik`);

--
-- A tábla indexei `pouzivatel`
--
ALTER TABLE `pouzivatel`
  ADD PRIMARY KEY (`idPouzivatel`);

--
-- A tábla indexei `pozvanka`
--
ALTER TABLE `pozvanka`
  ADD PRIMARY KEY (`idPozvanka`);

--
-- A tábla indexei `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`idRola`);

--
-- A tábla indexei `rola_pouzivatela`
--
ALTER TABLE `rola_pouzivatela`
  ADD PRIMARY KEY (`idRolaPouzivatela`);

--
-- A tábla indexei `udalost`
--
ALTER TABLE `udalost`
  ADD PRIMARY KEY (`idUdalost`);

--
-- A tábla indexei `vztah`
--
ALTER TABLE `vztah`
  ADD PRIMARY KEY (`idVztah`);

--
-- A tábla indexei `zaujem`
--
ALTER TABLE `zaujem`
  ADD PRIMARY KEY (`idZaujem`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `cennik`
--
ALTER TABLE `cennik`
  MODIFY `idCennik` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `pouzivatel`
--
ALTER TABLE `pouzivatel`
  MODIFY `idPouzivatel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `pozvanka`
--
ALTER TABLE `pozvanka`
  MODIFY `idPozvanka` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `rola`
--
ALTER TABLE `rola`
  MODIFY `idRola` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `rola_pouzivatela`
--
ALTER TABLE `rola_pouzivatela`
  MODIFY `idRolaPouzivatela` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `udalost`
--
ALTER TABLE `udalost`
  MODIFY `idUdalost` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `vztah`
--
ALTER TABLE `vztah`
  MODIFY `idVztah` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `zaujem`
--
ALTER TABLE `zaujem`
  MODIFY `idZaujem` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
