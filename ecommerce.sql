-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 07:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Asus', 'asus', 0, '2024-01-04 01:28:13', '2024-01-10 23:39:32', 1),
(2, 'Apple', 'apple', 0, '2024-01-04 01:28:41', '2024-01-04 01:28:41', 4),
(3, 'Leonove', 'leonove', 0, '2024-01-04 01:29:00', '2024-01-04 01:29:00', 4),
(4, 'shirt', 'shirt', 0, '2024-01-11 00:34:23', '2024-01-11 00:34:23', 5),
(6, 'MI', 'mi', 0, '2024-01-11 00:44:22', '2024-01-11 00:44:22', 1),
(7, 'Oppo', 'oppo', 0, '2024-01-11 00:44:40', '2024-01-11 00:44:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `meta_title`, `meta_keyword`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', 'mobile', 'This is Mobile Description', 'uploads/category/1703843073.png', 'Mobile', 'This is Mobile Description', 'This is Mobile Description', 0, '2023-12-29 04:14:33', '2023-12-29 04:14:33'),
(4, 'laptop', 'laptop', 'This is Iphone 15 Pro Max Description', 'uploads/category/1704261931.jpg', 'Laptop', 'This is Iphone 15 Pro Max Mobile Description', 'This is Iphone 15 Pro Max Mobile Description', 0, '2024-01-03 00:35:31', '2024-01-03 00:35:59'),
(5, 'shirt', 'shirt', 'a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a \"dress shirt\", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 'uploads/category/1704952926.jpg', 'Men\'s Shirt', 'Men\'s Shirt', 'a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a \"dress shirt\", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 0, '2024-01-11 00:32:06', '2024-01-11 00:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Red', 'red', 0, '2024-01-04 23:19:40', '2024-01-04 23:19:40'),
(2, 'Blue', 'blue', 0, '2024-01-04 23:20:05', '2024-01-05 04:53:18'),
(3, 'Green', 'green', 0, '2024-01-04 23:24:34', '2024-01-04 23:46:15'),
(5, 'Yellow', 'yellow', 0, '2024-01-05 04:52:51', '2024-01-05 04:52:51');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_29_045520_add_details_to_users_table', 2),
(6, '2023_12_29_070746_create_categories_table', 3),
(7, '2024_01_03_061142_create_brands_table', 4),
(8, '2024_01_03_102450_create_products_table', 5),
(9, '2024_01_03_103505_create_product_images_table', 5),
(11, '2024_01_05_041725_create_colors_table', 6),
(12, '2024_01_05_105734_create_product_colors_table', 7),
(13, '2024_01_09_102506_create_sliders_table', 8),
(14, '2024_01_11_050034_add_category_id_to_brands_table', 9),
(17, '2024_01_11_113307_create_wishlists_table', 10),
(18, '2024_01_12_113058_create_carts_table', 11),
(19, '2024_01_22_065155_create_orders_table', 12),
(20, '2024_01_22_065840_create_order_items_table', 12),
(22, '2024_01_30_063634_create_settings_table', 13),
(23, '2024_02_07_045546_create_user_details_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `status_message` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `tracking_no`, `fullname`, `email`, `phone`, `pincode`, `address`, `status_message`, `payment_mode`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'ralecon-B3Vq8n4MCm', 'sagar kumar behera', 'sagarkumar@ralecon.com', '9632587415', '560091', 'Banglore, India', 'in progress', 'Cash On Delivery', NULL, '2024-01-22 03:54:38', '2024-01-22 03:54:38'),
(2, 1, 'ralecon-voY1eacjy6', 'sagar kumar behera', 'sagarkumar@ralecon.com', '9861113562', '751016', 'Bhubaneswar, Orisssa', 'in progress', 'Cash On Delivery', NULL, '2024-01-22 03:57:56', '2024-01-22 03:57:56'),
(3, 1, 'ralecon-yGSzbggDuA', 'sagar kumar behera', 'sagarkumar@ralecon.com', '9871236452', '751017', 'Khurda, Orissa', 'completed', 'Cash On Delivery', NULL, '2024-01-23 04:37:10', '2024-01-23 01:45:36'),
(4, 1, 'ralecon-src5JVMKai', 'sagar kumar behera', 'sagarkumar@ralecon.com', '9632587419', '751016', 'Bhubaneswar, Orissa', 'In Progress', 'Cash On Delivery', NULL, '2024-01-23 01:50:46', '2024-01-23 01:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_color_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 7, 4, 999, '2024-01-22 03:54:38', '2024-01-22 03:54:38'),
(2, 1, 5, NULL, 5, 71999, '2024-01-22 03:54:38', '2024-01-22 03:54:38'),
(3, 2, 7, 7, 4, 999, '2024-01-22 03:57:56', '2024-01-22 03:57:56'),
(4, 2, 5, NULL, 5, 71999, '2024-01-22 03:57:56', '2024-01-22 03:57:56'),
(5, 3, 5, NULL, 1, 71999, '2024-01-22 04:37:10', '2024-01-22 04:37:10'),
(6, 3, 7, 7, 1, 999, '2024-01-22 04:37:10', '2024-01-22 04:37:10'),
(7, 4, 7, 7, 1, 999, '2024-01-23 01:50:46', '2024-01-23 01:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `small_description` mediumtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `trending` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=trending,0=not-trending',
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=featured,0=not-featured',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden,0=visible',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `brand`, `small_description`, `description`, `original_price`, `selling_price`, `quantity`, `trending`, `featured`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(5, 4, 'ThinkPad-E16-40.64cms-13th-Gen-Intel-i5', 'ThinkPad-E16-40.64cms-13th-Gen-Intel-i5', 'Apple', '13th Generation Intel® Core™ i5-1335U Processor (E-cores up to 3.40 GHz P-cores up to 4.60 GHz)', 'The Bottom Line. The Lenovo ThinkPad 13 is an inexpensive rugged laptop with all-day battery life; it\'s a fine choice whether you\'re buying it for a college student or a small business. PCMag editors select and review products independently.', 126401, 71999, 4, 1, 0, 0, 'Leonove New Model', '13th Generation Intel® Core™ i5-1335U Processor (E-cores up to 3.40 GHz P-cores up to 4.60 GHz)', 'The Bottom Line. The Lenovo ThinkPad 13 is an inexpensive rugged laptop with all-day battery life; it\'s a fine choice whether you\'re buying it for a college student or a small business. PCMag editors select and review products independently.', '2024-01-04 01:35:06', '2024-01-22 04:37:10'),
(6, 4, 'Acer-Nitro-5-Gaming-Laptop-Intel-Core-i5-12450H', 'Acer-Nitro-5-Gaming-Laptop-Intel-Core-i5-12450H', 'Leonove', 'The Acer Nitro 5, now called Nitro V 15, is arguably one of the best cheap gaming laptops you can get, but of course, that comes with some reasonable compromises.', 'So things like Gaming or Video Editing on battery? Don\'t. But still, the Nitro 5 can deliver 5–6 hours of battery for typical tasks, like MS Office, PDF reading, browsing and so on, if you need, which I consider pretty decent, and enough for a huge chunk of the day.', 100000, 88000, 3, 1, 1, 0, 'Leonove', 'The screen also has multi-touch support.', 'Our Verdict. The Acer Nitro 5 is decent for school use. It\'s more than powerful enough to handle light tasks like web browsing and text processing, and its battery lasts easily through a typical eight-hour day as long as you don\'t run any CPU or GPU-intensive programs.', '2024-01-05 05:46:18', '2024-01-05 05:46:18'),
(7, 5, 'Men\'s Shirt', 'shirt', 'shirt', 'a garment for the upper part of the body usually with a collar, sleeves, a front opening, and a tail long enough to be tucked inside pants or a skir', 'A shirt that is light and has breathable fabric is the best. It\'s nice if they are super soft but have good structure - the cut of it, the neck line and the sleeves are important. Long is good. Something that is fashion friendly and up with the trends, but not clingy and not too loose.', 799, 999, 3, 1, 1, 0, 'Men\'s Shirt', 'a garment for the upper part of the body usually with a collar, sleeves, a front opening, and a tail long enough to be tucked inside pants or a skir', 'A shirt that is light and has breathable fabric is the best. It\'s nice if they are super soft but have good structure - the cut of it, the neck line and the sleeves are important. Long is good. Something that is fashion friendly and up with the trends, but not clingy and not too loose.', '2024-01-11 00:37:30', '2024-01-23 04:40:34'),
(8, 5, 'Oxford Shirts', 'shirt', 'shirt', 'The name Oxford refers to a type of cloth originally made in Scotland – it\'s heavier and has a rougher weave (also sometimes known as a basket weave) than other types of shirts, which means it\'s sometimes more durable.', 'First of all, Oxford is a type of cloth that was created in Scottish Fabric mills. It has a heavier and rougher weave than most traditional dress shirt cloths - some refer to it as a basket weave. Oxford cloth tends to be stiff and hold up their form, while still being more formal than flannels.', 999, 1599, 4, 0, 0, 0, 'shirts', 'The name Oxford refers to a type of cloth originally made in Scotland – it\'s heavier and has a rougher weave (also sometimes known as a basket weave) than other types of shirts, which means it\'s sometimes more durable.', 'First of all, Oxford is a type of cloth that was created in Scottish Fabric mills. It has a heavier and rougher weave than most traditional dress shirt cloths - some refer to it as a basket weave. Oxford cloth tends to be stiff and hold up their form, while still being more formal than flannels.', '2024-01-11 00:41:16', '2024-01-11 00:41:16'),
(9, 1, 'Redmi Note 12 Pro 5G', 'redmi-12', 'MI', 'The phone comes with a 60 Hz refresh rate 6.60-inch touchscreen display offering a resolution of 1080x2400 pixels and an aspect ratio of 20:9.', 'Redmi Note 12 Pro 5G comes with a 120Hz Pro AMOLED Display with Dolby Atmos & Vision support. This combination along with HDR10+, a 1 billion color display, dual stereo speakers, and hi-res audio (wired & wireless) certification transforms your device into a wholesome multimedia package.', 26999, 21999, 2, 0, 1, 0, 'Redmi Note 12 Pro 5G', 'The phone comes with a 60 Hz refresh rate 6.60-inch touchscreen display offering a resolution of 1080x2400 pixels and an aspect ratio of 20:9.', 'Redmi Note 12 Pro 5G comes with a 120Hz Pro AMOLED Display with Dolby Atmos & Vision support. This combination along with HDR10+, a 1 billion color display, dual stereo speakers, and hi-res audio (wired & wireless) certification transforms your device into a wholesome multimedia package.', '2024-01-11 00:48:36', '2024-01-11 00:48:36'),
(10, 1, 'OPPO A38', 'oppo-a38', 'Oppo', 'In terms of connectivity, the OPPO A38 supports 5G SA/NSA and dual 4G VoLTE for high-speed internet access. It also features Wi-Fi 802.', 'The phone comes with a 90 Hz refresh rate 6.56-inch touchscreen display offering a resolution of 1612x720 pixels (HD+). Oppo A38 is powered by an octa-core MediaTek Helio G85 processor. It comes with 4GB of RAM. The Oppo A38 runs Android Android 13 and is powered by a 5000mAh non-removable battery.', 15999, 11999, 4, 1, 1, 0, 'OPPO A38', 'In terms of connectivity, the OPPO A38 supports 5G SA/NSA and dual 4G VoLTE for high-speed internet access. It also features Wi-Fi 802.', 'The phone comes with a 90 Hz refresh rate 6.56-inch touchscreen display offering a resolution of 1612x720 pixels (HD+). Oppo A38 is powered by an octa-core MediaTek Helio G85 processor. It comes with 4GB of RAM. The Oppo A38 runs Android Android 13 and is powered by a 5000mAh non-removable battery.', '2024-01-11 00:50:53', '2024-01-11 00:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 4, '2024-01-05 05:46:18', '2024-01-07 23:58:49'),
(3, 6, 2, 2, '2024-01-08 00:02:23', '2024-01-08 00:02:23'),
(4, 6, 3, 7, '2024-01-08 00:02:23', '2024-01-08 00:02:23'),
(5, 7, 1, 2, '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(6, 7, 2, 1, '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(7, 7, 3, 2, '2024-01-11 00:37:30', '2024-01-23 01:50:46'),
(8, 8, 5, 2, '2024-01-11 00:41:17', '2024-01-11 00:41:17'),
(9, 9, 2, 1, '2024-01-11 00:48:36', '2024-01-11 00:48:36'),
(10, 9, 5, 1, '2024-01-11 00:48:36', '2024-01-11 00:48:36'),
(11, 10, 2, 1, '2024-01-11 00:50:53', '2024-01-11 04:52:58'),
(12, 10, 3, 0, '2024-01-11 00:50:53', '2024-01-11 00:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 5, 'uploads/products/17043519061.jpg', '2024-01-04 01:35:06', '2024-01-04 01:35:06'),
(11, 6, 'uploads/products/17044533781.jpg', '2024-01-05 05:46:18', '2024-01-05 05:46:18'),
(12, 6, 'uploads/products/17044533782.jpg', '2024-01-05 05:46:18', '2024-01-05 05:46:18'),
(13, 7, 'uploads/products/17049532501.jpg', '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(14, 7, 'uploads/products/17049532502.jpg', '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(15, 7, 'uploads/products/17049532503.jpg', '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(16, 7, 'uploads/products/17049532504.jpg', '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(17, 7, 'uploads/products/17049532505.jpg', '2024-01-11 00:37:30', '2024-01-11 00:37:30'),
(18, 8, 'uploads/products/17049534761.jpg', '2024-01-11 00:41:16', '2024-01-11 00:41:16'),
(19, 8, 'uploads/products/17049534762.jpg', '2024-01-11 00:41:17', '2024-01-11 00:41:17'),
(20, 9, 'uploads/products/17049539161.jpg', '2024-01-11 00:48:36', '2024-01-11 00:48:36'),
(21, 9, 'uploads/products/17049539162.jpg', '2024-01-11 00:48:36', '2024-01-11 00:48:36'),
(22, 10, 'uploads/products/17049540531.jpg', '2024-01-11 00:50:53', '2024-01-11 00:50:53'),
(23, 10, 'uploads/products/17049540532.jpg', '2024-01-11 00:50:53', '2024-01-11 00:50:53'),
(24, 10, 'uploads/products/17049540533.jpg', '2024-01-11 00:50:53', '2024-01-11 00:50:53'),
(25, 10, 'uploads/products/17049540534.jpg', '2024-01-11 00:50:53', '2024-01-11 00:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `website_name`, `website_url`, `title`, `meta_keywords`, `meta_description`, `address`, `phone1`, `phone2`, `email1`, `email2`, `facebook`, `twitter`, `instagram`, `pinterest`, `created_at`, `updated_at`) VALUES
(1, 'Ralecon Ecommerce', 'http://127.0.0.1:8000/', 'Ralecon Ecommerce', 'Ecommerce', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.', 'Scorpio House, 3rd Floor, Building No.3, Marathahalli Bridge, Laxmi Layout, Munnekolala, Marathahalli, Bangalore - 560037', '918123414479', '918123414479', 'info@ralecon.com', 'info@ralecon.com', 'https://www.facebook.com/ralecon', 'https://twitter.com/ralecondotcom', 'https://www.linkedin.com/company/ralecon/mycompany/', 'https://www.pinterest.com/ralecon/', '2024-01-30 01:39:34', '2024-01-30 01:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden,0=visible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '<span>Best Ecommerce Solutions 1 </span> to Boost your Brand Name &amp; Sales', 'We offer an industry-driven and successful digital marketing strategy that helps our clients in achieving a strong online presence and maximum company profit.', 'uploads/slider/1704870028.jpg', 0, '2024-01-09 05:51:48', '2024-01-10 01:38:57'),
(2, '<span>Best Ecommerce Solutions 2 </span> to Boost your Brand Name &amp; Sales', 'We offer an industry-driven and successful digital marketing strategy that helps our clients in achieving a strong online presence and maximum company profit.', 'uploads/slider/1704870036.jpg', 0, '2024-01-09 05:57:35', '2024-01-10 01:38:49'),
(4, '<span>Best Ecommerce Solutions 3 </span> to Boost your Brand Name &amp; Sales', 'We offer an industry-driven and successful digital marketing strategy that helps our clients in achieving a strong online presence and maximum company profit.', 'uploads/slider/1704870074.jpg', 0, '2024-01-10 01:31:14', '2024-01-10 01:38:24');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=user,1=admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_as`) VALUES
(1, 'Sagar Kumar Behera', 'sagarkumar@ralecon.com', NULL, '$2y$10$XoXmGJ7YTQuGGqRaVPTHPe4tr3NTb3Nnu3i.sqCZGYzkfvdRwcf22', 'XS6Ca1J6ZER8nHKQfIM6ukjge0AdY9jDLb54LuOZOsLi0YLoPJeRXoWtdJAe', '2023-12-28 22:37:47', '2024-02-07 00:45:53', 0),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$FSl3vDK6CihKLybs240tduyOXd8nKYe1Ct.LYIw4lHGaxiUDORNdq', '4dPmQweYPWiqZKS0GEG29tJBPUDPr7jpefaZKIP5EcwbGpi7X6H9Dhc95HWQ', '2023-12-28 23:51:15', '2023-12-28 23:51:15', 1),
(3, 'kathiravan  v', 'kathir@ralecon.com', NULL, '$2y$10$bgujh3h2YHP7znKEzwITSuqnFtjHYyiptVWVICTIVFSyVET3E1.HW', NULL, '2024-02-01 05:21:03', '2024-02-01 06:21:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `phone`, `zip_code`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, '9632587418', '751018', 'Bhubaneswar, Orissa', '2024-02-07 00:40:58', '2024-02-07 00:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`),
  ADD KEY `product_colors_color_id_foreign` (`color_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_details_user_id_unique` (`user_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
