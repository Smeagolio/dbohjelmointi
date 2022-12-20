-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05.12.2022 klo 19:12
-- Palvelimen versio: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fiuke`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakas`
--

CREATE TABLE `asiakas` (
  `astunnus` int(10) NOT NULL,
  `asnimi` char(30) NOT NULL,
  `osoite` char(30) NOT NULL,
  `postinro` char(5) NOT NULL,
  `postitmp` char(10) NOT NULL,
  `puhelinnro` char(20) NOT NULL,
  `e_mail` char(40) NOT NULL,
  `salasana` char(60) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vedos taulusta `asiakas`
--

INSERT INTO `asiakas` (`astunnus`, `asnimi`, `osoite`, `postinro`, `postitmp`, `puhelinnro`, `e_mail`, `salasana`, `status`) VALUES
(2, 'Matti Meikalainen', 'Limakuja 6', '90100', 'Oulu', '0409284505', 'matti.meik@gmail.com', 'salasana', 'active'),
(3, 'Pekka Pouta', 'Aurinkotie 5', '33560', 'Tampere', '040123456', 'eiole@perkele.com', 'kuukeri', 'active');

-- --------------------------------------------------------

--
-- Rakenne taululle `tilaus`
--

CREATE TABLE `tilaus` (
  `astunnus` int(10) NOT NULL,
  `tilausnro` int(10) NOT NULL,
  `tilauspvm` datetime NOT NULL,
  `tuotenro` int(11) NOT NULL,
  `kpl` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Rakenne taululle `tilausrivi`
--

CREATE TABLE `tilausrivi` (
  `tilausnro` int(11) NOT NULL,
  `rivinro` smallint(6) NOT NULL,
  `tuotenro` int(11) NOT NULL,
  `kpl` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Rakenne taululle `tuote`
--

CREATE TABLE `tuote` (
  `tuotenro` int(11) NOT NULL,
  `trnro` int(11) NOT NULL,
  `logomerkki` char(15) NOT NULL,
  `tuotemalli` char(30) NOT NULL,
  `hinta` decimal(8,0) NOT NULL,
  `kustannus` decimal(8,2) NOT NULL,
  `kuvaus` char(255) NOT NULL,
  `kuva` char(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vedos taulusta `tuote`
--

INSERT INTO `tuote` (`tuotenro`, `trnro`, `logomerkki`, `tuotemalli`, `hinta`, `kustannus`, `kuvaus`, `kuva`, `status`) VALUES
(10, 1, 'Specialized', 'chisel', '2100', '1000.00', 'Specialized Chisel 29\" on PRO-tason maastopyörä edullisella hinnalla. Super kevyt alumiinirunko yhdistettynä laadukkaisiin komponentteihin tekevät tästä alumiinirunkoisen täysverisen kisamaastopyörän.', '', 'active'),
(11, 1, 'Specialized', 'chisel_comp', '2550', '1000.00', 'Specialized Chisel Comp maastopyörä. Todella tyylikäs ja hienosti viimeistelty alumiinirunko. Vaihteistona Shimanon 1×11 takaa helpon ja sujuvan vaihtamisen. Tyylikäs punainen väri. Ei muuta kuin poluille nauttimaan!', '', 'active'),
(12, 1, 'Trek', 'fuel_exe9.5', '6900', '3000.00', 'Fuel EX 7 on kotonaan hankalissa alamäissä, joissa tavallista parempi jousituskokonaisuus tulee tarpeeseen. Kevyt alumiinirunko, Tubeless Ready -kiekot ja luotettava 1x12-vaihteinen SRAM NX Eagle -voimansiirto tekevät siitä erinomaisen täysjouston.', '', 'active'),
(13, 1, 'Trek', 'rail_5', '4990', '2000.00', 'Rail 5 on sähköavusteinen maastopyörä, joka on suunniteltu epätasaisessa maastossa revittelyyn. Se on varustettu samoilla korkealuokkaisilla osilla kuin sähköttömät trail-pyörämme ja uudella Bosch-moottorilla.', '', 'active'),
(14, 1, 'Trek', 'farley_5', '1990', '1000.00', 'Farley 5 on hinta-laatusuhteeltaan paras läskipyörämme ja matkalippusi ympärivuotiseen pyöräilyyn. Se kulkee vaivattomasti niin lumessa kuin hiekalla ja ylittää sekä juuret että kivet.', '', 'active'),
(15, 1, 'Trek', 'farley_9.6', '3599', '2000.00', 'Farley 9.6 on hiilikuituinen fatbike-pyörä, joka on rakennettu nopeuden ehdoilla alustasta riippumatta. Kevyt hiilikuiturunko, jäykkä hiilikuituhaarukka ja huippuluokan 1x-voimansiirto tekevät siitä loistavan valinnan maastopyöräilijöille.', '', 'active'),
(16, 2, 'Scott', 'addict_rc15', '6599', '3000.00', 'Uusi Scott Addict RC on integroidumpi kuin koskaan ennen. Addict RC 15 on varusteltu Shimano Ultegran uudella sähköisellä osasarjalla, levyjarruilla ja Syncros hiilikuitukiekoilla. Näillä komponenteilla ajaminen ei jää ainakaan pyörästä kiinni.', '', 'active'),
(17, 2, 'Specialized', 'allez_elite', '1800', '900.00', 'Specialized Allez Elite on hinta-laatusuhteeltaan upea maantiepyörä. Allez tarjoaa luotettavuutta, toimivuutta ja ajomukavuutta kuitenkaan tyllikkyyttä unohtamatta. Allez Elitessä on legendaarinen Shimano 105 2x11 -vaihteisto.', '', 'active'),
(18, 2, 'Cannondale', 'synapse', '1199', '500.00', 'Synapse mallisto on tehty rennommalla ajoasennolla ja suuremmilla renkailla tehden pyörästä mukavamman ajaa myös pidempiä aikoja tai huonompia teitä. Runko on alumiinia ja haarukka on hiilikuitua.', '', 'active'),
(19, 2, 'Orbea', 'terra', '2049', '1000.00', 'Orbea Terra on alusta asti hiottu kesyttämään kaikki pyöräilijän tarpeet soratiellä. Sitä ei ole kehitetty uusituksi maantiepyöräksi eikä riisutuksi maastopyöräksi. Terra lisää ajomukavuutta reiteillesi ja vie sinut uudenlaiselle matkalle.', '', 'active'),
(20, 2, 'Orbea', 'orca', '5299', '2500.00', 'Suorituskyky, teknologia ja tyyli ovat olleet aina tärkeitä asioita pyöräilyssä. Orca on kevyempi, täysin integroidut vaijerin viennit ja huomattavasti aerodynaamisempi kuin edeltäjänsä.', '', 'active'),
(21, 2, 'Orbea', 'aero', '4549', '2200.00', 'Orca Aero on pyörä, jolla voit ajaa kovaa ja pitkään. Pyörä joka on varmasti viritetty huippuunsa ja joka tarjoaa ylivoimaista suorituskykyä. Pyörä jolla olet podiumin arvoinen.', '', 'active'),
(22, 3, 'Orbea', 'wild', '5590', '2300.00', 'Orbea Wild täysjoustosähkömaasturi. Äärimmäisen tyylikäs ja hienostunut alumiinirunko ja integroitu Boschin suuren kapasiteetin 625Wh akku yhdessä uuden Bosch Performance CX 4. sukupolven sähkömoottorin kanssa muodostavat todella saumattoman kokonaisuuden', '', 'active'),
(23, 3, 'Scott', 'patron', '6690', '3300.00', 'Upouusi Scott Patron eRIDE on suunniteltu ja optimoitu monipuoliseen maastoajoon vaikka koko päiväksi. Sen integroidut omanaisuudet ja huippuunsa hiottu geometria uuden tehokkaan Bosch moottorin kanssa tarjoaa enemmän kuin vain mahtavan ajokokemuksen.', '', 'active'),
(24, 3, 'Specialized', 'turbo_vado', '4300', '2150.00', 'Specialized Turbo Vado 4.0 malli on tyylikäs huippulaadukas sähköavusteinen kaupunkihybridi. Sen sisältä löytyy Specializedin 1.2 moottori, joka on suunniteltu erityisesti kaupunki- ja taajamakäyttöön.', '', 'active'),
(25, 3, 'Orbea', 'kemen', '4549', '2250.00', 'Kemenissä on Shimanon lippulaivamoottori EP8 täydellä 85 Nm väännöllä. Siron runkoputken sisään on mahdutettu Orbea Risestä tuttu 540 Wh akku, jolla ajaa jopa 5 tunnin lenkit avustuksella. Kemenit ovat erittäin hyvin varusteltuja.', '', 'active'),
(26, 3, 'Specialized', 'turbo_como', '3600', '3300.00', 'Uudistettu Specialized Turbo Como on rento ja mukava sähköpyörä mistä löytyy kuitenkin hyvin tehoa ajamiseen. Pysty ja rento ajoasento vähentää ajajan käsille kohdistuvaa kuormitusta. Turbo Full Power 2.0 moottori, 710Wh akku, vääntö 70Nm, 250W teho.', '', 'active'),
(27, 3, 'Orbea', 'vibe', '3499', '1700.00', 'Ebikemotion sähköjärjestelmällä varustettu Vibe sähköpyörä on tyylikäs, uskomattoman kevyt, sporttinen ja helposti ajettava! Vibe H30 mallissa on kevyt alumiinirunko, Shimano voimansiirto ja hydrauliset levyjarrut. Upeasti rullaavat 45mm leveät renkaat.', '', 'active');

-- --------------------------------------------------------

--
-- Rakenne taululle `tuoteryhma`
--

CREATE TABLE `tuoteryhma` (
  `trnro` int(11) NOT NULL,
  `tyyppi` char(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vedos taulusta `tuoteryhma`
--

INSERT INTO `tuoteryhma` (`trnro`, `tyyppi`, `status`) VALUES
(1, 'Maasto', 'active'),
(2, 'Maantie', 'active'),
(3, 'Sahko', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asiakas`
--
ALTER TABLE `asiakas`
  ADD PRIMARY KEY (`astunnus`);

--
-- Indexes for table `tilaus`
--
ALTER TABLE `tilaus`
  ADD PRIMARY KEY (`tilausnro`),
  ADD KEY `astunnus` (`astunnus`);

--
-- Indexes for table `tilausrivi`
--
ALTER TABLE `tilausrivi`
  ADD PRIMARY KEY (`tilausnro`),
  ADD KEY `tuotenro` (`tuotenro`);

--
-- Indexes for table `tuote`
--
ALTER TABLE `tuote`
  ADD PRIMARY KEY (`tuotenro`),
  ADD KEY `trnro` (`trnro`);

--
-- Indexes for table `tuoteryhma`
--
ALTER TABLE `tuoteryhma`
  ADD PRIMARY KEY (`trnro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asiakas`
--
ALTER TABLE `asiakas`
  MODIFY `astunnus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tilaus`
--
ALTER TABLE `tilaus`
  MODIFY `tilausnro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tilausrivi`
--
ALTER TABLE `tilausrivi`
  MODIFY `tilausnro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tuote`
--
ALTER TABLE `tuote`
  MODIFY `tuotenro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tuoteryhma`
--
ALTER TABLE `tuoteryhma`
  MODIFY `trnro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `tilaus`
--
ALTER TABLE `tilaus`
  ADD CONSTRAINT `tilaus_ibfk_1` FOREIGN KEY (`astunnus`) REFERENCES `asiakas` (`astunnus`);

--
-- Rajoitteet taululle `tilausrivi`
--
ALTER TABLE `tilausrivi`
  ADD CONSTRAINT `tilausrivi_ibfk_1` FOREIGN KEY (`tilausnro`) REFERENCES `tilaus` (`tilausnro`),
  ADD CONSTRAINT `tilausrivi_ibfk_2` FOREIGN KEY (`tuotenro`) REFERENCES `tuote` (`tuotenro`);

--
-- Rajoitteet taululle `tuote`
--
ALTER TABLE `tuote`
  ADD CONSTRAINT `tuote_ibfk_1` FOREIGN KEY (`trnro`) REFERENCES `tuoteryhma` (`trnro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
