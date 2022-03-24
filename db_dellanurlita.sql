-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 09:21 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ayulestari_dellanurlita`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_chekin`
--

CREATE TABLE `tb_chekin` (
  `id_chekin` int(11) NOT NULL,
  `kd_tamu` varchar(50) NOT NULL,
  `kd_kamar` varchar(5) NOT NULL,
  `tanggal_chekin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_chekout`
--

CREATE TABLE `tb_chekout` (
  `id_chekout` int(11) NOT NULL,
  `kd_tamu` varchar(10) NOT NULL,
  `kd_kamar` varchar(5) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `tanggal_chekout` date NOT NULL,
  `biaya_inap` decimal(10,0) NOT NULL,
  `total_biaya` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `kd_kamar` varchar(5) NOT NULL,
  `nama_kamar` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `tarif_kamar` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesan` int(11) NOT NULL,
  `kd_tamu` varchar(10) NOT NULL,
  `kd_kamar` varchar(5) NOT NULL,
  `total_pesanan` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tamu`
--

CREATE TABLE `tb_tamu` (
  `kd_tamu` varchar(10) NOT NULL,
  `nama_tamu` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_ktp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level_user` enum('admin','petugas','pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `username`, `password`, `telepon`, `email`, `level_user`) VALUES
(1, 'della', 'della123', '66be74fbb3086ea7b774f393cd264671', '02121212121', 'della@gmail.com', 'admin'),
(2, 'ayu', 'ayu123', 'fae38bd94701cdf2a9d114425cb40292', '02121212212', 'ayu@gmaill.com', 'admin'),
(3, 'petugas', 'petugas123', '570c396b3fc856eceb8aa7357f32af1a', '0121212121', 'petugas@gmail.com', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_chekin`
--
ALTER TABLE `tb_chekin`
  ADD PRIMARY KEY (`id_chekin`),
  ADD KEY `id_tamu` (`kd_tamu`),
  ADD KEY `kd_kamar` (`kd_kamar`);

--
-- Indexes for table `tb_chekout`
--
ALTER TABLE `tb_chekout`
  ADD PRIMARY KEY (`id_chekout`),
  ADD KEY `id_tamu` (`kd_tamu`),
  ADD KEY `id_pesan` (`id_pesan`),
  ADD KEY `kd_kamar` (`kd_kamar`);

--
-- Indexes for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`kd_kamar`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `kd_kamar` (`kd_kamar`),
  ADD KEY `kd_tamu` (`kd_tamu`);

--
-- Indexes for table `tb_tamu`
--
ALTER TABLE `tb_tamu`
  ADD PRIMARY KEY (`kd_tamu`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_chekin`
--
ALTER TABLE `tb_chekin`
  ADD CONSTRAINT `tb_chekin_ibfk_1` FOREIGN KEY (`kd_tamu`) REFERENCES `tb_tamu` (`kd_tamu`),
  ADD CONSTRAINT `tb_chekin_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `tb_kamar` (`kd_kamar`);

--
-- Constraints for table `tb_chekout`
--
ALTER TABLE `tb_chekout`
  ADD CONSTRAINT `tb_chekout_ibfk_1` FOREIGN KEY (`kd_tamu`) REFERENCES `tb_tamu` (`kd_tamu`),
  ADD CONSTRAINT `tb_chekout_ibfk_2` FOREIGN KEY (`id_pesan`) REFERENCES `tb_pesanan` (`id_pesan`),
  ADD CONSTRAINT `tb_chekout_ibfk_3` FOREIGN KEY (`kd_kamar`) REFERENCES `tb_kamar` (`kd_kamar`);

--
-- Constraints for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD CONSTRAINT `tb_pesanan_ibfk_1` FOREIGN KEY (`kd_kamar`) REFERENCES `tb_kamar` (`kd_kamar`),
  ADD CONSTRAINT `tb_pesanan_ibfk_2` FOREIGN KEY (`kd_tamu`) REFERENCES `tb_tamu` (`kd_tamu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
