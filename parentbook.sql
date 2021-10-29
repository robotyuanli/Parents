/*
SQLyog Community v12.3.0 (64 bit)
MySQL - 10.1.29-MariaDB : Database - parentbook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parentbook` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `parentbook`;

/*Table structure for table `activations` */

DROP TABLE IF EXISTS `activations`;

CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activations` */

insert  into `activations`(`id`,`user_id`,`token`,`ip_address`,`created_at`,`updated_at`) values 
(1,8,'qgHXAb5NPeBWuXwf3K9hFwcSMwpumbpaMSSB46Jx661GaOx2maChvL2vlqP6VfJa','0.0.0.0','2019-07-31 08:51:11','2019-07-31 08:51:11'),
(2,9,'0UNMVwuvLaiMRAFCZZRTh3jwZMKkKZNw55c44mud9GgQ9oY278lFhz9NBX6Rn9rt','0.0.0.0','2019-07-31 08:51:53','2019-07-31 08:51:53');

/*Table structure for table `childs` */

DROP TABLE IF EXISTS `childs`;

CREATE TABLE `childs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int(10) DEFAULT '0',
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int(10) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `childs` */

insert  into `childs`(`id`,`p_id`,`full_name`,`first_name`,`last_name`,`class_id`,`created_at`,`updated_at`) values 
(8,9,'child3','3','child',1,NULL,NULL),
(9,0,'pupil4','4','pupil',3,NULL,NULL),
(10,0,'pupil5','5','pupil',3,NULL,NULL),
(11,11,'child6','6','child',2,NULL,NULL),
(12,12,'child7','7','child',2,NULL,NULL),
(13,13,'child8','8','child',2,NULL,NULL),
(14,14,'child9','9','child',2,NULL,NULL),
(15,15,'chuld9','9','chuld',3,NULL,NULL),
(16,16,'child10','10','child',1,NULL,NULL);

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `classes` */

insert  into `classes`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Class 1','2019-07-30 09:37:44','2019-07-30 09:37:44'),
(2,'Class 2',NULL,NULL),
(3,'class 31',NULL,NULL);

/*Table structure for table `laravel2step` */

DROP TABLE IF EXISTS `laravel2step`;

CREATE TABLE `laravel2step` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int(11) NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT '0',
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laravel2step_userid_index` (`userId`),
  CONSTRAINT `laravel2step_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `laravel2step` */

/*Table structure for table `laravel_logger_activity` */

DROP TABLE IF EXISTS `laravel_logger_activity`;

CREATE TABLE `laravel_logger_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `laravel_logger_activity` */

insert  into `laravel_logger_activity`(`id`,`description`,`userType`,`userId`,`route`,`ipAddress`,`userAgent`,`locale`,`referer`,`methodType`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Failed Login Attempt','Guest',NULL,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-07-30 09:38:20','2019-07-30 09:38:20',NULL),
(2,'Logged In','Registered',1,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-07-30 09:38:36','2019-07-30 09:38:36',NULL),
(3,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-30 09:38:37','2019-07-30 09:38:37',NULL),
(4,'Logged Out','Registered',1,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-07-30 09:38:40','2019-07-30 09:38:40',NULL),
(5,'Logged In','Registered',2,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-07-30 09:39:56','2019-07-30 09:39:56',NULL),
(6,'Viewed home','Registered',2,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-30 09:39:57','2019-07-30 09:39:57',NULL),
(7,'Logged Out','Registered',2,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-07-30 09:40:08','2019-07-30 09:40:08',NULL),
(8,'Logged In','Registered',7,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-07-31 00:43:00','2019-07-31 00:43:00',NULL),
(9,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:43:01','2019-07-31 00:43:01',NULL),
(10,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:44:17','2019-07-31 00:44:17',NULL),
(11,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:44:40','2019-07-31 00:44:40',NULL),
(12,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:45:28','2019-07-31 00:45:28',NULL),
(13,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:45:45','2019-07-31 00:45:45',NULL),
(14,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:46:28','2019-07-31 00:46:28',NULL),
(15,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:47:23','2019-07-31 00:47:23',NULL),
(16,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:47:52','2019-07-31 00:47:52',NULL),
(17,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 00:48:22','2019-07-31 00:48:22',NULL),
(18,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:48:28','2019-07-31 00:48:28',NULL),
(19,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:49:00','2019-07-31 00:49:00',NULL),
(20,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:49:22','2019-07-31 00:49:22',NULL),
(21,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:49:53','2019-07-31 00:49:53',NULL),
(22,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:50:06','2019-07-31 00:50:06',NULL),
(23,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 00:50:19','2019-07-31 00:50:19',NULL),
(24,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 00:51:08','2019-07-31 00:51:08',NULL),
(25,'Viewed profile/testtest','Registered',7,'http://localhost:9100/profile/testtest','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-07-31 00:51:52','2019-07-31 00:51:52',NULL),
(26,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 00:51:56','2019-07-31 00:51:56',NULL),
(27,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 00:52:04','2019-07-31 00:52:04',NULL),
(28,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 01:55:12','2019-07-31 01:55:12',NULL),
(29,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 01:55:37','2019-07-31 01:55:37',NULL),
(30,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 01:56:30','2019-07-31 01:56:30',NULL),
(31,'Viewed profile/testtest/edit','Registered',7,'http://localhost:9100/profile/testtest/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest','GET','2019-07-31 01:58:23','2019-07-31 01:58:23',NULL),
(32,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 01:58:26','2019-07-31 01:58:26',NULL),
(33,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:01:04','2019-07-31 02:01:04',NULL),
(34,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:01:20','2019-07-31 02:01:20',NULL),
(35,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:01:46','2019-07-31 02:01:46',NULL),
(36,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:05:16','2019-07-31 02:05:16',NULL),
(37,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:05:33','2019-07-31 02:05:33',NULL),
(38,'Viewed parentslot','Registered',7,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/profile/testtest/edit','GET','2019-07-31 02:05:52','2019-07-31 02:05:52',NULL),
(39,'Viewed adminlogin','Registered',7,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:15:53','2019-07-31 02:15:53',NULL),
(40,'Viewed home','Registered',7,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:15:53','2019-07-31 02:15:53',NULL),
(41,'Logged Out','Registered',7,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-07-31 02:15:57','2019-07-31 02:15:57',NULL),
(42,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:16:03','2019-07-31 02:16:03',NULL),
(43,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:16:17','2019-07-31 02:16:17',NULL),
(44,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:17:16','2019-07-31 02:17:16',NULL),
(45,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:17:16','2019-07-31 02:17:16',NULL),
(46,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:17:16','2019-07-31 02:17:16',NULL),
(47,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:17:39','2019-07-31 02:17:39',NULL),
(48,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:20:52','2019-07-31 02:20:52',NULL),
(49,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:20:52','2019-07-31 02:20:52',NULL),
(50,'Logged Out','Registered',1,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 02:20:58','2019-07-31 02:20:58',NULL),
(51,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:21:06','2019-07-31 02:21:06',NULL),
(52,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:21:10','2019-07-31 02:21:10',NULL),
(53,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:21:10','2019-07-31 02:21:10',NULL),
(54,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:21:11','2019-07-31 02:21:11',NULL),
(55,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:21:11','2019-07-31 02:21:11',NULL),
(56,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:21:31','2019-07-31 02:21:31',NULL),
(57,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:22:02','2019-07-31 02:22:02',NULL),
(58,'Logged Out','Registered',1,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 02:22:08','2019-07-31 02:22:08',NULL),
(59,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:22:27','2019-07-31 02:22:27',NULL),
(60,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:22:32','2019-07-31 02:22:32',NULL),
(61,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:22:32','2019-07-31 02:22:32',NULL),
(62,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:22:33','2019-07-31 02:22:33',NULL),
(63,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:22:33','2019-07-31 02:22:33',NULL),
(64,'Logged Out','Registered',1,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 02:22:46','2019-07-31 02:22:46',NULL),
(65,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:22:53','2019-07-31 02:22:53',NULL),
(66,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:22:57','2019-07-31 02:22:57',NULL),
(67,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:22:57','2019-07-31 02:22:57',NULL),
(68,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:22:58','2019-07-31 02:22:58',NULL),
(69,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:22:58','2019-07-31 02:22:58',NULL),
(70,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:24:40','2019-07-31 02:24:40',NULL),
(71,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 02:24:43','2019-07-31 02:24:43',NULL),
(72,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 02:24:43','2019-07-31 02:24:43',NULL),
(73,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:24:51','2019-07-31 02:24:51',NULL),
(74,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:26:12','2019-07-31 02:26:12',NULL),
(75,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:26:31','2019-07-31 02:26:31',NULL),
(76,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:27:26','2019-07-31 02:27:26',NULL),
(77,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:27:35','2019-07-31 02:27:35',NULL),
(78,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:28:13','2019-07-31 02:28:13',NULL),
(79,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:28:18','2019-07-31 02:28:18',NULL),
(80,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:28:51','2019-07-31 02:28:51',NULL),
(81,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:29:10','2019-07-31 02:29:10',NULL),
(82,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:29:42','2019-07-31 02:29:42',NULL),
(83,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:30:02','2019-07-31 02:30:02',NULL),
(84,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:31:21','2019-07-31 02:31:21',NULL),
(85,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:32:50','2019-07-31 02:32:50',NULL),
(86,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:33:21','2019-07-31 02:33:21',NULL),
(87,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:34:45','2019-07-31 02:34:45',NULL),
(88,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:34:55','2019-07-31 02:34:55',NULL),
(89,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:35:38','2019-07-31 02:35:38',NULL),
(90,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:36:08','2019-07-31 02:36:08',NULL),
(91,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 02:36:30','2019-07-31 02:36:30',NULL),
(92,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:36:41','2019-07-31 02:36:41',NULL),
(93,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 02:36:41','2019-07-31 02:36:41',NULL),
(94,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:36:41','2019-07-31 02:36:41',NULL),
(95,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:36:42','2019-07-31 02:36:42',NULL),
(96,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:38:03','2019-07-31 02:38:03',NULL),
(97,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:39:02','2019-07-31 02:39:02',NULL),
(98,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:39:33','2019-07-31 02:39:33',NULL),
(99,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:40:00','2019-07-31 02:40:00',NULL),
(100,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:40:30','2019-07-31 02:40:30',NULL),
(101,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:40:46','2019-07-31 02:40:46',NULL),
(102,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:41:39','2019-07-31 02:41:39',NULL),
(103,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:41:46','2019-07-31 02:41:46',NULL),
(104,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:43:00','2019-07-31 02:43:00',NULL),
(105,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:43:08','2019-07-31 02:43:08',NULL),
(106,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:43:18','2019-07-31 02:43:18',NULL),
(107,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:43:39','2019-07-31 02:43:39',NULL),
(108,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:44:56','2019-07-31 02:44:56',NULL),
(109,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:45:29','2019-07-31 02:45:29',NULL),
(110,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:46:04','2019-07-31 02:46:04',NULL),
(111,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:46:29','2019-07-31 02:46:29',NULL),
(112,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:46:47','2019-07-31 02:46:47',NULL),
(113,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:46:59','2019-07-31 02:46:59',NULL),
(114,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:48:19','2019-07-31 02:48:19',NULL),
(115,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:48:39','2019-07-31 02:48:39',NULL),
(116,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:48:49','2019-07-31 02:48:49',NULL),
(117,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:50:24','2019-07-31 02:50:24',NULL),
(118,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:50:46','2019-07-31 02:50:46',NULL),
(119,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:51:25','2019-07-31 02:51:25',NULL),
(120,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:51:50','2019-07-31 02:51:50',NULL),
(121,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:52:13','2019-07-31 02:52:13',NULL),
(122,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:52:48','2019-07-31 02:52:48',NULL),
(123,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:53:05','2019-07-31 02:53:05',NULL),
(124,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:53:21','2019-07-31 02:53:21',NULL),
(125,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:56:12','2019-07-31 02:56:12',NULL),
(126,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:56:53','2019-07-31 02:56:53',NULL),
(127,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:58:19','2019-07-31 02:58:19',NULL),
(128,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 02:58:29','2019-07-31 02:58:29',NULL),
(129,'Logged In','Registered',1,'http://localhost:9100','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:37:31','2019-07-31 05:37:31',NULL),
(130,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:37:32','2019-07-31 05:37:32',NULL),
(131,'Viewed adminlogin','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:37:32','2019-07-31 05:37:32',NULL),
(132,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:37:33','2019-07-31 05:37:33',NULL),
(133,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:37:33','2019-07-31 05:37:33',NULL),
(134,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:41:30','2019-07-31 05:41:30',NULL),
(135,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:41:56','2019-07-31 05:41:56',NULL),
(136,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:42:29','2019-07-31 05:42:29',NULL),
(137,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:43:19','2019-07-31 05:43:19',NULL),
(138,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:44:18','2019-07-31 05:44:18',NULL),
(139,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:47:35','2019-07-31 05:47:35',NULL),
(140,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:50:10','2019-07-31 05:50:10',NULL),
(141,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:50:58','2019-07-31 05:50:58',NULL),
(142,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:54:50','2019-07-31 05:54:50',NULL),
(143,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:55:24','2019-07-31 05:55:24',NULL),
(144,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:55:50','2019-07-31 05:55:50',NULL),
(145,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:56:01','2019-07-31 05:56:01',NULL),
(146,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:56:14','2019-07-31 05:56:14',NULL),
(147,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:56:19','2019-07-31 05:56:19',NULL),
(148,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:56:57','2019-07-31 05:56:57',NULL),
(149,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:57:05','2019-07-31 05:57:05',NULL),
(150,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:57:09','2019-07-31 05:57:09',NULL),
(151,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:58:33','2019-07-31 05:58:33',NULL),
(152,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:59:01','2019-07-31 05:59:01',NULL),
(153,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:59:18','2019-07-31 05:59:18',NULL),
(154,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 05:59:47','2019-07-31 05:59:47',NULL),
(155,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:00:12','2019-07-31 06:00:12',NULL),
(156,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:00:20','2019-07-31 06:00:20',NULL),
(157,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:00:39','2019-07-31 06:00:39',NULL),
(158,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:01:02','2019-07-31 06:01:02',NULL),
(159,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:01:10','2019-07-31 06:01:10',NULL),
(160,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:01:16','2019-07-31 06:01:16',NULL),
(161,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:02:33','2019-07-31 06:02:33',NULL),
(162,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:03:12','2019-07-31 06:03:12',NULL),
(163,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 06:03:14','2019-07-31 06:03:14',NULL),
(164,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','POST','2019-07-31 06:03:14','2019-07-31 06:03:14',NULL),
(165,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:03:19','2019-07-31 06:03:19',NULL),
(166,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 06:03:27','2019-07-31 06:03:27',NULL),
(167,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 06:03:27','2019-07-31 06:03:27',NULL),
(168,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:03:27','2019-07-31 06:03:27',NULL),
(169,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:03:28','2019-07-31 06:03:28',NULL),
(170,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:07:35','2019-07-31 06:07:35',NULL),
(171,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:07:54','2019-07-31 06:07:54',NULL),
(172,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:08:13','2019-07-31 06:08:13',NULL),
(173,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 06:09:18','2019-07-31 06:09:18',NULL),
(174,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:09:33','2019-07-31 06:09:33',NULL),
(175,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:09:36','2019-07-31 06:09:36',NULL),
(176,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:10:01','2019-07-31 06:10:01',NULL),
(177,'Viewed adminlogin','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:10:31','2019-07-31 06:10:31',NULL),
(178,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:10:32','2019-07-31 06:10:32',NULL),
(179,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 06:10:32','2019-07-31 06:10:32',NULL),
(180,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:10:36','2019-07-31 06:10:36',NULL),
(181,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-07-31 06:13:11','2019-07-31 06:13:11',NULL),
(182,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:13:22','2019-07-31 06:13:22',NULL),
(183,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:19:26','2019-07-31 06:19:26',NULL),
(184,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:19:45','2019-07-31 06:19:45',NULL),
(185,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:20:17','2019-07-31 06:20:17',NULL),
(186,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:20:57','2019-07-31 06:20:57',NULL),
(187,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:21:20','2019-07-31 06:21:20',NULL),
(188,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:22:26','2019-07-31 06:22:26',NULL),
(189,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:22:31','2019-07-31 06:22:31',NULL),
(190,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:22:39','2019-07-31 06:22:39',NULL),
(191,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:23:00','2019-07-31 06:23:00',NULL),
(192,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:23:14','2019-07-31 06:23:14',NULL),
(193,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:28:58','2019-07-31 06:28:58',NULL),
(194,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:29:00','2019-07-31 06:29:00',NULL),
(195,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:29:24','2019-07-31 06:29:24',NULL),
(196,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:41:42','2019-07-31 06:41:42',NULL),
(197,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:42:49','2019-07-31 06:42:49',NULL),
(198,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:43:20','2019-07-31 06:43:20',NULL),
(199,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:46:31','2019-07-31 06:46:31',NULL),
(200,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:47:08','2019-07-31 06:47:08',NULL),
(201,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:47:19','2019-07-31 06:47:19',NULL),
(202,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:47:34','2019-07-31 06:47:34',NULL),
(203,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:50:09','2019-07-31 06:50:09',NULL),
(204,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:50:36','2019-07-31 06:50:36',NULL),
(205,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:50:42','2019-07-31 06:50:42',NULL),
(206,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:50:48','2019-07-31 06:50:48',NULL),
(207,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:53:41','2019-07-31 06:53:41',NULL),
(208,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:54:05','2019-07-31 06:54:05',NULL),
(209,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:54:17','2019-07-31 06:54:17',NULL),
(210,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:54:29','2019-07-31 06:54:29',NULL),
(211,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:56:59','2019-07-31 06:56:59',NULL),
(212,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:57:21','2019-07-31 06:57:21',NULL),
(213,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:58:07','2019-07-31 06:58:07',NULL),
(214,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:58:17','2019-07-31 06:58:17',NULL),
(215,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 06:59:38','2019-07-31 06:59:38',NULL),
(216,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 07:00:33','2019-07-31 07:00:33',NULL),
(217,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 07:08:12','2019-07-31 07:08:12',NULL),
(218,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-07-31 07:08:26','2019-07-31 07:08:26',NULL),
(219,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-07-31 07:09:17','2019-07-31 07:09:17',NULL),
(220,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-07-31 07:09:18','2019-07-31 07:09:18',NULL),
(221,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-07-31 07:14:34','2019-07-31 07:14:34',NULL),
(222,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 07:31:12','2019-07-31 07:31:12',NULL),
(223,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 07:34:37','2019-07-31 07:34:37',NULL),
(224,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 07:34:40','2019-07-31 07:34:40',NULL),
(225,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:34:45','2019-07-31 07:34:45',NULL),
(226,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:43:15','2019-07-31 07:43:15',NULL),
(227,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:43:16','2019-07-31 07:43:16',NULL),
(228,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:43:40','2019-07-31 07:43:40',NULL),
(229,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:43:47','2019-07-31 07:43:47',NULL),
(230,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:45:03','2019-07-31 07:45:03',NULL),
(231,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:45:22','2019-07-31 07:45:22',NULL),
(232,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:45:55','2019-07-31 07:45:55',NULL),
(233,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:46:48','2019-07-31 07:46:48',NULL),
(234,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:48:10','2019-07-31 07:48:10',NULL),
(235,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:48:17','2019-07-31 07:48:17',NULL),
(236,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:48:35','2019-07-31 07:48:35',NULL),
(237,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:54:56','2019-07-31 07:54:56',NULL),
(238,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:55:10','2019-07-31 07:55:10',NULL),
(239,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 07:55:18','2019-07-31 07:55:18',NULL),
(240,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:55:21','2019-07-31 07:55:21',NULL),
(241,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:55:23','2019-07-31 07:55:23',NULL),
(242,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:55:25','2019-07-31 07:55:25',NULL),
(243,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:55:30','2019-07-31 07:55:30',NULL),
(244,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:56:30','2019-07-31 07:56:30',NULL),
(245,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:56:36','2019-07-31 07:56:36',NULL),
(246,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:56:55','2019-07-31 07:56:55',NULL),
(247,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:56:59','2019-07-31 07:56:59',NULL),
(248,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:57:28','2019-07-31 07:57:28',NULL),
(249,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:57:35','2019-07-31 07:57:35',NULL),
(250,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:57:54','2019-07-31 07:57:54',NULL),
(251,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:58:17','2019-07-31 07:58:17',NULL),
(252,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:58:27','2019-07-31 07:58:27',NULL),
(253,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:58:56','2019-07-31 07:58:56',NULL),
(254,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:59:14','2019-07-31 07:59:14',NULL),
(255,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 07:59:30','2019-07-31 07:59:30',NULL),
(256,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:01:23','2019-07-31 08:01:23',NULL),
(257,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:03:34','2019-07-31 08:03:34',NULL),
(258,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:03:50','2019-07-31 08:03:50',NULL),
(259,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 08:28:48','2019-07-31 08:28:48',NULL),
(260,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:28:54','2019-07-31 08:28:54',NULL),
(261,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:30:11','2019-07-31 08:30:11',NULL),
(262,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:30:37','2019-07-31 08:30:37',NULL),
(263,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:32:34','2019-07-31 08:32:34',NULL),
(264,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:36:58','2019-07-31 08:36:58',NULL),
(265,'Created editparent','Registered',1,'http://localhost:9100/editparent','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','POST','2019-07-31 08:37:19','2019-07-31 08:37:19',NULL),
(266,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:37:19','2019-07-31 08:37:19',NULL),
(267,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:37:43','2019-07-31 08:37:43',NULL),
(268,'Created editparent','Registered',1,'http://localhost:9100/editparent','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','POST','2019-07-31 08:37:50','2019-07-31 08:37:50',NULL),
(269,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:37:50','2019-07-31 08:37:50',NULL),
(270,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:37:53','2019-07-31 08:37:53',NULL),
(271,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:41:34','2019-07-31 08:41:34',NULL),
(272,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:41:36','2019-07-31 08:41:36',NULL),
(273,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:41:39','2019-07-31 08:41:39',NULL),
(274,'Viewed parent/edit/7','Registered',1,'http://localhost:9100/parent/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:43:16','2019-07-31 08:43:16',NULL),
(275,'Created editparent','Registered',1,'http://localhost:9100/editparent','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','POST','2019-07-31 08:43:18','2019-07-31 08:43:18',NULL),
(276,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:43:18','2019-07-31 08:43:18',NULL),
(277,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:46:14','2019-07-31 08:46:14',NULL),
(278,'Viewed parent/delete/7','Registered',1,'http://localhost:9100/parent/delete/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:46:17','2019-07-31 08:46:17',NULL),
(279,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/7','GET','2019-07-31 08:49:42','2019-07-31 08:49:42',NULL),
(280,'Viewed parent/delete/7','Registered',1,'http://localhost:9100/parent/delete/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:49:45','2019-07-31 08:49:45',NULL),
(281,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','POST','2019-07-31 08:50:40','2019-07-31 08:50:40',NULL),
(282,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','POST','2019-07-31 08:50:40','2019-07-31 08:50:40',NULL),
(283,'Logged In','Registered',9,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-07-31 08:52:33','2019-07-31 08:52:33',NULL),
(284,'Viewed home','Registered',9,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-07-31 08:52:34','2019-07-31 08:52:34',NULL),
(285,'Logged Out','Registered',9,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-07-31 08:52:37','2019-07-31 08:52:37',NULL),
(286,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 08:52:40','2019-07-31 08:52:40',NULL),
(287,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 08:52:47','2019-07-31 08:52:47',NULL),
(288,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-07-31 08:52:47','2019-07-31 08:52:47',NULL),
(289,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 08:52:47','2019-07-31 08:52:47',NULL),
(290,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-07-31 08:52:48','2019-07-31 08:52:48',NULL),
(291,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 08:52:50','2019-07-31 08:52:50',NULL),
(292,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 08:52:51','2019-07-31 08:52:51',NULL),
(293,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 08:53:09','2019-07-31 08:53:09',NULL),
(294,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 08:53:13','2019-07-31 08:53:13',NULL),
(295,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 09:03:48','2019-07-31 09:03:48',NULL),
(296,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:03:58','2019-07-31 09:03:58',NULL),
(297,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:04:38','2019-07-31 09:04:38',NULL),
(298,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:05:27','2019-07-31 09:05:27',NULL),
(299,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:06:11','2019-07-31 09:06:11',NULL),
(300,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:06:13','2019-07-31 09:06:13',NULL),
(301,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:07:17','2019-07-31 09:07:17',NULL),
(302,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:07:28','2019-07-31 09:07:28',NULL),
(303,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:07:43','2019-07-31 09:07:43',NULL),
(304,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:08:37','2019-07-31 09:08:37',NULL),
(305,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:09:01','2019-07-31 09:09:01',NULL),
(306,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:09:37','2019-07-31 09:09:37',NULL),
(307,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:10:28','2019-07-31 09:10:28',NULL),
(308,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:10:39','2019-07-31 09:10:39',NULL),
(309,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:10:52','2019-07-31 09:10:52',NULL),
(310,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:13:15','2019-07-31 09:13:15',NULL),
(311,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:14:52','2019-07-31 09:14:52',NULL),
(312,'Created addteacher','Registered',1,'http://localhost:9100/addteacher','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/add','POST','2019-07-31 09:15:00','2019-07-31 09:15:00',NULL),
(313,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/add','GET','2019-07-31 09:15:00','2019-07-31 09:15:00',NULL),
(314,'Viewed teacher/edit/6','Registered',1,'http://localhost:9100/teacher/edit/6','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:16:40','2019-07-31 09:16:40',NULL),
(315,'Viewed teacher/edit/6','Registered',1,'http://localhost:9100/teacher/edit/6','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:18:26','2019-07-31 09:18:26',NULL),
(316,'Created editteacher','Registered',1,'http://localhost:9100/editteacher','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/edit/6','POST','2019-07-31 09:18:31','2019-07-31 09:18:31',NULL),
(317,'Created editteacher','Registered',1,'http://localhost:9100/editteacher','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/edit/6','POST','2019-07-31 09:18:49','2019-07-31 09:18:49',NULL),
(318,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/edit/6','GET','2019-07-31 09:18:50','2019-07-31 09:18:50',NULL),
(319,'Viewed teacher/edit/6','Registered',1,'http://localhost:9100/teacher/edit/6','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:19:25','2019-07-31 09:19:25',NULL),
(320,'Created editteacher','Registered',1,'http://localhost:9100/editteacher','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/edit/6','POST','2019-07-31 09:19:27','2019-07-31 09:19:27',NULL),
(321,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/edit/6','GET','2019-07-31 09:19:27','2019-07-31 09:19:27',NULL),
(322,'Viewed teacher/delete/6','Registered',1,'http://localhost:9100/teacher/delete/6','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:19:32','2019-07-31 09:19:32',NULL),
(323,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:19:33','2019-07-31 09:19:33',NULL),
(324,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:22:24','2019-07-31 09:22:24',NULL),
(325,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 09:22:26','2019-07-31 09:22:26',NULL),
(326,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:25:48','2019-07-31 09:25:48',NULL),
(327,'Viewed parent/edit/8','Registered',1,'http://localhost:9100/parent/edit/8','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageparents','GET','2019-07-31 09:25:55','2019-07-31 09:25:55',NULL),
(328,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/parent/edit/8','GET','2019-07-31 09:26:05','2019-07-31 09:26:05',NULL),
(329,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 09:26:06','2019-07-31 09:26:06',NULL),
(330,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-07-31 09:26:08','2019-07-31 09:26:08',NULL),
(331,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-07-31 09:26:15','2019-07-31 09:26:15',NULL),
(332,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-07-31 09:26:28','2019-07-31 09:26:28',NULL),
(333,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-07-31 09:26:38','2019-07-31 09:26:38',NULL),
(334,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-07-31 09:26:38','2019-07-31 09:26:38',NULL),
(335,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-07-31 09:27:05','2019-07-31 09:27:05',NULL),
(336,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:11:32','2019-08-01 09:11:32',NULL),
(337,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:11:33','2019-08-01 09:11:33',NULL),
(338,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:13:06','2019-08-01 09:13:06',NULL),
(339,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 09:13:13','2019-08-01 09:13:13',NULL),
(340,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 09:13:14','2019-08-01 09:13:14',NULL),
(341,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 09:13:14','2019-08-01 09:13:14',NULL),
(342,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 09:13:15','2019-08-01 09:13:15',NULL),
(343,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 09:15:32','2019-08-01 09:15:32',NULL),
(344,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:15:34','2019-08-01 09:15:34',NULL),
(345,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:15:41','2019-08-01 09:15:41',NULL),
(346,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:27:28','2019-08-01 09:27:28',NULL),
(347,'Viewed managepupils/0','Registered',1,'http://localhost:9100/managepupils/0','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:27:32','2019-08-01 09:27:32',NULL),
(348,'Viewed managepupils/0','Registered',1,'http://localhost:9100/managepupils/0','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:27:59','2019-08-01 09:27:59',NULL),
(349,'Viewed managepupils/0','Registered',1,'http://localhost:9100/managepupils/0','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:28:22','2019-08-01 09:28:22',NULL),
(350,'Viewed managepupils/0','Registered',1,'http://localhost:9100/managepupils/0','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:28:41','2019-08-01 09:28:41',NULL),
(351,'Viewed managepupils/0','Registered',1,'http://localhost:9100/managepupils/0','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:28:59','2019-08-01 09:28:59',NULL),
(352,'Viewed managepupils/2','Registered',1,'http://localhost:9100/managepupils/2','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/0','GET','2019-08-01 09:29:02','2019-08-01 09:29:02',NULL),
(353,'Viewed managepupils/3','Registered',1,'http://localhost:9100/managepupils/3','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/2','GET','2019-08-01 09:29:04','2019-08-01 09:29:04',NULL),
(354,'Viewed managepupils/1','Registered',1,'http://localhost:9100/managepupils/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/3','GET','2019-08-01 09:29:07','2019-08-01 09:29:07',NULL),
(355,'Viewed managepupils/2','Registered',1,'http://localhost:9100/managepupils/2','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:29:08','2019-08-01 09:29:08',NULL),
(356,'Viewed managepupils/2','Registered',1,'http://localhost:9100/managepupils/2','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:30:50','2019-08-01 09:30:50',NULL),
(357,'Viewed pupil/edit/7','Registered',1,'http://localhost:9100/pupil/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/2','GET','2019-08-01 09:30:52','2019-08-01 09:30:52',NULL),
(358,'Created editpupil','Registered',1,'http://localhost:9100/editpupil','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/edit/7','POST','2019-08-01 09:31:03','2019-08-01 09:31:03',NULL),
(359,'Viewed pupil/edit/7','Registered',1,'http://localhost:9100/pupil/edit/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/2','GET','2019-08-01 09:31:10','2019-08-01 09:31:10',NULL),
(360,'Created editpupil','Registered',1,'http://localhost:9100/editpupil','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/edit/7','POST','2019-08-01 09:31:14','2019-08-01 09:31:14',NULL),
(361,'Created editpupil','Registered',1,'http://localhost:9100/editpupil','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/edit/7','POST','2019-08-01 09:31:41','2019-08-01 09:31:41',NULL),
(362,'Viewed managepupils/1','Registered',1,'http://localhost:9100/managepupils/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/edit/7','GET','2019-08-01 09:31:41','2019-08-01 09:31:41',NULL),
(363,'Viewed pupil/delete/7','Registered',1,'http://localhost:9100/pupil/delete/7','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:31:51','2019-08-01 09:31:51',NULL),
(364,'Viewed managepupils/1','Registered',1,'http://localhost:9100/managepupils/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:31:52','2019-08-01 09:31:52',NULL),
(365,'Viewed managepupils/2','Registered',1,'http://localhost:9100/managepupils/2','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:31:56','2019-08-01 09:31:56',NULL),
(366,'Viewed managepupils/3','Registered',1,'http://localhost:9100/managepupils/3','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/2','GET','2019-08-01 09:31:58','2019-08-01 09:31:58',NULL),
(367,'Viewed managepupils/1','Registered',1,'http://localhost:9100/managepupils/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/3','GET','2019-08-01 09:32:00','2019-08-01 09:32:00',NULL),
(368,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/1','GET','2019-08-01 09:32:03','2019-08-01 09:32:03',NULL),
(369,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 09:32:04','2019-08-01 09:32:04',NULL),
(370,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:32:07','2019-08-01 09:32:07',NULL),
(371,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:32:09','2019-08-01 09:32:09',NULL),
(372,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 09:43:03','2019-08-01 09:43:03',NULL),
(373,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:45:03','2019-08-01 09:45:03',NULL),
(374,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:52:13','2019-08-01 09:52:13',NULL),
(375,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:52:31','2019-08-01 09:52:31',NULL),
(376,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:53:00','2019-08-01 09:53:00',NULL),
(377,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:56:36','2019-08-01 09:56:36',NULL),
(378,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:56:39','2019-08-01 09:56:39',NULL),
(379,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 09:57:48','2019-08-01 09:57:48',NULL),
(380,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 10:01:08','2019-08-01 10:01:08',NULL),
(381,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 10:01:16','2019-08-01 10:01:16',NULL),
(382,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 10:01:33','2019-08-01 10:01:33',NULL),
(383,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:01:35','2019-08-01 10:01:35',NULL),
(384,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:04:17','2019-08-01 10:04:17',NULL),
(385,'Edited users/1','Registered',1,'http://localhost:9100/users/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','PUT','2019-08-01 10:04:22','2019-08-01 10:04:22',NULL),
(386,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:04:23','2019-08-01 10:04:23',NULL),
(387,'Edited users/1','Registered',1,'http://localhost:9100/users/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','PUT','2019-08-01 10:04:28','2019-08-01 10:04:28',NULL),
(388,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:04:29','2019-08-01 10:04:29',NULL),
(389,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:04:57','2019-08-01 10:04:57',NULL),
(390,'Edited users/1','Registered',1,'http://localhost:9100/users/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','PUT','2019-08-01 10:04:58','2019-08-01 10:04:58',NULL),
(391,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:04:59','2019-08-01 10:04:59',NULL),
(392,'Edited users/1','Registered',1,'http://localhost:9100/users/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','PUT','2019-08-01 10:05:00','2019-08-01 10:05:00',NULL),
(393,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:05:01','2019-08-01 10:05:01',NULL),
(394,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:05:04','2019-08-01 10:05:04',NULL),
(395,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:05:06','2019-08-01 10:05:06',NULL),
(396,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:05:11','2019-08-01 10:05:11',NULL),
(397,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:05:24','2019-08-01 10:05:24',NULL),
(398,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:06:22','2019-08-01 10:06:22',NULL),
(399,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:08:46','2019-08-01 10:08:46',NULL),
(400,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:09:17','2019-08-01 10:09:17',NULL),
(401,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:09:35','2019-08-01 10:09:35',NULL),
(402,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:10:14','2019-08-01 10:10:14',NULL),
(403,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:10:48','2019-08-01 10:10:48',NULL),
(404,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:11:07','2019-08-01 10:11:07',NULL),
(405,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:11:14','2019-08-01 10:11:14',NULL),
(406,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:11:19','2019-08-01 10:11:19',NULL),
(407,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:11:22','2019-08-01 10:11:22',NULL),
(408,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:14:23','2019-08-01 10:14:23',NULL),
(409,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:15:05','2019-08-01 10:15:05',NULL),
(410,'Edited users/1','Registered',1,'http://localhost:9100/users/1','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','PUT','2019-08-01 10:15:24','2019-08-01 10:15:24',NULL),
(411,'Viewed users/1/edit','Registered',1,'http://localhost:9100/users/1/edit','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','GET','2019-08-01 10:15:24','2019-08-01 10:15:24',NULL),
(412,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','POST','2019-08-01 10:15:38','2019-08-01 10:15:38',NULL),
(413,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/1/edit','POST','2019-08-01 10:15:38','2019-08-01 10:15:38',NULL),
(414,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 10:15:44','2019-08-01 10:15:44',NULL),
(415,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:15:49','2019-08-01 10:15:49',NULL),
(416,'Failed Login Attempt','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:15:50','2019-08-01 10:15:50',NULL),
(417,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:15:50','2019-08-01 10:15:50',NULL),
(418,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:15:53','2019-08-01 10:15:53',NULL),
(419,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:15:53','2019-08-01 10:15:53',NULL),
(420,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:15:54','2019-08-01 10:15:54',NULL),
(421,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:15:54','2019-08-01 10:15:54',NULL),
(422,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:15:57','2019-08-01 10:15:57',NULL),
(423,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:16:16','2019-08-01 10:16:16',NULL),
(424,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:16:20','2019-08-01 10:16:20',NULL),
(425,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:16:21','2019-08-01 10:16:21',NULL),
(426,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:16:37','2019-08-01 10:16:37',NULL),
(427,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:16:38','2019-08-01 10:16:38',NULL),
(428,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:16:47','2019-08-01 10:16:47',NULL),
(429,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:19:34','2019-08-01 10:19:34',NULL),
(430,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:19:45','2019-08-01 10:19:45',NULL),
(431,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:20:50','2019-08-01 10:20:50',NULL),
(432,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:20:57','2019-08-01 10:20:57',NULL),
(433,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:21:03','2019-08-01 10:21:03',NULL),
(434,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:21:48','2019-08-01 10:21:48',NULL),
(435,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:22:42','2019-08-01 10:22:42',NULL),
(436,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:23:10','2019-08-01 10:23:10',NULL),
(437,'Viewed users/create','Registered',1,'http://localhost:9100/users/create','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:23:30','2019-08-01 10:23:30',NULL),
(438,'Created users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/create','POST','2019-08-01 10:23:59','2019-08-01 10:23:59',NULL),
(439,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users/create','GET','2019-08-01 10:24:00','2019-08-01 10:24:00',NULL),
(440,'Deleted users/10','Registered',1,'http://localhost:9100/users/10','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','DELETE','2019-08-01 10:24:31','2019-08-01 10:24:31',NULL),
(441,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:24:31','2019-08-01 10:24:31',NULL),
(442,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:24:36','2019-08-01 10:24:36',NULL),
(443,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:25:29','2019-08-01 10:25:29',NULL),
(444,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','POST','2019-08-01 10:25:34','2019-08-01 10:25:34',NULL),
(445,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','POST','2019-08-01 10:25:34','2019-08-01 10:25:34',NULL),
(446,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 10:25:38','2019-08-01 10:25:38',NULL),
(447,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:25:46','2019-08-01 10:25:46',NULL),
(448,'Failed Login Attempt','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:25:46','2019-08-01 10:25:46',NULL),
(449,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:25:46','2019-08-01 10:25:46',NULL),
(450,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:25:59','2019-08-01 10:25:59',NULL),
(451,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 10:25:59','2019-08-01 10:25:59',NULL),
(452,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:25:59','2019-08-01 10:25:59',NULL),
(453,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 10:25:59','2019-08-01 10:25:59',NULL),
(454,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:26:56','2019-08-01 10:26:56',NULL),
(455,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:26:57','2019-08-01 10:26:57',NULL),
(456,'Viewed users','Registered',1,'http://localhost:9100/users','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:28:01','2019-08-01 10:28:01',NULL),
(457,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/users','GET','2019-08-01 10:28:07','2019-08-01 10:28:07',NULL),
(458,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:28:11','2019-08-01 10:28:11',NULL),
(459,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:29:02','2019-08-01 10:29:02',NULL),
(460,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:29:06','2019-08-01 10:29:06',NULL),
(461,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:29:08','2019-08-01 10:29:08',NULL),
(462,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-08-01 10:29:10','2019-08-01 10:29:10',NULL),
(463,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:29:38','2019-08-01 10:29:38',NULL),
(464,'Viewed teacher/add','Registered',1,'http://localhost:9100/teacher/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:30:04','2019-08-01 10:30:04',NULL),
(465,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/teacher/add','GET','2019-08-01 10:33:32','2019-08-01 10:33:32',NULL),
(466,'Viewed pupil/add','Registered',1,'http://localhost:9100/pupil/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:33:34','2019-08-01 10:33:34',NULL),
(467,'Created addpupil','Registered',1,'http://localhost:9100/addpupil','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','POST','2019-08-01 10:33:45','2019-08-01 10:33:45',NULL),
(468,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','GET','2019-08-01 10:34:06','2019-08-01 10:34:06',NULL),
(469,'Viewed pupil/add','Registered',1,'http://localhost:9100/pupil/add','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:34:08','2019-08-01 10:34:08',NULL),
(470,'Created addpupil','Registered',1,'http://localhost:9100/addpupil','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','POST','2019-08-01 10:34:18','2019-08-01 10:34:18',NULL),
(471,'Viewed managepupils/3','Registered',1,'http://localhost:9100/managepupils/3','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','GET','2019-08-01 10:34:19','2019-08-01 10:34:19',NULL),
(472,'Viewed managepupils/3','Registered',1,'http://localhost:9100/managepupils/3','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','GET','2019-08-01 10:34:52','2019-08-01 10:34:52',NULL),
(473,'Viewed managepupils/3','Registered',1,'http://localhost:9100/managepupils/3','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/pupil/add','GET','2019-08-01 10:35:02','2019-08-01 10:35:02',NULL),
(474,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managepupils/3','GET','2019-08-01 10:35:07','2019-08-01 10:35:07',NULL),
(475,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:35:14','2019-08-01 10:35:14',NULL),
(476,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:35:16','2019-08-01 10:35:16',NULL),
(477,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:35:18','2019-08-01 10:35:18',NULL),
(478,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-01 10:37:27','2019-08-01 10:37:27',NULL),
(479,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 10:37:28','2019-08-01 10:37:28',NULL),
(480,'Viewed manageparents','Registered',1,'http://localhost:9100/manageparents','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-01 10:37:33','2019-08-01 10:37:33',NULL),
(481,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 22:52:17','2019-08-01 22:52:17',NULL),
(482,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 22:52:17','2019-08-01 22:52:17',NULL),
(483,'Logged In','Registered',14,'http://localhost:9100/register','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','POST','2019-08-01 23:13:29','2019-08-01 23:13:29',NULL),
(484,'Viewed activate','Registered',14,'http://localhost:9100/activate','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','GET','2019-08-01 23:13:30','2019-08-01 23:13:30',NULL),
(485,'Logged Out','Registered',14,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/','POST','2019-08-01 23:14:15','2019-08-01 23:14:15',NULL),
(486,'Logged In','Registered',15,'http://localhost:9100/register','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','POST','2019-08-01 23:14:45','2019-08-01 23:14:45',NULL),
(487,'Viewed activate','Registered',15,'http://localhost:9100/activate','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','GET','2019-08-01 23:14:45','2019-08-01 23:14:45',NULL),
(488,'Viewed home','Registered',15,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 23:16:07','2019-08-01 23:16:07',NULL),
(489,'Viewed home','Registered',15,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 23:16:15','2019-08-01 23:16:15',NULL),
(490,'Logged Out','Registered',15,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-08-01 23:17:01','2019-08-01 23:17:01',NULL),
(491,'Logged In','Registered',16,'http://localhost:9100/register','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','POST','2019-08-01 23:17:21','2019-08-01 23:17:21',NULL),
(492,'Viewed activate','Registered',16,'http://localhost:9100/activate','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','GET','2019-08-01 23:17:21','2019-08-01 23:17:21',NULL),
(493,'Viewed home','Registered',16,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','GET','2019-08-01 23:17:21','2019-08-01 23:17:21',NULL),
(494,'Viewed home','Registered',16,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/register','GET','2019-08-01 23:17:50','2019-08-01 23:17:50',NULL),
(495,'Logged Out','Registered',16,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-08-01 23:17:55','2019-08-01 23:17:55',NULL),
(496,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-01 23:18:00','2019-08-01 23:18:00',NULL),
(497,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 23:18:05','2019-08-01 23:18:05',NULL),
(498,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-01 23:18:05','2019-08-01 23:18:05',NULL),
(499,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 23:18:05','2019-08-01 23:18:05',NULL),
(500,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-01 23:18:06','2019-08-01 23:18:06',NULL),
(501,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-01 23:18:08','2019-08-01 23:18:08',NULL),
(502,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-02 01:32:38','2019-08-02 01:32:38',NULL),
(503,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-02 01:32:42','2019-08-02 01:32:42',NULL),
(504,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-02 01:32:42','2019-08-02 01:32:42',NULL),
(505,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-02 01:32:43','2019-08-02 01:32:43',NULL),
(506,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:32:45','2019-08-02 01:32:45',NULL),
(507,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:43:45','2019-08-02 01:43:45',NULL),
(508,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:43:46','2019-08-02 01:43:46',NULL),
(509,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:44:41','2019-08-02 01:44:41',NULL),
(510,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:44:58','2019-08-02 01:44:58',NULL),
(511,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:45:12','2019-08-02 01:45:12',NULL),
(512,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:45:17','2019-08-02 01:45:17',NULL),
(513,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','GET','2019-08-02 01:45:28','2019-08-02 01:45:28',NULL),
(514,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:45:30','2019-08-02 01:45:30',NULL),
(515,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-08-02 01:45:49','2019-08-02 01:45:49',NULL),
(516,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-02 01:45:50','2019-08-02 01:45:50',NULL),
(517,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-08-02 01:46:38','2019-08-02 01:46:38',NULL),
(518,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-02 01:46:38','2019-08-02 01:46:38',NULL),
(519,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-08-02 01:46:52','2019-08-02 01:46:52',NULL),
(520,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-02 01:46:53','2019-08-02 01:46:53',NULL),
(521,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-02 01:46:54','2019-08-02 01:46:54',NULL),
(522,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-02 01:46:56','2019-08-02 01:46:56',NULL),
(523,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','POST','2019-08-02 01:51:21','2019-08-02 01:51:21',NULL),
(524,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','POST','2019-08-02 01:51:21','2019-08-02 01:51:21',NULL),
(525,'Logged In','Registered',9,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-08-02 01:51:34','2019-08-02 01:51:34',NULL),
(526,'Viewed home','Registered',9,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-08-02 01:51:34','2019-08-02 01:51:34',NULL),
(527,'Logged In','Registered',11,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-08-08 10:10:41','2019-08-08 10:10:41',NULL),
(528,'Viewed home','Registered',11,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-08-08 10:10:42','2019-08-08 10:10:42',NULL),
(529,'Logged Out','Registered',11,'http://localhost:9100/logout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','POST','2019-08-08 10:11:18','2019-08-08 10:11:18',NULL),
(530,'Viewed adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8',NULL,'GET','2019-08-08 10:11:24','2019-08-08 10:11:24',NULL),
(531,'Created adminlogin','Guest',NULL,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-08 10:11:32','2019-08-08 10:11:32',NULL),
(532,'Logged In','Registered',1,'http://localhost:9100/adminlogin','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','POST','2019-08-08 10:11:32','2019-08-08 10:11:32',NULL),
(533,'Viewed home','Registered',1,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-08 10:11:33','2019-08-08 10:11:33',NULL),
(534,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminlogin','GET','2019-08-08 10:11:33','2019-08-08 10:11:33',NULL),
(535,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:11:37','2019-08-08 10:11:37',NULL),
(536,'Created addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','POST','2019-08-08 10:12:10','2019-08-08 10:12:10',NULL),
(537,'Viewed addcalendar','Registered',1,'http://localhost:9100/addcalendar','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-08 10:12:10','2019-08-08 10:12:10',NULL),
(538,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/addcalendar','GET','2019-08-08 10:12:15','2019-08-08 10:12:15',NULL),
(539,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:12:17','2019-08-08 10:12:17',NULL),
(540,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','GET','2019-08-08 10:12:33','2019-08-08 10:12:33',NULL),
(541,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:12:35','2019-08-08 10:12:35',NULL),
(542,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','GET','2019-08-08 10:12:38','2019-08-08 10:12:38',NULL),
(543,'Viewed manageusers','Registered',1,'http://localhost:9100/manageusers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:12:40','2019-08-08 10:12:40',NULL),
(544,'Viewed manageteachers','Registered',1,'http://localhost:9100/manageteachers','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageusers','GET','2019-08-08 10:12:42','2019-08-08 10:12:42',NULL),
(545,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/manageteachers','GET','2019-08-08 10:12:48','2019-08-08 10:12:48',NULL),
(546,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:12:50','2019-08-08 10:12:50',NULL),
(547,'Viewed adminhome','Registered',1,'http://localhost:9100/adminhome','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','GET','2019-08-08 10:13:12','2019-08-08 10:13:12',NULL),
(548,'Viewed managecalendars','Registered',1,'http://localhost:9100/managecalendars','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/adminhome','GET','2019-08-08 10:13:13','2019-08-08 10:13:13',NULL),
(549,'Created adminlogout','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','POST','2019-08-08 10:14:56','2019-08-08 10:14:56',NULL),
(550,'Logged Out','Registered',1,'http://localhost:9100/adminlogout','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/managecalendars','POST','2019-08-08 10:14:57','2019-08-08 10:14:57',NULL),
(551,'Logged In','Registered',9,'http://localhost:9100/login','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','POST','2019-08-08 10:15:05','2019-08-08 10:15:05',NULL),
(552,'Viewed home','Registered',9,'http://localhost:9100/home','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/login','GET','2019-08-08 10:15:05','2019-08-08 10:15:05',NULL),
(553,'Viewed parentslot','Registered',9,'http://localhost:9100/parentslot','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','en-US,en;q=0.9,ar;q=0.8','http://localhost:9100/home','GET','2019-08-08 10:15:17','2019-08-08 10:15:17',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_01_15_105324_create_roles_table',1),
(4,'2016_01_15_114412_create_role_user_table',1),
(5,'2016_01_26_115212_create_permissions_table',1),
(6,'2016_01_26_115523_create_permission_role_table',1),
(7,'2016_02_09_132439_create_permission_user_table',1),
(8,'2017_03_09_082449_create_social_logins_table',1),
(9,'2017_03_09_082526_create_activations_table',1),
(10,'2017_03_20_213554_create_themes_table',1),
(11,'2017_03_21_042918_create_profiles_table',1),
(12,'2017_11_04_103444_create_laravel_logger_activity_table',1),
(13,'2017_12_09_070937_create_two_step_auth_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`id`,`permission_id`,`role_id`,`created_at`,`updated_at`) values 
(1,1,1,'2019-07-30 09:37:44','2019-07-30 09:37:44'),
(2,2,1,'2019-07-30 09:37:44','2019-07-30 09:37:44'),
(3,3,1,'2019-07-30 09:37:44','2019-07-30 09:37:44'),
(4,4,1,'2019-07-30 09:37:44','2019-07-30 09:37:44');

/*Table structure for table `permission_user` */

DROP TABLE IF EXISTS `permission_user`;

CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_user` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`slug`,`description`,`model`,`created_at`,`updated_at`) values 
(1,'Can View Users','view.users','Can view users','Permission','2019-07-30 09:37:43','2019-07-30 09:37:43'),
(2,'Can Create Users','create.users','Can create new users','Permission','2019-07-30 09:37:43','2019-07-30 09:37:43'),
(3,'Can Edit Users','edit.users','Can edit users','Permission','2019-07-30 09:37:44','2019-07-30 09:37:44'),
(4,'Can Delete Users','delete.users','Can delete users','Permission','2019-07-30 09:37:44','2019-07-30 09:37:44');

/*Table structure for table `profiles` */

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `theme_id` int(10) unsigned NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_theme_id_foreign` (`theme_id`),
  KEY `profiles_user_id_index` (`user_id`),
  CONSTRAINT `profiles_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `profiles` */

insert  into `profiles`(`id`,`user_id`,`theme_id`,`location`,`bio`,`twitter_username`,`github_username`,`avatar`,`avatar_status`,`created_at`,`updated_at`) values 
(1,1,1,NULL,NULL,NULL,NULL,NULL,0,'2019-07-30 09:37:49','2019-07-30 09:37:49'),
(2,2,1,NULL,NULL,NULL,NULL,NULL,0,'2019-07-30 09:37:49','2019-07-30 09:37:49');

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_user` */

insert  into `role_user`(`id`,`role_id`,`user_id`,`created_at`,`updated_at`) values 
(2,2,2,'2019-07-30 09:37:49','2019-07-30 09:37:49'),
(8,2,8,'2019-07-31 08:51:10','2019-07-31 08:51:10'),
(9,2,9,'2019-07-31 08:51:53','2019-07-31 08:51:53'),
(14,1,1,'2019-08-01 10:15:24','2019-08-01 10:15:24'),
(15,1,10,'2019-08-01 10:24:00','2019-08-01 10:24:00'),
(16,2,11,'2019-08-01 22:54:05','2019-08-01 22:54:05'),
(17,2,12,'2019-08-01 22:55:11','2019-08-01 22:55:11'),
(18,2,13,'2019-08-01 22:56:09','2019-08-01 22:56:09'),
(19,2,14,'2019-08-01 23:13:29','2019-08-01 23:13:29'),
(20,2,15,'2019-08-01 23:14:45','2019-08-01 23:14:45'),
(21,2,16,'2019-08-01 23:17:21','2019-08-01 23:17:21');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`slug`,`description`,`level`,`created_at`,`updated_at`) values 
(1,'Admin','admin','Admin Role',5,'2019-07-30 09:37:44','2019-07-30 09:37:44'),
(2,'User','user','User Role',1,'2019-07-30 09:37:44','2019-07-30 09:37:44'),
(3,'Unverified','unverified','Unverified Role',0,'2019-07-30 09:37:44','2019-07-30 09:37:44');

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) DEFAULT '0',
  `teacher_id` int(10) NOT NULL DEFAULT '0',
  `workingdate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '00/00/0000',
  `duration` int(10) DEFAULT '0',
  `app_from` int(10) DEFAULT '0',
  `app_to` int(10) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `schedules` */

insert  into `schedules`(`id`,`class_id`,`teacher_id`,`workingdate`,`duration`,`app_from`,`app_to`,`created_at`,`updated_at`) values 
(6,1,5,'07/31/2019',35,5,14,NULL,NULL),
(7,2,5,'08/03/2019',40,12,15,NULL,NULL),
(8,3,5,'08/14/2019',55,15,19,NULL,NULL),
(9,1,5,'08/16/2019',35,13,17,NULL,NULL),
(10,1,5,'08/20/2019',25,5,6,NULL,NULL);

/*Table structure for table `social_logins` */

DROP TABLE IF EXISTS `social_logins`;

CREATE TABLE `social_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_logins_user_id_index` (`user_id`),
  CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `social_logins` */

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int(10) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `teachers` */

insert  into `teachers`(`id`,`full_name`,`first_name`,`last_name`,`class_id`,`created_at`,`updated_at`) values 
(5,'teacher1','1','teacher',1,NULL,NULL);

/*Table structure for table `themes` */

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_name_unique` (`name`),
  UNIQUE KEY `themes_link_unique` (`link`),
  KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `themes_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `themes` */

insert  into `themes`(`id`,`name`,`link`,`notes`,`status`,`taggable_type`,`taggable_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Default','null',NULL,1,'theme',1,'2019-07-30 09:37:44','2019-07-30 09:37:46',NULL),
(2,'Darkly','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/darkly/bootstrap.min.css',NULL,1,'theme',2,'2019-07-30 09:37:44','2019-07-30 09:37:46',NULL),
(3,'Cyborg','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/cyborg/bootstrap.min.css',NULL,1,'theme',3,'2019-07-30 09:37:44','2019-07-30 09:37:46',NULL),
(4,'Cosmo','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/cosmo/bootstrap.min.css',NULL,1,'theme',4,'2019-07-30 09:37:44','2019-07-30 09:37:46',NULL),
(5,'Cerulean','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/cerulean/bootstrap.min.css',NULL,1,'theme',5,'2019-07-30 09:37:45','2019-07-30 09:37:46',NULL),
(6,'Flatly','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/flatly/bootstrap.min.css',NULL,1,'theme',6,'2019-07-30 09:37:45','2019-07-30 09:37:46',NULL),
(7,'Journal','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/journal/bootstrap.min.css',NULL,1,'theme',7,'2019-07-30 09:37:45','2019-07-30 09:37:46',NULL),
(8,'Lumen','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/lumen/bootstrap.min.css',NULL,1,'theme',8,'2019-07-30 09:37:45','2019-07-30 09:37:46',NULL),
(9,'Paper','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/paper/bootstrap.min.css',NULL,1,'theme',9,'2019-07-30 09:37:45','2019-07-30 09:37:46',NULL),
(10,'Readable','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/readable/bootstrap.min.css',NULL,1,'theme',10,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(11,'Sandstone','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/sandstone/bootstrap.min.css',NULL,1,'theme',11,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(12,'Simplex','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/simplex/bootstrap.min.css',NULL,1,'theme',12,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(13,'Slate','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/slate/bootstrap.min.css',NULL,1,'theme',13,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(14,'Spacelab','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/spacelab/bootstrap.min.css',NULL,1,'theme',14,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(15,'Superhero','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/superhero/bootstrap.min.css',NULL,1,'theme',15,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(16,'United','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/united/bootstrap.min.css',NULL,1,'theme',16,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(17,'Yeti','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/yeti/bootstrap.min.css',NULL,1,'theme',17,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(18,'Bootstrap 4.0.0 Alpha','https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css',NULL,1,'theme',18,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(19,'Materialize','https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css',NULL,1,'theme',19,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(20,'Bootstrap Material Design 4.0.0','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.0/bootstrap-material-design.min.css',NULL,1,'theme',20,'2019-07-30 09:37:45','2019-07-30 09:37:47',NULL),
(21,'Bootstrap Material Design 4.0.2','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.min.css',NULL,1,'theme',21,'2019-07-30 09:37:46','2019-07-30 09:37:47',NULL),
(22,'mdbootstrap','https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css',NULL,1,'theme',22,'2019-07-30 09:37:46','2019-07-30 09:37:47',NULL),
(23,'Litera','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/litera/bootstrap.min.css',NULL,1,'theme',23,'2019-07-30 09:37:46','2019-07-30 09:37:47',NULL),
(24,'Lux','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/lux/bootstrap.min.css',NULL,1,'theme',24,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL),
(25,'Materia','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/materia/bootstrap.min.css',NULL,1,'theme',25,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL),
(26,'Minty','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/minty/bootstrap.min.css',NULL,1,'theme',26,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL),
(27,'Pulse','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/pulse/bootstrap.min.css',NULL,1,'theme',27,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL),
(28,'Sketchy','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/sketchy/bootstrap.min.css',NULL,1,'theme',28,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL),
(29,'Solar','https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/solar/bootstrap.min.css',NULL,1,'theme',29,'2019-07-30 09:37:46','2019-07-30 09:37:48',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`first_name`,`last_name`,`email`,`password`,`remember_token`,`activated`,`token`,`signup_ip_address`,`signup_confirmation_ip_address`,`signup_sm_ip_address`,`admin_ip_address`,`updated_ip_address`,`deleted_ip_address`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Administrator',NULL,'Administrator','admin@admin.com','$2y$10$rA2qoMsCxbS9LnaBCBCm5eGQIjU9RNK/f0pM1HHQ/eKR03sWvE9LS','Se2kXVr5CDvWLYLTHAD7HVv5OOJDHg1EYQKCCwgDYHuOWHq0PV2meg0xZ0rh',1,'PwJLspqmAMOiqyaPoRfjmzJt8guazlff8nouoMamDyIKbXXGb3hQiTWPAfzEvqd4',NULL,'214.151.102.113',NULL,'245.193.123.37','0.0.0.0',NULL,'2019-07-30 09:37:49','2019-08-01 10:15:24',NULL),
(2,'eulah.streich','Alexander','Bernier','user@user.com','$2y$10$2XUld9G3ZLOPS.vP3jF1we/E2LKXZi30h03Z6OvH230xLzGbrdzO2','A8pRr2CwQubD7P5eHyUYafNgCwIg3k1WOJzKaZjuEes7YMu8JRqkdQFMtTy3',1,'o0g3gwiSsopeyweb52aevwa0lxkcKdqPB2qQEDct47tNYnF4CtYpGnHYScynVHlP','66.128.22.5','132.193.90.222',NULL,NULL,NULL,NULL,'2019-07-30 09:37:49','2019-07-30 09:37:49',NULL),
(8,'parenttest','test','parent','parent1@gmail.com','$2y$10$qqolpqMJ6o3yWin1Hf3Rtuo/GjvaCp1TgOGcbq20toCLAnyyEcx0e',NULL,1,'nfrR8fujy5YyFGm79OxvowfhR2hecTQ0gM7zGDzpA74b2dVheVK8jfOGfnLKpKQs','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-07-31 08:51:10','2019-07-31 08:51:10',NULL),
(9,'parent2','2','parent','parent2@gmail.com','$2y$10$uVeD9HM.5onp5.zGEelpk.Is8y3dsTMikG/jGGI7uECxkMD8e94fK','pDZhuvu9le9SjUcUw2D2QuqLaNSNAoypnWCxgBcRU6SEnrX4LAgSJ65DClmA',1,'DBeFoHBBPIn3Opgaa5h7L4XfjL9etdfI6CLzV8KBPZ2B5BHYFIxvNiclpfPn10Xh','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-07-31 08:51:53','2019-07-31 08:51:53',NULL),
(10,'admin1','1','admin','admin1@gmail.com','$2y$10$13rZ.TF7LF2ravWvQvOQBeNpsWulNWu0Hy4.Ee/myW.RjYLe8WbAm',NULL,1,'xt0HjbuZbwDOpa4asy2O4VvZ9uPPaEzzQQ5QlKHTSDLtnHfLB8pqCHS26AAA1RO0',NULL,NULL,NULL,'0.0.0.0',NULL,'0.0.0.0','2019-08-01 10:24:00','2019-08-01 10:24:31','2019-08-01 10:24:31'),
(11,'parent4','4','parent','parent4@gmail.com','$2y$10$gjCUh6lDgjGxF1zSOv6kHe6DiVIv64Dgw4bQzVyggnkQtQe6KSESC','Fc3vOwRUSq2tPCinjAdRSLB7PPju4choTxgDwFS76EogZW0sJqJN8DWo61OX',1,'eAlo1Yonkz6uWJTOYFOeXrXXanxSfJMH4zXLtqVBviW8HleD8herDimzgHONNBNF','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 22:54:05','2019-08-01 22:54:05',NULL),
(12,'parent5','5','parent','parent5@gmail.com','$2y$10$G1t5GcV7c4iOTSETGRy4V.lKI50RoKuFZGPnlhu3WsZuAQG16PDQC',NULL,1,'xoAk9IEWQb6lIbvUDXHtGpILm3lC0iaOLIPulNrngpdMtwTybfFbW8zxgFOHfdCf','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 22:55:11','2019-08-01 22:55:11',NULL),
(13,'parent6','6','parent','parent6@gmail.com','$2y$10$WRdTPfP8Mz/cVtN3JSZho.m3hzQjWRMoDQMOBJIivHgR9Jgmjs8wu',NULL,1,'eEWOPnwTSRUhRkvABxCAmGNj8KMz3F8HzyJS2UJxStBQvNUesuczaR7M5qizOCYR','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 22:56:09','2019-08-01 22:56:09',NULL),
(14,'parent7','7','parent','parent7@gmail.com','$2y$10$ceoSTC2tZC6UzLTKcl4EceGKSNMN5edhMfX2EpUjtbtwUDXZaw9vC','NyKecWPNjDDwKd71XpGJ4q7Z93dT5dfmh0J4txtysmYFOY0Yg58ZOpco1ZaA',1,'vqkPS4TslWmV4vlIBYLaSMrOb2riDVl8xuIhXVFGAj7iGepbi4ew9HsF3bHsTatG','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 23:13:29','2019-08-01 23:13:29',NULL),
(15,'parent8','8','parent','parent8@gmail.com','$2y$10$wPxM1BeR4IkEo8ElFAi8k.G3uwGFlc/.3gU.QcOMngpDaco10EMiS','T4ODB7ZedZVGadWHqOEqTxL7A8ayNZtsKcLcvkBxauBJSNO7PwgN4KNqJPTv',1,'UKdElyDwQm5ZyZwJufR9YjESJyB8DzppdcbFQNrH6pygTEu9i7n2ZZLHJoqkgYW5','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 23:14:45','2019-08-01 23:14:45',NULL),
(16,'parent9','9','parent','parent9@gmail.com','$2y$10$GDxS1RbxPFzyUSzgRVi/RehvXR933RtCvpp0NX86NBxmGialdKqPq','Dmi3Bk4TL509XVma49nhyvfg3NWuo9xeGEdyH98U754GF8RCdPjCCLohpEzW',1,'FFcx4rBZQI8W8wQjFN9tKc1Hq3CHxoa27XAgtneBgqjoWSYuCfBf5TIOGftsvZrQ','0.0.0.0',NULL,NULL,NULL,NULL,NULL,'2019-08-01 23:17:21','2019-08-01 23:17:21',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
