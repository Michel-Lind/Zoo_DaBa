-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 07:31 AM
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
-- Database: `zoo_daba`
--

-- --------------------------------------------------------

--
-- Table structure for table `futter`
--

CREATE TABLE `futter` (
  `Futter_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `futter`
--

INSERT INTO `futter` (`Futter_ID`, `Name`) VALUES
(1, 'Rindfleisch'),
(2, 'Hering'),
(3, 'Vitamine');

-- --------------------------------------------------------

--
-- Table structure for table `gebäude`
--

CREATE TABLE `gebäude` (
  `Gebäude_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gebäude`
--

INSERT INTO `gebäude` (`Gebäude_ID`, `Name`) VALUES
(1, 'Tigerhaus'),
(2, 'Seehundanlage');

-- --------------------------------------------------------

--
-- Table structure for table `lieferant`
--

CREATE TABLE `lieferant` (
  `Lieferant_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lieferant`
--

INSERT INTO `lieferant` (`Lieferant_ID`, `Name`) VALUES
(1, 'Loh'),
(2, 'Westhof');

-- --------------------------------------------------------

--
-- Table structure for table `menge`
--

CREATE TABLE `menge` (
  `Menge_ID` int(11) NOT NULL,
  `Menge` decimal(10,2) DEFAULT NULL,
  `Futter_ID` int(11) DEFAULT NULL,
  `Lieferant_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menge`
--

INSERT INTO `menge` (`Menge_ID`, `Menge`, `Futter_ID`, `Lieferant_ID`) VALUES
(1, 5.00, 1, 1),
(2, 1.00, 2, 2),
(3, 50.00, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pfleger`
--

CREATE TABLE `pfleger` (
  `Pfleger_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Telefonnummer` varchar(20) DEFAULT NULL,
  `Revier_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pfleger`
--

INSERT INTO `pfleger` (`Pfleger_ID`, `Name`, `Adresse`, `Telefonnummer`, `Revier_ID`) VALUES
(1, 'Klaus Meier', 'Musterstr. 1, Stadt', '0123456789', 1),
(2, 'Franz Müller', 'Beispielweg 2, Stadt', '9876543210', 1),
(3, 'Hans Kraus', 'Hauptstr. 5, Stadt', '0198765432', 2),
(4, 'Holger Kanu', 'Seitenweg 3, Stadt', '0197654321', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pfleger_tier`
--

CREATE TABLE `pfleger_tier` (
  `Pfleger_ID` int(11) NOT NULL,
  `Tier_ID` int(11) NOT NULL,
  `Zeit_ID` int(11) NOT NULL,
  `Tag_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pfleger_tier`
--

INSERT INTO `pfleger_tier` (`Pfleger_ID`, `Tier_ID`, `Zeit_ID`, `Tag_ID`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 3),
(3, 2, 1, 4),
(4, 2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `revier`
--

CREATE TABLE `revier` (
  `Revier_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `revier`
--

INSERT INTO `revier` (`Revier_ID`, `Name`) VALUES
(1, 'Großtiere'),
(2, 'Affen'),
(3, 'Seehunde');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` int(11) NOT NULL,
  `Wochentag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`Tag_ID`, `Wochentag`) VALUES
(1, 'Montag'),
(2, 'Mittwoch'),
(3, 'Freitag'),
(4, 'Täglich');

-- --------------------------------------------------------

--
-- Table structure for table `tier`
--

CREATE TABLE `tier` (
  `Tier_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Revier_ID` int(11) DEFAULT NULL,
  `Gebäude_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tier`
--

INSERT INTO `tier` (`Tier_ID`, `Name`, `Revier_ID`, `Gebäude_ID`) VALUES
(1, 'Tiger Theo', 1, 1),
(2, 'Seehund Lisa', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tier_futter`
--

CREATE TABLE `tier_futter` (
  `Tier_ID` int(11) NOT NULL,
  `Futter_ID` int(11) NOT NULL,
  `Menge_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tier_futter`
--

INSERT INTO `tier_futter` (`Tier_ID`, `Futter_ID`, `Menge_ID`) VALUES
(1, 1, 1),
(1, 3, 3),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `zeit`
--

CREATE TABLE `zeit` (
  `Zeit_ID` int(11) NOT NULL,
  `Uhrzeit` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zeit`
--

INSERT INTO `zeit` (`Zeit_ID`, `Uhrzeit`) VALUES
(1, '09:00:00'),
(2, '16:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `futter`
--
ALTER TABLE `futter`
  ADD PRIMARY KEY (`Futter_ID`);

--
-- Indexes for table `gebäude`
--
ALTER TABLE `gebäude`
  ADD PRIMARY KEY (`Gebäude_ID`);

--
-- Indexes for table `lieferant`
--
ALTER TABLE `lieferant`
  ADD PRIMARY KEY (`Lieferant_ID`);

--
-- Indexes for table `menge`
--
ALTER TABLE `menge`
  ADD PRIMARY KEY (`Menge_ID`),
  ADD KEY `Futter_ID` (`Futter_ID`),
  ADD KEY `Lieferant_ID` (`Lieferant_ID`);

--
-- Indexes for table `pfleger`
--
ALTER TABLE `pfleger`
  ADD PRIMARY KEY (`Pfleger_ID`),
  ADD KEY `Revier_ID` (`Revier_ID`);

--
-- Indexes for table `pfleger_tier`
--
ALTER TABLE `pfleger_tier`
  ADD PRIMARY KEY (`Pfleger_ID`,`Tier_ID`,`Zeit_ID`,`Tag_ID`),
  ADD KEY `Tier_ID` (`Tier_ID`),
  ADD KEY `Zeit_ID` (`Zeit_ID`),
  ADD KEY `Tag_ID` (`Tag_ID`);

--
-- Indexes for table `revier`
--
ALTER TABLE `revier`
  ADD PRIMARY KEY (`Revier_ID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`Tag_ID`);

--
-- Indexes for table `tier`
--
ALTER TABLE `tier`
  ADD PRIMARY KEY (`Tier_ID`),
  ADD KEY `Revier_ID` (`Revier_ID`),
  ADD KEY `Gebäude_ID` (`Gebäude_ID`);

--
-- Indexes for table `tier_futter`
--
ALTER TABLE `tier_futter`
  ADD PRIMARY KEY (`Tier_ID`,`Futter_ID`,`Menge_ID`),
  ADD KEY `Futter_ID` (`Futter_ID`),
  ADD KEY `Menge_ID` (`Menge_ID`);

--
-- Indexes for table `zeit`
--
ALTER TABLE `zeit`
  ADD PRIMARY KEY (`Zeit_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `futter`
--
ALTER TABLE `futter`
  MODIFY `Futter_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gebäude`
--
ALTER TABLE `gebäude`
  MODIFY `Gebäude_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lieferant`
--
ALTER TABLE `lieferant`
  MODIFY `Lieferant_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menge`
--
ALTER TABLE `menge`
  MODIFY `Menge_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pfleger`
--
ALTER TABLE `pfleger`
  MODIFY `Pfleger_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `revier`
--
ALTER TABLE `revier`
  MODIFY `Revier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `Tag_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tier`
--
ALTER TABLE `tier`
  MODIFY `Tier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zeit`
--
ALTER TABLE `zeit`
  MODIFY `Zeit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menge`
--
ALTER TABLE `menge`
  ADD CONSTRAINT `menge_ibfk_1` FOREIGN KEY (`Futter_ID`) REFERENCES `futter` (`Futter_ID`),
  ADD CONSTRAINT `menge_ibfk_2` FOREIGN KEY (`Lieferant_ID`) REFERENCES `lieferant` (`Lieferant_ID`);

--
-- Constraints for table `pfleger`
--
ALTER TABLE `pfleger`
  ADD CONSTRAINT `pfleger_ibfk_1` FOREIGN KEY (`Revier_ID`) REFERENCES `revier` (`Revier_ID`);

--
-- Constraints for table `pfleger_tier`
--
ALTER TABLE `pfleger_tier`
  ADD CONSTRAINT `pfleger_tier_ibfk_1` FOREIGN KEY (`Pfleger_ID`) REFERENCES `pfleger` (`Pfleger_ID`),
  ADD CONSTRAINT `pfleger_tier_ibfk_2` FOREIGN KEY (`Tier_ID`) REFERENCES `tier` (`Tier_ID`),
  ADD CONSTRAINT `pfleger_tier_ibfk_3` FOREIGN KEY (`Zeit_ID`) REFERENCES `zeit` (`Zeit_ID`),
  ADD CONSTRAINT `pfleger_tier_ibfk_4` FOREIGN KEY (`Tag_ID`) REFERENCES `tag` (`Tag_ID`);

--
-- Constraints for table `tier`
--
ALTER TABLE `tier`
  ADD CONSTRAINT `tier_ibfk_1` FOREIGN KEY (`Revier_ID`) REFERENCES `revier` (`Revier_ID`),
  ADD CONSTRAINT `tier_ibfk_2` FOREIGN KEY (`Gebäude_ID`) REFERENCES `gebäude` (`Gebäude_ID`);

--
-- Constraints for table `tier_futter`
--
ALTER TABLE `tier_futter`
  ADD CONSTRAINT `tier_futter_ibfk_1` FOREIGN KEY (`Tier_ID`) REFERENCES `tier` (`Tier_ID`),
  ADD CONSTRAINT `tier_futter_ibfk_2` FOREIGN KEY (`Futter_ID`) REFERENCES `futter` (`Futter_ID`),
  ADD CONSTRAINT `tier_futter_ibfk_3` FOREIGN KEY (`Menge_ID`) REFERENCES `menge` (`Menge_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
