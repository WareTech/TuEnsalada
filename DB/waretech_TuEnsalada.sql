-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2012 at 07:58 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `waretech_TuEnsalada`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`id`, `version`, `value`, `description`) VALUES
(1, 0, 'UserEdit.jsp!update', 'UserEdit.jsp!update'),
(2, 0, 'Admin.jsp', 'Admin.jsp'),
(3, 0, 'PurchaseList.jsp', 'PurchaseList.jsp'),
(4, 0, 'PurchaseEdit.jsp', 'PurchaseEdit.jsp'),
(5, 0, 'UserEdit.jsp', 'UserEdit.jsp'),
(6, 0, 'UserList.jsp', 'UserList.jsp'),
(7, 0, 'ProductList.jsp', 'ProductList.jsp'),
(8, 0, 'UserEnableTest.jsp', 'UserEnableTest.jsp'),
(9, 0, 'log.jsp', 'log.jsp'),
(10, 0, 'ParameterList.jsp', 'ParameterList.jsp'),
(11, 0, 'Home.jsp', 'Home.jsp');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `customer` bigint(20) NOT NULL,
  `street` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `floor` varchar(255) default NULL,
  `office` varchar(255) default NULL,
  `comment` varchar(255) default NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Address_customer` (`customer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `version`, `customer`, `street`, `number`, `floor`, `office`, `comment`, `created`) VALUES
(15, 0, 2, 'Calle 528 Bis', '1650', '', '', NULL, '2012-11-21 19:51:30'),
(16, 0, 20, 'Viamonte', '524', '2', 'derecha', NULL, '2012-11-22 10:51:17'),
(17, 0, 21, 'lincoln', '12', '1', '33', NULL, '2012-11-22 13:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `giftcard`
--

CREATE TABLE IF NOT EXISTS `giftcard` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `code` varchar(255) NOT NULL,
  `crc` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `type` int(1) NOT NULL,
  `created` datetime NOT NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_GiftCard_code` (`code`),
  KEY `FK_GiftCard_user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=175 ;

--
-- Dumping data for table `giftcard`
--

INSERT INTO `giftcard` (`id`, `version`, `code`, `crc`, `amount`, `type`, `created`, `user`) VALUES
(75, 0, '629711456628', 'NjI5NzExNDU2NjI4', -100, 1, '2012-11-14 05:41:39', NULL),
(76, 0, '236288115307', 'MjM2Mjg4MTE1MzA3', -100, 1, '2012-11-14 05:41:39', NULL),
(77, 0, '367776705200', 'MzY3Nzc2NzA1MjAw', -100, 1, '2012-11-14 05:41:39', NULL),
(78, 0, '683460750908', 'NjgzNDYwNzUwOTA4', -100, 1, '2012-11-14 05:41:39', NULL),
(79, 0, '509842952245', 'NTA5ODQyOTUyMjQ1', -100, 1, '2012-11-14 05:41:39', NULL),
(80, 0, '672253866271', 'NjcyMjUzODY2Mjcx', -100, 1, '2012-11-14 05:41:39', NULL),
(81, 0, '362112412078', 'MzYyMTEyNDEyMDc4', -100, 1, '2012-11-14 05:41:39', NULL),
(82, 0, '269995054047', 'MjY5OTk1MDU0MDQ3', -100, 1, '2012-11-14 05:41:39', NULL),
(83, 0, '987119874951', 'OTg3MTE5ODc0OTUx', -100, 1, '2012-11-14 05:41:39', NULL),
(84, 0, '190421620855', 'MTkwNDIxNjIwODU1', -100, 1, '2012-11-14 05:41:39', NULL),
(85, 0, '711112670796', 'NzExMTEyNjcwNzk2', -100, 1, '2012-11-14 05:41:39', NULL),
(86, 0, '403995643010', 'NDAzOTk1NjQzMDEw', -100, 1, '2012-11-14 05:41:39', NULL),
(87, 0, '850297493601', 'ODUwMjk3NDkzNjAx', -100, 1, '2012-11-14 05:41:39', NULL),
(88, 0, '405119433159', 'NDA1MTE5NDMzMTU5', -100, 1, '2012-11-14 05:41:39', NULL),
(89, 0, '754698877668', 'NzU0Njk4ODc3NjY4', -100, 1, '2012-11-14 05:41:39', NULL),
(90, 0, '542820101545', 'NTQyODIwMTAxNTQ1', -100, 1, '2012-11-14 05:41:39', NULL),
(91, 0, '129408655294', 'MTI5NDA4NjU1Mjk0', -100, 1, '2012-11-14 05:41:39', NULL),
(92, 0, '021546415716', 'MDIxNTQ2NDE1NzE2', -100, 1, '2012-11-14 05:41:39', NULL),
(93, 0, '510034253882', 'NTEwMDM0MjUzODgy', -100, 1, '2012-11-14 05:41:39', NULL),
(94, 0, '363206754575', 'MzYzMjA2NzU0NTc1', -100, 1, '2012-11-14 05:41:39', NULL),
(95, 0, '250487896065', 'MjUwNDg3ODk2MDY1', -100, 1, '2012-11-14 05:41:39', NULL),
(96, 0, '559517956079', 'NTU5NTE3OTU2MDc5', -100, 1, '2012-11-14 05:41:39', NULL),
(97, 0, '464168266973', 'NDY0MTY4MjY2OTcz', -100, 1, '2012-11-14 05:41:39', NULL),
(98, 0, '202579005997', 'MjAyNTc5MDA1OTk3', -100, 1, '2012-11-14 05:41:39', NULL),
(99, 0, '228720294907', 'MjI4NzIwMjk0OTA3', -100, 1, '2012-11-14 05:41:39', NULL),
(100, 0, '669378222293', 'NjY5Mzc4MjIyMjkz', -100, 1, '2012-11-14 05:41:39', NULL),
(101, 0, '868321641318', 'ODY4MzIxNjQxMzE4', -100, 1, '2012-11-14 05:41:39', NULL),
(102, 0, '732343368459', 'NzMyMzQzMzY4NDU5', -100, 1, '2012-11-14 05:41:39', NULL),
(103, 0, '215121821923', 'MjE1MTIxODIxOTIz', -100, 1, '2012-11-14 05:41:39', NULL),
(104, 0, '943079214441', 'OTQzMDc5MjE0NDQx', -100, 1, '2012-11-14 05:41:39', NULL),
(105, 0, '425980426806', 'NDI1OTgwNDI2ODA2', -100, 1, '2012-11-14 05:41:39', NULL),
(106, 0, '224934448303', 'MjI0OTM0NDQ4MzAz', -100, 1, '2012-11-14 05:41:39', NULL),
(107, 0, '252660509448', 'MjUyNjYwNTA5NDQ4', -100, 1, '2012-11-14 05:41:39', NULL),
(108, 0, '649063219710', 'NjQ5MDYzMjE5NzEw', -100, 1, '2012-11-14 05:41:39', NULL),
(109, 0, '193038466235', 'MTkzMDM4NDY2MjM1', -100, 1, '2012-11-14 05:41:39', NULL),
(110, 0, '325539638064', 'MzI1NTM5NjM4MDY0', -100, 1, '2012-11-14 05:41:39', NULL),
(111, 0, '377055366629', 'Mzc3MDU1MzY2NjI5', -100, 1, '2012-11-14 05:41:39', NULL),
(112, 0, '440489557152', 'NDQwNDg5NTU3MTUy', -100, 1, '2012-11-14 05:41:39', NULL),
(113, 0, '243509580122', 'MjQzNTA5NTgwMTIy', -100, 1, '2012-11-14 05:41:39', NULL),
(114, 0, '161648979423', 'MTYxNjQ4OTc5NDIz', -100, 1, '2012-11-14 05:41:39', NULL),
(115, 0, '681260085152', 'NjgxMjYwMDg1MTUy', -100, 1, '2012-11-14 05:41:39', NULL),
(116, 0, '231073577380', 'MjMxMDczNTc3Mzgw', -100, 1, '2012-11-14 05:41:39', NULL),
(117, 0, '058775440674', 'MDU4Nzc1NDQwNjc0', -100, 1, '2012-11-14 05:41:39', NULL),
(118, 0, '852432780174', 'ODUyNDMyNzgwMTc0', -100, 1, '2012-11-14 05:41:39', NULL),
(119, 0, '380411462128', 'MzgwNDExNDYyMTI4', -100, 1, '2012-11-14 05:41:39', NULL),
(120, 0, '389047789938', 'Mzg5MDQ3Nzg5OTM4', -100, 1, '2012-11-14 05:41:39', NULL),
(121, 0, '173954659449', 'MTczOTU0NjU5NDQ5', -100, 1, '2012-11-14 05:41:39', NULL),
(122, 0, '784793847727', 'Nzg0NzkzODQ3NzI3', -100, 1, '2012-11-14 05:41:39', NULL),
(123, 0, '612859694517', 'NjEyODU5Njk0NTE3', -100, 1, '2012-11-14 05:41:39', NULL),
(124, 0, '416025083555', 'NDE2MDI1MDgzNTU1', -100, 1, '2012-11-14 05:41:39', NULL),
(125, 0, '592667383216', 'NTkyNjY3MzgzMjE2', -100, 1, '2012-11-14 05:41:39', NULL),
(126, 0, '698400883736', 'Njk4NDAwODgzNzM2', -100, 1, '2012-11-14 05:41:39', NULL),
(127, 0, '088101983683', 'MDg4MTAxOTgzNjgz', -100, 1, '2012-11-14 05:41:39', NULL),
(128, 0, '177877234755', 'MTc3ODc3MjM0NzU1', -100, 1, '2012-11-14 05:41:39', NULL),
(129, 0, '095255672344', 'MDk1MjU1NjcyMzQ0', -100, 1, '2012-11-14 05:41:39', NULL),
(130, 0, '638984482462', 'NjM4OTg0NDgyNDYy', -100, 1, '2012-11-14 05:41:39', NULL),
(131, 0, '863758892546', 'ODYzNzU4ODkyNTQ2', -100, 1, '2012-11-14 05:41:39', NULL),
(132, 0, '412668582819', 'NDEyNjY4NTgyODE5', -100, 1, '2012-11-14 05:41:39', NULL),
(133, 0, '715763135178', 'NzE1NzYzMTM1MTc4', -100, 1, '2012-11-14 05:41:39', NULL),
(134, 0, '100937971248', 'MTAwOTM3OTcxMjQ4', -100, 1, '2012-11-14 05:41:39', NULL),
(135, 0, '731082307968', 'NzMxMDgyMzA3OTY4', -100, 1, '2012-11-14 05:41:39', NULL),
(136, 0, '545520963215', 'NTQ1NTIwOTYzMjE1', -100, 1, '2012-11-14 05:41:39', NULL),
(137, 0, '087067858866', 'MDg3MDY3ODU4ODY2', -100, 1, '2012-11-14 05:41:39', NULL),
(138, 0, '286593151404', 'Mjg2NTkzMTUxNDA0', -100, 1, '2012-11-14 05:41:39', NULL),
(139, 0, '217813940444', 'MjE3ODEzOTQwNDQ0', -100, 1, '2012-11-14 05:41:39', NULL),
(140, 0, '662625104688', 'NjYyNjI1MTA0Njg4', -100, 1, '2012-11-14 05:41:39', NULL),
(141, 0, '290778759370', 'MjkwNzc4NzU5Mzcw', -100, 1, '2012-11-14 05:41:39', NULL),
(142, 0, '453790439422', 'NDUzNzkwNDM5NDIy', -100, 1, '2012-11-14 05:41:39', NULL),
(143, 0, '869254261465', 'ODY5MjU0MjYxNDY1', -100, 1, '2012-11-14 05:41:39', NULL),
(144, 0, '598164084782', 'NTk4MTY0MDg0Nzgy', -100, 1, '2012-11-14 05:41:39', NULL),
(145, 0, '066557352804', 'MDY2NTU3MzUyODA0', -100, 1, '2012-11-14 05:41:39', NULL),
(146, 0, '989636962217', 'OTg5NjM2OTYyMjE3', -100, 1, '2012-11-14 05:41:39', NULL),
(147, 0, '140120402834', 'MTQwMTIwNDAyODM0', -100, 1, '2012-11-14 05:41:39', NULL),
(148, 0, '247441893064', 'MjQ3NDQxODkzMDY0', -100, 1, '2012-11-14 05:41:39', NULL),
(149, 0, '751068189595', 'NzUxMDY4MTg5NTk1', -100, 1, '2012-11-14 05:41:39', NULL),
(150, 0, '473420946580', 'NDczNDIwOTQ2NTgw', -100, 1, '2012-11-14 05:41:39', NULL),
(151, 0, '776569938284', 'Nzc2NTY5OTM4Mjg0', -100, 1, '2012-11-14 05:41:39', NULL),
(152, 0, '329257840943', 'MzI5MjU3ODQwOTQz', -100, 1, '2012-11-14 05:41:39', NULL),
(153, 0, '950758601949', 'OTUwNzU4NjAxOTQ5', -100, 1, '2012-11-14 05:41:39', NULL),
(154, 0, '618623635820', 'NjE4NjIzNjM1ODIw', -100, 1, '2012-11-14 05:41:39', NULL),
(155, 0, '864565036939', 'ODY0NTY1MDM2OTM5', -100, 1, '2012-11-14 05:41:39', NULL),
(156, 0, '304827833760', 'MzA0ODI3ODMzNzYw', -100, 1, '2012-11-14 05:41:39', NULL),
(157, 0, '482343419818', 'NDgyMzQzNDE5ODE4', -100, 1, '2012-11-14 05:41:39', NULL),
(158, 0, '247444094924', 'MjQ3NDQ0MDk0OTI0', -100, 1, '2012-11-14 05:41:39', NULL),
(159, 0, '505336494532', 'NTA1MzM2NDk0NTMy', -100, 1, '2012-11-14 05:41:39', NULL),
(160, 0, '225532714262', 'MjI1NTMyNzE0MjYy', -100, 1, '2012-11-14 05:41:39', NULL),
(161, 0, '004586184504', 'MDA0NTg2MTg0NTA0', -100, 1, '2012-11-14 05:41:39', NULL),
(162, 0, '419634426562', 'NDE5NjM0NDI2NTYy', -100, 1, '2012-11-14 05:41:39', NULL),
(163, 0, '145146841551', 'MTQ1MTQ2ODQxNTUx', -100, 1, '2012-11-14 05:41:39', NULL),
(164, 0, '371166942298', 'MzcxMTY2OTQyMjk4', -100, 1, '2012-11-14 05:41:39', NULL),
(165, 0, '956703258210', 'OTU2NzAzMjU4MjEw', -100, 1, '2012-11-14 05:41:39', NULL),
(166, 0, '411400748011', 'NDExNDAwNzQ4MDEx', -100, 1, '2012-11-14 05:41:39', NULL),
(167, 0, '190978497616', 'MTkwOTc4NDk3NjE2', -100, 1, '2012-11-14 05:41:39', NULL),
(168, 0, '332895322424', 'MzMyODk1MzIyNDI0', -100, 1, '2012-11-14 05:41:39', NULL),
(169, 0, '897318467581', 'ODk3MzE4NDY3NTgx', -100, 1, '2012-11-14 05:41:39', NULL),
(170, 0, '559856799609', 'NTU5ODU2Nzk5NjA5', -100, 1, '2012-11-14 05:41:39', NULL),
(171, 0, '166265198731', 'MTY2MjY1MTk4NzMx', -100, 1, '2012-11-14 05:41:39', NULL),
(172, 0, '118336748370', 'MTE4MzM2NzQ4Mzcw', -100, 1, '2012-11-14 05:41:39', NULL),
(173, 0, '715709803198', 'NzE1NzA5ODAzMTk4', -100, 1, '2012-11-14 05:41:39', NULL),
(174, 0, '852011248449', 'ODUyMDExMjQ4NDQ5', -100, 1, '2012-11-14 05:41:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  `date_` datetime NOT NULL,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Log_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log`
--


-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `key_` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id`, `version`, `key_`, `value`) VALUES
(10, 0, 'E_Comercio', '1012746'),
(205, 0, 'mailto', 'info@tuensalada.com.ar'),
(206, 0, 'telefono', '(+54) 11-4328-4275'),
(207, 0, 'direccion', 'calle Maipu #429'),
(208, 0, 'ciudad', 'Buenos Aires'),
(209, 0, 'lo ultimo en facebook', 'Esta semana, comprando dos &oacute; m&aacute;s ensaladas te llev&aacute;s de regalo una coca o sprite de litro y medio. Qu&eacute; est&aacute;s esperando?'),
(210, 0, 'lo ultimo en twitter', 'Esta semana, comprando dos &oacute; m&aacute;s ensaladas te llev&aacute;s de regalo una coca o sprite de litro y medio. Qu&eacute; est&aacute;s esperando?'),
(211, 2, 'lo ultimo en twitter (tiempo)', 'Hace 5hs.'),
(213, 0, 'lo ultimo en facebook (tiempo)', 'Hace 2hs.'),
(216, 1, 'Hora de Entrega', '12.00, 12.15, 12.30, 12.45, 13.00, 13.15, 13.30, 13.45, 14.00, 14.15, 14.30, 14.45'),
(217, 0, 'DineroMail_URL', 'https://argentina.dineromail.com/Shop/Shop_Ingreso.asp'),
(218, 5, 'DineroMail_NombreItem', 'Compra #{0}'),
(219, 0, 'DineroMail_TipoMoneda', '1'),
(220, 1, 'DineroMail_E_Comercio_Augusto', '1012746'),
(221, 0, 'DineroMail_NroItem', 'CVD22'),
(222, 1, 'DineroMail_image_url', 'http://www.tuensalada.com.ar/s/img/tE-logo.png'),
(223, 0, 'DineroMail_DireccionEnvio', '0'),
(224, 1, 'DineroMail_DireccionExito', 'http://www.tuensalada.com.ar/s/PaymentSuccess.jsp'),
(225, 1, 'DineroMail_DireccionFracaso', 'http://www.tuensalada.com.ar/s/PaymentFail.jsp'),
(226, 0, 'DineroMail_Mensaje', 'Mensaje de Prueba'),
(227, 0, 'Purchase_mail_subject', 'TuEnsalada compra #{0}'),
(228, 1, 'Purchase_mail_body', 'Felicitaciones! Para revisar su pedido, acceda a http://www.tuensalada.com.ar/s/PurchaseView.jsp?{0}'),
(229, 0, 'PurchaseDineroMail_enabled', 'true'),
(230, 2, 'PurchaseChash_enabled', 'true'),
(231, 0, 'DineroMail_E_Comercio_Omar', '1535494'),
(232, 0, 'DineroMail_E_Comercio', '1535494'),
(233, 0, 'PURCHASE_STATUS_DEFAULT', '3,4'),
(234, 4, 'LoadBalancer', '/s1,/s2,/s3'),
(235, 0, 'MAIL_SUBJECT_FORGOT_PASSWORD', 'TuEnsalada - Nueva Clave'),
(236, 1, 'MAIL_TEXT_FORGOT_PASSWORD', 'EMail: {0}\\n Clave: {1}\\n \\n http://www.tuensalada.com.ar'),
(237, 0, 'MAIL_SUBJECT_USER_ACTIVATE', 'Tu Ensalada - Bienvenido!'),
(238, 0, 'MAIL_TEXT_USER_ACTIVATE', 'Tu usuario de Tu Ensalada ha sido creado! Para activarlo, por favor acceda a <http://www.tuensalada.com.ar/s/UserEnable.jsp?{0}> dentro de las proximas 24hs'),
(239, 0, 'USER_REGISTRATION_VALIDATION_FAIL', 'Validaci&oacute;n incorrecta'),
(240, 0, 'USER_REGISTRATION_VALIDATION_OUTDATED', 'El tiempo de validaci&oacute;n ha expirado'),
(241, 0, 'USER_REGISTRATION_VALIDATION_OK', 'Bienvenido!'),
(242, 0, 'USER_REGISTRATION_VALIDATION_ERROR', 'Error al intentar validar el usuario'),
(243, 0, 'USER_STATUS_0', 'Aprobado'),
(244, 0, 'USER_STATUS_1', 'Borrador'),
(245, 0, 'USER_STATUS_2', 'Pendiente'),
(246, 0, 'USER_STATUS_3', 'Rechazado'),
(247, 0, 'USER_STATUS_4', 'Eliminado'),
(248, 3, 'HOME_QUIERO', '103'),
(249, 1, 'PurchaseDineroMail_min', '25'),
(250, 0, 'PurchaseCash_max', '200'),
(251, 0, 'DineroMail_button_image', 'https://argentina.dineromail.com/imagenes/vender/boton/comprar-gris.gif');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `price` double NOT NULL,
  `calories` double default NULL,
  `status` int(1) NOT NULL,
  `type` int(1) NOT NULL,
  `created` datetime NOT NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Product_user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `version`, `name`, `description`, `price`, `calories`, `status`, `type`, `created`, `user`) VALUES
(1, 4, 'Coca Cola Zero', '', 6.5, 0, 0, 6, '2012-11-12 22:20:00', NULL),
(2, 0, 'Coca Cola Light', '', 6.5, 0, 0, 6, '2012-11-12 22:21:29', NULL),
(3, 1, 'Coca Cola', '', 6.5, 80, 0, 6, '2012-11-12 22:25:35', NULL),
(4, 1, 'Sprite Zero', '', 6.5, 0, 0, 6, '2012-11-12 22:26:06', NULL),
(5, 0, 'Sprite', '', 6.5, 80, 0, 6, '2012-11-12 22:33:51', NULL),
(6, 0, 'Fanta', '', 6.5, 80, 0, 6, '2012-11-12 22:34:13', NULL),
(7, 0, 'Fanta Pomelo', '', 6.5, 80, 0, 6, '2012-11-12 22:34:39', NULL),
(8, 0, 'Ser Citrus', '', 6, 0, 0, 6, '2012-11-12 22:35:05', NULL),
(9, 0, 'Ser Durazno', '', 6, 0, 0, 6, '2012-11-12 22:35:40', NULL),
(10, 0, 'Levite Manzana', '', 6, 45, 0, 6, '2012-11-12 22:35:56', NULL),
(11, 0, 'Levite Pomelo', '', 6, 45, 0, 6, '2012-11-12 22:36:12', NULL),
(12, 0, 'Levite Naranja', '', 6, 45, 0, 6, '2012-11-12 22:39:25', NULL),
(13, 1, 'Ser Lima', '', 6, 0, 0, 6, '2012-11-12 22:39:39', NULL),
(14, 2, 'Pollo', '', 7.5, 170, 0, 3, '2012-11-12 22:41:04', NULL),
(15, 1, 'Atun Rojo', '', 15, 127, 0, 3, '2012-11-12 22:41:46', NULL),
(16, 1, 'Carne Vacuna (tiras)', '', 6, 158, 2, 3, '2012-11-12 22:42:45', NULL),
(17, 0, 'Huevo', '', 3, 100, 0, 3, '2012-11-12 22:43:18', NULL),
(18, 0, 'Queso Romano', '', 8, 390, 0, 3, '2012-11-12 22:44:12', NULL),
(19, 0, 'Queso Azul', '', 8, 376, 0, 3, '2012-11-12 22:44:36', NULL),
(20, 0, 'Queso Fresco', '', 8, 250, 0, 3, '2012-11-12 22:45:03', NULL),
(21, 1, 'Jamón Cocido', '', 4, 126, 0, 3, '2012-11-12 22:45:40', NULL),
(22, 0, 'Atun (Lomos)', '', 8, 288, 0, 3, '2012-11-12 22:46:16', NULL),
(23, 0, 'Caballa', '', 6, 165, 0, 3, '2012-11-12 22:46:45', NULL),
(24, 0, 'Sardina', '', 6, 238, 0, 3, '2012-11-12 22:47:09', NULL),
(25, 1, 'Salmón', '', 15, 99, 0, 3, '2012-11-12 22:47:45', NULL),
(26, 0, 'Kanicama', '', 11, 80, 0, 3, '2012-11-12 22:48:02', NULL),
(27, 0, 'Mejjillones', '', 8, 95, 0, 3, '2012-11-12 22:48:19', NULL),
(28, 0, 'Camarones', '', 9, 45, 0, 3, '2012-11-12 22:48:36', NULL),
(32, 0, 'Tomate Cherry', '', 5, 22, 0, 4, '2012-11-13 17:29:52', NULL),
(33, 0, 'Rucula', '', 8, 37, 0, 4, '2012-11-13 17:30:14', NULL),
(34, 0, 'Cebolla Verdeo', '', 4, 38, 0, 4, '2012-11-13 17:30:40', NULL),
(35, 0, 'Cebolla', '', 3, 38, 0, 4, '2012-11-13 17:33:49', NULL),
(36, 0, 'Espinaca', '', 7, 26, 0, 4, '2012-11-13 17:34:14', NULL),
(37, 0, 'Morrones Verdes', '', 7, 24, 0, 4, '2012-11-13 17:34:35', NULL),
(38, 0, 'Morrones Rojos', '', 8, 24, 0, 4, '2012-11-13 17:35:31', NULL),
(39, 1, 'Achicoria', '', 5, 20, 2, 4, '2012-11-13 17:35:51', NULL),
(40, 0, 'Repollo Blanco', '', 4, 24, 0, 4, '2012-11-13 17:36:53', NULL),
(41, 0, 'Repollo Colorado', '', 4, 31, 0, 4, '2012-11-13 17:37:12', NULL),
(42, 0, 'Apio', '', 5, 21, 0, 4, '2012-11-13 17:40:17', NULL),
(43, 0, 'Zanahoria', '', 2, 42, 0, 4, '2012-11-13 17:45:56', NULL),
(44, 0, 'Radicheta', '', 8, 16, 0, 4, '2012-11-13 17:46:23', NULL),
(45, 0, 'Albahaca', '', 3, 27, 0, 4, '2012-11-13 17:49:52', NULL),
(46, 0, 'Esparragos', '', 4, 26, 0, 4, '2012-11-13 19:05:50', NULL),
(47, 0, 'Pepino', '', 4, 15, 0, 4, '2012-11-13 19:06:23', NULL),
(48, 0, 'Palta', '', 6, 162, 0, 4, '2012-11-13 19:06:49', NULL),
(49, 1, 'Repollitos de Bruselas', '', 5, 45, 2, 4, '2012-11-13 19:07:27', NULL),
(50, 1, 'Chaucha', '', 5, 32, 2, 4, '2012-11-13 20:03:07', NULL),
(51, 0, 'Brocoli', '', 5, 32, 0, 4, '2012-11-13 20:03:59', NULL),
(52, 1, 'Zucchini', '', 5, 32, 2, 4, '2012-11-13 20:04:30', NULL),
(53, 0, 'Remolacha', '', 3, 44, 0, 4, '2012-11-13 20:05:00', NULL),
(54, 0, 'Rabanito', '', 7, 16, 0, 4, '2012-11-13 20:05:23', NULL),
(55, 0, 'Manzana', '', 4, 58, 0, 4, '2012-11-13 20:06:00', NULL),
(56, 0, 'Naranja', '', 2, 42, 0, 4, '2012-11-13 20:06:29', NULL),
(57, 0, 'Hinojo', '', 3, 28, 0, 4, '2012-11-13 20:06:54', NULL),
(58, 0, 'Lino', '', 0, 0, 0, 10, '2012-11-13 20:07:31', NULL),
(59, 0, 'Amapola', '', 0, 0, 0, 10, '2012-11-13 20:08:33', NULL),
(60, 0, 'Sesamo', '', 0, 0, 0, 10, '2012-11-13 20:08:52', NULL),
(61, 0, 'Girasol', '', 0, 0, 0, 10, '2012-11-13 20:09:18', NULL),
(62, 0, 'Chia', '', 0, 0, 0, 10, '2012-11-13 20:09:52', NULL),
(63, 0, 'Quinoa', '', 0, 0, 0, 10, '2012-11-13 20:10:49', NULL),
(64, 1, 'Germen de Trigo', '', 0, 0, 0, 10, '2012-11-13 20:11:10', NULL),
(65, 0, 'Avena', '', 0, 0, 0, 10, '2012-11-13 20:12:02', NULL),
(66, 0, 'Nueces', '', 0, 0, 0, 10, '2012-11-13 20:12:20', NULL),
(67, 0, 'Almendras', '', 0, 0, 0, 10, '2012-11-13 20:13:01', NULL),
(68, 0, 'All Green', 'Rucula, espinaca, olivas verdes y albahaca.', 26, 310, 0, 2, '2012-11-15 16:22:43', NULL),
(69, 0, 'Aderezo Cesar', '', 0, 40, 0, 7, '2012-11-15 16:43:29', NULL),
(70, 0, 'Vinagreta Ensalada', '', 0, 40, 0, 7, '2012-11-15 16:43:57', NULL),
(71, 1, 'Aceite de Maíz', '', 0, 15, 0, 7, '2012-11-15 16:44:20', NULL),
(72, 0, 'Vinagre de alcohol', '', 0, 0, 0, 7, '2012-11-15 16:44:39', NULL),
(73, 0, 'Vinagre de Manzana', '', 0, 0, 0, 7, '2012-11-15 16:44:59', NULL),
(74, 0, 'Sal', '', 0, 0, 0, 7, '2012-11-15 16:45:35', NULL),
(75, 0, 'Pimienta', '', 0, 0, 0, 7, '2012-11-15 16:45:53', NULL),
(76, 0, 'Aceto', '', 0, 0, 0, 7, '2012-11-15 16:46:10', NULL),
(77, 0, 'Aceite de Oliva', '', 0, 50, 0, 7, '2012-11-15 16:46:31', NULL),
(78, 0, 'Salsa de Soja', '', 0, 0, 0, 7, '2012-11-15 16:51:19', NULL),
(79, 0, 'Jugo de Limon', '', 0, 0, 0, 7, '2012-11-15 16:51:48', NULL),
(80, 0, 'Mayonesa', '', 0, 25, 0, 7, '2012-11-15 16:52:24', NULL),
(81, 0, 'Mostaza', '', 0, 0, 0, 7, '2012-11-15 16:52:43', NULL),
(82, 0, 'Ketchup', '', 0, 0, 0, 7, '2012-11-15 16:53:02', NULL),
(83, 0, 'Salsa Golf', '', 0, 15, 0, 7, '2012-11-15 16:53:25', NULL),
(84, 0, 'Grisines', '', 0, 25, 0, 7, '2012-11-15 16:54:00', NULL),
(85, 0, 'Tostadas', '', 0, 15, 0, 7, '2012-11-15 16:54:24', NULL),
(86, 0, 'Manzana Cortada', '', 5, 50, 0, 8, '2012-11-15 16:56:16', NULL),
(87, 1, 'Gelatina con Fruta', '', 6, 35, 2, 8, '2012-11-15 16:56:51', NULL),
(88, 0, 'Ensalada Frutos Rojos', '', 10, 80, 0, 8, '2012-11-15 16:57:24', NULL),
(89, 0, 'Ensalada de Frutas', '', 10, 65, 0, 8, '2012-11-15 16:57:49', NULL),
(90, 1, 'Olivas Verdes', '', 5, 132, 0, 4, '2012-11-15 16:59:30', NULL),
(91, 0, 'Olivas Negras', '', 5, 320, 0, 4, '2012-11-15 17:00:16', NULL),
(103, 4, 'Combo del Caesar Light', 'Enslada Caesar (sin crutones), con bebida y postre', 35, 11, 0, 1, '2012-11-21 03:57:48', NULL),
(105, 0, 'Bebida', 'Bebida', 0, 0, 1, 6, '2012-11-21 04:54:09', NULL),
(106, 0, 'Postre', 'Postre', 0, 0, 1, 8, '2012-11-21 04:54:21', NULL),
(107, 0, 'Orange Bird', 'Zanahoria Rayada,Huevo duro y Pollo a la plancha.', 32, 0, 0, 1, '2012-11-22 09:39:07', NULL),
(108, 0, 'Capresse', 'Oliva verde y negra, Queso, Tomate Cherry y Albahaca', 28, 0, 0, 2, '2012-11-22 10:17:24', NULL),
(109, 0, 'Mediterranea', 'Mix de Hojas Verdes, Queso Romano, Tomate Cherry y Palmitos', 28, 0, 0, 2, '2012-11-22 10:26:55', NULL),
(110, 0, 'Lechuga Mantecosa', '', 2, 0, 0, 4, '2012-11-22 10:28:06', NULL),
(111, 0, 'Lechuga Morada', '', 2, 0, 0, 4, '2012-11-22 10:28:23', NULL),
(112, 0, 'Lechuga Francesa', '', 2, 0, 0, 4, '2012-11-22 10:28:36', NULL),
(113, 0, 'Palmito', '', 6, 0, 0, 4, '2012-11-22 10:30:17', NULL),
(114, 0, 'Fresh Tuna', 'Atun rojo, Repollo blanco, Repollo Colorado, Lechuga francesa y Tomates Cherry', 40, 0, 0, 1, '2012-11-22 10:35:01', NULL),
(115, 0, 'Querandy Azul', 'Hojas Verdes, Tomates Cherry, Queso Roquefort, Huevo Rayado, Crutons.', 26, 0, 0, 2, '2012-11-22 10:49:32', NULL),
(116, 0, 'Nombre', NULL, 35, NULL, 0, 2, '2012-11-22 10:45:36', 20),
(117, 0, 'Nombre', NULL, 28, NULL, 0, 2, '2012-11-22 10:48:19', 20),
(118, 0, 'Nombre', NULL, 6.5, NULL, 0, 2, '2012-11-22 10:48:51', 20),
(119, 0, 'Nombre', NULL, 32, NULL, 0, 2, '2012-11-22 10:49:53', 20),
(120, 0, 'Nombre', NULL, 61, NULL, 0, 2, '2012-11-22 13:04:08', 21);

-- --------------------------------------------------------

--
-- Table structure for table `productproduct`
--

CREATE TABLE IF NOT EXISTS `productproduct` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `parent` bigint(20) NOT NULL,
  `child` bigint(20) NOT NULL,
  `count` double NOT NULL,
  `unit` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_ProductProduct_parent` (`parent`),
  KEY `FK_ProductProduct_child` (`parent`),
  KEY `FK_ProductProduct_chiuld` (`child`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `productproduct`
--

INSERT INTO `productproduct` (`id`, `version`, `parent`, `child`, `count`, `unit`) VALUES
(26, 0, 103, 105, 1, 1),
(28, 0, 103, 106, 1, 1),
(29, 0, 107, 105, 1, 1),
(30, 0, 107, 106, 1, 1),
(31, 0, 107, 43, 1, 1),
(32, 0, 107, 14, 1, 1),
(33, 0, 107, 17, 2, 1),
(34, 0, 108, 32, 2, 1),
(35, 0, 108, 90, 1, 1),
(36, 0, 108, 91, 1, 1),
(37, 0, 108, 20, 1, 1),
(38, 0, 108, 45, 1, 1),
(39, 0, 109, 110, 1, 1),
(40, 0, 109, 112, 1, 1),
(41, 0, 109, 33, 1, 1),
(42, 0, 109, 18, 1, 1),
(43, 0, 109, 32, 1, 1),
(44, 0, 109, 113, 1, 1),
(45, 0, 114, 15, 1, 1),
(46, 0, 114, 40, 1, 1),
(48, 0, 114, 112, 1, 1),
(49, 0, 114, 32, 2, 1),
(50, 0, 114, 41, 1, 1),
(51, 0, 114, 105, 1, 1),
(52, 0, 114, 106, 1, 1),
(53, 0, 115, 33, 1, 1),
(54, 0, 115, 111, 1, 1),
(55, 0, 115, 32, 1, 1),
(56, 0, 115, 17, 1, 1),
(57, 0, 116, 103, 1, 1),
(58, 0, 117, 109, 1, 1),
(59, 0, 118, 7, 1, 1),
(60, 0, 119, 107, 1, 1),
(61, 0, 115, 19, 1, 1),
(62, 0, 120, 103, 1, 1),
(63, 0, 120, 68, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productproducttype`
--

CREATE TABLE IF NOT EXISTS `productproducttype` (
  `productId` bigint(20) NOT NULL,
  `productTypeId` bigint(20) NOT NULL,
  PRIMARY KEY  (`productId`,`productTypeId`),
  UNIQUE KEY `UK_PPT_productProductType` (`productId`,`productTypeId`),
  KEY `FK_PPT_product` (`productId`),
  KEY `FK_PPT_productType` (`productTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productproducttype`
--


-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE IF NOT EXISTS `producttype` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_ProductType_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `producttype`
--


-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `customer` bigint(20) NOT NULL,
  `status` int(1) NOT NULL,
  `created` datetime NOT NULL,
  `total` double NOT NULL,
  `paymentType` int(1) NOT NULL,
  `address` bigint(20) NOT NULL,
  `deliveryTime` varchar(255) NOT NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Purchase_user` (`customer`),
  KEY `FK_Purchase_address` (`address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `version`, `customer`, `status`, `created`, `total`, `paymentType`, `address`, `deliveryTime`, `comment`) VALUES
(8, 2, 20, 0, '2012-11-22 10:51:24', 1.5, 1, 16, '14.00', 'Oficina saliendo del ascensor a la derecha. Empresa VMN+'),
(9, 1, 21, 0, '2012-11-22 13:08:42', -39, 1, 17, '14.45', '');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseitem`
--

CREATE TABLE IF NOT EXISTS `purchaseitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `purchase` bigint(20) NOT NULL,
  `position` int(2) NOT NULL,
  `product` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `count` int(2) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_PurchaseItem_purchase` (`purchase`),
  KEY `FK_PurchaseItem_product` (`product`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `purchaseitem`
--

INSERT INTO `purchaseitem` (`id`, `version`, `purchase`, `position`, `product`, `description`, `count`, `price`) VALUES
(9, 0, 8, 1, 116, 'Nombre (Combo del Caesar Light (Bebida (1), Postre (1)) (1))', 0, 35),
(10, 0, 8, 2, 117, 'Nombre (Mediterranea (Lechuga Mantecosa (1), Lechuga Francesa (1), Rucula (1), Queso Romano (1), Tomate Cherry (1), Palmito (1)) (1))', 0, 28),
(11, 0, 8, 3, 118, 'Nombre (Fanta Pomelo (1))', 0, 6.5),
(12, 0, 8, 4, 119, 'Nombre (Orange Bird (Bebida (1), Postre (1), Zanahoria (1), Pollo (1), Huevo (2)) (1))', 0, 32),
(13, 0, 9, 1, 120, 'Nombre (Combo del Caesar Light (Bebida (1), Postre (1)) (1), All Green (1))', 0, 61);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_User_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `firstname`, `lastname`, `email`, `password`, `status`, `created`) VALUES
(2, 5, 'Augusto', 'Soncini', 'augustosoncini@hotmail.com', 'dHVlbkdFTFA=', 0, '2012-09-09 00:00:00'),
(9, 0, 'Omar', 'Bianchimano', 'obianchimano@gmail.com', 'ZGFsZUxPQk8=', 0, '2012-11-18 22:47:41'),
(10, 4, 'Magdalena', 'Del val', 'magdadelval@hotmail.com', 'bG9jdXJhMDE=', 0, '2012-11-19 10:54:45'),
(11, 0, 'Graciana', 'Fornetti', 'gracianafornetti@hotmail.com', 'bG9jdXJhMDE=', 1, '2012-11-19 10:57:09'),
(12, 4, 'Valentino', 'Soncini', 'valentinosoncini@gmail.com', 'dHVlbkdFTFA=', 0, '2012-11-19 15:20:56'),
(14, 0, 'Federico', 'Bianchimano', 'fbianchimano@hotmail.com', 'bG9jdXJhMDI=', 0, '2012-11-19 20:05:09'),
(19, 0, 'Augusto', 'Soncini', 'augustosoncini@gmail.com', 'dHVlbkdFTFA=', 0, '2012-11-21 01:08:24'),
(20, 0, 'Fabio', 'Sottile', 'fabiocsottile@gmail.com', 'MjIwMzIwMDM=', 0, '2012-11-22 10:37:47'),
(21, 0, 'magda', 'del val', 'magdadelval@gmail.com', 'bWFnZGExOTc5', 0, '2012-11-22 12:56:51'),
(22, 0, 'JUAN CARLOS', 'FERRARA', 'juancarlosferrara@gmail.com', 'MTFTVU1BMjA=', 0, '2012-11-22 13:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `useraccess`
--

CREATE TABLE IF NOT EXISTS `useraccess` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL default '0',
  `user` bigint(20) NOT NULL,
  `access` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_UserAccess_user` (`user`),
  KEY `FK_UserAccess_access` (`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `useraccess`
--

INSERT INTO `useraccess` (`id`, `version`, `user`, `access`) VALUES
(1, 0, 2, 2),
(4, 0, 2, 1),
(5, 0, 2, 3),
(6, 0, 2, 4),
(7, 0, 2, 5),
(8, 0, 2, 6),
(9, 0, 9, 1),
(10, 0, 9, 2),
(11, 0, 9, 3),
(12, 0, 9, 4),
(13, 0, 9, 5),
(14, 0, 9, 6),
(15, 0, 2, 7),
(16, 0, 2, 8),
(17, 0, 9, 7),
(18, 0, 9, 8),
(19, 0, 2, 9),
(20, 0, 2, 10),
(21, 0, 9, 9),
(22, 0, 9, 10);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_Address_customer` FOREIGN KEY (`customer`) REFERENCES `user` (`id`);

--
-- Constraints for table `giftcard`
--
ALTER TABLE `giftcard`
  ADD CONSTRAINT `FK_GiftCard_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_Log_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_Product_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Constraints for table `productproduct`
--
ALTER TABLE `productproduct`
  ADD CONSTRAINT `FK_ProductProduct_chiuld` FOREIGN KEY (`child`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_ProductProduct_parent` FOREIGN KEY (`parent`) REFERENCES `product` (`id`);

--
-- Constraints for table `productproducttype`
--
ALTER TABLE `productproducttype`
  ADD CONSTRAINT `FK_PPT_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_PPT_productType` FOREIGN KEY (`productTypeId`) REFERENCES `producttype` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FK_Purchase_address` FOREIGN KEY (`address`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_Purchase_user` FOREIGN KEY (`customer`) REFERENCES `user` (`id`);

--
-- Constraints for table `purchaseitem`
--
ALTER TABLE `purchaseitem`
  ADD CONSTRAINT `FK_PurchaseItem_product` FOREIGN KEY (`product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_PurchaseItem_purchaser` FOREIGN KEY (`purchase`) REFERENCES `purchase` (`id`);

--
-- Constraints for table `useraccess`
--
ALTER TABLE `useraccess`
  ADD CONSTRAINT `FK_UserAccess_access` FOREIGN KEY (`access`) REFERENCES `access` (`id`),
  ADD CONSTRAINT `FK_UserAccess_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`);
