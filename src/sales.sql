-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sales
CREATE DATABASE IF NOT EXISTS `sales` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sales`;

-- Dumping structure for table sales.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `status` int(20) DEFAULT 1,
  `gender` int(10) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table sales.customer: ~12 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT IGNORE INTO `customer` (`id`, `first_name`, `last_name`, `age`, `email`, `mobile_number`, `date_started`, `status`, `gender`) VALUES
	(2, 'Andrew', 'Sherman', 27, 'andrew@gmail.com', '2829102345', '2000-02-01', 1, 0),
	(4, 'Sam', 'Smithy', 54, 'smihgsh@gmail.com', '947276222', '2004-06-24', 1, 0),
	(5, 'Wendy', 'Wailer', 76, 'wnehy32@yahoo.com', '76643334', '2016-02-05', 1, 1),
	(7, 'Cory', 'Mant', 29, 'coregsy@yahoo.com', '8263833443', '2010-06-14', 0, 0),
	(8, 'Albert', 'Sui', 30, 'al34b@gmail.com', '893237234', '2016-07-25', 1, 0),
	(9, 'Penny', 'Doris', 37, 'penshykj@email.com', '4393032334', NULL, 2, 1),
	(10, 'Robert', 'Cena', 45, 'rob555@robaer.com', '82739222333', '2011-11-24', 1, 0),
	(23, 'Randy', 'Chan', 36, 'ran@yahoo.com', '3829374233', '2014-06-04', 0, 0),
	(24, 'Mary', 'Sue', 43, 'mmmshye@gmail.com', '3222399332', '2011-02-22', 2, 1),
	(25, 'Der', 'Ham', 22, 'hsye@yahoo.com', '3829304233', '2014-11-19', 2, 1),
	(28, 'gobs', 'Cahyo', 14, 'hilalcahyo@gmail.com', '081319051379', NULL, 1, 1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table sales.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sales.hibernate_sequence: ~1 rows (approximately)
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT IGNORE INTO `hibernate_sequence` (`next_val`) VALUES
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table sales.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `madein` varchar(45) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table sales.product: ~2 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`id`, `name`, `brand`, `madein`, `price`) VALUES
	(1, 'server', 'ibm', 'china', 1500);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table sales.role
CREATE TABLE IF NOT EXISTS `role` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table sales.role: ~1 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT IGNORE INTO `role` (`roleid`, `role`) VALUES
	(1, 'SUPERUSER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table sales.users
CREATE TABLE IF NOT EXISTS `users` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table sales.users: ~9 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`userid`, `name`, `password`, `email`) VALUES
	(1, 'Annisa', '123456', 'an@gmail.com'),
	(2, 'Dwi', '123456', 'dwi@gmail.com'),
	(3, 'Helia', '123456', 'helia@gmail.com'),
	(4, 'admin', 'admin', 'admin@gmail.com'),
	(5, 'Fajar', '123456', 'fajar@gmail.com'),
	(6, 'Daniel', '123456', 'daniel@gmail.com'),
	(7, 'Dani', '123456', 'dani@gmail.com'),
	(18, 'adadada', '$2a$10$a2qCHOkYrHwFdYvqq7pQF.m.BAFTH8Zv4ArWZvI71VcthGBvX13Fq', 'adadada@gmail.com'),
	(19, 'Hilal Cahyo', '$2a$10$PGJ0HJYsJk0xIpKmoGoW8eiGuA5zdJMw8qgrGbhfrzaF1nFGUoNpi', 'hilalcahyo@gmail.com'),
	(20, 'nada chairunissa', '$2a$10$PARV.HuQM6Owk6VV7cUwxuTiXgmiABQ6zuIW/igC2wh9icAgVUqo.', 'nadachai1811@gmail.com'),
	(21, '2', '$2a$10$SQeQ91UAGxlOqRLsn4zJbewAKUa1VJW.PDgqiXHDe2bcDMf3CVkUO', '2@gmail.com'),
	(22, '3', '$2a$10$R5J3tHA4OMGgc5JzET/N3OYB1Ftos1IDHw5jcDE/4i7A9qN9takem', '3@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table sales.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table sales.user_role: 4 rows
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT IGNORE INTO `user_role` (`userid`, `roleid`) VALUES
	(1, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
