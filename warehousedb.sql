/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.4.11-MariaDB : Database - warehousedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`warehousedb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `warehousedb`;

/*Table structure for table `catagory` */

DROP TABLE IF EXISTS `catagory`;

CREATE TABLE `catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_by` int(2) DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `catagory` */

insert  into `catagory`(`id`,`name`,`description`,`created_by`,`update_at`,`create_at`) values (8,'Cars','Vehicles',1,NULL,'2025-01-14 17:03:19'),(9,'Watches','Wearing Product',1,NULL,'2025-01-14 21:44:18'),(10,'Motor Cycle','Two Wheeler',1,NULL,'2025-01-14 21:48:53'),(11,'Phones','Andriod',1,NULL,'2025-01-15 10:14:39');

/*Table structure for table `customer_blance` */

DROP TABLE IF EXISTS `customer_blance`;

CREATE TABLE `customer_blance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `due_blance` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `customer_blance` */

insert  into `customer_blance`(`id`,`cus_id`,`due_blance`) values (6,'12',0),(7,'13',10),(8,'14',0),(9,'15',0);

/*Table structure for table `expense` */

DROP TABLE IF EXISTS `expense`;

CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_date` date NOT NULL,
  `expense_for` varchar(50) NOT NULL,
  `amount` float(15,2) NOT NULL DEFAULT 0.00,
  `expense_cat` int(10) NOT NULL,
  `ex_description` text NOT NULL,
  `added_by` int(4) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `expense` */

insert  into `expense`(`id`,`ex_date`,`expense_for`,`amount`,`expense_cat`,`ex_description`,`added_by`,`added_date`) values (3,'2025-01-07','Personal',150.00,4,'i eat',1,'2025-01-14 17:05:15');

/*Table structure for table `expense_catagory` */

DROP TABLE IF EXISTS `expense_catagory`;

CREATE TABLE `expense_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `added_by` int(4) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `expense_catagory` */

insert  into `expense_catagory`(`id`,`name`,`description`,`added_by`,`added_time`) values (4,'Food','burger',1,'2025-01-14 17:04:56'),(5,'Bill','Electricity',1,'2025-01-15 15:51:01');

/*Table structure for table `factory_products` */

DROP TABLE IF EXISTS `factory_products`;

CREATE TABLE `factory_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `catagory_name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL,
  `alert_quantity` int(4) NOT NULL,
  `product_expense` float(15,2) NOT NULL DEFAULT 0.00,
  `sell_price` float(15,2) NOT NULL DEFAULT 0.00,
  `added_by` int(4) NOT NULL,
  `last_update_at` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `factory_products` */

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(100) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `sub_total` float(15,2) NOT NULL DEFAULT 0.00,
  `discount` float(15,2) NOT NULL DEFAULT 0.00,
  `pre_cus_due` float(15,2) NOT NULL DEFAULT 0.00,
  `net_total` float(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` float(15,2) NOT NULL DEFAULT 0.00,
  `due_amount` float(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(20) NOT NULL,
  `return_status` varchar(30) NOT NULL DEFAULT 'no',
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `invoice` */

insert  into `invoice`(`id`,`invoice_number`,`customer_id`,`customer_name`,`order_date`,`sub_total`,`discount`,`pre_cus_due`,`net_total`,`paid_amount`,`due_amount`,`payment_type`,`return_status`,`last_update`) values (52,'S1736919672',12,'Luqman','2025-01-15',2500.00,10.00,0.00,2490.00,2490.00,0.00,'Cash','no',NULL),(53,'S1736919949',15,'Ihsan','2024-12-04',430.00,0.00,0.00,430.00,430.00,0.00,'Cash','no',NULL);

/*Table structure for table `invoice_details` */

DROP TABLE IF EXISTS `invoice_details`;

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `invoice_details` */

insert  into `invoice_details`(`id`,`invoice_no`,`pid`,`product_name`,`price`,`quantity`) values (14,52,12,'Toyata Gli','2500',1),(15,53,14,'Watch 50','430',1);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `con_num` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `total_buy` float(15,2) NOT NULL DEFAULT 0.00,
  `total_paid` float(15,2) NOT NULL DEFAULT 0.00,
  `total_due` float(15,2) NOT NULL DEFAULT 0.00,
  `reg_date` date NOT NULL,
  `update_by` int(8) DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`member_id`,`name`,`company`,`address`,`con_num`,`email`,`total_buy`,`total_paid`,`total_due`,`reg_date`,`update_by`,`update_at`,`create_at`) values (12,'C1736919068','Luqman','Colgate','Kalakale','03228989899','luqman@gmail.com',2500.00,2490.00,0.00,'2025-01-14',1,NULL,'2025-01-15 10:31:08'),(13,'C1736919100','Farhan','Lays','Galoch','03228989865','farhan@gmail.com',0.00,0.00,10.00,'2025-01-14',1,NULL,'2025-01-15 10:31:40'),(14,'C1736919127','Adnan','Yams','Palosaa','03228989899','adnan@gmail.com',0.00,0.00,0.00,'2025-01-06',1,NULL,'2025-01-15 10:32:07'),(15,'C1736919903','Ihsan','Lums','Lalkop','03428989865','ihsan@gmail.com',430.00,430.00,0.00,'2025-01-07',1,NULL,'2025-01-15 10:45:03');

/*Table structure for table `paymethode` */

DROP TABLE IF EXISTS `paymethode`;

CREATE TABLE `paymethode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `paymethode` */

insert  into `paymethode`(`id`,`name`,`added_by`,`added_time`) values (1,'Cash',NULL,'2024-09-11 15:46:23');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `catagory_id` int(10) NOT NULL,
  `catagory_name` varchar(100) DEFAULT NULL,
  `product_source` varchar(20) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `quantity` int(10) DEFAULT 0,
  `alert_quanttity` int(3) DEFAULT NULL,
  `buy_price` varchar(10) DEFAULT NULL,
  `sell_price` varchar(10) DEFAULT NULL,
  `added_by` int(4) DEFAULT NULL,
  `last_update_at` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`product_id`,`brand_name`,`catagory_id`,`catagory_name`,`product_source`,`sku`,`quantity`,`alert_quanttity`,`buy_price`,`sell_price`,`added_by`,`last_update_at`,`added_time`) values (12,'Toyata Gli','P1736919362','Toyota',8,'Cars','factory','3436454',6,2,'2000','2500',1,'2025-01-07','2025-01-15 10:36:02'),(13,'S24','P1736919414','Samsung',11,'Phones','factory','44354355',20,3,'150','200',1,'2025-01-15','2025-01-15 10:36:54'),(14,'Watch 50','P1736919457','Rollex',9,'Watches','factory','1122',8,5,'400','430',1,'2025-01-07','2025-01-15 10:37:37'),(15,'Y10','P1736919546','Oppo',11,'Phones','factory','33322',5,5,'1000','1050',1,'2025-01-15','2025-01-15 10:39:06');

/*Table structure for table `purchase_payment` */

DROP TABLE IF EXISTS `purchase_payment`;

CREATE TABLE `purchase_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliar_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` float(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(20) DEFAULT NULL,
  `pay_description` text NOT NULL,
  `added_by` int(4) DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_payment` */

insert  into `purchase_payment`(`id`,`suppliar_id`,`payment_date`,`payment_amount`,`payment_type`,`pay_description`,`added_by`,`last_update`,`added_time`) values (12,8,'2025-01-07',1600.00,'Cash','',1,NULL,'2025-01-15 10:50:24'),(13,9,'2025-01-04',1500.00,'Cash','',1,NULL,'2025-01-15 11:07:59'),(14,10,'2025-01-07',2300.00,'Cash','',1,NULL,'2025-01-15 12:16:04');

/*Table structure for table `purchase_products` */

DROP TABLE IF EXISTS `purchase_products`;

CREATE TABLE `purchase_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_suppliar` int(11) DEFAULT NULL,
  `suppliar_name` varchar(255) DEFAULT NULL,
  `prev_quantity` int(11) DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  `purchase_price` float(15,2) DEFAULT 0.00,
  `purchase_sell_price` float(15,2) DEFAULT 0.00,
  `purchase_subtotal` float(15,2) DEFAULT 0.00,
  `prev_total_due` float(15,2) DEFAULT 0.00,
  `purchase_net_total` float(15,2) DEFAULT 0.00,
  `purchase_paid_bill` float(15,2) DEFAULT 0.00,
  `purchase_due_bill` float(15,2) DEFAULT 0.00,
  `purchase_pamyent_by` varchar(20) DEFAULT NULL,
  `return_status` varchar(50) NOT NULL DEFAULT 'no',
  `added_by` int(4) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_products` */

insert  into `purchase_products`(`id`,`product_id`,`product_name`,`purchase_date`,`purchase_suppliar`,`suppliar_name`,`prev_quantity`,`purchase_quantity`,`purchase_price`,`purchase_sell_price`,`purchase_subtotal`,`prev_total_due`,`purchase_net_total`,`purchase_paid_bill`,`purchase_due_bill`,`purchase_pamyent_by`,`return_status`,`added_by`,`added_time`) values (9,14,'Watch 50','2025-01-07',8,'Jehanzeb',4,4,400.00,430.00,1600.00,0.00,1600.00,1600.00,0.00,'Cash','no',1,'2025-01-15 10:50:24'),(10,12,'Toyata Gli','2025-01-04',9,'Ahmad Zeb',4,1,2000.00,2500.00,2000.00,0.00,2000.00,1500.00,500.00,'Cash','no',1,'2025-01-15 11:07:59'),(11,12,'Toyata Gli','2025-01-07',10,'Izhar',5,1,2000.00,2500.00,2000.00,300.00,2300.00,2300.00,0.00,'Cash','no',1,'2025-01-15 12:16:04');

/*Table structure for table `purchase_return` */

DROP TABLE IF EXISTS `purchase_return`;

CREATE TABLE `purchase_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_id` int(11) DEFAULT NULL,
  `suppliar_id` int(11) DEFAULT NULL,
  `suppliar_name` varchar(50) NOT NULL,
  `return_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `subtotal` float(15,2) NOT NULL DEFAULT 0.00,
  `discount` float(15,2) NOT NULL DEFAULT 0.00,
  `netTotal` float(15,2) NOT NULL DEFAULT 0.00,
  `create_by` int(4) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_return` */

/*Table structure for table `sell_payment` */

DROP TABLE IF EXISTS `sell_payment`;

CREATE TABLE `sell_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` float(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(20) NOT NULL,
  `pay_description` text NOT NULL,
  `added_by` int(4) NOT NULL,
  `last_update` date DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `sell_payment` */

insert  into `sell_payment`(`id`,`customer_id`,`payment_date`,`payment_amount`,`payment_type`,`pay_description`,`added_by`,`last_update`,`added_time`) values (12,12,'2025-01-15',2490.00,'Cash','',1,NULL,'2025-01-15 10:41:12'),(13,15,'2024-12-04',430.00,'Cash','',1,NULL,'2025-01-15 10:45:49');

/*Table structure for table `sell_return` */

DROP TABLE IF EXISTS `sell_return`;

CREATE TABLE `sell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `amount` float(15,2) NOT NULL DEFAULT 0.00,
  `added_by` int(11) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sell_return` */

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `con_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `added_by` int(4) DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

/*Table structure for table `suppliar` */

DROP TABLE IF EXISTS `suppliar`;

CREATE TABLE `suppliar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliar_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `con_num` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `total_buy` float(15,2) NOT NULL DEFAULT 0.00,
  `total_paid` float(15,2) NOT NULL DEFAULT 0.00,
  `total_due` float(15,2) NOT NULL DEFAULT 0.00,
  `reg_date` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `suppliar` */

insert  into `suppliar`(`id`,`suppliar_id`,`name`,`company`,`address`,`con_num`,`email`,`total_buy`,`total_paid`,`total_due`,`reg_date`,`update_by`,`update_at`,`create_at`) values (7,'S1736919172','Saifullah','Cosmo','Sirsinai','0323545466','saifullah@gmail.com',0.00,0.00,0.00,'2025-01-02',1,NULL,'2025-01-15 10:32:52'),(8,'S1736919208','Jehanzeb','Chims ','Ghwardand','0323545466','jehanzeb@gmial.com',1600.00,1600.00,0.00,'2025-01-09',1,NULL,'2025-01-15 10:33:28'),(9,'S1736919276','Ahmad Zeb','Black Horse','Kabal','03244516616','ahmadzeb@gmial.com',2000.00,1500.00,500.00,'2025-01-01',1,NULL,'2025-01-15 10:34:36'),(10,'S1736921447','Izhar','GFC','Shaderai','03453424343','izhar@gmail.com',2000.00,2300.00,0.00,'2025-01-19',1,NULL,'2025-01-15 11:10:47');

/*Table structure for table `suppliar_balance` */

DROP TABLE IF EXISTS `suppliar_balance`;

CREATE TABLE `suppliar_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supliar_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `due_blance` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `suppliar_balance` */

insert  into `suppliar_balance`(`id`,`supliar_id`,`due_blance`) values (4,'7','0.00'),(5,'8','0.00'),(6,'9','0.00'),(7,'10','300.00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `last_update_at` int(11) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`user_role`,`update_by`,`last_update_at`,`added_date`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin',1,0,'2024-09-17 23:00:00'),(7,'user1','827ccb0eea8a706c4c34a16891f84e7b','allowRight',NULL,NULL,'2025-01-15 12:22:09');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
