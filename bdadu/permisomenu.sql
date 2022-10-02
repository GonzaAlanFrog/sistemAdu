/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : siscobro

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-03-04 14:32:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permisomenu
-- ----------------------------
DROP TABLE IF EXISTS `permisomenu`;
CREATE TABLE `permisomenu` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idorden`,`id_perfil`,`id`),
  KEY `menuiten_permisomenu_fk` (`id`),
  KEY `perfiles_permisomenu_fk` (`id_perfil`),
  CONSTRAINT `menuiten_permisomenu_fk` FOREIGN KEY (`id`) REFERENCES `menuiten` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `perfiles_permisomenu_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisomenu
-- ----------------------------
INSERT INTO `permisomenu` VALUES ('1', '2', '2', '1');
INSERT INTO `permisomenu` VALUES ('2', '2', '1', '1');
INSERT INTO `permisomenu` VALUES ('3', '2', '6', '1');
INSERT INTO `permisomenu` VALUES ('4', '2', '5', '1');
INSERT INTO `permisomenu` VALUES ('7', '2', '7', '1');
INSERT INTO `permisomenu` VALUES ('8', '2', '8', '1');
INSERT INTO `permisomenu` VALUES ('10', '2', '10', '1');
INSERT INTO `permisomenu` VALUES ('11', '2', '12', '1');
INSERT INTO `permisomenu` VALUES ('12', '2', '11', '1');
INSERT INTO `permisomenu` VALUES ('13', '2', '9', '1');
INSERT INTO `permisomenu` VALUES ('14', '2', '13', '1');
INSERT INTO `permisomenu` VALUES ('15', '2', '15', '1');
SET FOREIGN_KEY_CHECKS=1;
