-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 03:30 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_peminjaman`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` int(11) NOT NULL,
  `nama_buku` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `penerbit` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `harga_pinjam` decimal(10,2) NOT NULL,
  `stock_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `nama_buku`, `penerbit`, `harga_pinjam`, `stock_buku`) VALUES
(1, 'Pemrograman Java Dasar', 'Erlangga', '5000.00', 10),
(2, 'Algoritma dan Struktur Data', 'Andi Publisher', '7000.00', 8),
(3, 'Jaringan Komputer', 'Gramedia', '6000.00', 4),
(4, 'Dasar-dasar Sistem Operasi', 'Salemba Empat', '8000.00', 12),
(5, 'Matematika Diskrit', 'Informatika', '6500.00', 14),
(6, 'Database Management System', 'Erlangga', '7500.00', 9),
(7, 'Pengantar Kecerdasan Buatan', 'Andi Publisher', '9000.00', 5),
(8, 'Sistem Basis Data', 'Gramedia', '7000.00', 6),
(9, 'Pengembangan Aplikasi Web', 'Salemba Empat', '8500.00', 8),
(10, 'Pemrograman Python', 'Informatika', '6000.00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `id_favorit` int(11) NOT NULL,
  `nik` int(11) NOT NULL,
  `kode_buku` int(11) NOT NULL,
  `nama_buku` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `nama_penyewa` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorit`
--

INSERT INTO `favorit` (`id_favorit`, `nik`, `kode_buku`, `nama_buku`, `nama_penyewa`) VALUES
(1, 12345, 3, 'Jaringan Komputer', 'rijal'),
(2, 12345, 10, 'Pemrograman Python', 'rijal');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `nik` int(11) NOT NULL,
  `nama_penyewa` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `nomor_telefon` varchar(15) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`nik`, `nama_penyewa`, `alamat`, `nomor_telefon`) VALUES
(123, 'sya', 'madura', '0861'),
(12345, 'rijal', 'nganjuk', '0812467'),
(23111, 'eka', 'nganjuk', '085555551'),
(123456, 'bebel', 'kediri', '08838832'),
(230441, 'mentari', 'nganjuk jatim', '0866662222'),
(298389, 'belia', 'nganjuk', '085257145665');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `nik` int(11) NOT NULL,
  `nama_penyewa` varchar(255) NOT NULL,
  `nama_buku` varchar(255) NOT NULL,
  `harga_buku` decimal(10,2) NOT NULL,
  `mulai_pinjam` date NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `akhir_pinjam` date NOT NULL,
  `total_biaya` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id_pinjam`, `nik`, `nama_penyewa`, `nama_buku`, `harga_buku`, `mulai_pinjam`, `lama_pinjam`, `akhir_pinjam`, `total_biaya`) VALUES
(1, 123456, 'bebel', 'Dasar-dasar Sistem Operasi', '8000.00', '2024-11-15', 3, '2024-11-18', '24000.00'),
(2, 123456, 'bebel', 'Matematika Diskrit', '6500.00', '2024-11-15', 4, '2024-11-19', '26000.00'),
(3, 12345, 'rijal', 'Jaringan Komputer', '6000.00', '2024-11-15', 4, '2024-11-19', '24000.00'),
(4, 123, 'sya', 'Pengantar Kecerdasan Buatan', '9000.00', '2024-11-15', 2, '2024-11-17', '18000.00'),
(5, 123, 'sya', 'Pengantar Kecerdasan Buatan', '9000.00', '2024-11-15', 2, '2024-11-17', '18000.00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'user1', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id_favorit`),
  ADD KEY `fk_nik` (`nik`),
  ADD KEY `fk_kode_buku` (`kode_buku`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `fk_nik_penyewa` (`nik`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `kode_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `favorit`
--
ALTER TABLE `favorit`
  MODIFY `id_favorit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `nik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298390;
--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `fk_kode_buku` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`),
  ADD CONSTRAINT `fk_nik` FOREIGN KEY (`nik`) REFERENCES `penyewa` (`nik`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `fk_nik_penyewa` FOREIGN KEY (`nik`) REFERENCES `penyewa` (`nik`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
