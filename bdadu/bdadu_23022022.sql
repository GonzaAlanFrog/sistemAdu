/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : bdadu

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-02-23 16:47:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `cod_cargo` int(255) NOT NULL,
  `descrip_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cargo
-- ----------------------------

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `cod_ciu` int(255) unsigned NOT NULL,
  `descrip_ciu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ciu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ciudad
-- ----------------------------

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `cod_emple` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `cod_ciu` int(255) unsigned NOT NULL,
  `cod_cargo` int(255) NOT NULL,
  `nom_emple` varchar(30) DEFAULT NULL,
  `ape_emple` varchar(30) DEFAULT NULL,
  `dir_emple` varchar(100) DEFAULT '',
  `telf` varchar(20) DEFAULT NULL,
  `documento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_emple`),
  KEY `empleado_FKIndex1` (`cod_ciu`),
  KEY `empleado_ibfk_2` (`cod_cargo`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cod_ciu`) REFERENCES `ciudad` (`cod_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo` (`cod_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------

-- ----------------------------
-- Table structure for perfil_usuario
-- ----------------------------
DROP TABLE IF EXISTS `perfil_usuario`;
CREATE TABLE `perfil_usuario` (
  `cod_perfil_usu` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_perfil` varchar(45) DEFAULT '',
  PRIMARY KEY (`cod_perfil_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil_usuario
-- ----------------------------
INSERT INTO `perfil_usuario` VALUES ('1', 'ADMIN');
INSERT INTO `perfil_usuario` VALUES ('2', 'OPERACIONES');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `cod_usu` int(255) unsigned NOT NULL,
  `cod_perfil_usu` int(255) unsigned NOT NULL,
  `cod_emple` int(255) unsigned NOT NULL,
  `cod_empresa` int(255) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `nro_documento` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `estado_usu` varchar(45) DEFAULT 'A',
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  KEY `fk_usuario_perfil_usuario1_idx` (`cod_perfil_usu`),
  KEY `fk_usuario_perfil_usuario2_idx` (`cod_emple`) USING BTREE,
  CONSTRAINT `fk_usuario_perfil_usuario1` FOREIGN KEY (`cod_perfil_usu`) REFERENCES `perfil_usuario` (`cod_perfil_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_perfil_usuario2` FOREIGN KEY (`cod_emple`) REFERENCES `empleado` (`cod_emple`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
