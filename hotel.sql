-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 03:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartemen`
--

CREATE TABLE `apartemen` (
  `id_apartemen` int(11) NOT NULL,
  `nama_apartemen` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `harga` double NOT NULL,
  `harga_minggu` double NOT NULL,
  `harga_bulan` double NOT NULL,
  `foto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apartemen`
--

INSERT INTO `apartemen` (`id_apartemen`, `nama_apartemen`, `id_kota`, `harga`, `harga_minggu`, `harga_bulan`, `foto`) VALUES
(3, 'EL ROYALE', 1, 350000, 2400000, 9000000, 'hotel-laris-di-bandung.jpg'),
(4, 'Martas Windows Hotel', 6, 550000, 3800000, 15000000, '186509370.jpg'),
(5, 'Novotel Resort & Villas', 3, 400000, 2300000, 9050000, '36013285.jpg'),
(6, 'Hard Rock', 7, 570000, 3500000, 12000000, 'katamaran.jpg'),
(7, 'Louis Kienne', 4, 400000, 10000000, 50000000, 'luois.jpg'),
(8, 'Wyndham Opi Hotel', 5, 400000, 2500000, 10000000, 'Palembang.jpg'),
(9, 'Morrissey', 2, 300000, 2000000, 5000000, 'morrissey-boutique-serviced.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `nama_kota` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`) VALUES
(1, 'Bandung'),
(2, 'Jakarta'),
(3, 'Jogjakarta'),
(4, 'Semarang'),
(5, 'Palembang'),
(6, 'Mandalika'),
(7, 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `kode_booking` varchar(20) NOT NULL,
  `nomor_kamar` varchar(20) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_apartemen` int(11) NOT NULL,
  `hari` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `paket` varchar(200) NOT NULL,
  `jumlah_paket` int(11) NOT NULL,
  `total_bayar` double NOT NULL,
  `bukti_transfer` text DEFAULT NULL,
  `jenis_pembayaran` varchar(100) NOT NULL,
  `status_pembayaran` enum('sudah_dibayar','belum_dibayar','proses_verifikasi','ditolak') NOT NULL DEFAULT 'belum_dibayar',
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `kode_booking`, `nomor_kamar`, `id_user`, `id_apartemen`, `hari`, `checkin`, `paket`, `jumlah_paket`, `total_bayar`, `bukti_transfer`, `jenis_pembayaran`, `status_pembayaran`, `tgl_pesan`) VALUES
(1, 'BK-0001', '305', 2, 1, 1, '2019-11-20', 'harian', 1, 300000, NULL, 'cash', 'sudah_dibayar', '2019-11-20'),
(2, 'BK-0002', '001', 2, 1, 1, '2019-11-20', 'harian', 1, 300000, '23.jpeg', 'transfer', 'sudah_dibayar', '2019-11-20'),
(3, 'BK-0003', NULL, 2, 1, 1, '2019-12-12', 'harian', 1, 300000, 'header2.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(4, 'BK-0004', NULL, 2, 1, 2, '2019-12-12', 'harian', 2, 600000, NULL, 'cash', 'ditolak', '2019-11-21'),
(5, 'BK-0005', '002', 2, 1, 12, '2019-12-12', 'harian', 12, 3600000, 'anime-boy-sad.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(6, 'BK-0006', '337', 3, 1, 3, '2019-11-21', 'harian', 3, 900000, '54350293_2593634993983993_2715256269874135040_n.jpg', 'transfer', 'sudah_dibayar', '2019-11-21'),
(7, 'BK-0007', 'j17', 4, 3, 3, '2020-06-24', 'harian', 3, 600000, NULL, 'cash', 'sudah_dibayar', '2020-06-10'),
(8, 'BK-0008', 'A001', 5, 4, 1, '2021-11-27', 'harian', 1, 550000, '1_.png', 'transfer', 'sudah_dibayar', '2021-11-26'),
(9, 'BK-0009', '12', 6, 3, 2, '2022-11-10', 'harian', 2, 400000, NULL, 'cash', 'sudah_dibayar', '2022-11-09'),
(10, 'BK-0010', '12', 6, 4, 1, '2022-11-10', 'harian', 1, 550000, '21-5-Canal-Central-Hotel-2018-19.jpg', 'transfer', 'sudah_dibayar', '2022-11-09'),
(11, 'BK-0011', '', 6, 3, 1, '2022-11-10', 'harian', 1, 200000, NULL, 'cash', 'sudah_dibayar', '2022-11-09'),
(12, 'BK-0012', NULL, 6, 1, 1, '2022-11-11', 'harian', 1, 300000, NULL, 'cash', 'ditolak', '2022-11-10'),
(13, 'BK-0013', '12', 1, 1, 1, '2022-11-11', 'harian', 1, 300000, NULL, 'cash', 'sudah_dibayar', '2022-11-10'),
(14, 'BK-0014', '10', 6, 1, 1, '2022-11-10', 'harian', 1, 300000, 'room.jpg', 'transfer', 'sudah_dibayar', '2022-11-10'),
(15, 'BK-0015', '12', 6, 1, 1, '2022-11-11', 'harian', 1, 300000, 'WhatsApp_Image_2022-11-10_at_10_03_30.jpeg', 'transfer', 'sudah_dibayar', '2022-11-10'),
(16, 'BK-0016', '12', 6, 5, 1, '2022-11-10', 'harian', 1, 560000, NULL, 'cash', 'sudah_dibayar', '2022-11-10'),
(17, 'BK-0017', '', 6, 3, 1, '2022-11-11', 'harian', 1, 350000, 'jkt.jpg', 'transfer', 'sudah_dibayar', '2022-11-10'),
(18, 'BK-0018', NULL, 6, 1, 1, '2022-11-11', 'harian', 1, 300000, NULL, 'transfer', 'belum_dibayar', '2022-11-11'),
(19, 'BK-0019', '11', 7, 3, 7, '2022-11-12', 'mingguan', 1, 2400000, NULL, 'cash', 'sudah_dibayar', '2022-11-11'),
(20, 'BK-0020', '10', 7, 3, 7, '2022-11-14', 'mingguan', 1, 2400000, 'linac.png', 'transfer', 'sudah_dibayar', '2022-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 = admin, 2 = tamu'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_hp`, `username`, `password`, `level`) VALUES
(1, 'admin', 'disini saja', '087745512606', 'admin', '202cb962ac59075b964b07152d234b70', 1),
(6, 'tomo', 'jl kenangan', '3252323423', 'tomo', '4297f44b13955235245b2497399d7a93', 2),
(7, 'kelompok linac', 'indonesia', '087745512666', 'linac', '827ccb0eea8a706c4c34a16891f84e7b', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartemen`
--
ALTER TABLE `apartemen`
  ADD PRIMARY KEY (`id_apartemen`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartemen`
--
ALTER TABLE `apartemen`
  MODIFY `id_apartemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
