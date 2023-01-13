-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2023 pada 08.04
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_manonjaya`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `DeleteBarangKeluar` AFTER DELETE ON `barang_keluar` FOR EACH ROW BEGIN UPDATE items SET stok=stok+old.qty WHERE items.id=old.item_id; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TriggerBarangKeluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN UPDATE items SET stok=stok-new.qty WHERE items.id=new.item_id; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `item_id`, `qty`, `trx_date`) VALUES
(1, 1, 7, '2022-10-10'),
(2, 2, 4, '2022-10-10'),
(3, 3, 91, '2022-10-10'),
(4, 4, 72, '2022-10-10'),
(5, 5, 300, '2022-10-10'),
(6, 6, 29, '2022-10-10'),
(7, 7, 6, '2022-10-10'),
(8, 9, 10, '2022-10-10'),
(9, 10, 6, '2022-10-10'),
(10, 11, 1, '2022-10-10'),
(11, 12, 1, '2022-10-10'),
(12, 13, 1, '2022-10-10'),
(13, 14, 1, '2022-10-10'),
(14, 15, 15, '2022-10-10'),
(15, 16, 43, '2022-10-10'),
(16, 17, 16, '2022-10-10'),
(17, 18, 18, '2022-10-10'),
(18, 19, 12, '2022-10-10'),
(19, 20, 1, '2022-10-10'),
(20, 21, 4, '2022-10-10'),
(21, 22, 5, '2022-10-10'),
(22, 23, 3, '2022-10-10'),
(23, 24, 6, '2022-10-10'),
(24, 25, 8, '2022-10-10'),
(25, 26, 2, '2022-10-10'),
(26, 27, 2, '2022-10-10'),
(27, 28, 3, '2022-10-10'),
(28, 29, 6, '2022-10-10'),
(29, 30, 5, '2022-10-10'),
(30, 32, 5, '2022-10-10'),
(31, 31, 5, '2022-10-10'),
(32, 33, 7, '2022-10-10'),
(33, 34, 1, '2022-10-10'),
(34, 35, 9, '2022-10-10'),
(35, 36, 3, '2022-10-10'),
(36, 37, 1, '2022-10-10'),
(37, 38, 4, '2022-10-10'),
(38, 39, 8, '2022-10-10'),
(39, 40, 12, '2022-10-10'),
(40, 41, 12, '2022-10-10'),
(41, 42, 12, '2022-10-10'),
(42, 43, 3, '2022-10-10'),
(43, 37, 9, '2022-10-18'),
(44, 7, 5, '2022-11-07'),
(45, 35, 5, '2022-11-07'),
(46, 33, 5, '2022-11-07'),
(47, 20, 2, '2022-11-07'),
(48, 44, 2, '2022-11-07'),
(49, 2, 12, '2022-11-07'),
(50, 4, 100, '2022-11-14'),
(51, 11, 1, '2022-11-15'),
(52, 13, 1, '2022-11-15'),
(53, 12, 1, '2022-11-15'),
(54, 14, 2, '2022-11-15'),
(55, 4, 528, '2022-11-15'),
(56, 4, 1, '2022-11-15'),
(57, 15, 50, '2022-11-15'),
(58, 3, 100, '2022-12-07'),
(59, 33, 1, '2022-12-08'),
(60, 45, 1, '2022-12-08'),
(61, 6, 28, '2022-12-08'),
(62, 33, 5, '2023-01-04'),
(63, 6, 10, '2023-01-04'),
(64, 7, 3, '2023-01-04'),
(65, 35, 3, '2023-01-04'),
(66, 5, 1, '2023-01-10');

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `DeleteBarangMasuk` AFTER DELETE ON `barang_masuk` FOR EACH ROW BEGIN UPDATE items SET stok=stok-old.qty WHERE items.id=old.item_id; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahStok` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN UPDATE items SET stok=stok+new.qty WHERE items.id=new.item_id; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cetakan`
--

CREATE TABLE `cetakan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cetakan`
--

INSERT INTO `cetakan` (`id`, `kode`, `nama`, `path`) VALUES
(1, 'cy95m4', 'KURNIASIH', '/MBA/tes/@20-Oct-2022@tes@tes@1.jfif'),
(2, 'cy95m4', 'KURNIASIH', '/MBA/tes/@20-Oct-2022@tes@tes@1.jfif'),
(3, 'y4wm20', 'logo', '/MBA/tes/@19-Oct-2022@tes@tes@ul.png'),
(4, 'oohi57', 'Dewi Gowa talo', '/MBA/KERAJAAN GOWA TALO/@27-Oct-2022@Dewi@KERAJAAN GOWA TALO@53.jpg'),
(5, 'ueyhcb', 'oom', '/MBA/gowa talo/@25-Nov-2022@oom@gowa talo@5.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` enum('unit','pcs','lembar','stick','roll') COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `name`, `satuan`, `stok`) VALUES
(1, 'Odner Kecil', 'pcs', 5),
(2, 'Odner Besar', 'pcs', 7),
(3, 'Buku Tabungan', 'pcs', 78),
(4, 'Kartu Angsuran', 'pcs', 410),
(5, 'Kartu Taber', 'pcs', 186),
(6, 'Pulpen', 'stick', 25),
(7, 'Lem Kertas', 'stick', 9),
(9, 'Spidol', 'stick', 8),
(10, 'Lakban Bening Kecil', 'roll', 5),
(11, 'Tinta Merah', 'unit', 2),
(12, 'Tinta Kuning', 'unit', 2),
(13, 'Tinta Biru', 'unit', 2),
(14, 'Tinta Hitam', 'unit', 2),
(15, 'Kwitansi Transaksi', 'pcs', 36),
(16, 'Kwitansi Debet', 'pcs', 41),
(17, 'Kwitansi Credit', 'pcs', 14),
(18, 'Map Plastik', 'pcs', 17),
(19, 'Businnes File', 'pcs', 8),
(20, 'Staples', 'unit', 2),
(21, 'Note', 'pcs', 4),
(22, 'Triagonal Clips', 'pcs', 5),
(23, 'Staples Arsip', 'pcs', 3),
(24, 'Buku Catatan', 'pcs', 5),
(25, 'Stabilo', 'pcs', 8),
(26, 'Cap Kecil', 'unit', 2),
(27, 'Tipe-x', 'pcs', 2),
(28, 'Lakban Kertas', 'roll', 3),
(29, 'Doubletape Kecil', 'roll', 6),
(30, 'Lakban Hitam', 'roll', 5),
(31, 'Company Profile', 'lembar', 5),
(32, 'Box File', 'pcs', 5),
(33, 'Kertas A4', 'pcs', 8),
(34, 'Gunting', 'unit', 1),
(35, 'Isi Staples', 'pcs', 10),
(36, 'Kantung Uang', 'unit', 2),
(37, 'Nazava Ryam', 'unit', 6),
(38, 'Lakban Bening Besar', 'roll', 4),
(39, 'Posh it', 'pcs', 7),
(40, 'Binder Clips Kecil', 'pcs', 12),
(41, 'Binder Clips Sedang', 'pcs', 11),
(42, 'Binder Clips Besar', 'pcs', 12),
(43, 'Push Pin', 'pcs', 2),
(44, 'Penggaris', 'pcs', 1),
(45, 'Kertas F4', 'pcs', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kolektabilitas`
--

CREATE TABLE `kolektabilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `petugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majelis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pokok` decimal(15,0) DEFAULT NULL,
  `margin` decimal(15,0) DEFAULT NULL,
  `jangka_waktu` int(11) DEFAULT NULL,
  `angsuran_pokok` decimal(15,0) DEFAULT NULL,
  `angsuran_margin` decimal(15,0) DEFAULT NULL,
  `terbayar` int(11) DEFAULT NULL,
  `seharusnya` int(11) DEFAULT NULL,
  `saldo_pokok` decimal(15,0) DEFAULT NULL,
  `saldo_margin` decimal(15,0) DEFAULT NULL,
  `tunggakan_angsuran` int(11) DEFAULT NULL,
  `tunggakan_hari` int(11) DEFAULT NULL,
  `tunggakan_pokok` decimal(15,0) DEFAULT NULL,
  `tunggakan_margin` decimal(15,0) DEFAULT NULL,
  `par` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpp_persentase` int(11) NOT NULL,
  `cpp_nominal` decimal(15,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majelis`
--

CREATE TABLE `majelis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `majelis`
--

INSERT INTO `majelis` (`id`, `nama`) VALUES
(1, 'CANDI SEMBADRA'),
(2, 'CANDI PUNTADEWA'),
(3, 'CANDI JABUNG'),
(4, 'KERAJAAN TERNATE'),
(5, 'KERAJAAN SAMBALIUNG'),
(6, 'KERAJAAN TABANAN'),
(7, 'KERAJAAN SERDANG'),
(8, 'KERAJAAN TORIBULU'),
(9, 'CANDI CHETO'),
(10, 'CANDI PENATARAN'),
(11, 'CANDI JAWI'),
(12, 'CANDI MUARA TAKUS'),
(13, 'CANDI BUBRAH'),
(14, 'CANDI GEDONG SONGO'),
(15, 'CANDI GAJAH MUNGKUR'),
(16, 'CANDI PRAMBANAN'),
(17, 'CANDI SOJIWAN'),
(18, 'CANDI KIDAL'),
(19, 'CANDI BAHAL'),
(20, 'CANDI SINGASARI'),
(21, 'CANDI SAWENTAR'),
(22, 'CANDI GENTONG'),
(23, 'KERAJAAN GALUH'),
(24, 'KERAJAAN PAGATAN'),
(25, 'KERAJAAN GOWA TALLO'),
(26, 'CANDI SARI'),
(27, 'CANDI SEMAR'),
(28, 'KERAJAAN SERDANG'),
(29, 'CANDI PALANGKA'),
(30, 'CANDI ARCA GUPOLO'),
(31, 'CANDI PRINGAPUS'),
(32, 'KERAJAAN KAHURIPAN'),
(33, 'KERAJAAN MEDANG'),
(34, 'KERAJAAN DEMAK'),
(35, 'KERAJAAN WANGSA ISYANA'),
(36, 'CANDI BOGANG'),
(37, 'KERAJAAN BANTEN'),
(38, 'CANDI BAJANG RATU'),
(39, 'CANDI KIMPULAN'),
(40, 'CANDI ARCA GUPOLO'),
(41, 'KERAJAAN WAJO'),
(42, 'CANDI MENAK JINGGA'),
(43, 'KERAJAAN HOLING'),
(44, 'CANDI UMBUL'),
(45, 'KERAJAAN TIDORE'),
(46, 'KERAJAAN JEUMPA'),
(47, 'CANDI CANGGAL'),
(48, 'CANDI GONDOSULI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_09_19_074119_items', 1),
(5, '2022_09_19_074824_petugas', 1),
(6, '2022_09_19_075052_barang_masuk', 1),
(7, '2022_09_19_075256_barang_keluar', 1),
(8, '2022_09_19_075328_transaksi', 1),
(9, '2022_09_20_132106_kolektabilitas', 1),
(10, '2022_10_06_154421_trigger_tambahstok', 1),
(11, '2022_10_06_154525_trigger_transaksi', 1),
(12, '2022_10_06_154901_trigger_barangkeluar', 1),
(13, '2022_10_07_140315_wakalah', 1),
(14, '2022_10_08_055558_majelis', 1),
(15, '2022_10_18_114552_mba_foto', 2),
(16, '2022_10_22_095052_cetakan', 3),
(17, '2022_10_17_065604_sp3', 4),
(18, '2022_10_31_055816_validasi_tabungan', 4),
(19, '2022_11_07_072240_verif_tabungan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `murabahah`
--

CREATE TABLE `murabahah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `murabahah`
--

INSERT INTO `murabahah` (`id`, `deskripsi`, `tanggal`, `path`) VALUES
(1, 'logo baytul.png', '2022-10-19', '/MBA/tes/@19-Oct-2022@tes@tes@ul.png'),
(2, '1.jfif', '2022-10-20', '/MBA/tes/@20-Oct-2022@tes@tes@1.jfif'),
(3, '1.jfif', '2022-10-20', '/MBA/tes/@20-Oct-2022@tes@tes@1.jfif'),
(4, '1.jfif', '2022-10-25', '/MBA/tes/@25-Oct-2022@tes@tes@1.jfif'),
(5, 'IMG_20221027_145453.jpg', '2022-10-27', '/MBA/KERAJAAN GOWA TALO/@27-Oct-2022@Dewi@KERAJAAN GOWA TALO@53.jpg'),
(6, 'IMG-20221104-WA0003.jpg', '2022-11-04', '/MBA/KERAJAAN GOWA TALO/@04-Nov-2022@DEWI HANDAYANI@KERAJAAN GOWA TALO@03.jpg'),
(7, 'IMG-20221104-WA0002.jpg', '2022-11-04', '/MBA/KERAJAAN GOWA TALO/@04-Nov-2022@DEWI HANDAYANI@KERAJAAN GOWA TALO@02.jpg'),
(8, 'WhatsApp Image 2022-11-25 at 08.29.35.jpeg', '2022-11-25', '/MBA/gowa talo/@25-Nov-2022@oom@gowa talo@5.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('tpl','supervisi','kepala cabang','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('aktif','non aktif') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `name`, `role`, `status`) VALUES
(1, 'Yogi Saputra', 'tpl', 'aktif'),
(2, 'Sandy Martha', 'tpl', 'aktif'),
(3, 'Deni Wardiman', 'tpl', 'aktif'),
(4, 'Rian Andriani Aziz', 'tpl', 'aktif'),
(5, 'Iqbal Abdurahman', 'tpl', 'aktif'),
(6, 'M Arip Budiman', 'supervisi', 'aktif'),
(7, 'RAHMA ALIFIA PRAMANIK', 'admin', 'aktif'),
(8, 'Slamet', 'supervisi', 'aktif'),
(9, 'Kamaludin', 'supervisi', 'aktif'),
(10, 'Geisha Nanda P', 'kepala cabang', 'aktif'),
(11, 'Arjuna', 'tpl', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sp3`
--

CREATE TABLE `sp3` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majelis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `status` enum('pending','approve') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx_date` date NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `trx_date`, `petugas_id`, `item_id`, `qty`) VALUES
(1, '2022-10-11', 6, 43, 1),
(4, '2022-10-12', 5, 4, 10),
(5, '2022-10-12', 5, 15, 1),
(6, '2022-10-13', 2, 4, 6),
(7, '2022-10-13', 2, 15, 1),
(8, '2022-10-13', 9, 10, 1),
(9, '2022-10-13', 1, 4, 2),
(10, '2022-10-14', 5, 3, 10),
(11, '2022-10-17', 11, 6, 1),
(12, '2022-10-17', 11, 24, 1),
(13, '2022-10-17', 11, 20, 1),
(14, '2022-10-17', 2, 6, 1),
(15, '2022-10-17', 7, 7, 1),
(16, '2022-10-17', 8, 18, 1),
(17, '2022-10-17', 5, 4, 1),
(18, '2022-10-17', 1, 6, 1),
(19, '2022-10-18', 6, 33, 1),
(20, '2022-10-18', 11, 15, 1),
(21, '2022-10-18', 11, 35, 1),
(22, '2022-10-18', 11, 36, 1),
(23, '2022-10-19', 2, 4, 2),
(24, '2022-10-19', 2, 4, 3),
(25, '2022-10-17', 3, 3, 3),
(26, '2022-10-19', 6, 15, 1),
(28, '2022-10-19', 1, 15, 1),
(29, '2022-10-19', 2, 5, 10),
(30, '2022-10-20', 5, 6, 1),
(31, '2022-10-21', 1, 4, 4),
(32, '2022-10-21', 3, 4, 3),
(33, '2022-10-21', 3, 15, 1),
(34, '2022-10-21', 1, 4, 2),
(35, '2022-10-24', 2, 6, 1),
(36, '2022-10-24', 2, 15, 1),
(37, '2022-10-24', 7, 2, 1),
(38, '2022-10-24', 7, 2, 2),
(39, '2022-10-24', 7, 17, 1),
(40, '2022-10-25', 4, 4, 1),
(41, '2022-10-25', 11, 6, 1),
(42, '2022-10-25', 5, 5, 1),
(43, '2022-10-26', 1, 19, 1),
(44, '2022-10-26', 6, 33, 1),
(45, '2022-10-26', 4, 5, 1),
(46, '2022-10-27', 1, 37, 1),
(47, '2022-10-27', 9, 19, 1),
(48, '2022-10-27', 1, 4, 1),
(49, '2022-10-28', 4, 4, 11),
(50, '2022-10-28', 4, 15, 1),
(51, '2022-10-28', 2, 4, 2),
(52, '2022-10-31', 7, 7, 1),
(53, '2022-10-31', 3, 4, 1),
(54, '2022-10-31', 7, 6, 1),
(55, '2022-10-27', 4, 3, 11),
(56, '2022-10-27', 5, 3, 1),
(57, '2022-10-24', 2, 3, 1),
(58, '2022-10-18', 5, 3, 1),
(59, '2022-11-01', 9, 6, 1),
(60, '2022-11-02', 4, 5, 11),
(61, '2022-11-03', 4, 33, 1),
(62, '2022-11-03', 11, 6, 1),
(63, '2022-11-03', 1, 6, 2),
(64, '2022-11-03', 5, 6, 2),
(65, '2022-11-03', 4, 6, 2),
(66, '2022-11-03', 9, 6, 1),
(67, '2022-11-03', 8, 6, 1),
(68, '2022-11-04', 6, 15, 1),
(69, '2022-11-04', 11, 4, 1),
(70, '2022-11-04', 4, 4, 3),
(71, '2022-11-04', 8, 9, 1),
(72, '2022-11-07', 7, 44, 1),
(73, '2022-11-07', 7, 2, 1),
(74, '2022-11-07', 5, 15, 1),
(75, '2022-11-08', 7, 39, 1),
(76, '2022-11-09', 7, 16, 1),
(77, '2022-11-09', 4, 5, 2),
(78, '2022-11-09', 5, 15, 1),
(79, '2022-11-09', 4, 4, 6),
(80, '2022-11-09', 11, 4, 2),
(81, '2022-11-09', 5, 4, 10),
(82, '2022-11-10', 2, 6, 1),
(83, '2022-11-11', 2, 4, 1),
(84, '2022-11-11', 5, 35, 1),
(85, '2022-11-11', 11, 5, 1),
(86, '2022-11-14', 2, 4, 8),
(87, '2022-11-14', 7, 41, 1),
(88, '2022-11-08', 4, 3, 5),
(89, '2022-11-10', 4, 3, 1),
(90, '2022-11-10', 11, 3, 1),
(91, '2022-11-14', 4, 5, 5),
(92, '2022-11-14', 11, 5, 2),
(93, '2022-11-15', 7, 4, 100),
(94, '2022-11-15', 7, 33, 1),
(95, '2022-11-16', 1, 5, 5),
(96, '2022-11-16', 11, 15, 1),
(97, '2022-11-16', 1, 5, 2),
(98, '2022-11-17', 2, 4, 1),
(99, '2022-11-17', 1, 15, 1),
(100, '2022-11-17', 5, 5, 1),
(101, '2022-11-17', 4, 5, 1),
(102, '2022-11-18', 2, 15, 1),
(103, '2022-11-18', 4, 4, 1),
(104, '2022-11-18', 5, 4, 4),
(105, '2022-11-21', 2, 6, 1),
(106, '2022-11-21', 7, 7, 1),
(107, '2022-11-22', 6, 15, 1),
(108, '2022-11-22', 4, 4, 9),
(109, '2022-11-22', 4, 15, 1),
(110, '2022-11-22', 2, 5, 1),
(111, '2022-11-23', 4, 33, 1),
(112, '2022-11-24', 4, 5, 1),
(113, '2022-11-24', 2, 4, 1),
(114, '2022-11-24', 5, 4, 1),
(115, '2022-11-22', 4, 3, 9),
(116, '2022-11-17', 5, 3, 1),
(117, '2022-11-16', 5, 3, 1),
(118, '2022-11-14', 5, 3, 10),
(119, '2022-11-24', 5, 5, 2),
(120, '2022-11-25', 6, 6, 1),
(121, '2022-11-25', 2, 4, 2),
(122, '2022-11-25', 1, 4, 3),
(123, '2022-11-25', 7, 6, 1),
(124, '2022-11-24', 4, 3, 2),
(125, '2022-11-28', 5, 15, 1),
(126, '2022-11-29', 4, 5, 9),
(127, '2022-11-30', 4, 4, 1),
(128, '2022-11-24', 4, 3, 2),
(129, '2022-11-29', 4, 3, 9),
(130, '2022-11-29', 4, 3, 1),
(131, '2022-11-30', 7, 17, 1),
(132, '2022-11-30', 4, 4, 12),
(133, '2022-12-01', 7, 33, 1),
(134, '2022-12-01', 2, 4, 2),
(135, '2022-12-01', 11, 4, 1),
(136, '2022-12-01', 5, 3, 1),
(137, '2022-12-02', 1, 4, 3),
(138, '2022-12-02', 1, 35, 1),
(139, '2022-12-02', 11, 35, 1),
(140, '2022-12-01', 1, 37, 2),
(141, '2022-12-05', 1, 6, 1),
(142, '2022-12-05', 2, 6, 1),
(143, '2022-12-05', 4, 6, 1),
(144, '2022-12-05', 5, 6, 1),
(145, '2022-12-05', 11, 6, 1),
(146, '2022-12-05', 11, 15, 1),
(147, '2022-12-06', 2, 5, 2),
(148, '2022-12-06', 4, 5, 12),
(149, '2022-12-06', 11, 5, 1),
(150, '2022-12-07', 6, 15, 1),
(151, '2022-12-06', 11, 3, 1),
(152, '2022-12-07', 7, 2, 1),
(153, '2022-12-08', 7, 6, 1),
(154, '2022-12-07', 11, 5, 1),
(155, '2022-12-07', 11, 3, 1),
(156, '2022-12-08', 11, 5, 1),
(157, '2022-12-09', 1, 4, 1),
(158, '2022-12-09', 1, 15, 1),
(159, '2022-12-09', 2, 4, 2),
(160, '2022-12-12', 8, 6, 1),
(161, '2022-12-13', 7, 33, 1),
(162, '2022-12-13', 1, 5, 1),
(163, '2022-12-14', 4, 5, 1),
(164, '2022-12-15', 11, 4, 2),
(165, '2022-12-15', 10, 6, 1),
(166, '2022-12-16', 2, 4, 2),
(167, '2022-12-16', 2, 15, 1),
(168, '2022-12-16', 11, 4, 5),
(169, '2022-12-16', 1, 4, 1),
(170, '2022-12-20', 2, 5, 2),
(171, '2022-12-20', 7, 14, 1),
(172, '2022-12-19', 11, 5, 2),
(173, '2022-12-19', 7, 2, 1),
(174, '2022-12-19', 8, 6, 1),
(175, '2022-12-19', 5, 15, 1),
(176, '2022-12-21', 1, 6, 1),
(177, '2022-12-21', 2, 6, 1),
(178, '2022-12-21', 4, 6, 1),
(179, '2022-12-21', 5, 6, 1),
(180, '2022-12-21', 11, 6, 1),
(181, '2022-12-21', 2, 4, 3),
(182, '2022-12-21', 4, 5, 3),
(183, '2022-12-23', 5, 4, 2),
(184, '2022-12-23', 2, 33, 1),
(185, '2022-12-23', 2, 4, 2),
(186, '2022-12-26', 2, 35, 1),
(187, '2022-12-26', 7, 7, 1),
(188, '2022-12-26', 11, 5, 2),
(189, '2022-12-27', 1, 4, 2),
(190, '2022-12-27', 6, 15, 1),
(191, '2022-12-27', 4, 35, 1),
(192, '2022-12-27', 2, 5, 1),
(193, '2022-12-28', 7, 16, 1),
(194, '2022-12-29', 2, 15, 1),
(195, '2022-12-29', 4, 4, 9),
(196, '2022-12-29', 2, 4, 1),
(197, '2022-12-29', 5, 4, 3),
(198, '2022-12-30', 1, 4, 2),
(199, '2022-12-08', 4, 3, 1),
(200, '2022-12-14', 11, 3, 4),
(201, '2022-12-26', 5, 3, 12),
(202, '2022-12-29', 2, 3, 1),
(203, '2023-01-02', 7, 33, 1),
(204, '2023-01-03', 7, 9, 1),
(205, '2023-01-03', 1, 6, 1),
(206, '2023-01-03', 2, 6, 1),
(207, '2023-01-03', 4, 6, 1),
(208, '2023-01-03', 5, 6, 1),
(209, '2023-01-03', 8, 6, 1),
(210, '2023-01-03', 9, 6, 1),
(211, '2023-01-03', 11, 6, 1),
(212, '2023-01-03', 11, 15, 1),
(213, '2023-01-03', 1, 19, 1),
(214, '2023-01-04', 1, 5, 2),
(215, '2023-01-05', 2, 4, 1),
(216, '2023-01-05', 4, 4, 9),
(217, '2023-01-05', 2, 15, 1),
(218, '2023-01-05', 4, 35, 1),
(219, '2023-01-05', 1, 4, 1),
(220, '2023-01-05', 1, 15, 1),
(221, '2023-01-06', 7, 15, 1),
(222, '2023-01-06', 2, 4, 1),
(223, '2023-01-06', 4, 4, 11),
(224, '2023-01-06', 5, 4, 2),
(225, '2023-01-09', 4, 19, 1),
(226, '2023-01-09', 7, 7, 1),
(227, '2023-01-09', 7, 1, 2),
(228, '2023-01-09', 7, 2, 3),
(229, '2023-01-09', 7, 33, 1),
(230, '2023-01-09', 11, 4, 1),
(231, '2023-01-09', 4, 5, 4),
(232, '2023-01-10', 4, 5, 11),
(233, '2023-01-11', 6, 15, 1),
(234, '2023-01-11', 1, 4, 3),
(235, '2023-01-11', 1, 5, 2),
(236, '2023-01-11', 2, 5, 1),
(237, '2023-01-12', 1, 37, 1),
(238, '2023-01-03', 4, 3, 9),
(239, '2023-01-04', 1, 3, 2),
(240, '2023-01-05', 4, 3, 10),
(241, '2023-01-11', 2, 3, 1),
(242, '2023-01-11', 1, 3, 1),
(243, '2023-01-12', 4, 5, 10),
(244, '2023-01-12', 11, 5, 1),
(245, '2023-01-13', 11, 4, 4);

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `DeleteTransaksi` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN UPDATE items SET stok=stok+old.qty WHERE items.id=old.item_id; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TriggerTransaksi` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN UPDATE items SET stok=stok-new.qty WHERE items.id=new.item_id; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$6PfztX0uLsAoVNixGxMPr.RGO0mKqLJIwcsTuZfqpcSjdr1LLlqMm', NULL, '2022-10-09 19:50:51', '2022-10-09 19:50:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `validasi`
--

CREATE TABLE `validasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_anggota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anggota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majelis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `petugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo_sistem` decimal(15,0) NOT NULL,
  `saldo_buku` decimal(15,0) DEFAULT NULL,
  `tgl_posting` date NOT NULL,
  `tgl_validasi` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vrf_tabungan`
--

CREATE TABLE `vrf_tabungan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_anggota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anggota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majelis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `petugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saldo_sistem` decimal(15,0) NOT NULL,
  `saldo_buku` decimal(15,0) DEFAULT NULL,
  `tgl_posting` date NOT NULL DEFAULT '2022-12-08',
  `tgl_validasi` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wakalah`
--

CREATE TABLE `wakalah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `petugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anggota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majelis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` decimal(15,0) NOT NULL,
  `status` enum('OnProses','Approve','Reject') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OnProses',
  `trx_wkl` date NOT NULL,
  `trx_mba` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wakalah`
--

INSERT INTO `wakalah` (`id`, `petugas`, `nama_anggota`, `majelis`, `nominal`, `status`, `trx_wkl`, `trx_mba`, `created_at`, `updated_at`) VALUES
(1, 'Sandy Martha', 'NIRAWATI', 'CANDI SEMBADRA', '2500000', 'Approve', '2022-10-03', '2022-10-10', '2022-10-10 11:44:06', '2022-10-10 05:17:12'),
(2, 'Sandy Martha', 'SERLI', 'CANDI SEMBADRA', '2800000', 'Approve', '2022-10-03', '2022-10-10', '2022-10-10 11:44:06', '2022-10-10 05:17:19'),
(3, 'Deni Wardiman', 'EBEN', 'CANDI PUNTADEWA', '3000000', 'Approve', '2022-10-04', '2022-10-10', '2022-10-10 11:47:58', '2022-10-10 05:17:22'),
(4, 'Deni Wardiman', 'ELIN', 'CANDI PUNTADEWA', '3500000', 'Approve', '2022-10-04', '2022-10-10', '2022-10-10 11:47:58', '2022-10-10 05:17:31'),
(5, 'Deni Wardiman', 'ETI', 'CANDI PUNTADEWA', '3500000', 'Approve', '2022-10-04', '2022-10-10', '2022-10-10 11:47:58', '2022-10-10 05:17:28'),
(6, 'Deni Wardiman', 'MAESAROH', 'CANDI PUNTADEWA', '2700000', 'Approve', '2022-10-04', '2022-10-10', '2022-10-10 11:47:58', '2022-10-10 05:17:26'),
(7, 'Yogi Saputra', 'MAESAROH', 'CANDI PENATARAN', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:42', '2022-10-11 20:40:17'),
(8, 'Iqbal Abdurahman', 'NUNUNG H', 'CANDI JABUNG', '2000000', 'Approve', '2022-10-05', '2022-10-10', '2022-10-10 11:57:42', '2022-10-10 05:17:46'),
(9, 'Rian Andriani Aziz', 'RAZMITA', 'KERAJAAN TERNATE', '2000000', 'Approve', '2022-10-05', '2022-10-10', '2022-10-10 11:57:42', '2022-10-10 05:17:53'),
(10, 'Sandy Martha', 'SAODAH', 'KERAJAAN SAMBALIUNG', '1700000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:42'),
(11, 'Sandy Martha', 'TITI M', 'KERAJAAN SAMBALIUNG', '500000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:46:07'),
(12, 'Sandy Martha', 'TITI S', 'KERAJAAN SAMBALIUNG', '1800000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:50'),
(13, 'Sandy Martha', 'ERNAWATI', 'KERAJAAN SAMBALIUNG', '1500000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:57'),
(14, 'Sandy Martha', 'AMANAH', 'KERAJAAN SAMBALIUNG', '1500000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:44:06'),
(15, 'Sandy Martha', 'SINTA A', 'KERAJAAN SAMBALIUNG', '1800000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:45:56'),
(16, 'Sandy Martha', 'IRMA Y', 'KERAJAAN SAMBALIUNG', '1800000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:40:34'),
(17, 'Sandy Martha', 'RINI', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:16'),
(18, 'Sandy Martha', 'LILI', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:33'),
(19, 'Sandy Martha', 'RINA P', 'KERAJAAN SAMBALIUNG', '1000000', 'Approve', '2022-10-05', '2022-10-10', '2022-10-10 11:57:43', '2022-10-10 05:18:08'),
(20, 'Sandy Martha', 'SUSILAWATI', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:41:05'),
(21, 'Sandy Martha', 'ASTI SRI', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:40:52'),
(22, 'Sandy Martha', 'DESI R', 'KERAJAAN SAMBALIUNG', '1000000', 'Approve', '2022-10-05', '2022-10-10', '2022-10-10 11:57:43', '2022-10-10 05:18:50'),
(23, 'Sandy Martha', 'ATIKAH', 'KERAJAAN SAMBALIUNG', '1000000', 'Approve', '2022-10-05', '2022-10-10', '2022-10-10 11:57:43', '2022-10-10 05:19:05'),
(24, 'Sandy Martha', 'DEWI N', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-10-05', '2022-10-12', '2022-10-10 11:57:43', '2022-10-11 20:40:26'),
(25, 'Iqbal Abdurahman', 'ULPAH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:50:53'),
(26, 'Iqbal Abdurahman', 'EKA NURHASANAH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:50:46'),
(27, 'Iqbal Abdurahman', 'KOKOY RUKOYAH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:50:30'),
(28, 'Iqbal Abdurahman', 'DEDEH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:51:45'),
(29, 'Iqbal Abdurahman', 'DADAH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:50:12'),
(30, 'Iqbal Abdurahman', 'AI TIKA S', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:52:02'),
(31, 'Iqbal Abdurahman', 'LIA YULIANI', 'KERAJAAN TABANAN', '800000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:52:11'),
(32, 'Iqbal Abdurahman', 'DEVI SUSILAWATI', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:51:04'),
(33, 'Iqbal Abdurahman', 'DEDE ASRI', 'KERAJAAN TABANAN', '1200000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:55', '2022-10-11 20:50:23'),
(34, 'Iqbal Abdurahman', 'ATIK', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:49:28'),
(35, 'Iqbal Abdurahman', 'ERNI SUMARTINI', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:48:59'),
(36, 'Iqbal Abdurahman', 'YANI SURYANI', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:48:42'),
(37, 'Iqbal Abdurahman', 'VIA ANGGRAENI', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:49:36'),
(38, 'Iqbal Abdurahman', 'NOVI HARYANI', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:49:10'),
(39, 'Iqbal Abdurahman', 'YULIANTI', 'KERAJAAN SERDANG', '1200000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:49:19'),
(40, 'Iqbal Abdurahman', 'YUNITA KOMALUDIN', 'KERAJAAN SERDANG', '1500000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:48:31'),
(41, 'Iqbal Abdurahman', 'NURHAYATI', 'KERAJAAN SERDANG', '1000000', 'Approve', '2022-10-06', '2022-10-10', '2022-10-10 12:10:56', '2022-10-10 05:19:18'),
(42, 'Iqbal Abdurahman', 'AYU ERMA', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:49:51'),
(43, 'Iqbal Abdurahman', 'IJAH', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:10:56', '2022-10-11 20:48:51'),
(44, 'Deni Wardiman', 'INA HASANAH', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-10', '2022-10-10 12:16:35', '2022-10-10 05:19:30'),
(45, 'Deni Wardiman', 'IIS AISYAH', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:47:16'),
(46, 'Deni Wardiman', 'INA KARTINI', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-10', '2022-10-10 12:16:35', '2022-10-10 05:19:38'),
(47, 'Deni Wardiman', 'ICA SUHARTINI', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:47:27'),
(48, 'Deni Wardiman', 'ELA RIDA', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-10', '2022-10-10 12:16:35', '2022-10-10 05:20:55'),
(49, 'Deni Wardiman', 'NENENG APRIYANI', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:47:34'),
(50, 'Deni Wardiman', 'DEDE ETIH', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:47:41'),
(51, 'Deni Wardiman', 'OJAH', 'KERAJAAN TORIBULU', '1400000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:47:04'),
(52, 'Deni Wardiman', 'NUNUNG NURYANI', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:48:18'),
(53, 'Iqbal Abdurahman', 'CUCUN', 'KERAJAAN SERDANG', '1000000', 'Approve', '2022-10-06', '2022-10-10', '2022-10-10 12:16:35', '2022-10-10 05:21:08'),
(54, 'Deni Wardiman', 'IYAN YANTI', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:46:44'),
(55, 'Deni Wardiman', 'IIS AISAH', 'KERAJAAN TORIBULU', '2000000', 'Approve', '2022-10-06', '2022-10-12', '2022-10-10 12:16:35', '2022-10-11 20:46:31'),
(56, 'Sandy Martha', 'RINI', 'CANDI CHETO', '4000000', 'Approve', '2022-10-06', '2022-10-13', '2022-10-10 12:16:35', '2022-10-12 20:19:00'),
(57, 'Rian Andriani Aziz', 'OOH HASAROH', 'CANDI JAWI', '3000000', 'Approve', '2022-10-10', '2022-10-12', '2022-10-11 03:37:25', '2022-10-11 20:40:03'),
(58, 'Rian Andriani Aziz', 'SULISTIAWATI', 'CANDI JAWI', '4000000', 'Approve', '2022-10-10', '2022-10-12', '2022-10-11 03:37:26', '2022-10-11 20:39:51'),
(59, 'Sandy Martha', 'SITI NURJAMILAH', 'CANDI SEMBADRA', '3000000', 'Approve', '2022-10-10', '2022-10-18', '2022-10-11 03:37:26', '2022-10-17 20:30:07'),
(60, 'Deni Wardiman', 'NADIA ERISKA', 'CANDI MUARA TAKUS', '2000000', 'Approve', '2022-10-10', '2022-10-13', '2022-10-11 03:37:26', '2022-10-12 20:20:01'),
(61, 'Deni Wardiman', 'DEDEH', 'CANDI PUNTADEWA', '2500000', 'Approve', '2022-10-11', '2022-10-18', '2022-10-11 03:44:33', '2022-10-17 20:32:50'),
(62, 'Deni Wardiman', 'PEPI', 'CANDI PUNTADEWA', '2500000', 'Approve', '2022-10-11', '2022-10-18', '2022-10-11 03:44:33', '2022-10-17 20:32:21'),
(63, 'Deni Wardiman', 'ENUR NURHAYATI', 'CANDI PUNTADEWA', '2000000', 'Approve', '2022-10-11', '2022-10-18', '2022-10-11 03:45:15', '2022-10-17 20:31:37'),
(64, 'Yogi Saputra', 'DEVI', 'CANDI PENATARAN', '2500000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:01:54', '2022-10-17 20:30:45'),
(65, 'Yogi Saputra', 'DESTI', 'CANDI PENATARAN', '2500000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:01:54', '2022-10-17 20:30:34'),
(66, 'Deni Wardiman', 'DINA DEWI', 'CANDI BUBRAH', '3000000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:05:29', '2022-10-17 20:31:12'),
(67, 'Deni Wardiman', 'PATIAH', 'CANDI GAJAH MUNGKUR', '3500000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:05:29', '2022-10-17 20:30:19'),
(68, 'Yogi Saputra', 'SITI ROHMAH', 'CANDI GEDONG SONGO', '2000000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:05:29', '2022-10-17 20:31:04'),
(69, 'Yogi Saputra', 'YANTI M', 'CANDI PRAMBANAN', '7000000', 'Approve', '2022-10-12', '2022-10-18', '2022-10-12 08:06:05', '2022-10-17 20:30:57'),
(70, 'Iqbal Abdurahman', 'DEDE ILAH', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-10-13', '2022-10-18', '2022-10-13 03:13:03', '2022-10-17 22:05:45'),
(71, 'Iqbal Abdurahman', 'EROH ROSMAYANTI', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:30:00'),
(72, 'Iqbal Abdurahman', 'KIKI KARTIKA', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:29:49'),
(73, 'Iqbal Abdurahman', 'YETI SUSAN', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:29:41'),
(74, 'Iqbal Abdurahman', 'SUSILAWATI', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:29:33'),
(75, 'Iqbal Abdurahman', 'LELA SARI', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:33:40'),
(76, 'Iqbal Abdurahman', 'NINA', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:33:33'),
(77, 'Iqbal Abdurahman', 'NENTI', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:33:26'),
(78, 'Iqbal Abdurahman', 'YULIANI AGUSTINA', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:33:19'),
(79, 'Iqbal Abdurahman', 'E ROSITA', 'CANDI SOJIWAN', '2000000', 'Approve', '2022-10-17', '2022-10-18', '2022-10-17 02:33:38', '2022-10-17 20:33:03'),
(80, 'Sandy Martha', 'KAYAH', 'CANDI SEMBADRA', '2000000', 'Approve', '2022-10-17', '2022-10-25', '2022-10-17 02:33:39', '2022-10-25 00:11:19'),
(81, 'Sandy Martha', 'TETI', 'CANDI SEMBADRA', '2000000', 'Approve', '2022-10-17', '2022-10-25', '2022-10-17 02:33:39', '2022-10-25 00:11:29'),
(82, 'Sandy Martha', 'ERNAWATI', 'CANDI SEMBADRA', '2000000', 'Approve', '2022-10-17', '2022-10-25', '2022-10-17 02:33:39', '2022-10-25 00:11:25'),
(83, 'Sandy Martha', 'DEDE DEWI', 'CANDI SEMBADRA', '2000000', 'Approve', '2022-10-17', '2022-10-25', '2022-10-17 02:33:39', '2022-10-25 00:11:33'),
(84, 'Iqbal Abdurahman', 'MARNI', 'CANDI KIDAL', '2000000', 'Approve', '2022-10-18', '2022-10-19', '2022-10-18 02:23:26', '2022-10-18 20:21:41'),
(85, 'Deni Wardiman', 'RISMAYANTI', 'CANDI PUNTADEWA', '2500000', 'Approve', '2022-10-18', '2022-10-21', '2022-10-18 02:23:26', '2022-10-20 21:13:06'),
(86, 'Deni Wardiman', 'MASITOH', 'CANDI PUNTADEWA', '2500000', 'Approve', '2022-10-18', '2022-10-21', '2022-10-18 02:23:26', '2022-10-20 21:13:14'),
(87, 'Iqbal Abdurahman', 'TITA JUARSIH', 'KERAJAAN TABANAN', '2000000', 'Approve', '2022-10-20', '2022-10-25', '2022-10-20 03:02:05', '2022-10-25 00:34:29'),
(88, 'Sandy Martha', 'CICIH', 'CANDI BAHAL', '3000000', 'Approve', '2022-10-20', '2022-10-26', '2022-10-20 03:02:05', '2022-10-25 20:07:42'),
(89, 'Sandy Martha', 'YENI HERMAYANI', 'CANDI BAHAL', '2000000', 'Approve', '2022-10-20', '2022-10-26', '2022-10-20 03:02:05', '2022-10-25 20:07:38'),
(90, 'Rian Andriani Aziz', 'AAS ROSANAH', 'CANDI SINGASARI', '2500000', 'Approve', '2022-10-24', '2022-10-28', '2022-10-24 02:42:17', '2022-10-27 19:36:52'),
(91, 'Deni Wardiman', 'RENI ASTRIANI', 'CANDI MUARA TAKUS', '3500000', 'Approve', '2022-10-24', '2022-11-01', '2022-10-24 02:42:18', '2022-10-31 19:58:40'),
(92, 'Sandy Martha', 'IIS PATIMAH', 'CANDI SAWENTAR', '2000000', 'Approve', '2022-10-24', '2022-10-25', '2022-10-24 02:42:18', '2022-10-25 00:34:43'),
(93, 'Deni Wardiman', 'MAYA P', 'CANDI GENTONG', '3000000', 'Approve', '2022-10-25', '2022-11-01', '2022-10-25 02:36:29', '2022-10-31 19:58:37'),
(94, 'Deni Wardiman', 'JUJU', 'CANDI PUNTADEWA', '2500000', 'Approve', '2022-10-25', '2022-11-01', '2022-10-25 02:36:29', '2022-10-31 19:58:33'),
(95, 'Yogi Saputra', 'ELIN HERLINA', 'CANDI PENATARAN', '1300000', 'Approve', '2022-10-26', '2022-11-01', '2022-10-26 02:27:10', '2022-10-31 19:58:12'),
(96, 'Yogi Saputra', 'EPONG M', 'CANDI PENATARAN', '7000000', 'Approve', '2022-10-26', '2022-11-01', '2022-10-26 02:27:10', '2022-10-31 19:58:06'),
(97, 'Rian Andriani Aziz', 'SUMINAR', 'KERAJAAN GALUH', '1000000', 'Approve', '2022-10-26', '2022-10-28', '2022-10-26 02:29:38', '2022-10-27 19:36:47'),
(98, 'Deni Wardiman', 'ENENG SITI M', 'CANDI GAJAH MUNGKUR', '3000000', 'Approve', '2022-10-26', '2022-11-01', '2022-10-26 02:31:13', '2022-10-31 19:58:27'),
(99, 'Deni Wardiman', 'AI SURYANI', 'CANDI GAJAH MUNGKUR', '2500000', 'Approve', '2022-10-26', '2022-11-01', '2022-10-26 02:31:13', '2022-10-31 19:58:22'),
(100, 'Deni Wardiman', 'AMAH', 'CANDI GAJAH MUNGKUR', '4000000', 'Approve', '2022-10-26', '2022-11-01', '2022-10-26 02:31:13', '2022-10-31 19:58:30'),
(101, 'Rian Andriani Aziz', 'NENENG', 'CANDI JAWI', '3500000', 'Approve', '2022-10-31', '2022-11-01', '2022-10-31 02:39:15', '2022-10-31 19:58:16'),
(102, 'Rian Andriani Aziz', 'IIS TRIAWATI', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:41', '2022-11-07 19:51:36'),
(103, 'Rian Andriani Aziz', 'ELIS LISMAWATI', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:18'),
(104, 'Rian Andriani Aziz', 'IRAWATI', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:45'),
(105, 'Rian Andriani Aziz', 'LINA HERLINA', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:51:44'),
(106, 'Rian Andriani Aziz', 'YULI Y', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:24'),
(107, 'Rian Andriani Aziz', 'DEWI P', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:50'),
(108, 'Rian Andriani Aziz', 'RATNASI', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:39'),
(109, 'Rian Andriani Aziz', 'LENI M', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:58'),
(110, 'Rian Andriani Aziz', 'NURLELA', 'KERAJAAN PAGATAN', '2000000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:51:59'),
(111, 'Rian Andriani Aziz', 'IRNA S', 'KERAJAAN PAGATAN', '1500000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:51:53'),
(112, 'Rian Andriani Aziz', 'ENAH', 'KERAJAAN PAGATAN', '1700000', 'Approve', '2022-11-02', '2022-11-08', '2022-11-02 03:38:42', '2022-11-07 19:52:10'),
(113, 'Iqbal Abdurahman', 'TUTI H', 'CANDI BUBRAH', '3500000', 'Approve', '2022-11-02', '2022-11-14', '2022-11-02 03:38:42', '2022-11-13 19:48:20'),
(114, 'Iqbal Abdurahman', 'ENTIN', 'CANDI GENTONG', '3500000', 'Approve', '2022-11-01', '2022-11-08', '2022-11-03 05:00:11', '2022-11-07 19:54:00'),
(115, 'Iqbal Abdurahman', 'AIDAH', 'CANDI BUBRAH', '4000000', 'Approve', '2022-11-09', '2022-11-14', '2022-11-09 01:30:02', '2022-11-13 19:48:24'),
(116, 'Iqbal Abdurahman', 'TITIN', 'CANDI BUBRAH', '3500000', 'Approve', '2022-11-09', '2022-11-14', '2022-11-09 01:30:02', '2022-11-13 19:48:25'),
(117, 'Iqbal Abdurahman', 'EMA MARLINA', 'CANDI BUBRAH', '3500000', 'Approve', '2022-11-09', '2022-11-14', '2022-11-09 01:30:02', '2022-11-13 19:48:26'),
(118, 'Arjuna', 'DEWI H', 'KERAJAAN GOWA TALLO', '1500000', 'Approve', '2022-11-10', '2022-11-16', '2022-11-14 02:50:01', '2022-11-15 21:02:12'),
(119, 'Rian Andriani Aziz', 'ITOH MASITOH', 'CANDI SARI', '1300000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:17:54'),
(120, 'Rian Andriani Aziz', 'ADE N', 'CANDI SARI', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:18:13'),
(121, 'Rian Andriani Aziz', 'NINING', 'CANDI SARI', '1500000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:18:00'),
(122, 'Rian Andriani Aziz', 'EDED A', 'CANDI SARI', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:18:07'),
(123, 'Rian Andriani Aziz', 'UDENG', 'CANDI SARI', '600000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:17:39'),
(124, 'Rian Andriani Aziz', 'TINI', 'CANDI JAWI', '4000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:47', '2022-11-17 19:17:05'),
(125, 'Arjuna', 'SOPI S.H', 'CANDI SEMAR', '2500000', 'Approve', '2022-11-14', '2022-11-22', '2022-11-14 03:28:47', '2022-11-21 20:34:59'),
(126, 'Arjuna', 'DEDE P', 'CANDI SEMAR', '2500000', 'Approve', '2022-11-14', '2022-11-22', '2022-11-14 03:28:47', '2022-11-21 20:34:53'),
(127, 'Iqbal Abdurahman', 'AI NURHAMIDAH', 'KERAJAAN SERDANG', '2000000', 'Reject', '2022-11-14', '2023-01-10', '2022-11-14 03:28:47', '2023-01-09 20:05:02'),
(128, 'Iqbal Abdurahman', 'JUJU JULAEHA', 'KERAJAAN SERDANG', '1000000', 'Reject', '2022-11-14', '2023-01-10', '2022-11-14 03:28:47', '2023-01-09 20:05:07'),
(129, 'Iqbal Abdurahman', 'YUYU', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:15:23'),
(130, 'Iqbal Abdurahman', 'IKAH SARTIKAH', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:15:14'),
(131, 'Iqbal Abdurahman', 'ETI ROHAYATI', 'KERAJAAN SERDANG', '1000000', 'Approve', '2022-11-14', '2022-11-15', '2022-11-14 03:28:48', '2022-11-14 20:12:14'),
(132, 'Iqbal Abdurahman', 'NURLIA', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:15:41'),
(133, 'Iqbal Abdurahman', 'ERNI H', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:14:52'),
(134, 'Iqbal Abdurahman', 'MARTINI', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:15:03'),
(135, 'Iqbal Abdurahman', 'TITIN', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:15:53'),
(136, 'Iqbal Abdurahman', 'MARKONAH', 'KERAJAAN SERDANG', '2000000', 'Approve', '2022-11-14', '2022-11-18', '2022-11-14 03:28:48', '2022-11-17 19:16:02'),
(137, 'Sandy Martha', 'NINING', 'KERAJAAN SAMBALIUNG', '2000000', 'Approve', '2022-11-16', '2022-11-22', '2022-11-16 03:30:09', '2022-11-21 20:34:41'),
(138, 'Arjuna', 'YATI', 'CANDI PALANGKA', '2000000', 'Approve', '2022-11-16', '2022-11-24', '2022-11-16 03:33:17', '2022-11-23 20:07:29'),
(139, 'Iqbal Abdurahman', 'NENEN', 'CANDI BUBRAH', '4000000', 'Approve', '2022-11-16', '2022-11-17', '2022-11-16 03:33:17', '2022-11-16 20:30:10'),
(140, 'Iqbal Abdurahman', 'ONENG', 'CANDI BUBRAH', '2500000', 'Approve', '2022-11-16', '2022-11-17', '2022-11-16 03:33:17', '2022-11-16 20:29:45'),
(141, 'Iqbal Abdurahman', 'TITI', 'CANDI BUBRAH', '4000000', 'Approve', '2022-11-16', '2022-11-17', '2022-11-16 03:33:17', '2022-11-16 20:30:01'),
(142, 'Iqbal Abdurahman', 'ENTIN K', 'CANDI BUBRAH', '1000000', 'Approve', '2022-11-16', '2022-11-17', '2022-11-16 03:33:17', '2022-11-16 20:30:22'),
(143, 'Iqbal Abdurahman', 'TITIN R', 'CANDI ARCA GUPOLO', '3000000', 'Approve', '2022-11-16', '2022-11-17', '2022-11-16 03:33:17', '2022-11-16 20:32:44'),
(144, 'Rian Andriani Aziz', 'IDA FARIDA', 'CANDI PRINGAPUS', '2000000', 'Approve', '2022-11-17', '2022-11-22', '2022-11-17 02:43:41', '2022-11-21 20:34:47'),
(145, 'Iqbal Abdurahman', 'SANTI', 'KERAJAAN KAHURIPAN', '2000000', 'Approve', '2022-11-17', '2022-11-18', '2022-11-17 02:43:41', '2022-11-17 19:16:11'),
(146, 'Iqbal Abdurahman', 'AI NURHABIBAH', 'KERAJAAN MEDANG', '2000000', 'Approve', '2022-11-21', '2022-11-23', '2022-11-21 03:01:07', '2022-11-22 21:01:59'),
(147, 'Sandy Martha', 'NINA', 'KERAJAAN DEMAK', '1200000', 'Approve', '2022-11-22', '2022-11-30', '2022-11-23 03:42:40', '2022-11-29 19:58:17'),
(148, 'Iqbal Abdurahman', 'LISNA', 'CANDI BUBRAH', '2500000', 'Approve', '2022-11-23', '2022-11-24', '2022-11-24 01:53:51', '2022-11-23 20:07:35'),
(149, 'Iqbal Abdurahman', 'RENI', 'CANDI BUBRAH', '3500000', 'Approve', '2022-11-23', '2022-11-24', '2022-11-24 01:53:51', '2022-11-23 20:07:41'),
(150, 'Rian Andriani Aziz', 'AI TUTI S', 'KERAJAAN GALUH', '2800000', 'Approve', '2022-11-23', '2022-11-30', '2022-11-24 01:53:51', '2022-11-29 19:58:43'),
(151, 'Iqbal Abdurahman', 'RISMA', 'KERAJAAN WANGSA ISYANA', '2000000', 'Approve', '2022-11-24', '2022-11-25', '2022-11-25 01:55:08', '2022-11-24 18:55:56'),
(152, 'Iqbal Abdurahman', 'MIROH', 'KERAJAAN WANGSA ISYANA', '2000000', 'Approve', '2022-11-24', '2022-11-25', '2022-11-25 01:55:08', '2022-11-24 18:55:59'),
(153, 'Sandy Martha', 'SRIYANI', 'CANDI SEMBADRA', '2000000', 'Approve', '2022-11-28', '2022-11-29', '2022-11-28 02:27:15', '2022-11-28 20:16:50'),
(154, 'Rian Andriani Aziz', 'ILAH', 'CANDI BOGANG', '1000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 19:58:53'),
(155, 'Rian Andriani Aziz', 'RUSTIANA', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:38'),
(156, 'Rian Andriani Aziz', 'AI SETIAWATI', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:44'),
(157, 'Rian Andriani Aziz', 'ETI', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:35'),
(158, 'Rian Andriani Aziz', 'YULI YANTI', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:33'),
(159, 'Rian Andriani Aziz', 'SUMARTINI', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:27'),
(160, 'Rian Andriani Aziz', 'RANI', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 19:59:55'),
(161, 'Rian Andriani Aziz', 'DELA', 'CANDI BOGANG', '2000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 19:58:59'),
(162, 'Rian Andriani Aziz', 'TITI SURYATI', 'CANDI BOGANG', '1000000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 20:00:58'),
(163, 'Iqbal Abdurahman', 'ENTI NUR', 'CANDI GENTONG', '2500000', 'Approve', '2022-11-29', '2022-11-30', '2022-11-29 02:59:29', '2022-11-29 19:58:33'),
(164, 'Iqbal Abdurahman', 'PITRIYANI', 'CANDI BUBRAH', '2000000', 'Approve', '2022-11-30', '2022-12-01', '2022-12-01 02:06:18', '2022-11-30 19:38:51'),
(165, 'Iqbal Abdurahman', 'DEWI APRILIAWATI', 'CANDI GAJAH MUNGKUR', '3000000', 'Approve', '2022-11-30', '2022-12-01', '2022-12-01 02:06:18', '2022-11-30 19:38:53'),
(166, 'Rian Andriani Aziz', 'SANI', 'CANDI JAWI', '4000000', 'Approve', '2022-12-05', '2022-12-06', '2022-12-05 02:28:08', '2022-12-05 20:45:40'),
(167, 'Yogi Saputra', 'YANI YOHANI', 'KERAJAAN BANTEN', '300000', 'Approve', '2022-12-05', '2022-12-06', '2022-12-05 02:52:24', '2022-12-05 20:45:32'),
(168, 'Rian Andriani Aziz', 'JUJU JUWITA', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:27', '2022-12-08 19:25:20'),
(169, 'Rian Andriani Aziz', 'ANI ROSMAYANI', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:27', '2022-12-08 19:25:12'),
(170, 'Rian Andriani Aziz', 'NISA NURHAYATI', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:25:04'),
(171, 'Rian Andriani Aziz', 'DEWI WIDAYANTI', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:24:58'),
(172, 'Rian Andriani Aziz', 'MAMAH', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:24:28'),
(173, 'Rian Andriani Aziz', 'ROHAYATI', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:23:44'),
(174, 'Rian Andriani Aziz', 'E ROHAYANI', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:23:57'),
(175, 'Rian Andriani Aziz', 'N IMAS', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:24:21'),
(176, 'Rian Andriani Aziz', 'DEDE IKAH', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:25:37'),
(177, 'Rian Andriani Aziz', 'IKON', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:25:26'),
(178, 'Rian Andriani Aziz', 'AAS', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:25:32'),
(179, 'Rian Andriani Aziz', 'YOYOH', 'CANDI BAJANG RATU', '2000000', 'Approve', '2022-12-06', '2022-12-09', '2022-12-06 02:48:28', '2022-12-08 19:24:11'),
(180, 'Sandy Martha', 'KARINA NUR AIZA', 'KERAJAAN DEMAK', '900000', 'Approve', '2022-12-06', '2022-12-14', '2022-12-06 02:48:28', '2022-12-13 20:40:29'),
(181, 'Sandy Martha', 'YAYAH', 'KERAJAAN DEMAK', '3000000', 'Approve', '2022-12-06', '2022-12-14', '2022-12-06 02:48:28', '2022-12-13 20:40:31'),
(182, 'Arjuna', 'ERNI', 'CANDI GAJAH MUNGKUR', '2000000', 'Approve', '2022-12-06', '2022-12-13', '2022-12-06 02:48:28', '2022-12-12 20:29:31'),
(183, 'Iqbal Abdurahman', 'ERIN H', 'CANDI ARCA GUPOLO', '3000000', 'Approve', '2022-12-07', '2022-12-08', '2022-12-07 02:53:45', '2022-12-07 20:28:15'),
(184, 'Iqbal Abdurahman', 'ENOK AAY', 'CANDI ARCA GUPOLO', '3500000', 'Approve', '2022-12-07', '2022-12-08', '2022-12-07 02:53:46', '2022-12-07 20:28:49'),
(185, 'Arjuna', 'SRI MULYA', 'CANDI JABUNG', '2000000', 'Approve', '2022-12-07', '2022-12-13', '2022-12-07 02:53:46', '2022-12-12 20:29:26'),
(186, 'Arjuna', 'OOM KOMARIAH', 'KERAJAAN GOWA TALLO', '2000000', 'Approve', '2022-12-08', '2022-12-13', '2022-12-09 02:26:20', '2022-12-12 20:29:37'),
(187, 'Yogi Saputra', 'ERIS RESMIATI', 'CANDI GEDONG SONGO', '2000000', 'Approve', '2022-12-14', '2022-12-21', '2022-12-15 04:14:36', '2022-12-20 19:32:01'),
(188, 'Iqbal Abdurahman', 'SITI NURAISAH', 'CANDI BUBRAH', '3500000', 'Approve', '2022-12-14', '2022-12-15', '2022-12-15 04:14:36', '2022-12-14 21:15:08'),
(189, 'Rian Andriani Aziz', 'LAILA', 'KERAJAAN GALUH', '1800000', 'Approve', '2022-12-14', '2022-12-16', '2022-12-15 04:14:36', '2022-12-15 19:23:11'),
(190, 'Arjuna', 'TENI JULIANTI', 'CANDI SEMAR', '2000000', 'Approve', '2022-12-19', '2022-12-22', '2022-12-21 01:58:31', '2022-12-21 20:43:13'),
(191, 'Arjuna', 'HERNI NURAINI', 'CANDI SEMAR', '2500000', 'Approve', '2022-12-19', '2022-12-22', '2022-12-21 01:58:31', '2022-12-21 20:43:26'),
(192, 'Sandy Martha', 'WATI', 'KERAJAAN DEMAK', '3500000', 'Approve', '2022-12-19', '2022-12-23', '2022-12-21 01:59:22', '2022-12-22 20:09:30'),
(193, 'Sandy Martha', 'KURNIASIH', 'KERAJAAN DEMAK', '3700000', 'Approve', '2022-12-19', '2022-12-23', '2022-12-21 01:59:22', '2022-12-22 20:09:20'),
(194, 'Arjuna', 'RENI H', 'CANDI KIMPULAN', '4000000', 'Approve', '2022-12-21', '2022-12-27', '2022-12-22 03:50:01', '2022-12-26 20:50:40'),
(195, 'Rian Andriani Aziz', 'UNUNG NURHAYATI', 'KERAJAAN WAJO', '2000000', 'Approve', '2022-12-21', '2022-12-28', '2022-12-22 03:50:02', '2022-12-27 20:28:02'),
(196, 'Rian Andriani Aziz', 'ENIS', 'KERAJAAN WAJO', '2000000', 'Approve', '2022-12-21', '2022-12-28', '2022-12-22 03:50:02', '2022-12-27 20:27:40'),
(197, 'Rian Andriani Aziz', 'UMI', 'KERAJAAN WAJO', '2000000', 'Approve', '2022-12-21', '2022-12-28', '2022-12-22 03:50:02', '2022-12-27 20:27:16'),
(198, 'Iqbal Abdurahman', 'LIA', 'CANDI ARCA GUPOLO', '2000000', 'Approve', '2022-12-21', '2022-12-22', '2022-12-22 03:50:02', '2022-12-21 20:50:14'),
(199, 'Yogi Saputra', 'NENI', 'KERAJAAN BANTEN', '1500000', 'Approve', '2022-12-22', '2022-12-27', '2022-12-23 03:08:13', '2022-12-26 20:50:45'),
(200, 'Arjuna', 'DIANA KARTIKA', 'CANDI MUARA TAKUS', '2000000', 'Approve', '2022-12-26', '2022-12-27', '2022-12-26 02:23:46', '2022-12-26 20:50:30'),
(201, 'Arjuna', 'DIAH S', 'CANDI SEMAR', '2500000', 'Approve', '2022-12-26', '2022-12-27', '2022-12-26 02:23:46', '2022-12-26 20:50:35'),
(202, 'Sandy Martha', 'DEDE SOPIAH', 'KERAJAAN DEMAK', '3500000', 'Approve', '2022-12-27', '2022-12-28', '2022-12-27 07:18:51', '2022-12-27 20:27:09'),
(203, 'Iqbal Abdurahman', 'DARTIYANI', 'CANDI ARCA GUPOLO', '3000000', 'Approve', '2022-12-28', '2022-12-29', '2022-12-28 03:09:06', '2022-12-28 20:32:39'),
(204, 'Iqbal Abdurahman', 'ETI SUMYATI', 'CANDI MENAK JINGGA', '3500000', 'Approve', '2022-12-28', '2022-12-29', '2022-12-28 03:09:06', '2022-12-28 20:32:43'),
(205, 'Iqbal Abdurahman', 'DEDE ROHAYATI', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:24:20'),
(206, 'Iqbal Abdurahman', 'SRI RAHAYU WULAN', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:25:10'),
(207, 'Iqbal Abdurahman', 'DEDEH R', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:25:20'),
(208, 'Iqbal Abdurahman', 'IIN SOPI', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:25:43'),
(209, 'Iqbal Abdurahman', 'SARI', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:25:28'),
(210, 'Iqbal Abdurahman', 'IIS HENDRAYANI', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:24:10'),
(211, 'Iqbal Abdurahman', 'ENTIN SUHARTINI', 'KERAJAAN HOLING', '2000000', 'Approve', '2023-01-02', '2023-01-10', '2023-01-05 06:40:18', '2023-01-09 20:24:43'),
(212, 'Sandy Martha', 'MIA SUMIATI', 'KERAJAAN DEMAK', '3500000', 'Approve', '2023-01-03', '2023-01-06', '2023-01-05 06:41:22', '2023-01-06 00:06:41'),
(213, 'Iqbal Abdurahman', 'NANI', 'CANDI BUBRAH', '4000000', 'Approve', '2023-01-04', '2023-01-06', '2023-01-05 06:43:54', '2023-01-05 21:14:16'),
(214, 'Iqbal Abdurahman', 'ROSIDA', 'CANDI GAJAH MUNGKUR', '3000000', 'Approve', '2023-01-04', '2023-01-06', '2023-01-05 06:43:54', '2023-01-05 21:13:55'),
(215, 'Arjuna', 'MARTI', 'CANDI KIMPULAN', '3500000', 'Approve', '2023-01-04', '2023-01-06', '2023-01-05 06:43:54', '2023-01-05 21:14:07'),
(216, 'Yogi Saputra', 'ROHAYATI', 'CANDI PENATARAN', '2000000', 'Approve', '2023-01-04', '2023-01-11', '2023-01-05 06:43:54', '2023-01-10 20:34:49'),
(217, 'Yogi Saputra', 'NENI', 'CANDI PENATARAN', '2000000', 'Approve', '2023-01-04', '2023-01-11', '2023-01-05 06:43:54', '2023-01-10 20:34:40'),
(218, 'Sandy Martha', 'KANTI HERTIANA', 'CANDI SAWENTAR', '6000000', 'Approve', '2023-01-09', '2023-01-10', '2023-01-10 03:00:21', '2023-01-09 20:26:09'),
(219, 'Rian Andriani Aziz', 'AI ROHAYATI', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(220, 'Rian Andriani Aziz', 'IDA ROSIDA', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(221, 'Rian Andriani Aziz', 'ILMA Y', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(222, 'Rian Andriani Aziz', 'SISKA S', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(223, 'Rian Andriani Aziz', 'RIA RESTI', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(224, 'Rian Andriani Aziz', 'MIMIN', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(225, 'Rian Andriani Aziz', 'CUCU N', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(226, 'Rian Andriani Aziz', 'FEBI S', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(227, 'Rian Andriani Aziz', 'PIPIN S', 'CANDI UMBUL', '2000000', 'OnProses', '2023-01-10', NULL, '2023-01-10 03:04:32', '2023-01-10 03:04:32'),
(228, 'Yogi Saputra', 'ENENG HENI', 'CANDI PRAMBANAN', '2000000', 'Approve', '2023-01-11', '2023-01-12', '2023-01-11 05:39:56', '2023-01-11 20:17:05'),
(229, 'Iqbal Abdurahman', 'IMAS MASRIYANI', 'CANDI MENAK JINGGA', '4000000', 'Approve', '2023-01-11', '2023-01-12', '2023-01-11 05:39:56', '2023-01-11 20:16:48'),
(230, 'Iqbal Abdurahman', 'NENDA Y', 'CANDI MENAK JINGGA', '3500000', 'Approve', '2023-01-11', '2023-01-12', '2023-01-11 05:39:56', '2023-01-11 20:16:56'),
(231, 'Sandy Martha', 'EMA SUHEMA', 'KERAJAAN JEUMPA', '1000000', 'Approve', '2023-01-11', '2023-01-12', '2023-01-11 05:39:56', '2023-01-11 20:16:39'),
(232, 'Rian Andriani Aziz', 'TRI M', 'KERAJAAN TIDORE', '1500000', 'OnProses', '2023-01-11', NULL, '2023-01-11 05:39:56', '2023-01-11 05:39:56'),
(233, 'Rian Andriani Aziz', 'SITI N', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(234, 'Rian Andriani Aziz', 'AI NURHAYATI', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(235, 'Rian Andriani Aziz', 'IRMAWATI', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(236, 'Rian Andriani Aziz', 'NURHASANAH', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(237, 'Rian Andriani Aziz', 'YETI', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(238, 'Rian Andriani Aziz', 'IKOH A', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(239, 'Rian Andriani Aziz', 'ITA PURNAMASARI', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(240, 'Rian Andriani Aziz', 'NIA KURNIA', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(241, 'Rian Andriani Aziz', 'EDOY W', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(242, 'Rian Andriani Aziz', 'LILIS N', 'CANDI CANGGAL', '2000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(243, 'Arjuna', 'TUTI N', 'CANDI GONDOSULI', '3500000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(244, 'Yogi Saputra', 'WULAN', 'KERAJAAN BANTEN', '3500000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26'),
(245, 'Yogi Saputra', 'NUNUNG', 'KERAJAAN BANTEN', '4000000', 'OnProses', '2023-01-12', NULL, '2023-01-13 02:56:26', '2023-01-13 02:56:26');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cetakan`
--
ALTER TABLE `cetakan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kolektabilitas`
--
ALTER TABLE `kolektabilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majelis`
--
ALTER TABLE `majelis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `murabahah`
--
ALTER TABLE `murabahah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sp3`
--
ALTER TABLE `sp3`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `validasi`
--
ALTER TABLE `validasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vrf_tabungan`
--
ALTER TABLE `vrf_tabungan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wakalah`
--
ALTER TABLE `wakalah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `cetakan`
--
ALTER TABLE `cetakan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `kolektabilitas`
--
ALTER TABLE `kolektabilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `majelis`
--
ALTER TABLE `majelis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `murabahah`
--
ALTER TABLE `murabahah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `sp3`
--
ALTER TABLE `sp3`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `validasi`
--
ALTER TABLE `validasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `vrf_tabungan`
--
ALTER TABLE `vrf_tabungan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wakalah`
--
ALTER TABLE `wakalah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
