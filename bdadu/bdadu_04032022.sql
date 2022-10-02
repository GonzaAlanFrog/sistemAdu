/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : bdadu

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-03-04 14:52:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for caja
-- ----------------------------
DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `cod_caja` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_caja` varchar(100) DEFAULT NULL,
  `caja_ultfactura` int(255) DEFAULT NULL,
  `caja_estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cod_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caja
-- ----------------------------
INSERT INTO `caja` VALUES ('1', 'CAJA1', '0', 'A');

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
INSERT INTO `cargo` VALUES ('1', 'INFORMATICA');

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
INSERT INTO `ciudad` VALUES ('1', 'ASUNCION');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', '1', '1', 'GONZALO GERMAN', 'MARECO SANDOVAL', '', null, '4717567');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Operaciones', null);
INSERT INTO `menu` VALUES ('3', 'Reportes', null);
INSERT INTO `menu` VALUES ('4', 'Mantenimientos', null);

-- ----------------------------
-- Table structure for menuiten
-- ----------------------------
DROP TABLE IF EXISTS `menuiten`;
CREATE TABLE `menuiten` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  `id_menu` int(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `menuiten_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menuiten
-- ----------------------------
INSERT INTO `menuiten` VALUES ('0', 'Mantener Proveedor', '4', '/recursos/html/Mantener_proveedor.html');
INSERT INTO `menuiten` VALUES ('1', 'Caja', '1', 'recursos/html/caja.html');
INSERT INTO `menuiten` VALUES ('2', 'ventas', '1', 'recursos/html/Venta.html');
INSERT INTO `menuiten` VALUES ('3', 'Anulacion', '1', 'html/mantener');
INSERT INTO `menuiten` VALUES ('5', 'Gestor Reportes', '3', 'html/mantener');
INSERT INTO `menuiten` VALUES ('6', 'Mantener Clientes', '4', 'recursos/html/Mantener_clientes.html');
INSERT INTO `menuiten` VALUES ('7', 'Mantener Usuarios ', '4', 'recursos/html/Mantener_usuarios.html');
INSERT INTO `menuiten` VALUES ('8', 'Mantener Perfiles', '4', 'recursos/html/Mantener_perfil.html');
INSERT INTO `menuiten` VALUES ('9', 'Mantener Ciudad', '4', 'recursos/html/Mantener_ciudad.html');
INSERT INTO `menuiten` VALUES ('10', 'Mantener Deposito', '4', 'recursos/html/Mantener_deposito.html');
INSERT INTO `menuiten` VALUES ('11', 'Mantener Funcionarios', '4', 'recursos/html/Mantener_funcionarios.html');
INSERT INTO `menuiten` VALUES ('12', 'Mantener Mercaderia ', '4', 'recursos/html/Mantener_mercaderia.html');
INSERT INTO `menuiten` VALUES ('13', 'Mantener Proveedor', '4', 'recursos/html/Mantener_proveedor.html');
INSERT INTO `menuiten` VALUES ('15', 'Comprar', '1', 'recursos/html/Compra.html');

-- ----------------------------
-- Table structure for perfil_usuario
-- ----------------------------
DROP TABLE IF EXISTS `perfil_usuario`;
CREATE TABLE `perfil_usuario` (
  `cod_perfil_usu` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_perfil` varchar(45) DEFAULT '',
  PRIMARY KEY (`cod_perfil_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil_usuario
-- ----------------------------
INSERT INTO `perfil_usuario` VALUES ('1', 'ADMIN');
INSERT INTO `perfil_usuario` VALUES ('2', 'OPERACIONES');
INSERT INTO `perfil_usuario` VALUES ('3', 'LIBRE');
INSERT INTO `perfil_usuario` VALUES ('4', 'MANTENIMIENTOS');

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
  `clave` varchar(45) DEFAULT NULL,
  `estado_usu` varchar(45) DEFAULT 'A',
  `fecha_alta` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  KEY `fk_usuario_perfil_usuario1_idx` (`cod_perfil_usu`),
  KEY `fk_usuario_perfil_usuario2_idx` (`cod_emple`) USING BTREE,
  CONSTRAINT `fk_usuario_emple` FOREIGN KEY (`cod_emple`) REFERENCES `empleado` (`cod_emple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_perfil_usuario1` FOREIGN KEY (`cod_perfil_usu`) REFERENCES `perfil_usuario` (`cod_perfil_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', '1', '1', 'Gonzalo Mareco', '1234', 'A', '2022-03-04 00:00:00', 'gmarecos');
SET FOREIGN_KEY_CHECKS=1;
