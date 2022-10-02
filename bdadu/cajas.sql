/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : siscobro

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-03-04 14:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL,
  `caja_descripcion` varchar(300) NOT NULL,
  `caja_ultfactura` int(11) DEFAULT NULL,
  `caja_estado` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES ('1', 'Caja 1', '0', '');
INSERT INTO `cajas` VALUES ('2', 'Caja 2', '0', '');
SET FOREIGN_KEY_CHECKS=1;
