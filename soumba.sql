-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 mars 2024 à 15:28
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `soumba`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrondissement` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `department`, `city`, `arrondissement`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Pointe-Noire', NULL, '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(2, NULL, 'Brazzaville', NULL, '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(3, NULL, 'Dolisie', NULL, '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(4, NULL, 'Nkayi', NULL, '2024-01-10 10:55:11', '2024-01-10 10:55:11');

-- --------------------------------------------------------

--
-- Structure de la table `balances`
--

DROP TABLE IF EXISTS `balances`;
CREATE TABLE IF NOT EXISTS `balances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balances_customer_id_foreign` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_valided` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE IF NOT EXISTS `cart_products` (
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `cart_products_cart_id_foreign` (`cart_id`),
  KEY `cart_products_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE IF NOT EXISTS `chats` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id_foreign` (`user_id`),
  KEY `chats_customer_id_foreign` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `profil_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_address_id_foreign` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone`, `address_id`, `profil_picture`, `created_at`, `updated_at`) VALUES
(1, 'Adélaïde', 'Lesage', 'hpichon@lefevre.fr', '08 21 00 55 91', 2, 'https://via.placeholder.com/640x480.png/0000ee?text=tempore', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(2, 'Zoé', 'Alves', 'denis.bertrand@club-internet.fr', '0996909196', 1, 'https://via.placeholder.com/640x480.png/00bb77?text=aut', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(3, 'René', 'Chauveau', 'margaud.gautier@free.fr', '06 04 33 65 93', 4, 'https://via.placeholder.com/640x480.png/003399?text=sed', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(4, 'Émilie', 'Albert', 'auguste.duhamel@live.com', '01 32 46 16 71', 2, 'https://via.placeholder.com/640x480.png/00ff11?text=recusandae', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(5, 'Christelle', 'Renard', 'yauger@laposte.net', '+33 3 08 63 38 98', 3, 'https://via.placeholder.com/640x480.png/0099aa?text=doloremque', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(6, 'Noël', 'Legrand', 'zoe53@lacroix.net', '+33 (0)1 90 60 94 87', 3, 'https://via.placeholder.com/640x480.png/006600?text=rem', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(7, 'Marianne', 'Le Goff', 'christophe.langlois@gregoire.com', '+33 (0)3 73 95 61 63', 3, 'https://via.placeholder.com/640x480.png/005599?text=molestiae', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(8, 'Eugène', 'Mathieu', 'qmahe@leduc.net', '+33 9 30 45 00 17', 4, 'https://via.placeholder.com/640x480.png/0077ee?text=quia', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(9, 'Eugène', 'Gomez', 'pgros@sfr.fr', '+33 9 75 98 21 72', 2, 'https://via.placeholder.com/640x480.png/008833?text=porro', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(10, 'Victoire', 'Royer', 'llevy@sfr.fr', '+33 (0)7 61 33 23 40', 4, 'https://via.placeholder.com/640x480.png/00cc44?text=iure', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(11, 'Nicole', 'Renard', 'hortense.carlier@gmail.com', '+33 (0)7 66 40 51 42', 4, 'https://via.placeholder.com/640x480.png/00ddcc?text=natus', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(12, 'Adrien', 'Pires', 'stephane91@lecomte.com', '+33 (0)5 22 64 49 55', 3, 'https://via.placeholder.com/640x480.png/00aa99?text=ea', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(13, 'Michel', 'Vincent', 'robert23@godard.fr', '05 43 39 69 19', 2, 'https://via.placeholder.com/640x480.png/00ffff?text=voluptas', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(14, 'Suzanne', 'Guichard', 'michel.moreau@renault.net', '07 99 61 73 42', 3, 'https://via.placeholder.com/640x480.png/00cc99?text=est', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(15, 'Paulette', 'Becker', 'vaillant.emilie@lesage.org', '01 00 49 67 48', 1, 'https://via.placeholder.com/640x480.png/00dd66?text=dolorum', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(16, 'Julie', 'Levy', 'brunel.victor@clement.fr', '+33 7 57 93 95 45', 2, 'https://via.placeholder.com/640x480.png/009977?text=commodi', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(17, 'Zacharie', 'Gauthier', 'mendes.diane@laposte.net', '05 37 08 37 12', 2, 'https://via.placeholder.com/640x480.png/004488?text=dicta', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(18, 'Alain', 'Costa', 'gilbert.carlier@laposte.net', '0515708156', 3, 'https://via.placeholder.com/640x480.png/001188?text=impedit', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(19, 'Andrée', 'Dumont', 'david.allain@lecoq.net', '+33 5 25 37 94 46', 1, 'https://via.placeholder.com/640x480.png/002288?text=ab', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(20, 'Henri', 'Samson', 'xavier.petitjean@orange.fr', '+33 (0)3 33 30 82 24', 2, 'https://via.placeholder.com/640x480.png/009944?text=doloremque', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(21, 'Odette', 'Julien', 'therese.lefebvre@tele2.fr', '0235981064', 3, 'https://via.placeholder.com/640x480.png/0055ff?text=fuga', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(22, 'Aimé', 'Thomas', 'zreynaud@albert.net', '+33 (0)7 39 84 90 55', 3, 'https://via.placeholder.com/640x480.png/00ff33?text=incidunt', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(23, 'Alexandrie', 'Pruvost', 'marthe85@gerard.fr', '0940686613', 1, 'https://via.placeholder.com/640x480.png/0044bb?text=accusamus', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(24, 'Alice', 'Bonneau', 'thierry.roger@teixeira.net', '01 90 75 43 21', 3, 'https://via.placeholder.com/640x480.png/006677?text=nisi', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(25, 'Nicole', 'Imbert', 'zoe.schneider@free.fr', '+33 8 01 55 35 09', 2, 'https://via.placeholder.com/640x480.png/002211?text=blanditiis', '2024-01-10 10:55:11', '2024-01-10 10:55:11');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `chat_id` bigint UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(81, '2014_10_12_000000_create_users_table', 1),
(82, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(83, '2019_08_19_000000_create_failed_jobs_table', 1),
(84, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(85, '2024_01_10_021757_create_categories_table', 1),
(86, '2024_01_10_034758_create_products_table', 1),
(87, '2024_01_10_052736_create_addresses_table', 1),
(88, '2024_01_10_060912_create_customers_table', 1),
(89, '2024_01_10_061649_create_chats_table', 1),
(90, '2024_01_10_061714_create_messages_table', 1),
(91, '2024_01_10_062557_create_payments_table', 1),
(92, '2024_01_10_063309_create_carts_table', 1),
(93, '2024_01_10_063709_create_orders_table', 1),
(94, '2024_01_10_071105_create_product_pictures_table', 1),
(95, '2024_01_10_071825_create_balances_table', 1),
(96, '2024_01_10_072609_create_cart_products_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `delivered_at` datetime NOT NULL,
  `payment_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_payment_id_foreign` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_payment_mode_unique` (`payment_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `payment_mode`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Money', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(2, 'Airtel Money', '2024-01-10 10:55:11', '2024-01-10 10:55:11'),
(3, 'Cash', '2024-01-10 10:55:11', '2024-01-10 10:55:11');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `modelNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `nb_stock` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_modelno_unique` (`modelNo`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_pictures`
--

DROP TABLE IF EXISTS `product_pictures`;
CREATE TABLE IF NOT EXISTS `product_pictures` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_pictures_path_unique` (`path`),
  KEY `product_pictures_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aure', 'dul@aure.com', NULL, 'password@', NULL, NULL, NULL),
(2, 'Louange', 'deo@louange.com', NULL, 'password@', NULL, NULL, NULL),
(3, 'Dominique', 'cephas@dominique.com', NULL, 'password@', NULL, NULL, NULL),
(4, 'simar', 'allmighty@simarlord.com', NULL, 'password@', NULL, NULL, NULL),
(5, 'wilson', 'excellent@wilson.com', NULL, 'password@', NULL, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_pictures`
--
ALTER TABLE `product_pictures`
  ADD CONSTRAINT `product_pictures_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
