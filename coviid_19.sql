-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2022 at 09:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coviid_19`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppId` int(11) NOT NULL,
  `Hosid` int(11) NOT NULL,
  `Patid` varchar(225) NOT NULL,
  `Date` date NOT NULL,
  `Fee` decimal(10,2) NOT NULL,
  `StatusVac` varchar(225) NOT NULL DEFAULT 'Pending',
  `Vacid` int(11) NOT NULL,
  `cnic` varchar(225) NOT NULL,
  `contact` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppId`, `Hosid`, `Patid`, `Date`, `Fee`, `StatusVac`, `Vacid`, `cnic`, `contact`) VALUES
(2, 2, 'Fahad', '2022-12-07', '2000.00', 'Pending', 14, '4255458899', '03456789765'),
(3, 1, 'Abc', '2022-12-07', '1200.00', 'Pending', 13, '4255458899', '03456789765');

-- --------------------------------------------------------

--
-- Table structure for table `covid-19 report`
--

CREATE TABLE `covid-19 report` (
  `id` int(11) NOT NULL,
  `Pat-id` int(11) NOT NULL,
  `Status` varchar(225) NOT NULL DEFAULT '',
  `Vac-id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldetail`
--

CREATE TABLE `hospitaldetail` (
  `Hosid` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `Role` varchar(225) NOT NULL DEFAULT 'H'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitaldetail`
--

INSERT INTO `hospitaldetail` (`Hosid`, `Name`, `Email`, `Address`, `Password`, `Role`) VALUES
(1, 'Agha Khan', 'aghakhan@gmail.com', 'PECHS', '$2y$10$4ULTdvgpWSCgE3zN3ZzuyOIgEbN/fI1HGWJnfl7wkJK/u8V2o7NxO', 'H'),
(2, 'Saifi', 'Saifi@gmail.com', 'Karachi', '$2y$10$BuGnRDGajse9vG20xxyd..DVgTwuL7Vo7B3hZu0AGfSoo4zlmaf5y', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `patientdetail`
--

CREATE TABLE `patientdetail` (
  `Pat-id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Contact` varchar(200) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `Role` varchar(225) NOT NULL DEFAULT 'P'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientdetail`
--

INSERT INTO `patientdetail` (`Pat-id`, `Name`, `Email`, `Address`, `Contact`, `Password`, `Role`) VALUES
(2, 'Abc', 'abc@gmail.com', 'Nazimabad no 5', '03350987654', '$2y$10$XnKoEkFKENSetRndyyeEo.TABEmy4W6PLJdtEXWJQSvgkZ7vzRu9u', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(225) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `Role` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `UserName`, `Email`, `Password`, `Role`) VALUES
(9, 'Admin', 'admin@gmail.com', '$2y$10$RU2LyF2Kcv.xPSNfSBjo.eqiCoSt/b9LHcJx.XiJBkNh78xX9MUZK', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `Vacid` int(11) NOT NULL,
  `NameVac` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `Status` varchar(225) NOT NULL,
  `Hospital_Name` varchar(11) NOT NULL,
  `Vac_Img` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`Vacid`, `NameVac`, `Date`, `Price`, `Description`, `Status`, `Hospital_Name`, `Vac_Img`) VALUES
(12, 'Sinaovac', '2022-12-02', '1000.00', 'Sinovac COVID-19 vaccine', 'Available', 'Agha Khan', '../Main_Layout/assets/images/sinovac.jfif'),
(13, 'Sinopharm', '2022-12-02', '1200.00', 'Sinopharm COVID-19 Vaccine (BBIBP-CorV)', 'Available', 'Agha Khan', '../Main_Layout/assets/images/sinopharm.jfif'),
(14, 'Pfizer', '2022-12-02', '2000.00', 'Pfizer-BioNTech and Moderna mRNA COVID-19 vaccines', 'Available', 'Agha Khan', '../Main_Layout/assets/images/phizer.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppId`),
  ADD KEY `Fk_Hospital` (`Hosid`),
  ADD KEY `Fk_Vaccine` (`Vacid`);

--
-- Indexes for table `covid-19 report`
--
ALTER TABLE `covid-19 report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_VaccId` (`Vac-id`),
  ADD KEY `Fk_PatientId` (`Pat-id`);

--
-- Indexes for table `hospitaldetail`
--
ALTER TABLE `hospitaldetail`
  ADD PRIMARY KEY (`Hosid`);

--
-- Indexes for table `patientdetail`
--
ALTER TABLE `patientdetail`
  ADD PRIMARY KEY (`Pat-id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`Vacid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `covid-19 report`
--
ALTER TABLE `covid-19 report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitaldetail`
--
ALTER TABLE `hospitaldetail`
  MODIFY `Hosid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patientdetail`
--
ALTER TABLE `patientdetail`
  MODIFY `Pat-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `Vacid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `Fk_Hospital` FOREIGN KEY (`Hosid`) REFERENCES `hospitaldetail` (`Hosid`),
  ADD CONSTRAINT `Fk_Vaccine` FOREIGN KEY (`Vacid`) REFERENCES `vaccination` (`Vacid`);

--
-- Constraints for table `covid-19 report`
--
ALTER TABLE `covid-19 report`
  ADD CONSTRAINT `FK_VaccId` FOREIGN KEY (`Vac-id`) REFERENCES `vaccination` (`Vacid`),
  ADD CONSTRAINT `Fk_PatientId` FOREIGN KEY (`Pat-id`) REFERENCES `patientdetail` (`Pat-id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
