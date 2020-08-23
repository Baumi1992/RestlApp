-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Aug 2020 um 20:58
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
(3, 'kirsche.png', 'Kirsche', 'Stück'),
(4, 'ananas.png', 'Ananas', 'Stück'),
(5, 'birne.png', 'Birne', 'Stück'),
(6, 'aprikose.png', 'Marille', 'Stück'),
(7, 'avocado.png', 'Avocado', 'Stück'),
(8, 'brokkoli.png', 'Brokkoli', 'Stück'),
(9, 'chili.png', 'Chili', 'Stück'),
(10, 'erbse.png', 'Erbse', 'Stück'),
(11, 'erdbeere.png', 'Erdbeere', 'Stück'),
(12, 'karotte.png', 'Karotte', 'Stück'),
(13, 'kartoffel.png', 'Kartoffel', 'Stück'),
(14, 'knoblauch.png', 'Knoblauch', 'Stück'),
(15, 'kuerbis.png', 'Kürbis', 'Stück'),
(16, 'lauch.png', 'Lauch', 'Stück'),
(17, 'mais.png', 'Mais', 'Stück'),
(18, 'mango.png', 'Mango', 'Stück'),
(19, 'melanzani.png', 'Melanzani', 'Stück'),
(20, 'olive.png', 'Olive', 'Stück'),
(21, 'orange.png', 'Orange', 'Stück'),
(22, 'paprika.png', 'Paprika', 'Stück'),
(23, 'pilz.png', 'Pilz', 'Stück'),
(24, 'rettich.png', 'Rettich', 'Stück'),
(25, 'rueben.png', 'Rübe', 'Stück'),
(26, 'tomate.png', 'Tomate', 'Stück'),
(27, 'traube.png', 'Traube', 'Stück'),
(28, 'wassermelone.png', 'Wassermelone', 'Stück'),
(29, 'zitrone.png', 'Zitrone', 'Stück'),
(30, 'zucchini.png', 'Zucchini', 'Stück'),
(31, 'zwiebel.png', 'Zwiebel', 'Stück'),
(32, 'steckruebe.png', 'Steckrübe', 'Stück'),
(33, 'milk.png', 'Milch', 'ml'),
(34, 'bacon.png', 'Speck', 'Streifen'),
(35, 'bread.png', 'Brot', 'Scheiben'),
(36, 'butter.png', 'Butter', 'g'),
(37, 'cheese.png', 'Käse', 'g'),
(38, 'chicken.png', 'Hühnerfleisch', 'g'),
(39, 'egg.png', 'Ei', 'Stück'),
(40, 'fish.png', 'Fisch', 'Stück'),
(41, 'flour.png', 'Mehl', 'g'),
(42, 'ginger.png', 'Ingwer', 'Stück'),
(43, 'ham.png', 'Schinken', 'Streifen'),
(44, 'honey.png', 'Honig', 'Teelöffel'),
(45, 'ketchup.png', 'Ketchup', 'Teelöffel'),
(46, 'lamb.png', 'Lammfleisch', 'Stück'),
(47, 'meat.png', 'Wurst', 'Stück'),
(48, 'olive-oil.png', 'Olivenöl', 'ml'),
(49, 'pork.png', 'Schweinefleisch', 'Stück'),
(50, 'sugar.png', 'Zucker', 'Teelöffel'),
(51, 'pork.png', 'Rindfleisch', 'Stück'),
(52, 'frozen-yogurt.png', 'Joghurt', 'ml'),
(53, 'frozen-yogurt.png', 'Sauerrahm', 'ml'),
(54, 'frozen-yogurt.png', 'Sahne', 'ml'),
(55, 'salt.png', 'Salz', 'Teelöffel');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipe`
--

CREATE TABLE `recipe` (
  `recipeID` int(10) NOT NULL,
  `recipeName` varchar(100) NOT NULL,
  `recipeImageURL` varchar(100) NOT NULL,
  `preperation` varchar(3000) NOT NULL,
  `duration` int(10) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipe`
--

INSERT INTO `recipe` (`recipeID`, `recipeName`, `recipeImageURL`, `preperation`, `duration`, `level`) VALUES
(1, 'Erdbeermilch', 'erdbeermilch.png', 'Die Erdbeeren putzen und waschen. Danach die Erdbeeren zerkleinern, Milch hinzufügen und mit dem Stabmixer pürieren.', 10, 'einfach'),
(3, 'Bananenmilch', 'bananenmilch.png', 'Zuerst die Bananen schälen, in Stücke brechen und gemeinsam mit etwas Milch im Mixer pürieren.\r\nDanach die restliche Milch zugeben. Ungefähr 20 Sekunden mixen, sodass keine Bananenstücke mehr zu sehen sind', 10, 'einfach'),
(4, 'Käsespätzle', 'kaesespaetzle.png', 'Das Mehl in eine Schüssel geben, in die Mitte eine Vertiefung drücken und die Eier hineinschlagen, Salz zugeben. 40 ml Wassers dazu gießen und alles mit Hilfe eines Kochlöffels zu einem feinen Teig verrühren. Den Teig so lange kräftig schlagen, bis er von glatter, zäher Konsistenz ist und in dicken Tropfen vom Löffel fällt. Bei Bedarf weiteres Wasser zufügen. Anschließend den Teig für 15 Minuten ruhen lassen. Den Bergkäse reiben und mit dem geriebenen Emmentaler in einer Schale vermischen. Die Zwiebeln schälen und in dünne Ringe schneiden. Anschließend 80 g Butter bei mittlerer Hitze in eine Pfanne geben und schmelzen lassen. Die Zwiebelscheiben darin so lange braten, bis sie kross und goldbraun sind. Einen Topf mit Wasser zum Kochen bringen. Einen Teil des Spätzleteiges durch einen Spätzlehobel - ein Lochblech mit einem Gefäß, das hin- und hergeschoben wird - in sprudelnd kochendes Wasser tropfen lassen. Die frei schwimmenden Spätzle im Wasser ziehen lassen, bis sie an die Oberfläche steigen. Diese dann mit einem Schaumlöffel vorsichtig herausnehmen. Den Vorgang wiederholen, bis der gesamte Teig verbraucht ist. Die restlichen 20 g Butter in zwei entsprechend großen Pfannen zerlassen. Die Pfannenboden mit der ersten Schicht Spätzle bedecken und darauf eine Schicht Käse geben. Abwechselnd Spätzle und Käse in beide Pfannen einschichten, bis alle Zutaten verbraucht sind. Zum Schluss die gebratenen Zwiebeln über die Käsepätzle geben und mit Schnittlauch bestreuen.', 60, 'mittel');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipeID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `menge` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipeID`, `ingredientID`, `menge`) VALUES
(1, 11, 10),
(1, 33, 100),
(1, 50, 10),
(3, 2, 1),
(3, 33, 100),
(3, 50, 10),
(4, 31, 2),
(4, 36, 50),
(4, 37, 130),
(4, 39, 4),
(4, 41, 250),
(4, 55, 0.5);

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
(38, 'baumi', '202cb962ac59075b964b07152d234b70', 'baumi', NULL, NULL);

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
  MODIFY `ingredientID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `webuser`
--
ALTER TABLE `webuser`
  MODIFY `webuserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
