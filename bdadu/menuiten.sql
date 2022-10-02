/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : siscobro

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-03-07 13:34:24
*/

SET FOREIGN_KEY_CHECKS=0;

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
SET FOREIGN_KEY_CHECKS=1;
