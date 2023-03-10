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
(10, 1, 'Specialized', 'chisel', '2100', '1000.00', 'Specialized Chisel 29\" on PRO-tason maastopy??r?? edullisella hinnalla. Super kevyt alumiinirunko yhdistettyn?? laadukkaisiin komponentteihin tekev??t t??st?? alumiinirunkoisen t??ysverisen kisamaastopy??r??n.', '', 'active'),
(11, 1, 'Specialized', 'chisel_comp', '2550', '1000.00', 'Specialized Chisel Comp maastopy??r??. Todella tyylik??s ja hienosti viimeistelty alumiinirunko. Vaihteistona Shimanon 1??11 takaa helpon ja sujuvan vaihtamisen. Tyylik??s punainen v??ri. Ei muuta kuin poluille nauttimaan!', '', 'active'),
(12, 1, 'Trek', 'fuel_exe9.5', '6900', '3000.00', 'Fuel EX 7 on kotonaan hankalissa alam??iss??, joissa tavallista parempi jousituskokonaisuus tulee tarpeeseen. Kevyt alumiinirunko, Tubeless Ready -kiekot ja luotettava 1x12-vaihteinen SRAM NX Eagle -voimansiirto tekev??t siit?? erinomaisen t??ysjouston.', '', 'active'),
(13, 1, 'Trek', 'rail_5', '4990', '2000.00', 'Rail 5 on s??hk??avusteinen maastopy??r??, joka on suunniteltu ep??tasaisessa maastossa revittelyyn. Se on varustettu samoilla korkealuokkaisilla osilla kuin s??hk??tt??m??t trail-py??r??mme ja uudella Bosch-moottorilla.', '', 'active'),
(14, 1, 'Trek', 'farley_5', '1990', '1000.00', 'Farley 5 on hinta-laatusuhteeltaan paras l??skipy??r??mme ja matkalippusi ymp??rivuotiseen py??r??ilyyn. Se kulkee vaivattomasti niin lumessa kuin hiekalla ja ylitt???? sek?? juuret ett?? kivet.', '', 'active'),
(15, 1, 'Trek', 'farley_9.6', '3599', '2000.00', 'Farley 9.6 on hiilikuituinen fatbike-py??r??, joka on rakennettu nopeuden ehdoilla alustasta riippumatta. Kevyt hiilikuiturunko, j??ykk?? hiilikuituhaarukka ja huippuluokan 1x-voimansiirto tekev??t siit?? loistavan valinnan maastopy??r??ilij??ille.', '', 'active'),
(16, 2, 'Scott', 'addict_rc15', '6599', '3000.00', 'Uusi Scott Addict RC on integroidumpi kuin koskaan ennen. Addict RC 15 on varusteltu Shimano Ultegran uudella s??hk??isell?? osasarjalla, levyjarruilla ja Syncros hiilikuitukiekoilla. N??ill?? komponenteilla ajaminen ei j???? ainakaan py??r??st?? kiinni.', '', 'active'),
(17, 2, 'Specialized', 'allez_elite', '1800', '900.00', 'Specialized Allez Elite on hinta-laatusuhteeltaan upea maantiepy??r??. Allez tarjoaa luotettavuutta, toimivuutta ja ajomukavuutta kuitenkaan tyllikkyytt?? unohtamatta. Allez Elitess?? on legendaarinen Shimano 105 2x11 -vaihteisto.', '', 'active'),
(18, 2, 'Cannondale', 'synapse', '1199', '500.00', 'Synapse mallisto on tehty rennommalla ajoasennolla ja suuremmilla renkailla tehden py??r??st?? mukavamman ajaa my??s pidempi?? aikoja tai huonompia teit??. Runko on alumiinia ja haarukka on hiilikuitua.', '', 'active'),
(19, 2, 'Orbea', 'terra', '2049', '1000.00', 'Orbea Terra on alusta asti hiottu kesytt??m????n kaikki py??r??ilij??n tarpeet soratiell??. Sit?? ei ole kehitetty uusituksi maantiepy??r??ksi eik?? riisutuksi maastopy??r??ksi. Terra lis???? ajomukavuutta reiteillesi ja vie sinut uudenlaiselle matkalle.', '', 'active'),
(20, 2, 'Orbea', 'orca', '5299', '2500.00', 'Suorituskyky, teknologia ja tyyli ovat olleet aina t??rkeit?? asioita py??r??ilyss??. Orca on kevyempi, t??ysin integroidut vaijerin viennit ja huomattavasti aerodynaamisempi kuin edelt??j??ns??.', '', 'active'),
(21, 2, 'Orbea', 'aero', '4549', '2200.00', 'Orca Aero on py??r??, jolla voit ajaa kovaa ja pitk????n. Py??r?? joka on varmasti viritetty huippuunsa ja joka tarjoaa ylivoimaista suorituskyky??. Py??r?? jolla olet podiumin arvoinen.', '', 'active'),
(22, 3, 'Orbea', 'wild', '5590', '2300.00', 'Orbea Wild t??ysjoustos??hk??maasturi. ????rimm??isen tyylik??s ja hienostunut alumiinirunko ja integroitu Boschin suuren kapasiteetin 625Wh akku yhdess?? uuden Bosch Performance CX 4. sukupolven s??hk??moottorin kanssa muodostavat todella saumattoman kokonaisuuden', '', 'active'),
(23, 3, 'Scott', 'patron', '6690', '3300.00', 'Upouusi Scott Patron eRIDE on suunniteltu ja optimoitu monipuoliseen maastoajoon vaikka koko p??iv??ksi. Sen integroidut omanaisuudet ja huippuunsa hiottu geometria uuden tehokkaan Bosch moottorin kanssa tarjoaa enemm??n kuin vain mahtavan ajokokemuksen.', '', 'active'),
(24, 3, 'Specialized', 'turbo_vado', '4300', '2150.00', 'Specialized Turbo Vado 4.0 malli on tyylik??s huippulaadukas s??hk??avusteinen kaupunkihybridi. Sen sis??lt?? l??ytyy Specializedin 1.2 moottori, joka on suunniteltu erityisesti kaupunki- ja taajamak??ytt????n.', '', 'active'),
(25, 3, 'Orbea', 'kemen', '4549', '2250.00', 'Kemeniss?? on Shimanon lippulaivamoottori EP8 t??ydell?? 85 Nm v????nn??ll??. Siron runkoputken sis????n on mahdutettu Orbea Risest?? tuttu 540 Wh akku, jolla ajaa jopa 5 tunnin lenkit avustuksella. Kemenit ovat eritt??in hyvin varusteltuja.', '', 'active'),
(26, 3, 'Specialized', 'turbo_como', '3600', '3300.00', 'Uudistettu Specialized Turbo Como on rento ja mukava s??hk??py??r?? mist?? l??ytyy kuitenkin hyvin tehoa ajamiseen. Pysty ja rento ajoasento v??hent???? ajajan k??sille kohdistuvaa kuormitusta. Turbo Full Power 2.0 moottori, 710Wh akku, v????nt?? 70Nm, 250W teho.', '', 'active'),
(27, 3, 'Orbea', 'vibe', '3499', '1700.00', 'Ebikemotion s??hk??j??rjestelm??ll?? varustettu Vibe s??hk??py??r?? on tyylik??s, uskomattoman kevyt, sporttinen ja helposti ajettava! Vibe H30 mallissa on kevyt alumiinirunko, Shimano voimansiirto ja hydrauliset levyjarrut. Upeasti rullaavat 45mm leve??t renkaat.', '', 'active');

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
