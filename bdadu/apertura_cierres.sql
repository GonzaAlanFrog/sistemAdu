/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : siscobro

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-03-07 10:44:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apertura_cierres
-- ----------------------------
DROP TABLE IF EXISTS `apertura_cierres`;
CREATE TABLE `apertura_cierres` (
  `id_apercierre` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime NOT NULL DEFAULT current_timestamp(),
  `aper_monto` int(11) NOT NULL,
  `cierre_fecha` timestamp NULL DEFAULT NULL,
  `cierre_monto` int(11) DEFAULT NULL,
  `id_caja` int(11) NOT NULL,
  `id_funcionario` int(100) NOT NULL,
  PRIMARY KEY (`id_apercierre`),
  KEY `cajas_apertura_cierres_fk` (`id_caja`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `apertura_cierres_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `cajas` (`id_caja`),
  CONSTRAINT `cajas_apertura_cierres_fk` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apertura_cierres
-- ----------------------------
INSERT INTO `apertura_cierres` VALUES ('8', '2018-08-18 18:07:13', '25000000', '2018-08-18 18:10:39', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('9', '2018-08-18 18:11:49', '25000000', '2018-08-18 18:11:53', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('10', '2018-08-18 18:15:35', '25000000', '2018-08-18 18:19:10', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('11', '2018-08-18 18:19:38', '25000000', '2018-08-18 18:19:46', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('12', '2018-08-18 18:20:49', '25000000', '2018-08-18 18:20:51', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('13', '2018-08-18 18:21:34', '25000000', '2018-08-18 18:21:36', '0', '1', '1');
INSERT INTO `apertura_cierres` VALUES ('14', '2018-08-18 18:23:45', '25000000', '2018-08-18 18:23:49', '0', '1', '1');
SET FOREIGN_KEY_CHECKS=1;
