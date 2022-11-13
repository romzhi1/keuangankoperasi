-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Mar 2022 pada 05.13
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasicermat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_nama` varchar(255) NOT NULL,
  `bank_nomor` char(255) NOT NULL,
  `bank_pemilik` varchar(255) NOT NULL,
  `bank_saldo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_nama`, `bank_nomor`, `bank_pemilik`, `bank_saldo`) VALUES
(1, 'Bank Central Asia', '8465491555', 'Muhammad Romzhi Fatrianto', 1028500000),
(3, 'BNI', '8455093023', 'Koperasi Cermat Palembang', 3000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`) VALUES
(1, 'PINJAMAN'),
(2, 'SIMPANAN'),
(3, 'USAHA KETENAGAKERJAAN'),
(4, 'SEWA KENDARAAN'),
(5, 'SEWA CCTV'),
(6, 'MINIMARKET'),
(7, 'UMUM,PENDIDIKAN & PENGEMBANGAN'),
(8, 'OPERASIONAL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL,
  `transaksi_jenis` enum('Pengeluaran','Pemasukan') NOT NULL,
  `transaksi_kategori` int(11) NOT NULL,
  `transaksi_nominal` int(11) NOT NULL,
  `transaksi_keterangan` text NOT NULL,
  `transaksi_foto` varchar(255) NOT NULL,
  `transaksi_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_tanggal`, `transaksi_jenis`, `transaksi_kategori`, `transaksi_nominal`, `transaksi_keterangan`, `transaksi_foto`, `transaksi_bank`) VALUES
(3, '2022-01-24', 'Pemasukan', 6, 4000000, 'Pendapatan dari mini market', '1212366923_bunga lily rain.jpg', 1),
(4, '2022-01-24', 'Pengeluaran', 8, 5000000, 'Biaya Operasional Pengawas', '907279164_66026.jpg', 1),
(5, '2022-01-16', 'Pemasukan', 8, 3000000, 'Operasional Perusahaan', '1631282977__106090984_2e39b218-c369-452e-b5be-d2476f9d8728.jpg', 3),
(6, '2022-01-24', 'Pengeluaran', 8, 500000, 'Biaya Operasional Usaha', '990870212_bunga lily rain.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_foto` varchar(100) DEFAULT NULL,
  `user_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_foto`, `user_level`) VALUES
(1, 'Pengurus', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'avatar.png', 'Pengurus'),
(2, 'Akuntan', 'akuntan', '5acc540c98fc1ca5aeaaa9d5c69771c8', 'avatar.png', 'Akuntansi'),
(3, 'Muhammad Romzhi Fatrianto', 'romzhi', '32b69a3387fd0a8ad5bd6c637cebf1f6', '1180679803_user.png', 'Akuntansi'),
(4, 'Demico', 'ryan', '32b69a3387fd0a8ad5bd6c637cebf1f6', '', 'Pengurus');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
