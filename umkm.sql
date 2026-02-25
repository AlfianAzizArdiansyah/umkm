-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2026 at 10:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umkm`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_user`
--

CREATE TABLE `alamat_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `desa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` int(11) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `provinsi_id`, `nama`) VALUES
(1101, 11, 'Kabupaten Simeulue'),
(1102, 11, 'Kabupaten Aceh Singkil'),
(1103, 11, 'Kabupaten Aceh Selatan'),
(1104, 11, 'Kabupaten Aceh Tenggara'),
(1105, 11, 'Kabupaten Aceh Timur'),
(1106, 11, 'Kabupaten Aceh Tengah'),
(1107, 11, 'Kabupaten Aceh Barat'),
(1108, 11, 'Kabupaten Aceh Besar'),
(1109, 11, 'Kabupaten Pidie'),
(1110, 11, 'Kabupaten Bireuen'),
(1111, 11, 'Kabupaten Aceh Utara'),
(1112, 11, 'Kabupaten Aceh Barat Daya'),
(1113, 11, 'Kabupaten Gayo Lues'),
(1114, 11, 'Kabupaten Aceh Tamiang'),
(1115, 11, 'Kabupaten Nagan Raya'),
(1116, 11, 'Kabupaten Aceh Jaya'),
(1117, 11, 'Kabupaten Bener Meriah'),
(1118, 11, 'Kabupaten Pidie Jaya'),
(1171, 11, 'Kota Banda Aceh'),
(1172, 11, 'Kota Sabang'),
(1173, 11, 'Kota Langsa'),
(1174, 11, 'Kota Lhokseumawe'),
(1175, 11, 'Kota Subulussalam'),
(1201, 12, 'Kabupaten Nias'),
(1202, 12, 'Kabupaten Mandailing Natal'),
(1203, 12, 'Kabupaten Tapanuli Selatan'),
(1204, 12, 'Kabupaten Tapanuli Tengah'),
(1205, 12, 'Kabupaten Tapanuli Utara'),
(1206, 12, 'Kabupaten Toba'),
(1207, 12, 'Kabupaten Labuhanbatu'),
(1208, 12, 'Kabupaten Asahan'),
(1209, 12, 'Kabupaten Simalungun'),
(1210, 12, 'Kabupaten Dairi'),
(1211, 12, 'Kabupaten Karo'),
(1212, 12, 'Kabupaten Deli Serdang'),
(1213, 12, 'Kabupaten Langkat'),
(1214, 12, 'Kabupaten Nias Selatan'),
(1215, 12, 'Kabupaten Humbang Hasundutan'),
(1216, 12, 'Kabupaten Pakpak Bharat'),
(1217, 12, 'Kabupaten Samosir'),
(1218, 12, 'Kabupaten Serdang Bedagai'),
(1219, 12, 'Kabupaten Batu Bara'),
(1220, 12, 'Kabupaten Padang Lawas Utara'),
(1221, 12, 'Kabupaten Padang Lawas'),
(1222, 12, 'Kabupaten Labuhanbatu Selatan'),
(1223, 12, 'Kabupaten Labuhanbatu Utara'),
(1224, 12, 'Kabupaten Nias Utara'),
(1225, 12, 'Kabupaten Nias Barat'),
(1271, 12, 'Kota Sibolga'),
(1272, 12, 'Kota Tanjungbalai'),
(1273, 12, 'Kota Pematangsiantar'),
(1274, 12, 'Kota Tebing Tinggi'),
(1275, 12, 'Kota Medan'),
(1276, 12, 'Kota Binjai'),
(1277, 12, 'Kota Padangsidimpuan'),
(1278, 12, 'Kota Gunungsitoli'),
(1301, 13, 'Kabupaten Kepulauan Mentawai'),
(1302, 13, 'Kabupaten Pesisir Selatan'),
(1303, 13, 'Kabupaten Solok'),
(1304, 13, 'Kabupaten Sijunjung'),
(1305, 13, 'Kabupaten Tanah Datar'),
(1306, 13, 'Kabupaten Padang Pariaman'),
(1307, 13, 'Kabupaten Agam'),
(1308, 13, 'Kabupaten Lima Puluh Kota'),
(1309, 13, 'Kabupaten Pasaman'),
(1310, 13, 'Kabupaten Solok Selatan'),
(1311, 13, 'Kabupaten Dharmasraya'),
(1312, 13, 'Kabupaten Pasaman Barat'),
(1371, 13, 'Kota Padang'),
(1372, 13, 'Kota Solok'),
(1373, 13, 'Kota Sawahlunto'),
(1374, 13, 'Kota Padang Panjang'),
(1375, 13, 'Kota Bukittinggi'),
(1376, 13, 'Kota Payakumbuh'),
(1377, 13, 'Kota Pariaman'),
(1401, 14, 'Kabupaten Kuantan Singingi'),
(1402, 14, 'Kabupaten Indragiri Hulu'),
(1403, 14, 'Kabupaten Indragiri Hilir'),
(1404, 14, 'Kabupaten Pelalawan'),
(1405, 14, 'Kabupaten Siak'),
(1406, 14, 'Kabupaten Kampar'),
(1407, 14, 'Kabupaten Rokan Hulu'),
(1408, 14, 'Kabupaten Bengkalis'),
(1409, 14, 'Kabupaten Rokan Hilir'),
(1410, 14, 'Kabupaten Kepulauan Meranti'),
(1471, 14, 'Kota Pekanbaru'),
(1472, 14, 'Kota Dumai'),
(1501, 15, 'Kabupaten Kerinci'),
(1502, 15, 'Kabupaten Merangin'),
(1503, 15, 'Kabupaten Sarolangun'),
(1504, 15, 'Kabupaten Batang Hari'),
(1505, 15, 'Kabupaten Muaro Jambi'),
(1506, 15, 'Kabupaten Tanjung Jabung Timur'),
(1507, 15, 'Kabupaten Tanjung Jabung Barat'),
(1508, 15, 'Kabupaten Tebo'),
(1509, 15, 'Kabupaten Bungo'),
(1571, 15, 'Kota Jambi'),
(1572, 15, 'Kota Sungai Penuh'),
(1601, 16, 'Kabupaten Ogan Komering Ulu'),
(1602, 16, 'Kabupaten Ogan Komering Ilir'),
(1603, 16, 'Kabupaten Muara Enim'),
(1604, 16, 'Kabupaten Lahat'),
(1605, 16, 'Kabupaten Musi Rawas'),
(1606, 16, 'Kabupaten Musi Banyuasin'),
(1607, 16, 'Kabupaten Banyuasin'),
(1608, 16, 'Kabupaten Ogan Komering Ulu Selatan'),
(1609, 16, 'Kabupaten Ogan Komering Ulu Timur'),
(1610, 16, 'Kabupaten Ogan Ilir'),
(1611, 16, 'Kabupaten Empat Lawang'),
(1612, 16, 'Kabupaten Penukal Abab Lematang Ilir'),
(1613, 16, 'Kabupaten Musi Rawas Utara'),
(1671, 16, 'Kota Palembang'),
(1672, 16, 'Kota Prabumulih'),
(1673, 16, 'Kota Pagar Alam'),
(1674, 16, 'Kota Lubuklinggau'),
(1701, 17, 'Kabupaten Bengkulu Selatan'),
(1702, 17, 'Kabupaten Rejang Lebong'),
(1703, 17, 'Kabupaten Bengkulu Utara'),
(1704, 17, 'Kabupaten Kaur'),
(1705, 17, 'Kabupaten Seluma'),
(1706, 17, 'Kabupaten Mukomuko'),
(1707, 17, 'Kabupaten Lebong'),
(1708, 17, 'Kabupaten Kepahiang'),
(1709, 17, 'Kabupaten Bengkulu Tengah'),
(1771, 17, 'Kota Bengkulu'),
(1801, 18, 'Kabupaten Lampung Barat'),
(1802, 18, 'Kabupaten Tanggamus'),
(1803, 18, 'Kabupaten Lampung Selatan'),
(1804, 18, 'Kabupaten Lampung Timur'),
(1805, 18, 'Kabupaten Lampung Tengah'),
(1806, 18, 'Kabupaten Lampung Utara'),
(1807, 18, 'Kabupaten Way Kanan'),
(1808, 18, 'Kabupaten Tulang Bawang'),
(1809, 18, 'Kabupaten Pesawaran'),
(1810, 18, 'Kabupaten Pringsewu'),
(1811, 18, 'Kabupaten Mesuji'),
(1812, 18, 'Kabupaten Tulang Bawang Barat'),
(1813, 18, 'Kabupaten Pesisir Barat'),
(1871, 18, 'Kota Bandar Lampung'),
(1872, 18, 'Kota Metro'),
(1901, 19, 'Kabupaten Bangka'),
(1902, 19, 'Kabupaten Belitung'),
(1903, 19, 'Kabupaten Bangka Barat'),
(1904, 19, 'Kabupaten Bangka Tengah'),
(1905, 19, 'Kabupaten Bangka Selatan'),
(1906, 19, 'Kabupaten Belitung Timur'),
(1971, 19, 'Kota Pangkal Pinang'),
(2101, 21, 'Kabupaten Karimun'),
(2102, 21, 'Kabupaten Bintan'),
(2103, 21, 'Kabupaten Natuna'),
(2104, 21, 'Kabupaten Lingga'),
(2105, 21, 'Kabupaten Kepulauan Anambas'),
(2171, 21, 'Kota Batam'),
(2172, 21, 'Kota Tanjung Pinang'),
(3101, 31, 'Kabupaten Kepulauan Seribu'),
(3171, 31, 'Kota Jakarta Selatan'),
(3172, 31, 'Kota Jakarta Timur'),
(3173, 31, 'Kota Jakarta Pusat'),
(3174, 31, 'Kota Jakarta Barat'),
(3175, 31, 'Kota Jakarta Utara'),
(3201, 32, 'Kabupaten Bogor'),
(3202, 32, 'Kabupaten Sukabumi'),
(3203, 32, 'Kabupaten Cianjur'),
(3204, 32, 'Kabupaten Bandung'),
(3205, 32, 'Kabupaten Garut'),
(3206, 32, 'Kabupaten Tasikmalaya'),
(3207, 32, 'Kabupaten Ciamis'),
(3208, 32, 'Kabupaten Kuningan'),
(3209, 32, 'Kabupaten Cirebon'),
(3210, 32, 'Kabupaten Majalengka'),
(3211, 32, 'Kabupaten Sumedang'),
(3212, 32, 'Kabupaten Indramayu'),
(3213, 32, 'Kabupaten Subang'),
(3214, 32, 'Kabupaten Purwakarta'),
(3215, 32, 'Kabupaten Karawang'),
(3216, 32, 'Kabupaten Bekasi'),
(3217, 32, 'Kabupaten Bandung Barat'),
(3218, 32, 'Kabupaten Pangandaran'),
(3271, 32, 'Kota Bogor'),
(3272, 32, 'Kota Sukabumi'),
(3273, 32, 'Kota Bandung'),
(3274, 32, 'Kota Cirebon'),
(3275, 32, 'Kota Bekasi'),
(3276, 32, 'Kota Depok'),
(3277, 32, 'Kota Cimahi'),
(3278, 32, 'Kota Tasikmalaya'),
(3279, 32, 'Kota Banjar'),
(3301, 33, 'Kabupaten Cilacap'),
(3302, 33, 'Kabupaten Banyumas'),
(3303, 33, 'Kabupaten Purbalingga'),
(3304, 33, 'Kabupaten Banjarnegara'),
(3305, 33, 'Kabupaten Kebumen'),
(3306, 33, 'Kabupaten Purworejo'),
(3307, 33, 'Kabupaten Wonosobo'),
(3308, 33, 'Kabupaten Magelang'),
(3309, 33, 'Kabupaten Boyolali'),
(3310, 33, 'Kabupaten Klaten'),
(3311, 33, 'Kabupaten Sukoharjo'),
(3312, 33, 'Kabupaten Wonogiri'),
(3313, 33, 'Kabupaten Karanganyar'),
(3314, 33, 'Kabupaten Sragen'),
(3315, 33, 'Kabupaten Grobogan'),
(3316, 33, 'Kabupaten Blora'),
(3317, 33, 'Kabupaten Rembang'),
(3318, 33, 'Kabupaten Pati'),
(3319, 33, 'Kabupaten Kudus'),
(3320, 33, 'Kabupaten Jepara'),
(3321, 33, 'Kabupaten Demak'),
(3322, 33, 'Kabupaten Semarang'),
(3323, 33, 'Kabupaten Temanggung'),
(3324, 33, 'Kabupaten Kendal'),
(3325, 33, 'Kabupaten Batang'),
(3326, 33, 'Kabupaten Pekalongan'),
(3327, 33, 'Kabupaten Pemalang'),
(3328, 33, 'Kabupaten Tegal'),
(3329, 33, 'Kabupaten Brebes'),
(3371, 33, 'Kota Magelang'),
(3372, 33, 'Kota Surakarta'),
(3373, 33, 'Kota Salatiga'),
(3374, 33, 'Kota Semarang'),
(3375, 33, 'Kota Pekalongan'),
(3376, 33, 'Kota Tegal'),
(3401, 34, 'Kabupaten Kulon Progo'),
(3402, 34, 'Kabupaten Bantul'),
(3403, 34, 'Kabupaten Gunungkidul'),
(3404, 34, 'Kabupaten Sleman'),
(3471, 34, 'Kota Yogyakarta'),
(3501, 35, 'Kabupaten Pacitan'),
(3502, 35, 'Kabupaten Ponorogo'),
(3503, 35, 'Kabupaten Trenggalek'),
(3504, 35, 'Kabupaten Tulungagung'),
(3505, 35, 'Kabupaten Blitar'),
(3506, 35, 'Kabupaten Kediri'),
(3507, 35, 'Kabupaten Malang'),
(3508, 35, 'Kabupaten Lumajang'),
(3509, 35, 'Kabupaten Jember'),
(3510, 35, 'Kabupaten Banyuwangi'),
(3511, 35, 'Kabupaten Bondowoso'),
(3512, 35, 'Kabupaten Situbondo'),
(3513, 35, 'Kabupaten Probolinggo'),
(3514, 35, 'Kabupaten Pasuruan'),
(3515, 35, 'Kabupaten Sidoarjo'),
(3516, 35, 'Kabupaten Mojokerto'),
(3517, 35, 'Kabupaten Jombang'),
(3518, 35, 'Kabupaten Nganjuk'),
(3519, 35, 'Kabupaten Madiun'),
(3520, 35, 'Kabupaten Magetan'),
(3521, 35, 'Kabupaten Ngawi'),
(3522, 35, 'Kabupaten Bojonegoro'),
(3523, 35, 'Kabupaten Tuban'),
(3524, 35, 'Kabupaten Lamongan'),
(3525, 35, 'Kabupaten Gresik'),
(3526, 35, 'Kabupaten Bangkalan'),
(3527, 35, 'Kabupaten Sampang'),
(3528, 35, 'Kabupaten Pamekasan'),
(3529, 35, 'Kabupaten Sumenep'),
(3571, 35, 'Kota Kediri'),
(3572, 35, 'Kota Blitar'),
(3573, 35, 'Kota Malang'),
(3574, 35, 'Kota Probolinggo'),
(3575, 35, 'Kota Pasuruan'),
(3576, 35, 'Kota Mojokerto'),
(3577, 35, 'Kota Madiun'),
(3578, 35, 'Kota Surabaya'),
(3579, 35, 'Kota Batu'),
(3601, 36, 'Kabupaten Pandeglang'),
(3602, 36, 'Kabupaten Lebak'),
(3603, 36, 'Kabupaten Tangerang'),
(3604, 36, 'Kabupaten Serang'),
(3671, 36, 'Kota Tangerang'),
(3672, 36, 'Kota Cilegon'),
(3673, 36, 'Kota Serang'),
(3674, 36, 'Kota Tangerang Selatan'),
(5101, 51, 'Kabupaten Jembrana'),
(5102, 51, 'Kabupaten Tabanan'),
(5103, 51, 'Kabupaten Badung'),
(5104, 51, 'Kabupaten Gianyar'),
(5105, 51, 'Kabupaten Klungkung'),
(5106, 51, 'Kabupaten Bangli'),
(5107, 51, 'Kabupaten Karangasem'),
(5108, 51, 'Kabupaten Buleleng'),
(5171, 51, 'Kota Denpasar'),
(5201, 52, 'Kabupaten Lombok Barat'),
(5202, 52, 'Kabupaten Lombok Tengah'),
(5203, 52, 'Kabupaten Lombok Timur'),
(5204, 52, 'Kabupaten Sumbawa'),
(5205, 52, 'Kabupaten Dompu'),
(5206, 52, 'Kabupaten Bima'),
(5207, 52, 'Kabupaten Sumbawa Barat'),
(5208, 52, 'Kabupaten Lombok Utara'),
(5271, 52, 'Kota Mataram'),
(5272, 52, 'Kota Bima'),
(5301, 53, 'Kabupaten Kupang'),
(5302, 53, 'Kabupaten Timor Tengah Selatan'),
(5303, 53, 'Kabupaten Timor Tengah Utara'),
(5304, 53, 'Kabupaten Belu'),
(5305, 53, 'Kabupaten Alor'),
(5306, 53, 'Kabupaten Flores Timur'),
(5307, 53, 'Kabupaten Sikka'),
(5308, 53, 'Kabupaten Ende'),
(5309, 53, 'Kabupaten Ngada'),
(5310, 53, 'Kabupaten Manggarai'),
(5311, 53, 'Kabupaten Sumba Timur'),
(5312, 53, 'Kabupaten Sumba Barat'),
(5313, 53, 'Kabupaten Lembata'),
(5314, 53, 'Kabupaten Rote Ndao'),
(5315, 53, 'Kabupaten Manggarai Barat'),
(5316, 53, 'Kabupaten Nagekeo'),
(5317, 53, 'Kabupaten Sumba Tengah'),
(5318, 53, 'Kabupaten Sumba Barat Daya'),
(5319, 53, 'Kabupaten Manggarai Timur'),
(5320, 53, 'Kabupaten Sabu Raijua'),
(5321, 53, 'Kabupaten Malaka'),
(5371, 53, 'Kota Kupang'),
(6101, 61, 'Kabupaten Sambas'),
(6102, 61, 'Kabupaten Bengkayang'),
(6103, 61, 'Kabupaten Landak'),
(6104, 61, 'Kabupaten Mempawah'),
(6105, 61, 'Kabupaten Sanggau'),
(6106, 61, 'Kabupaten Ketapang'),
(6107, 61, 'Kabupaten Sintang'),
(6108, 61, 'Kabupaten Kapuas Hulu'),
(6109, 61, 'Kabupaten Sekadau'),
(6110, 61, 'Kabupaten Melawi'),
(6111, 61, 'Kabupaten Kayong Utara'),
(6112, 61, 'Kabupaten Kubu Raya'),
(6171, 61, 'Kota Pontianak'),
(6172, 61, 'Kota Singkawang'),
(6201, 62, 'Kabupaten Kotawaringin Barat'),
(6202, 62, 'Kabupaten Kotawaringin Timur'),
(6203, 62, 'Kabupaten Kapuas'),
(6204, 62, 'Kabupaten Barito Selatan'),
(6205, 62, 'Kabupaten Barito Utara'),
(6206, 62, 'Kabupaten Sukamara'),
(6207, 62, 'Kabupaten Lamandau'),
(6208, 62, 'Kabupaten Seruyan'),
(6209, 62, 'Kabupaten Katingan'),
(6210, 62, 'Kabupaten Pulang Pisau'),
(6211, 62, 'Kabupaten Gunung Mas'),
(6212, 62, 'Kabupaten Barito Timur'),
(6213, 62, 'Kabupaten Murung Raya'),
(6271, 62, 'Kota Palangka Raya'),
(6301, 63, 'Kabupaten Tanah Laut'),
(6302, 63, 'Kabupaten Kotabaru'),
(6303, 63, 'Kabupaten Banjar'),
(6304, 63, 'Kabupaten Barito Kuala'),
(6305, 63, 'Kabupaten Tapin'),
(6306, 63, 'Kabupaten Hulu Sungai Selatan'),
(6307, 63, 'Kabupaten Hulu Sungai Tengah'),
(6308, 63, 'Kabupaten Hulu Sungai Utara'),
(6309, 63, 'Kabupaten Tabalong'),
(6310, 63, 'Kabupaten Tanah Bumbu'),
(6311, 63, 'Kabupaten Balangan'),
(6371, 63, 'Kota Banjarmasin'),
(6372, 63, 'Kota Banjarbaru'),
(6401, 64, 'Kabupaten Paser'),
(6402, 64, 'Kabupaten Kutai Kartanegara'),
(6403, 64, 'Kabupaten Berau'),
(6407, 64, 'Kabupaten Kutai Barat'),
(6408, 64, 'Kabupaten Kutai Timur'),
(6409, 64, 'Kabupaten Penajam Paser Utara'),
(6411, 64, 'Kabupaten Mahakam Ulu'),
(6471, 64, 'Kota Balikpapan'),
(6472, 64, 'Kota Samarinda'),
(6474, 64, 'Kota Bontang'),
(6501, 65, 'Kabupaten Bulungan'),
(6502, 65, 'Kabupaten Malinau'),
(6503, 65, 'Kabupaten Nunukan'),
(6504, 65, 'Kabupaten Tana Tidung'),
(6571, 65, 'Kota Tarakan'),
(7101, 71, 'Kabupaten Bolaang Mongondow'),
(7102, 71, 'Kabupaten Minahasa'),
(7103, 71, 'Kabupaten Kepulauan Sangihe'),
(7104, 71, 'Kabupaten Kepulauan Talaud'),
(7105, 71, 'Kabupaten Minahasa Selatan'),
(7106, 71, 'Kabupaten Minahasa Utara'),
(7107, 71, 'Kabupaten Bolaang Mongondow Utara'),
(7108, 71, 'Kabupaten Siau Tagulandang Biaro'),
(7109, 71, 'Kabupaten Minahasa Tenggara'),
(7110, 71, 'Kabupaten Bolaang Mongondow Selatan'),
(7111, 71, 'Kabupaten Bolaang Mongondow Timur'),
(7171, 71, 'Kota Manado'),
(7172, 71, 'Kota Bitung'),
(7173, 71, 'Kota Tomohon'),
(7174, 71, 'Kota Kotamobagu'),
(7201, 72, 'Kabupaten Banggai'),
(7202, 72, 'Kabupaten Poso'),
(7203, 72, 'Kabupaten Donggala'),
(7204, 72, 'Kabupaten Toli-Toli'),
(7205, 72, 'Kabupaten Buol'),
(7206, 72, 'Kabupaten Morowali'),
(7207, 72, 'Kabupaten Banggai Kepulauan'),
(7208, 72, 'Kabupaten Parigi Moutong'),
(7209, 72, 'Kabupaten Tojo Una-Una'),
(7210, 72, 'Kabupaten Sigi'),
(7211, 72, 'Kabupaten Banggai Laut'),
(7212, 72, 'Kabupaten Morowali Utara'),
(7271, 72, 'Kota Palu'),
(7301, 73, 'Kabupaten Kepulauan Selayar'),
(7302, 73, 'Kabupaten Bulukumba'),
(7303, 73, 'Kabupaten Bantaeng'),
(7304, 73, 'Kabupaten Jeneponto'),
(7305, 73, 'Kabupaten Takalar'),
(7306, 73, 'Kabupaten Gowa'),
(7307, 73, 'Kabupaten Sinjai'),
(7308, 73, 'Kabupaten Maros'),
(7309, 73, 'Kabupaten Pangkajene dan Kepulauan'),
(7310, 73, 'Kabupaten Barru'),
(7311, 73, 'Kabupaten Bone'),
(7312, 73, 'Kabupaten Soppeng'),
(7313, 73, 'Kabupaten Wajo'),
(7314, 73, 'Kabupaten Sidenreng Rappang'),
(7315, 73, 'Kabupaten Pinrang'),
(7316, 73, 'Kabupaten Enrekang'),
(7317, 73, 'Kabupaten Luwu'),
(7318, 73, 'Kabupaten Tana Toraja'),
(7322, 73, 'Kabupaten Luwu Utara'),
(7325, 73, 'Kabupaten Luwu Timur'),
(7326, 73, 'Kabupaten Toraja Utara'),
(7371, 73, 'Kota Makassar'),
(7372, 73, 'Kota Parepare'),
(7373, 73, 'Kota Palopo'),
(7401, 74, 'Kabupaten Buton'),
(7402, 74, 'Kabupaten Muna'),
(7403, 74, 'Kabupaten Konawe'),
(7404, 74, 'Kabupaten Kolaka'),
(7405, 74, 'Kabupaten Konawe Selatan'),
(7406, 74, 'Kabupaten Bombana'),
(7407, 74, 'Kabupaten Wakatobi'),
(7408, 74, 'Kabupaten Kolaka Utara'),
(7409, 74, 'Kabupaten Buton Utara'),
(7410, 74, 'Kabupaten Konawe Utara'),
(7411, 74, 'Kabupaten Kolaka Timur'),
(7412, 74, 'Kabupaten Konawe Kepulauan'),
(7413, 74, 'Kabupaten Muna Barat'),
(7414, 74, 'Kabupaten Buton Tengah'),
(7415, 74, 'Kabupaten Buton Selatan'),
(7471, 74, 'Kota Kendari'),
(7472, 74, 'Kota Baubau'),
(7501, 75, 'Kabupaten Boalemo'),
(7502, 75, 'Kabupaten Gorontalo'),
(7503, 75, 'Kabupaten Pohuwato'),
(7504, 75, 'Kabupaten Bone Bolango'),
(7505, 75, 'Kabupaten Gorontalo Utara'),
(7571, 75, 'Kota Gorontalo'),
(7601, 76, 'Kabupaten Majene'),
(7602, 76, 'Kabupaten Polewali Mandar'),
(7603, 76, 'Kabupaten Mamasa'),
(7604, 76, 'Kabupaten Mamuju'),
(7605, 76, 'Kabupaten Mamuju Utara'),
(7606, 76, 'Kabupaten Mamuju Tengah');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `warna` varchar(15) NOT NULL,
  `icon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `warna`, `icon`) VALUES
(60, 'Fashion', 'bg-info', ''),
(61, 'Barang', 'bg-success', ''),
(63, 'Teknologi', 'bg-warning', ''),
(67, 'Makanan', 'bg-danger', ''),
(97, 'Kerajinan', 'bg-info', ''),
(98, 'Minuman', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `kabupaten_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` varchar(10) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_update` date NOT NULL,
  `toko_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `gambar`, `nama_produk`, `harga`, `deskripsi`, `tanggal_update`, `toko_id`, `kategori_id`) VALUES
(18, 'dimsum.png', 'Dimsum', '20000', 'Dimsum adalah hidangan khas Tiongkok yang disajikan dalam porsi kecil dengan cita rasa gurih dan lezat. Terbuat dari bahan pilihan seperti ayam, udang, atau daging yang dibungkus kulit tipis dan dikukus hingga matang sempurna. Cocok dinikmati sebagai camilan maupun teman bersantai bersama keluarga dan teman.\r\n', '2026-02-12', 16, 67),
(19, 'tahubakso.png', 'Tahu Bakso', '20000', 'Tahu bakso adalah perpaduan lezat antara tahu lembut dan isian bakso daging yang gurih dan kenyal. Dibuat dari bahan pilihan dan bumbu khas, tahu bakso kami memiliki cita rasa savory yang pas, dengan tekstur luar yang lembut dan isi yang padat serta juicy. Cocok dinikmati sebagai camilan, lauk pendamping, maupun sajian spesial bersama keluarga.', '2026-02-05', 16, 67),
(20, 'geblek.png', 'Geblek', '20000', 'Geblek adalah camilan khas berbahan dasar tepung tapioka yang memiliki tekstur kenyal dan cita rasa gurih. Dibentuk menyerupai angka delapan dan digoreng hingga matang, geblek memiliki bagian luar yang sedikit renyah dengan bagian dalam yang lembut dan elastis. Cocok dinikmati sebagai teman santai, camilan sore, atau pelengkap hidangan tradisional.', '2026-02-05', 16, 67);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id`, `nama`) VALUES
(11, 'Aceh'),
(12, 'Sumatera Utara'),
(13, 'Sumatera Barat'),
(14, 'Riau'),
(15, 'Jambi'),
(16, 'Sumatera Selatan'),
(17, 'Bengkulu'),
(18, 'Lampung'),
(19, 'Kepulauan Bangka Belitung'),
(21, 'Kepulauan Riau'),
(31, 'DKI Jakarta'),
(32, 'Jawa Barat'),
(33, 'Jawa Tengah'),
(34, 'DI Yogyakarta'),
(35, 'Jawa Timur'),
(36, 'Banten'),
(51, 'Bali'),
(52, 'Nusa Tenggara Barat'),
(53, 'Nusa Tenggara Timur'),
(61, 'Kalimantan Barat'),
(62, 'Kalimantan Tengah'),
(63, 'Kalimantan Selatan'),
(64, 'Kalimantan Timur'),
(65, 'Kalimantan Utara'),
(71, 'Sulawesi Utara'),
(72, 'Sulawesi Tengah'),
(73, 'Sulawesi Selatan'),
(74, 'Sulawesi Tenggara'),
(75, 'Gorontalo'),
(76, 'Sulawesi Barat'),
(81, 'Maluku'),
(82, 'Maluku Utara'),
(91, 'Papua'),
(92, 'Papua Barat'),
(93, 'Papua Selatan'),
(94, 'Papua Tengah'),
(95, 'Papua Pegunungan'),
(96, 'Papua Barat Daya');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nama_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'Pelaku UMKM'),
(3, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `nama_toko`, `alamat`) VALUES
(1, 'Fulan Store', 'Pundak Tegal, Kembang, Nanggulan'),
(16, 'Toko Kidul', 'Pundak Tegal, Kembang, Nanggulan');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `pelaku_umkm_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `notif` tinyint(1) DEFAULT NULL,
  `tanggal_transaksi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `kontak` varchar(15) DEFAULT NULL,
  `toko_id` int(11) DEFAULT NULL,
  `rekening` varchar(25) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `photo`, `nama`, `email`, `jenis_kelamin`, `kontak`, `toko_id`, `rekening`, `password`, `role_id`) VALUES
(1, 'avatar5.png', 'Alfian', 'admin@gmail.com', 'laki-laki', '085608536870', NULL, '0120123123', 'e00cf25ad42683b3df678c61f42c6bda', 1),
(41, 'avatar.png', 'Ijul', 'umkm@gmail.com', 'laki-laki', '085608536870', 16, '08893393939', 'e00cf25ad42683b3df678c61f42c6bda', 2),
(42, 'images.jpg', 'Alfian Customer', 'alfianardiansyah295@gmail.com', 'laki-laki', '085608536870', NULL, NULL, 'e00cf25ad42683b3df678c61f42c6bda', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_user`
--
ALTER TABLE `alamat_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kecamatan_id` (`kecamatan_id`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinsi_id` (`provinsi_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kabupaten_id` (`kabupaten_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `toko_id` (`toko_id`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `pelaku_umkm_id` (`pelaku_umkm_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ibfk_1` (`role_id`),
  ADD KEY `user_ibfk_2` (`toko_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_user`
--
ALTER TABLE `alamat_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7607;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat_user`
--
ALTER TABLE `alamat_user`
  ADD CONSTRAINT `alamat_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `desa`
--
ALTER TABLE `desa`
  ADD CONSTRAINT `desa_ibfk_1` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_ibfk_1` FOREIGN KEY (`provinsi_id`) REFERENCES `provinsi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`kabupaten_id`) REFERENCES `kabupaten` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pelanggan_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`pelaku_umkm_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
