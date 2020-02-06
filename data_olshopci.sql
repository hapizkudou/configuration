-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Feb 2020 pada 04.18
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_olshopci`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'android', 'Android'),
(2, 'laptops', 'Laptops'),
(3, 'console-game', 'Playstation'),
(4, 'dekstop', 'Computers'),
(5, 'pheriperal', 'Pheriperal'),
(6, 'accessorise-smartphone', 'Accessorise Smartphone');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 4, '2019-12-16', '420191216162025', 32637000, 'hapis', 'medan', '0812345678', 'paid'),
(2, 4, '2019-12-17', '420191217132324', 17309500, 'ridwan', 'medan', '084869123456', 'cancel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(4, 1, 'hapis', '084869', 32637000, '-', '420191216162025-20191217125257.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 2, 15482000),
(2, 1, 1, 1, 17155000),
(3, 2, 1, 1, 17155000),
(4, 2, 2, 1, 154500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `title`, `slug`, `description`, `price`, `is_available`, `image`) VALUES
(1, 2, 'ASUS ROG STRIX GL503GE', 'asus-rog-strix-gl503ge', 'Tipe Processor  \r\n8th Gen Intel Core i7-8750H\r\n\r\nDetail Processor  \r\n2.80 \'\'\" 3.80 GHz, 6 MB Cache\r\n\r\nMemori  \r\n8 GB 2400 MHz DDR4\r\n\r\nPenyimpanan  \r\n128 GB SSD + 1 TB 5400 rpm SATA HDD + 8G Hybrid HDD\r\n\r\nOptikal  \r\n\'\'\"\r\n\r\nKartu Grafis  \r\nIntel HD Graphics', 17155000, 1, 'asus-rog-strix-gl503ge-2019121213152556.png'),
(2, 6, 'KZ ZSN Pro with Mic 1DD+1BA Hybrid ', 'kz-zsn-pro-with-mic-1dd1ba-hybrid', 'KZ - ZSN Pro Hybrid technology Professional Earphones Experience of grand Dynamic Details \r\n\r\nThree times the cost of ordinary dynamic earphones! Stunning technology configuration, Casting the professional sound quality of the Hybrid technology type Earph', 154500, 1, 'kz-zsn-pro-with-mic-1dd1ba-hybrid-2019121213152712.png'),
(3, 5, 'Asus ROG Spatha', 'asus-rog-spartha', 'Connectivity Technology\r\nWired/Wireless\r\nWireless Technology\r\nRF 2.4GHz\r\nTracking\r\nLaser', 2260000, 1, 'asus-rog-spatha-2019121213152648.png'),
(4, 4, 'ASUS DESKTOP ROG STRIX GL10CS', 'asus-desktop-rog-strix-gl10cs', 'Deskripsi Produk\r\n- Processor : i5-9400\r\n- Graphic : NVIDIA® GeForce® GT1030 : 2GB\r\n- Memory : 4GB DDR4 (Up to 32GB of 2666MHz DDR4 RAM)\r\n- HDD : 1TB 7200RPM\r\n- On Board Expansion :\r\n1 x M.2 Connector for WiFi\r\n1 x M.2 Connector for SSD(Sata)\r\n1 x PCIE x1', 7741000, 1, 'asus-desktop-rog-strix-gl10cs-2019121213152656.png'),
(6, 3, 'Stik Sony PS4', 'stik-sony-ps4', 'Ready Stock warna: Biru, Merah, Putih, Army (Camouflage)\r\n\r\nPS4 #DualShock4 #Wireless #Controller merupakan generasi terbaru dari seri controller #DualShock yang diciptakan sebagai controller #PS4 Slim dan PRO. Mempunyai desain yang mirip dengan pendahulu', 799000, 0, 'stik-sony-ps4-2019121213152703.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(1, 'member pertama', 'member@mail.com', '$2y$10$GVPpBxlJjLqqFWe7UCfkCuKWWCkjhLHNKo59NW0o.3PFzkVHwHEw6', 'admin', 1, 'member-pertama-20191212171416.png'),
(2, '1234567', '123456@mail.com', '$2y$10$R.JmwKi34TCVPE9dkTi/eu2cvDjAmRNP32LCIpx1af02i9s55vJgy', 'member', 1, '1234567-20191213115154.jpg'),
(4, 'hapis', 'hapis@mail.com', '$2y$10$4ouyy48A3QO8YBkhpMGbtewddb1r0KgU/TdhZp1REZYZrMw1sPZZK', 'admin', 1, 'hapis-20191212171807.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
