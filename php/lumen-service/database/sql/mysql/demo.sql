/*
Navicat MariaDB Data Transfer

Source Server         : local mariadb
Source Server Version : 100122
Source Host           : localhost:3307
Source Database       : demo

Target Server Type    : MariaDB
Target Server Version : 100122
File Encoding         : 65001

Date: 2019-04-12 20:12:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bodega
-- ----------------------------
DROP TABLE IF EXISTS `bodega`;
CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bodega`,`id_proveedor`,`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `bodega_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bodega
-- ----------------------------
INSERT INTO `bodega` VALUES ('1', '4', '1', '2');
INSERT INTO `bodega` VALUES ('2', '1', '2', '3');
INSERT INTO `bodega` VALUES ('3', '4', '3', '5');
INSERT INTO `bodega` VALUES ('4', '2', '4', '2');
INSERT INTO `bodega` VALUES ('5', '2', '5', '1');
INSERT INTO `bodega` VALUES ('6', '1', '6', '3');
INSERT INTO `bodega` VALUES ('7', '3', '7', '0');
INSERT INTO `bodega` VALUES ('8', '2', '8', '1');
INSERT INTO `bodega` VALUES ('9', '4', '9', '2');
INSERT INTO `bodega` VALUES ('10', '2', '10', '6');
INSERT INTO `bodega` VALUES ('11', '2', '11', '8');
INSERT INTO `bodega` VALUES ('12', '4', '12', '0');
INSERT INTO `bodega` VALUES ('13', '3', '12', '3');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('4', '2019_03_08_020526_create_users_table', '1');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1', 'nombresit1');
INSERT INTO `producto` VALUES ('2', 'ariel');
INSERT INTO `producto` VALUES ('3', 'fab');
INSERT INTO `producto` VALUES ('4', 'jabon coco');
INSERT INTO `producto` VALUES ('5', 'suavitel');
INSERT INTO `producto` VALUES ('6', 'palmolive');
INSERT INTO `producto` VALUES ('7', 'protex');
INSERT INTO `producto` VALUES ('8', 'rexona');
INSERT INTO `producto` VALUES ('9', 'balance');
INSERT INTO `producto` VALUES ('10', 'dove');
INSERT INTO `producto` VALUES ('11', 'nivea');
INSERT INTO `producto` VALUES ('12', 'jhonson');
INSERT INTO `producto` VALUES ('13', 'jabon liquido');
INSERT INTO `producto` VALUES ('14', 'nombresito2');
INSERT INTO `producto` VALUES ('16', 'nombresito2');
INSERT INTO `producto` VALUES ('17', 'nombresito2');
INSERT INTO `producto` VALUES ('18', 'nombresito3');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES ('1', 'don pepe');
INSERT INTO `proveedor` VALUES ('2', 'exito');
INSERT INTO `proveedor` VALUES ('3', 'carulla');
INSERT INTO `proveedor` VALUES ('4', 'continente');

-- ----------------------------
-- Table structure for tb_demo
-- ----------------------------
DROP TABLE IF EXISTS `tb_demo`;
CREATE TABLE `tb_demo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `COMPANY` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_demo
-- ----------------------------
INSERT INTO `tb_demo` VALUES ('3', 'dato 4.1', 'dato 4.2', 'dato 4.3');
INSERT INTO `tb_demo` VALUES ('4', 'dato 4.1', 'dato 4.2', 'dato 4.3');
INSERT INTO `tb_demo` VALUES ('20', 'Amy Julyssa German', 'Internet #996 Culiacan Sinaloa', 'Nothing');
INSERT INTO `tb_demo` VALUES ('22', 'Amy Julyssa German', 'Internet #996 Culiacan Sinaloa', 'Nothing');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `users_id_users_unique` (`id_users`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'zayro', 'marlon@tipcolombia.com', '$2y$10$hm0IkIoVec8Bbb9nPW4XoeC/2A/xlFF5XCTJX1d.w2Bp/dmNd9jGK', '2019-03-24 01:57:59', '2019-03-24 01:57:59');
INSERT INTO `users` VALUES ('7', 'xbruen', 'stracke.floy@gmail.com', '$2y$10$bijZ7YpysDXr47X.rlaRS..3I9XfjkFEQkAkGF4UVw40hpuNARUjW', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('10', 'zayro', 'zayro8905@gmail.com', '$2y$10$HsdkQ.j86rWA97EOyLriU.5kwlP0fUTeOr73Q8tY4dzf2ZLKCdguO', null, null);
INSERT INTO `users` VALUES ('63', 'uhirthe', 'bartholome.wintheiser@vandervort.com', '$2y$10$OB3RYuzbzCIh01fHqgn6C.DK7nqUhKbJHWW2gxktfoF3heWI7iRrq', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('29680', 'shanon62', 'xparisian@hotmail.com', '$2y$10$fIaQ92cIdXzFcCxglzHX7.NfuT6Ei8xgnCPLzZLEviBZbEIRXn90S', '2019-03-24 01:50:50', '2019-03-24 01:50:50');
INSERT INTO `users` VALUES ('33561', 'verla.reinger', 'lessie.monahan@yahoo.com', '$2y$10$D1IX0adt1QS8T3YfPKvUWeqJxAGJDFv1KgoicHQ24PLv7maXw779y', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('61222', 'satterfield.jalyn', 'langworth.jonas@hotmail.com', '$2y$10$N9yIysYDShm69vZAHmUit.vF27c0OH8Errj.OuCSU3XOGuT/NwX0.', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('87400', 'rhomenick', 'dmitchell@schmitt.com', '$2y$10$fTpu/Sk4TTP8QvwoMlo0oe0FUH2jlRFtkCANMSl4It8bIiEvqJKqG', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('7215715', 'nedra50', 'harber.gwendolyn@white.net', '$2y$10$0ns3OOnbVuX7s2jt2E.1ouU/TEJkpKjNihVLwGFA8T8sUbmyZ5yKa', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('74580478', 'zrohan', 'irma.flatley@vonrueden.net', '$2y$10$.3nZppsG9cz0RCfWSNEh9e7rX/tK.KUKutrGorJbfcR4uvkE8xxUy', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('861461762', 'arlie.bergstrom', 'theo.johns@gmail.com', '$2y$10$lKZ0OGYpyNdQ8rm5M3YbE.tz5MQpfYfhygG3HX3UPACFX7zEdFK9S', '2019-03-24 01:50:51', '2019-03-24 01:50:51');
INSERT INTO `users` VALUES ('954799259', 'verdie.rogahn', 'pdavis@glover.com', '$2y$10$HsdkQ.j86rWA97EOyLriU.5kwlP0fUTeOr73Q8tY4dzf2ZLKCdguO', '2019-03-24 01:50:51', '2019-03-24 01:50:51');

-- ----------------------------
-- Table structure for users_information
-- ----------------------------
DROP TABLE IF EXISTS `users_information`;
CREATE TABLE `users_information` (
  `id_users_information` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_users_information`,`id_users`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `users_information_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_information
-- ----------------------------
INSERT INTO `users_information` VALUES ('1', '10', 'MARLON', 'ARIAS', '301319930');

-- ----------------------------
-- Table structure for users_menu
-- ----------------------------
DROP TABLE IF EXISTS `users_menu`;
CREATE TABLE `users_menu` (
  `id_users_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `order_menu` int(3) NOT NULL,
  PRIMARY KEY (`id_users_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_menu
-- ----------------------------
INSERT INTO `users_menu` VALUES ('1', 'test', 'test', '-100');
INSERT INTO `users_menu` VALUES ('2', 'home', 'home', '1');
INSERT INTO `users_menu` VALUES ('3', 'MENU.audit.title', 'audit', '-1');

-- ----------------------------
-- Table structure for users_privileges
-- ----------------------------
DROP TABLE IF EXISTS `users_privileges`;
CREATE TABLE `users_privileges` (
  `id_users_privileges` int(11) NOT NULL AUTO_INCREMENT,
  `id_users_roles` int(11) NOT NULL,
  `id_users_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_users_privileges`,`id_users_roles`,`id_users_menu`),
  KEY `id_users_roles` (`id_users_roles`),
  KEY `id_users_menu` (`id_users_menu`),
  CONSTRAINT `users_privileges_ibfk_1` FOREIGN KEY (`id_users_menu`) REFERENCES `users_menu` (`id_users_menu`),
  CONSTRAINT `users_privileges_ibfk_2` FOREIGN KEY (`id_users_roles`) REFERENCES `users_roles` (`id_users_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_privileges
-- ----------------------------
INSERT INTO `users_privileges` VALUES ('1', '5', '1');
INSERT INTO `users_privileges` VALUES ('2', '5', '2');
INSERT INTO `users_privileges` VALUES ('3', '5', '3');

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id_users_roles` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_users_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES ('1', 'ADMIN');
INSERT INTO `users_roles` VALUES ('2', 'AUTHOR');
INSERT INTO `users_roles` VALUES ('4', 'CONSULTANT');
INSERT INTO `users_roles` VALUES ('5', 'DEVELOPER');
INSERT INTO `users_roles` VALUES ('16', 'CONSUMER');

-- ----------------------------
-- Table structure for users_validation
-- ----------------------------
DROP TABLE IF EXISTS `users_validation`;
CREATE TABLE `users_validation` (
  `id_users_validation` int(11) NOT NULL,
  `id_users_roles` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_users_validation`,`id_users_roles`,`id_users`),
  KEY `id_users_roles` (`id_users_roles`),
  CONSTRAINT `users_validation_ibfk_1` FOREIGN KEY (`id_users_roles`) REFERENCES `users_roles` (`id_users_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_validation
-- ----------------------------
INSERT INTO `users_validation` VALUES ('1', '5', '10', null, null);

-- ----------------------------
-- View structure for view_information_users
-- ----------------------------
DROP VIEW IF EXISTS `view_information_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `view_information_users` AS SELECT
users.username,
users.email,
users_information.first_name,
users_information.last_name,
users_information.phone
FROM
users
INNER JOIN users_information ON users_information.id_users = users.id_users ;

-- ----------------------------
-- View structure for view_privileges
-- ----------------------------
DROP VIEW IF EXISTS `view_privileges`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_privileges` AS SELECT
	u.id_users AS id,
	u.username AS username,
	u.email AS email,
	ur.`name` AS `name`,
	um.menu AS menu,
	um.link AS link
FROM
	users AS u
JOIN users_validation AS uv ON  uv.id_users = u.id_users
JOIN users_roles AS ur ON ur.id_users_roles = uv.id_users_roles
JOIN users_privileges AS up ON up.id_users_roles = ur.id_users_roles
JOIN users_menu AS um ON um.id_users_menu = up.id_users_menu
ORDER BY
	`um`.`order_menu` ;

-- ----------------------------
-- Procedure structure for GetAllDemo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllDemo`;
DELIMITER ;;
CREATE DEFINER=`marlon`@`%` PROCEDURE `GetAllDemo`()
BEGIN
    SELECT * FROM TB_DEMO;
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GetDemo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetDemo`;
DELIMITER ;;
CREATE DEFINER=`marlon`@`%` PROCEDURE `GetDemo`(IN parametro INT(11))
BEGIN
    SELECT * 
    FROM TB_DEMO
    WHERE id = parametro;
    END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
