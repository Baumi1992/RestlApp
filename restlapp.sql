-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Aug 2020 um 21:31
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
  `name` varchar(50) NOT NULL,
  `iconURL` varchar(100) NOT NULL,
  `mengenAngabe` text NOT NULL,
  `ingredientType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ingredient`
--

INSERT INTO `ingredient` (`ingredientID`, `name`, `iconURL`, `mengenAngabe`, `ingredientType`) VALUES
(1, 'Apfel', 'apfel.png', 'Stück', 'Fruits'),
(2, 'Banane', 'banane.png', 'Stück', 'Fruits'),
(3, 'Kirsche', 'kirsche.png', 'g', 'Fruits'),
(4, 'Ananas', 'ananas.png', 'Stück', 'Fruits'),
(5, 'Birne', 'birne.png', 'Stück', 'Fruits'),
(6, 'Marille', 'aprikose.png', 'Stück', 'Fruits'),
(7, 'Avocado', 'avocado.png', 'Stück', 'Vegetables'),
(8, 'Brokkoli', 'brokkoli.png', 'g', 'Vegetables'),
(9, 'Chili', 'chili.png', 'Stück', 'Vegetables'),
(10, 'Erbse', 'erbse.png', 'g', 'Vegetables'),
(11, 'Erdbeere', 'erdbeere.png', 'g', 'Fruits'),
(12, 'Karotte', 'karotte.png', 'Stück', 'Vegetables'),
(13, 'Kartoffel', 'kartoffel.png', 'Stück', 'Vegetables'),
(14, 'Knoblauch', 'knoblauch.png', 'Zehe(n)', 'Vegetables'),
(15, 'Kürbis', 'kuerbis.png', 'g', 'Vegetables'),
(16, 'Lauch', 'lauch.png', 'Stück', 'Vegetables'),
(17, 'Mais', 'mais.png', 'g', 'Vegetables'),
(18, 'Mango', 'mango.png', 'Stück', 'Fruits'),
(19, 'Melanzani', 'melanzani.png', 'Stück', 'Vegetables'),
(20, 'Olive', 'olive.png', 'Stück', 'Vegetables'),
(21, 'Orange', 'orange.png', 'Stück', 'Fruits'),
(22, 'Paprika', 'paprika.png', 'Stück', 'Vegetables'),
(23, 'Pilz', 'pilz.png', 'Stück', 'mushrooms'),
(24, 'Rettich', 'rettich.png', 'Stück', 'Vegetables'),
(25, 'Rübe', 'rueben.png', 'Stück', 'Vegetables'),
(26, 'Tomate', 'tomate.png', 'Stück', 'Vegetables'),
(27, 'Traube', 'traube.png', 'Stück', 'Fruits'),
(28, 'Wassermelone', 'wassermelone.png', 'Stück', 'Fruits'),
(29, 'Zitrone', 'zitrone.png', 'Stück', 'Fruits'),
(30, 'Zucchini', 'zucchini.png', 'Stück', 'Vegetables'),
(31, 'Zwiebel', 'zwiebel.png', 'Stück', 'Vegetables'),
(32, 'Steckrübe', 'steckruebe.png', 'Stück', 'Vegetables'),
(33, 'Milch', 'milk.png', 'ml', 'Milk'),
(34, 'Speck', 'bacon.png', 'Streifen', 'Meat'),
(35, 'Brot', 'bread.png', 'Scheiben', 'Bread'),
(36, 'Butter', 'butter.png', 'TL', 'Milk'),
(37, 'Käse', 'cheese.png', 'g', 'Milk'),
(38, 'Hühnerfleisch', 'chicken.png', 'g', 'Meat'),
(39, 'Ei', 'egg.png', 'Stück', 'Milk'),
(40, 'Fisch', 'fish.png', 'Stück', 'Meat'),
(41, 'Mehl', 'flour.png', 'g', 'Seasoning'),
(42, 'Ingwer', 'ginger.png', 'Stück', 'Vegetables'),
(43, 'Schinken', 'ham.png', 'Streifen', 'Meat'),
(44, 'Honig', 'honey.png', 'TL', 'Seasoning'),
(45, 'Ketchup', 'ketchup.png', 'g', 'Seasoning'),
(46, 'Lammfleisch', 'lamb.png', 'Stück', 'Meat'),
(47, 'Wurst', 'meat.png', 'Stück', 'Meat'),
(48, 'Olivenöl', 'olive-oil.png', 'ml', 'Seasoning'),
(49, 'Schweinefleisch', 'pork.png', 'Stück', 'Meat'),
(50, 'Zucker', 'sugar.png', 'g', 'Seasoning'),
(51, 'Rindfleisch', 'pork.png', 'Stück', 'Meat'),
(52, 'Joghurt', 'frozen-yogurt.png', 'ml', 'Milk'),
(53, 'Sauerrahm', 'frozen-yogurt.png', 'ml', 'Milk'),
(54, 'Sahne', 'frozen-yogurt.png', 'ml', 'Milk'),
(55, 'Salz', 'salt.png', 'Prise', 'Seasoning'),
(56, 'Artischoken', 'artichoke.png', 'Stück', 'Vegetables'),
(57, 'Basilikum', 'basil.png', 'Stück', 'seasoning'),
(58, 'Kiwi', 'kiwi.png', 'Stück', 'Fruits'),
(59, 'Haselnuss', 'hazelnut.png', 'Stück', 'nuts'),
(60, 'Muskatnuss', 'hazelnut.png', 'Prise', 'nuts'),
(61, 'Pfeffer', 'pepper.png', 'Prise', 'seasoning'),
(62, 'Champignon', 'pilz.png', 'Stück', 'mushrooms'),
(63, 'Salat', 'salad.png', 'Stück', 'Vegetables'),
(64, 'Gemüsefond', 'soup.png', 'ml', 'ingredient'),
(65, 'Backpulver', 'sugar.png', 'TL', 'seasoning'),
(66, 'Essig', 'vinegar.png', 'ml', 'seasoning'),
(67, 'Topfen', 'frozen-yogurt.png', 'g', 'milk'),
(68, 'Creme fraiche', 'frozen-yogurt.png', 'g', 'milk'),
(69, 'Margarine', 'butter.png', 'g', 'milk'),
(70, 'Kipferl', 'croissant.png', 'Stück', 'bread'),
(71, 'Semmel', 'roll.png', 'Stück', 'bread'),
(72, 'Faschiertes', 'mincedmeat.png', 'g', 'meat'),
(73, 'Lachs', 'salmon.png', 'g', 'meat'),
(74, 'Bohnen', 'beans.png', 'g', 'Vegetables'),
(75, 'Erdnuss', 'erdnuss.png', 'g', 'nuts'),
(76, 'Senf', 'sauce.png', 'TL', 'seasoning'),
(77, 'Sojasauce', 'soy.png', 'TL', 'seasoning'),
(78, 'Tomatensauce', 'ketchup.png', 'g', 'ingredient'),
(79, 'Walnuss', 'nuts.png', 'g', 'nuts'),
(80, 'Zimt', 'cinnamon.png', 'TL', 'seasoning'),
(81, 'Vanillezucker', 'sugar.png', 'TL', 'seasoning'),
(82, 'Fussili', 'fussili.png', 'g', 'corn'),
(83, 'Penne', 'penne.png', 'g', 'corn'),
(84, 'Spaghetti', 'pasta.png', 'g', 'corn'),
(85, 'Reis', 'rice.png', 'g', 'corn'),
(86, 'Rosinen', 'raisins.png', 'g', 'ingredient'),
(87, 'Staubzucker', 'sugar.png', 'Prise', 'seasoning'),
(88, 'Oregano', 'basil.png', 'TL', 'seasoning'),
(89, 'Tomatenmark', 'ketchup.png', 'TL', 'ingredient');

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
  `level` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipe`
--

INSERT INTO `recipe` (`recipeID`, `recipeName`, `recipeImageURL`, `preperation`, `duration`, `level`, `type`) VALUES
(1, 'Erdbeermilch', 'erdbeermilch.png', 'Die Erdbeeren putzen und waschen. Danach die Erdbeeren zerkleinern, Milch hinzufügen und mit dem Stabmixer pürieren.', 10, 'einfach', 'dessert'),
(3, 'Bananenmilch', 'bananenmilch.png', 'Zuerst die Bananen schälen, in Stücke brechen und gemeinsam mit etwas Milch im Mixer pürieren.\r\nDanach die restliche Milch zugeben. Ungefähr 20 Sekunden mixen, sodass keine Bananenstücke mehr zu sehen sind', 10, 'einfach', 'dessert'),
(4, 'Käsespätzle', 'kaesespaetzle.png', 'Das Mehl in eine Schüssel geben, in die Mitte eine Vertiefung drücken und die Eier hineinschlagen, Salz zugeben. 40 ml Wassers dazu gießen und alles mit Hilfe eines Kochlöffels zu einem feinen Teig verrühren. Den Teig so lange kräftig schlagen, bis er von glatter, zäher Konsistenz ist und in dicken Tropfen vom Löffel fällt. Bei Bedarf weiteres Wasser zufügen. Anschließend den Teig für 15 Minuten ruhen lassen. Den Bergkäse reiben und mit dem geriebenen Emmentaler in einer Schale vermischen. Die Zwiebeln schälen und in dünne Ringe schneiden. Anschließend 80 g Butter bei mittlerer Hitze in eine Pfanne geben und schmelzen lassen. Die Zwiebelscheiben darin so lange braten, bis sie kross und goldbraun sind. Einen Topf mit Wasser zum Kochen bringen. Einen Teil des Spätzleteiges durch einen Spätzlehobel - ein Lochblech mit einem Gefäß, das hin- und hergeschoben wird - in sprudelnd kochendes Wasser tropfen lassen. Die frei schwimmenden Spätzle im Wasser ziehen lassen, bis sie an die Oberfläche steigen. Diese dann mit einem Schaumlöffel vorsichtig herausnehmen. Den Vorgang wiederholen, bis der gesamte Teig verbraucht ist. Die restlichen 20 g Butter in zwei entsprechend großen Pfannen zerlassen. Die Pfannenboden mit der ersten Schicht Spätzle bedecken und darauf eine Schicht Käse geben. Abwechselnd Spätzle und Käse in beide Pfannen einschichten, bis alle Zutaten verbraucht sind. Zum Schluss die gebratenen Zwiebeln über die Käsepätzle geben und mit Schnittlauch bestreuen.', 60, 'mittel', 'maincourse'),
(5, 'Zitronen-Kaltschale', 'zitronen_kaltschale.jpg', 'Die Zitronen gründlich waschen und die Schale reiben, dann den Saft auspressen.\r\nJoghurt mit dem Sauerrahm, Zitronensaft, Salz und der geriebenen Schale verrühren.', 15, 'einfach', 'starter'),
(6, 'Kürbiscremesuppe', 'kuerbiscremesuppe.jpg', 'Für diese köstliche Kürbiscremesuppe zuerst den Zwiebel schälen, in feine Stückchen schneiden und in einer hohen Pfanne in Butterschmalz kurz anschwitzen.\r\nDanach das geschälte, gewürfelte Kürbisfleisch zugeben, kurz mitbraten lassen, und danach mit der Suppe (Gemüsebrühe oder Rindsuppe) aufgießen.\r\nDie Suppebrühe gut würzen (mit Salz, Pfeffer, Muskat, fein gehacktem Thymian und ein paar Korianderkörner), die Kürbisstücke darin bei leichter Hitze weichkochen und anschließend mit einem Pürierstab pürieren.\r\nNochmals kurz abschmecken und nachwürzen und das Gericht mit etwas Schlagobers verfeinern/einrühren.', 40, 'mittel', 'soups'),
(7, 'Brokolicremesuppe', 'brokkoli-suppe.jpg', 'Für die Brokkolisuppe zuerst Brokkoli, Knoblauch und Zwiebeln fein hacken und in Ölivenöl einige Minuten in einem Topf gut anbraten.\r\nMit Gemüsesuppe aufgießen und ca. 20 Minuten bei niedriger Hitze köcheln lassen.\r\nAbschließend mit einem Stabmixer kurz durchmixen und nach belieben mit Salz und Pfeffer abschmecken.\r\nZum Verfeinern kann noch Obers (Sahne) untergerührt werden.', 40, 'mittel', 'soups'),
(8, 'Wiener Kaiserschmarrn', 'kaiserschmarrn.jpg', 'Für diesen köstlichen Kaiserschmarrn zuerst in einer Schüssel Mehl, Zucker, Salz und Dotter mit der Milch zu einem glatten, dickflüssigen Teig verrühren.\r\nIn einer anderen Schüssel die Eiklar zu einem steifen Schnee schlagen und danach unter den dickflüssigen Teig heben.\r\nDie Butter in einer großen, flachen Pfanne aufschäumen lassen, den Teig langsam eingießen, und auf beiden Seiten anbacken.\r\nAnschließend die Pfanne in ein vorgeheiztes Backrohr bei mäßiger Hitze (Heißluft ca. 180°C) für 10-12 Min. fertig backen - bis der Kaiserschmarren leicht goldbraun ist.\r\nDanach die Pfanne aus dem Backrohr nehmen und den fertigen Teig mit zwei Gabeln in unregelmäßige Stücke zerreißen.\r\nNun die Rosinen hinzufügen, gut verrühren und die Pfanne nochmals für ca. 1 Minute in den noch heißen Backofen geben.\r\nDen Schmarren auf Tellern anrichten, mit Zucker bestreuen und mit beliebigem Kompott oder auch Apfelmus servieren.', 30, 'mittel', 'dessert'),
(9, 'Hähnchenbrust mit Speck </br>und Kartoffeln', 'haehnchenbrust-mit-speck-und-kartoffeln.jpg', 'Die Hähnchenbrüste abbrausen und trocken tupfen. Mit Salz und Pfeffer würzen und von beiden Seiten kurz in heißem Öl anbraten. Wieder aus der Pfanne nehmen. Den Speck in Streifen schneiden und in der Pfanne anschwitzen. Das Tomatenmark untermengen und mit dem Fond ablöschen. Den Oregano dazu geben, mit Salz und Pfeffer würzen und das Hähnchen wieder in die Sauce legen. Zugedeckt ca. 10 Minuten leise gar schmoren lassen.\r\nKartoffeln ca 30 Minuten kochen und anschließend schälen.\r\nZum Schluss nochmal abschmecken und mit Kartoffeln servieren.', 35, 'einfach', 'maincourse');

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
(4, 55, 0.5),
(5, 29, 4),
(5, 52, 400),
(5, 53, 200),
(5, 55, 0.5),
(6, 15, 300),
(6, 31, 2),
(6, 36, 2),
(6, 54, 150),
(6, 55, 1),
(6, 60, 0.5),
(6, 61, 1),
(6, 64, 750),
(7, 8, 250),
(7, 14, 1),
(7, 31, 2),
(7, 48, 4),
(7, 54, 100),
(7, 55, 1),
(7, 61, 1),
(7, 64, 800),
(8, 33, 400),
(8, 36, 50),
(8, 39, 5),
(8, 41, 250),
(8, 50, 40),
(8, 55, 1.5),
(8, 86, 35),
(8, 87, 1.5),
(9, 13, 10),
(9, 21, 0.5),
(9, 34, 6),
(9, 38, 4),
(9, 48, 4),
(9, 55, 1),
(9, 61, 1),
(9, 64, 200),
(9, 89, 2);

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
  MODIFY `ingredientID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT für Tabelle `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
