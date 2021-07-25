-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2021 at 09:57 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentalmobil`
--
CREATE DATABASE IF NOT EXISTS `rentalmobil` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rentalmobil`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user`, `pass`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `idRental` varchar(255) DEFAULT NULL,
  `tglInput` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `idRental`, `tglInput`) VALUES
(1, '1', '25 Juli 2021'),
(2, '2', '25 Juli 2021'),
(3, '3', '25 Juli 2021');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `no` int(11) NOT NULL,
  `idMobil` varchar(255) NOT NULL,
  `merek` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `kapasitas` varchar(255) DEFAULT NULL,
  `plat` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`no`, `idMobil`, `merek`, `nama`, `jenis`, `kapasitas`, `plat`, `harga`, `status`) VALUES
(1, 'MBL-1', 'TOYOTA', 'AVANZA', 'SUV', '1000 CC', 'B 2139 PIS', '250000', 'Tersedia'),
(3, 'MBL-2', 'DAIHATSU', 'XENIA', 'SUV', '1000 CC', 'F 3488 SIC', '250000', 'On Rental'),
(4, 'MBL-4', 'HONDA', 'BRIO', 'Hatchback', '1000 CC', 'B 4385 PSA', '300000', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `tglInput` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `nama`, `ktp`, `alamat`, `telp`, `tglInput`) VALUES
('1', 'SETIADI', '31982395884', 'JL. BOJONG', '098763463', '25 Juli 2021'),
('2', 'FAUZI', '38983987422', 'JL. CISADA', '098438853', '25 Juli 2021'),
('3', 'MULYANA', '332981209823', 'JL. RAYA BOGOR', '089898663', '25 Juli 2021');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idRental` varchar(255) NOT NULL,
  `total` varchar(255) DEFAULT NULL,
  `uangmuka` varchar(255) DEFAULT NULL,
  `sisabayar` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idRental`, `total`, `uangmuka`, `sisabayar`, `status`) VALUES
('1', '1250000', '1250000', '0', 'DP'),
('2', '600000', '600000', '0', 'DP'),
('3', '750000', '250000', '500000', 'DP');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `idRental` varchar(255) NOT NULL,
  `idPelanggan` varchar(255) NOT NULL,
  `idMobil` varchar(255) NOT NULL,
  `jangkaWaktu` varchar(255) DEFAULT NULL,
  `tglPinjam` varchar(255) DEFAULT NULL,
  `tglKembali` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`idRental`, `idPelanggan`, `idMobil`, `jangkaWaktu`, `tglPinjam`, `tglKembali`, `status`) VALUES
('1', '1', 'MBL-2', '5', '25 Juli 2021', '30 Juli 2021', 'Selesai'),
('2', '2', 'MBL-4', '2', '25 Juli 2021', '27 Juli 2021', 'Selesai'),
('3', '3', 'MBL-2', '3', '25 Juli 2021', '28 Juli 2021', 'Berjalan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`no`,`idMobil`) USING BTREE;

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idRental`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`idRental`,`idPelanggan`,`idMobil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
