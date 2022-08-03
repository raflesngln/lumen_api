/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laravel`;

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latest_article_published` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `authors` */

insert  into `authors`(`id`,`name`,`email`,`github`,`twitter`,`location`,`latest_article_published`,`created_at`,`updated_at`) values (1,'budi ajas','budi@gmail.com','budi@gmail.com','budi@gmail.com','jakarta','2022-10-10','2022-08-02 18:14:17','2022-08-03 05:04:27'),(2,'mawar','budi@gmail.com','budi@gmail.com','budi@gmail.com','jakarta','2022-10-10','2022-08-02 18:17:18','2022-08-02 18:17:18'),(4,'dede','dede@gmail.com','budi@gmail.com','budi@gmail.com','jakarta','2022-10-10','2022-08-02 18:32:54','2022-08-02 18:32:54'),(5,'dede','dede@gmail.com','budi@gmail.com','budi@gmail.com','jakarta','2022-10-10','2022-08-03 05:04:13','2022-08-03 05:04:13');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2022_08_02_095944_create_users_table',1),(2,'2022_08_02_110246_create_authors_table',2);

/*Table structure for table `ms_assesories` */

DROP TABLE IF EXISTS `ms_assesories`;

CREATE TABLE `ms_assesories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` varchar(22) NOT NULL,
  `nm_produk` varchar(70) DEFAULT NULL,
  `barcode` varchar(150) DEFAULT NULL,
  `id_kategori` varchar(15) DEFAULT NULL,
  `id_brand` varchar(25) DEFAULT NULL,
  `id_gudang` varchar(25) DEFAULT NULL,
  `satuan` varchar(90) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL COMMENT 'harga pokok pembelian',
  `harga_jual` double DEFAULT NULL,
  `stok` double DEFAULT '0',
  `stok_gudang` float DEFAULT NULL,
  `stok_gudang2` float DEFAULT NULL,
  `deskripsi` text,
  `gambar` text,
  `url_gambar` text,
  `stok_minimum` float DEFAULT NULL,
  `stok_maksimum` float DEFAULT NULL,
  `komisi1` float DEFAULT NULL,
  `komisi2` float DEFAULT NULL,
  `komisi3` float DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `create_by` year(4) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(15) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unix_id_produk` (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ms_assesories` */

/*Table structure for table `ms_users` */

DROP TABLE IF EXISTS `ms_users`;

CREATE TABLE `ms_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ms_users` */

insert  into `ms_users`(`id`,`username`,`password`,`name`,`address`,`phone`) values (1,'raflesngln','eyJpdiI6IjNwOWV3NkovSlNmWFZ1S0I3aTBya3c9PSIsInZhbHVlIjoiT0djSDhWZnBDVnQvUHptaTAyRHdDdz09IiwibWFjIjoiZmZhZjBkMGQ0OTBiM2NkOGNkYzNlYjU0YjMzMGU1MjI2ZDUzN2MyMzNlNmY5ZjNhMDMyM2MyNGUyODBiOGEwZiIsInRhZyI6IiJ9','rafles nainggolan','jakarta','098654'),(2,'budisantoso','eyJpdiI6IjNwOWV3NkovSlNmWFZ1S0I3aTBya3c9PSIsInZhbHVlIjoiT0djSDhWZnBDVnQvUHptaTAyRHdDdz09IiwibWFjIjoiZmZhZjBkMGQ0OTBiM2NkOGNkYzNlYjU0YjMzMGU1MjI2ZDUzN2MyMzNlNmY5ZjNhMDMyM2MyNGUyODBiOGEwZiIsInRhZyI6IiJ9','budin santoso','bandung','0898765467');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`email`,`phone`,`address`,`created_at`,`updated_at`) values (1,'raflesngln','$2y$10$fFXmuOqyVrEORkC1Qbnb8ujtB0psU4tNwTdxMQriDSc3lq3RLS4US','rafles','raflesngln@gmail.com','845678','jsaksrastdas',NULL,NULL),(2,'mawar','$2y$10$fFXmuOqyVrEORkC1Qbnb8ujtB0psU4tNwTdxMQriDSc3lq3RLS4US','mawar','mawar@gmail.com','999999999','Bandung','2022-08-02 17:42:58','2022-08-03 04:08:47'),(4,'mawarasas','$2y$10$fFXmuOqyVrEORkC1Qbnb8ujtB0psU4tNwTdxMQriDSc3lq3RLS4US','mawarss','budi@gmail.com','09128383838','BANTEN','2022-08-03 02:48:52','2022-08-03 02:48:52'),(5,'ririn','$2y$10$fFXmuOqyVrEORkC1Qbnb8ujtB0psU4tNwTdxMQriDSc3lq3RLS4US','ririn','ririn@gmail.com','123456789','jaskdasjdsagj','2022-08-03 05:10:43','2022-08-03 05:10:43');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
