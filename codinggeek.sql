-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jan 2020 pada 08.14
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codinggeek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `id_language` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `language_id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`language_id`, `name`, `image`) VALUES
(1, 'C#', 'http://192.168.100.4:5000/language/iconcsharp.jpg'),
(2, 'HTML', 'http://192.168.100.4:5000/language/iconhtml.jpg'),
(3, 'JAVA', 'http://192.168.100.4:5000/language/iconjava.jpg'),
(4, 'JavaScript', 'http://192.168.100.4:5000/language/iconjavascript.jpg'),
(5, 'NodeJS', 'http://192.168.100.4:5000/language/iconnodejs.png'),
(6, 'PHP', 'http://192.168.100.4:5000/language/iconphp.jpg'),
(7, 'Phyton', 'http://192.168.100.4:5000/language/iconphyton.jpg'),
(8, 'SQL', 'http://192.168.100.4:5000/language/iconsql.png'),
(9, 'C++', 'http://192.168.100.4:5000/language/iconcplusplus.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `country` varchar(10) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `bod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `pass`, `gender`, `country`, `occupation`, `bod`) VALUES
('11209ffc-3d63-44f2-b01b-4ec8401add6b', 'fizfarmad@gmail.com', '-', '65cba8b9fc24829baa2449a45fe1b5bb', '-', '-', '-', '0000-00-00'),
('17150058', 'a', 'Hafiz', '65cba8b9fc24829baa2449a45fe1b5bb', 'Male', 'Indonesia', 'Student', '1996-12-18');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_language_fk` (`id_language`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `id_language_fk` FOREIGN KEY (`id_language`) REFERENCES `language` (`language_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
