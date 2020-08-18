-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Aug 2020 um 21:15
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `restlapp`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredientID` int(10) NOT NULL,
  `iconURL` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mengenAngabe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ingredient`
--

INSERT INTO `ingredient` (`ingredientID`, `iconURL`, `name`, `mengenAngabe`) VALUES
(1, 'apfel.png', 'Apfel', 'Stück'),
(2, 'banane.png', 'Banane', 'Stück'),
(3, 'kirsche.png', 'Kirsche', ''),
(4, 'ananas.png', 'Ananas', ''),
(5, 'birne.png', 'Birne', ''),
(6, 'aprikose.png', 'Marille', ''),
(7, 'avocado.png', 'Avocado', ''),
(8, 'brokkoli.png', 'Brokkoli', ''),
(9, 'chili.png', 'Chili', ''),
(10, 'erbse.png', 'Erbse', ''),
(11, 'erdbeere.png', 'Erdbeere', ''),
(12, 'karotte.png', 'Karotte', ''),
(13, 'kartoffel.png', 'Kartoffel', ''),
(14, 'knoblauch.png', 'Knoblauch', ''),
(15, 'kuerbis.png', 'Kürbis', ''),
(16, 'lauch.png', 'Lauch', ''),
(17, 'mais.png', 'Mais', ''),
(18, 'mango.png', 'Mango', ''),
(19, 'melanzani.png', 'Melanzani', ''),
(20, 'olive.png', 'Olive', ''),
(21, 'orange.png', 'Orange', ''),
(22, 'paprika.png', 'Paprika', ''),
(23, 'pilz.png', 'Pilz', ''),
(24, 'rettich.png', 'Rettich', ''),
(25, 'rueben.png', 'Rübe', ''),
(26, 'tomate.png', 'Tomate', ''),
(27, 'traube.png', 'Traube', ''),
(28, 'wassermelone.png', 'Wassermelone', ''),
(29, 'zitrone.png', 'Zitrone', ''),
(30, 'zucchini.png', 'Zucchini', ''),
(31, 'zwiebel.png', 'Zwiebel', ''),
(32, 'steckruebe.png', 'Steckrübe', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipe`
--

CREATE TABLE `recipe` (
  `recipeID` int(10) NOT NULL,
  `recipeImageURL` varchar(100) NOT NULL,
  `preperation` varchar(100) NOT NULL,
  `duration` int(10) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipeID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `webuser`
--

CREATE TABLE `webuser` (
  `webuserID` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `webuserImageURL` varchar(100) DEFAULT NULL,
  `ingredientList` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `webuser`
--

INSERT INTO `webuser` (`webuserID`, `username`, `password`, `email`, `webuserImageURL`, `ingredientList`) VALUES
(1, 'Baumi', '202cb962ac59075b964b07152d234b70', 'baumgartner17@gmail.com', NULL, NULL),
(2, 'Liane', '827ccb0eea8a706c4c34a16891f84e7b', 'liane.glaser@gmx.at', NULL, NULL),
(10, 'Baumiiii', '202cb962ac59075b964b07152d234b70', 'baumi', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `webuser_recipe`
--

CREATE TABLE `webuser_recipe` (
  `webuserID` int(11) NOT NULL,
  `recipeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredientID`);

--
-- Indizes für die Tabelle `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipeID`);

--
-- Indizes für die Tabelle `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipeID`,`ingredientID`),
  ADD KEY `ingredientID` (`ingredientID`);

--
-- Indizes für die Tabelle `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`webuserID`);

--
-- Indizes für die Tabelle `webuser_recipe`
--
ALTER TABLE `webuser_recipe`
  ADD PRIMARY KEY (`webuserID`,`recipeID`),
  ADD KEY `recipeID` (`recipeID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredientID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `webuser`
--
ALTER TABLE `webuser`
  MODIFY `webuserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`),
  ADD CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`);

--
-- Constraints der Tabelle `webuser_recipe`
--
ALTER TABLE `webuser_recipe`
  ADD CONSTRAINT `webuser_recipe_ibfk_1` FOREIGN KEY (`webuserID`) REFERENCES `webuser` (`webuserID`),
  ADD CONSTRAINT `webuser_recipe_ibfk_2` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`recipeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
