-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22 Jan 2021 pada 03.47
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventorymel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_items`
--

CREATE TABLE `input_items` (
  `id_input` bigint(11) NOT NULL,
  `id_item` bigint(11) DEFAULT NULL,
  `id_supplier` bigint(11) DEFAULT NULL,
  `qty_input` int(11) NOT NULL,
  `kb_input` int(11) NOT NULL,
  `tgl_input` date NOT NULL,
  `h_stokInput` int(11) NOT NULL,
  `id_user` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `input_items`
--

INSERT INTO `input_items` (`id_input`, `id_item`, `id_supplier`, `qty_input`, `kb_input`, `tgl_input`, `h_stokInput`, `id_user`) VALUES
(38, 16, 14, 100, 10, '2021-01-20', 100, 2),
(39, 16, 14, 50, 5, '2021-01-20', 150, 2),
(40, 16, 14, 20, 2, '2021-01-21', 170, 2),
(41, 17, 15, 200, 20, '2021-01-21', 200, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id_item` bigint(11) NOT NULL,
  `nama_item` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `kb` int(11) NOT NULL,
  `stok_limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id_item`, `nama_item`, `jenis`, `netto`, `merk`, `stok`, `kb`, `stok_limit`) VALUES
(16, 'day cream', 'cream', '100', 'mellydia', 140, 14, 0),
(17, 'night cream', 'cream', '100', 'mellydia', 200, 20, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `output_items`
--

CREATE TABLE `output_items` (
  `id_output` bigint(11) NOT NULL,
  `id_item` bigint(11) DEFAULT NULL,
  `qty_output` int(11) NOT NULL,
  `kb_output` int(11) NOT NULL,
  `tgl_output` date NOT NULL,
  `h_stokOutput` int(11) NOT NULL,
  `id_user` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `output_items`
--

INSERT INTO `output_items` (`id_output`, `id_item`, `qty_output`, `kb_output`, `tgl_output`, `h_stokOutput`, `id_user`) VALUES
(12, 16, 30, 3, '2021-01-21', 140, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` bigint(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `kontak` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `nama_supplier`, `kontak`) VALUES
(14, 'coy', '081'),
(15, 'rudi', '082');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_items`
--

CREATE TABLE `transaksi_items` (
  `id_ti` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `stok_masuk` int(11) DEFAULT NULL,
  `kb_masuk` int(11) DEFAULT NULL,
  `stok_keluar` int(11) DEFAULT NULL,
  `kb_keluar` int(11) DEFAULT NULL,
  `sisa_stok` int(11) DEFAULT NULL,
  `sisa_kb` int(11) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `id_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_items`
--

INSERT INTO `transaksi_items` (`id_ti`, `tanggal`, `stok_masuk`, `kb_masuk`, `stok_keluar`, `kb_keluar`, `sisa_stok`, `sisa_kb`, `keterangan`, `id_item`) VALUES
(4, '2021-01-20', 150, 15, NULL, NULL, 150, 15, 'disetujui', 16),
(5, '2021-01-21', 20, 2, 30, 3, 140, 14, NULL, 16),
(6, '2021-01-21', 200, 20, NULL, NULL, 200, 20, NULL, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` bigint(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`) VALUES
(2, 'superadmin', 'superadmin@superadmin.com', '17c4520f6cfd1ab53d8745e84681eb49', 'superadmin'),
(9, 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `input_items`
--
ALTER TABLE `input_items`
  ADD PRIMARY KEY (`id_input`),
  ADD KEY `id_items` (`id_item`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `output_items`
--
ALTER TABLE `output_items`
  ADD PRIMARY KEY (`id_output`),
  ADD KEY `id_items` (`id_item`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi_items`
--
ALTER TABLE `transaksi_items`
  ADD PRIMARY KEY (`id_ti`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `input_items`
--
ALTER TABLE `input_items`
  MODIFY `id_input` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id_item` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `output_items`
--
ALTER TABLE `output_items`
  MODIFY `id_output` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `transaksi_items`
--
ALTER TABLE `transaksi_items`
  MODIFY `id_ti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
