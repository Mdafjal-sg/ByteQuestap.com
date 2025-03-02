-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2025 at 05:04 PM
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
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_02_065605_create_products_table', 1),
(5, '2025_03_02_072058_product', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Test Product', 'This is a sample product afzal', 500.00, 24, '2025-03-02 03:42:51', '2025-03-02 04:35:05'),
(3, 'ex', 'Voluptatem adipisci assumenda ut reiciendis et.', 435.26, 33, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(4, 'est', 'Debitis fugiat ex dolor.', 297.52, 46, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(5, 'ut', 'Eos quibusdam voluptatem qui possimus aliquam officiis quasi.', 908.43, 23, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(6, 'quidem', 'Voluptatem cupiditate temporibus asperiores.', 283.87, 26, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(7, 'fuga', 'Hic et eos autem doloribus ducimus placeat sint.', 131.18, 40, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(8, 'repellat', 'Sequi et pariatur nisi laboriosam sequi nam expedita aperiam.', 559.31, 28, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(9, 'qui', 'Expedita rerum est amet sed.', 124.08, 40, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(10, 'aut', 'Voluptate molestiae doloribus excepturi voluptatem placeat nam.', 605.69, 33, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(11, 'veritatis', 'Necessitatibus nisi placeat harum.', 315.26, 4, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(12, 'magni', 'Et qui aliquid officiis eaque laborum.', 762.01, 24, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(13, 'ducimus', 'Ipsa tenetur architecto et cumque voluptas.', 867.63, 6, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(14, 'doloribus', 'Illum esse voluptas voluptatem velit architecto eum.', 968.80, 28, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(15, 'magnam', 'Quod fugiat id fugiat dolorem.', 755.39, 5, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(16, 'minus', 'Hic velit reiciendis aut est saepe incidunt similique est.', 749.26, 33, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(17, 'quo', 'Molestiae omnis et quis sunt cumque.', 880.64, 41, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(18, 'iste', 'Hic ullam recusandae vel harum qui corporis recusandae harum.', 400.32, 2, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(19, 'qui', 'Commodi dolorem quae modi sunt eum ut culpa.', 808.66, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(20, 'voluptatem', 'Ut nihil explicabo et nihil in eum omnis.', 142.42, 21, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(21, 'debitis', 'Eum autem ut ex minima neque pariatur.', 235.65, 8, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(22, 'voluptas', 'Facere voluptatem eum aliquid cupiditate quisquam quasi rerum rerum.', 603.77, 11, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(23, 'qui', 'Dignissimos deserunt voluptatum qui ut voluptatibus eveniet.', 930.90, 40, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(24, 'distinctio', 'Eos dolor autem consequatur voluptate harum quasi consequatur.', 730.23, 14, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(25, 'eius', 'Eum quia occaecati molestiae quia.', 813.05, 25, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(26, 'beatae', 'Modi perferendis nostrum voluptate.', 421.17, 36, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(27, 'animi', 'Necessitatibus delectus iure illo.', 819.83, 16, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(28, 'asperiores', 'Voluptatem et quae consequatur.', 939.98, 24, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(29, 'excepturi', 'Possimus hic quis impedit vitae.', 714.93, 7, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(30, 'laboriosam', 'In quia est ab suscipit quia voluptatum tenetur.', 706.20, 38, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(31, 'ullam', 'Id debitis natus perferendis quisquam.', 225.61, 5, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(32, 'enim', 'Amet nisi magnam velit rem sunt rerum.', 324.11, 31, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(33, 'sit', 'Est cumque et vero deserunt qui sit omnis.', 613.82, 5, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(34, 'provident', 'Perspiciatis minima quidem voluptate quia.', 769.07, 48, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(35, 'aut', 'Velit atque illo qui tempora placeat et odit qui.', 271.96, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(36, 'sed', 'Voluptas ut rem voluptatem et.', 400.17, 43, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(37, 'enim', 'Hic quis ipsam architecto porro reiciendis placeat.', 642.55, 15, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(38, 'repellendus', 'Sit eos laboriosam quae non ipsum fugit odio labore.', 911.88, 27, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(39, 'autem', 'Ab error est autem corrupti accusantium laborum.', 162.59, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(40, 'ut', 'Tenetur quae quasi at sunt est.', 278.34, 25, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(41, 'expedita', 'Cum nemo velit ab.', 725.74, 18, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(42, 'est', 'Commodi ut id natus minus quasi.', 457.56, 14, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(43, 'nobis', 'Ut et beatae beatae voluptates architecto numquam.', 368.96, 49, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(44, 'consequatur', 'Facere nostrum ut perspiciatis sint deserunt a vel.', 904.19, 29, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(45, 'inventore', 'Non cum facilis cumque aut illo.', 127.19, 48, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(46, 'laudantium', 'Aspernatur quasi illo qui atque tenetur consectetur.', 506.14, 48, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(47, 'accusantium', 'Vel non dicta et ut dignissimos ipsa reiciendis.', 454.96, 10, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(48, 'placeat', 'Recusandae sed ipsam omnis quod harum et.', 270.08, 35, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(49, 'nobis', 'Modi sit labore tempore tempore ea accusamus.', 491.67, 43, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(50, 'qui', 'Asperiores quia est ut.', 433.96, 12, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(51, 'repellendus', 'Recusandae modi velit repudiandae quia provident aut.', 363.42, 13, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(52, 'distinctio', 'Voluptatem vero ut ut quia facere.', 303.12, 33, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(53, 'eveniet', 'Ad earum rem et sit est nemo.', 854.65, 33, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(54, 'id', 'Unde et sapiente eius praesentium.', 551.10, 39, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(55, 'et', 'Maxime exercitationem maxime eligendi odit.', 366.91, 12, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(56, 'et', 'Reprehenderit amet vel aspernatur veniam explicabo consectetur fugit commodi.', 332.55, 4, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(57, 'quo', 'Nam sint similique rerum magnam voluptate.', 265.44, 49, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(58, 'voluptatem', 'Culpa perspiciatis ea dolor aut sed fugit.', 803.72, 15, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(59, 'possimus', 'Ratione et eligendi id accusantium nihil at.', 254.53, 43, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(60, 'omnis', 'Iusto voluptatem adipisci non illo aspernatur nostrum similique nihil.', 807.67, 49, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(61, 'ex', 'Aut ut nemo dolore deleniti.', 841.36, 43, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(62, 'et', 'Ratione velit voluptatem et est sed.', 377.30, 31, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(63, 'vel', 'Facere vero laborum quasi quidem necessitatibus harum quisquam.', 810.93, 37, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(64, 'nulla', 'Dolorem alias quam cupiditate non molestiae quae.', 670.61, 25, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(65, 'aut', 'Sequi totam est quo totam enim quisquam quis dolores.', 177.68, 42, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(66, 'sunt', 'Dolorem architecto fugiat sint doloribus consequuntur eum illo autem.', 323.75, 18, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(67, 'pariatur', 'Et facere possimus sapiente soluta in soluta nemo.', 631.00, 13, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(68, 'ducimus', 'Fugiat qui est esse necessitatibus.', 679.66, 8, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(69, 'eum', 'Et est ut eum quia.', 131.54, 25, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(70, 'nam', 'Fugit dolor illum et alias nulla eum.', 870.57, 49, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(71, 'alias', 'Aperiam ut veniam asperiores doloribus nihil similique quasi.', 666.71, 9, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(72, 'similique', 'Cum asperiores ut voluptatum earum.', 352.46, 36, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(73, 'enim', 'Qui voluptatum sint amet sint maxime quia.', 290.44, 35, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(74, 'aspernatur', 'Sunt velit et accusantium suscipit facilis aperiam natus.', 716.10, 26, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(75, 'rem', 'Qui consequuntur deleniti excepturi odio consequuntur sapiente.', 559.99, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(76, 'quis', 'Repudiandae fugiat saepe eligendi voluptas pariatur exercitationem.', 378.38, 2, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(77, 'non', 'Doloremque consequatur vel culpa itaque iure.', 160.14, 1, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(78, 'nobis', 'Cupiditate deserunt molestias incidunt fugit vitae id.', 745.74, 34, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(79, 'quam', 'Ex laborum sed ipsam aut autem excepturi quo ea.', 600.97, 36, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(80, 'praesentium', 'At amet porro voluptatum error enim modi pariatur.', 532.15, 47, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(81, 'expedita', 'Omnis dolores provident reprehenderit repudiandae.', 926.65, 8, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(82, 'iusto', 'Voluptas eligendi ex suscipit.', 103.40, 10, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(83, 'corporis', 'Rem eius autem dolorem optio qui.', 126.95, 17, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(84, 'iste', 'Accusantium sit et inventore.', 932.35, 9, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(85, 'necessitatibus', 'Aut atque libero quos.', 491.91, 41, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(86, 'aut', 'Earum porro nostrum laboriosam est.', 284.10, 20, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(87, 'praesentium', 'Maxime tempora perferendis alias saepe.', 209.78, 43, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(88, 'voluptas', 'Nesciunt error suscipit saepe assumenda laborum fugit.', 580.12, 17, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(89, 'nulla', 'Consequatur eveniet et consequatur rem autem et error.', 931.24, 11, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(90, 'ullam', 'Natus expedita reprehenderit corporis iusto eaque quod est.', 650.73, 39, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(91, 'deleniti', 'Magnam voluptas aut perferendis est ab eos.', 716.59, 31, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(92, 'facilis', 'Minus reiciendis repellat qui minima possimus.', 798.66, 12, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(93, 'rerum', 'Dolorem in reprehenderit reprehenderit eos adipisci quia ut et.', 243.76, 48, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(94, 'optio', 'In omnis ut at eum perferendis.', 521.33, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(95, 'enim', 'Debitis facilis aliquam voluptatem eveniet rerum nihil voluptates.', 377.90, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(96, 'reprehenderit', 'Sed est consequatur aut in deleniti ducimus.', 620.46, 3, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(97, 'magni', 'Error et dolor et rerum nesciunt ea magni quae.', 983.00, 39, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(98, 'quidem', 'Omnis est quia consequatur consequatur ducimus consequatur voluptas.', 978.77, 22, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(99, 'eveniet', 'Voluptates nulla repellat et consequatur id est.', 167.44, 38, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(100, 'aut', 'Corporis ullam amet iure nobis officia quia eum.', 988.63, 10, '2025-03-02 03:42:51', '2025-03-02 03:42:51'),
(101, 'Test Product', 'This is a sample product', 500.00, 24, '2025-03-02 03:59:49', '2025-03-02 03:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cKZKrvLExwadiHLJ5xMuW34oZlUtDrevJ18UK4zn', NULL, '::1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWQ0MWxia1RTV2VZMGhwczNlYllyUUZUcE9ISUdIM2w0aVYxQ24zTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbW1lcmNlX0J5dGVRdWVzdC9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740907241);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
