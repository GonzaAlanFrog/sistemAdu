/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : siscobro

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-07-08 09:10:18
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

-- ----------------------------
-- Table structure for bancos
-- ----------------------------
DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(300) NOT NULL,
  `ruc` varchar(300) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `Telefono` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bancos
-- ----------------------------

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

-- ----------------------------
-- Table structure for cargos
-- ----------------------------
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL,
  `car_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cargos
-- ----------------------------
INSERT INTO `cargos` VALUES ('1', 'administrador');
INSERT INTO `cargos` VALUES ('2', 'cajeros');
INSERT INTO `cargos` VALUES ('3', 'Operacional');
INSERT INTO `cargos` VALUES ('4', 'Gerencia');
INSERT INTO `cargos` VALUES ('5', 'Desarrollador');
INSERT INTO `cargos` VALUES ('6', 'DBA');

-- ----------------------------
-- Table structure for ciudades
-- ----------------------------
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `ciu_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ciudades
-- ----------------------------
INSERT INTO `ciudades` VALUES ('0', 'Capiata');
INSERT INTO `ciudades` VALUES ('9', 'Aregua');
INSERT INTO `ciudades` VALUES ('10', 'Itaugua');
INSERT INTO `ciudades` VALUES ('12', 'Caacupe');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `cli_ruc` varchar(300) NOT NULL,
  `cli_razonsocial` varchar(300) NOT NULL,
  `cli_telefono` varchar(300) NOT NULL,
  `cli_direccion` varchar(300) DEFAULT NULL,
  `cli_email` varchar(300) DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `ciudades_clientes_fk` (`id_ciudad`),
  CONSTRAINT `ciudades_clientes_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('0', '4538212', 'roberto perez', '0994 447065', 'itaugua km30', 'rperez@gmail.com', '10');

-- ----------------------------
-- Table structure for cobros
-- ----------------------------
DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `id_cobros` int(11) NOT NULL,
  `cob_fecha` datetime NOT NULL,
  `cob_efectivo` int(11) NOT NULL,
  `cob_estado` varchar(300) NOT NULL,
  PRIMARY KEY (`id_cobros`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobros
-- ----------------------------

-- ----------------------------
-- Table structure for cobro_cheques
-- ----------------------------
DROP TABLE IF EXISTS `cobro_cheques`;
CREATE TABLE `cobro_cheques` (
  `id_cobros` int(11) NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `nro_cheque` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_cobro` date NOT NULL,
  `importe` int(11) NOT NULL,
  `titular` varchar(300) NOT NULL,
  PRIMARY KEY (`id_cobros`,`id_entidad`,`nro_cheque`),
  KEY `entidad_emisoras_cobro_cheques_fk` (`id_entidad`),
  CONSTRAINT `cobros_cobro_cheques_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entidad_emisoras_cobro_cheques_fk` FOREIGN KEY (`id_entidad`) REFERENCES `entidad_emisoras` (`id_entidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobro_cheques
-- ----------------------------

-- ----------------------------
-- Table structure for cobro_tarjetas
-- ----------------------------
DROP TABLE IF EXISTS `cobro_tarjetas`;
CREATE TABLE `cobro_tarjetas` (
  `id_cobros` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `nro_tarjeta` int(11) NOT NULL,
  `cod_auto` int(11) NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `importe` int(11) NOT NULL,
  PRIMARY KEY (`id_cobros`,`id_tarjeta`,`nro_tarjeta`,`cod_auto`),
  KEY `tarjetas_cobro_tarjetas_fk` (`id_tarjeta`),
  KEY `entidad_emisoras_cobro_tarjetas_fk` (`id_entidad`),
  CONSTRAINT `cobros_cobro_tarjetas_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entidad_emisoras_cobro_tarjetas_fk` FOREIGN KEY (`id_entidad`) REFERENCES `entidad_emisoras` (`id_entidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tarjetas_cobro_tarjetas_fk` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id_tarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobro_tarjetas
-- ----------------------------

-- ----------------------------
-- Table structure for condicion_ventas
-- ----------------------------
DROP TABLE IF EXISTS `condicion_ventas`;
CREATE TABLE `condicion_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of condicion_ventas
-- ----------------------------

-- ----------------------------
-- Table structure for cuentas_cobrar
-- ----------------------------
DROP TABLE IF EXISTS `cuentas_cobrar`;
CREATE TABLE `cuentas_cobrar` (
  `id_venta` int(11) NOT NULL,
  `cta_nro` int(11) NOT NULL,
  `cta_vencimiento` date NOT NULL,
  `cta_monto` int(11) NOT NULL,
  `cta_saldo` int(11) NOT NULL,
  `cta_estado` varchar(300) NOT NULL,
  PRIMARY KEY (`id_venta`,`cta_nro`),
  CONSTRAINT `ventas_cuentas_cobrar_fk` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentas_cobrar
-- ----------------------------

-- ----------------------------
-- Table structure for cuenta_bancarias
-- ----------------------------
DROP TABLE IF EXISTS `cuenta_bancarias`;
CREATE TABLE `cuenta_bancarias` (
  `id_cuenta_bancaria` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cuentas` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `id_banco` int(11) NOT NULL,
  PRIMARY KEY (`id_cuenta_bancaria`),
  KEY `bancos_cuenta_bancarias_fk` (`id_banco`),
  CONSTRAINT `bancos_cuenta_bancarias_fk` FOREIGN KEY (`id_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuenta_bancarias
-- ----------------------------

-- ----------------------------
-- Table structure for depositos
-- ----------------------------
DROP TABLE IF EXISTS `depositos`;
CREATE TABLE `depositos` (
  `id_deposito` int(11) NOT NULL AUTO_INCREMENT,
  `dep_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_deposito`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of depositos
-- ----------------------------
INSERT INTO `depositos` VALUES ('3', 'modidixs');
INSERT INTO `depositos` VALUES ('4', 'modidixs');
INSERT INTO `depositos` VALUES ('6', 'perra faldera');

-- ----------------------------
-- Table structure for detalle_cobros
-- ----------------------------
DROP TABLE IF EXISTS `detalle_cobros`;
CREATE TABLE `detalle_cobros` (
  `id_cobros` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cta_nro` int(11) NOT NULL,
  `detc_monto` int(11) NOT NULL,
  PRIMARY KEY (`id_cobros`,`id_venta`,`cta_nro`),
  KEY `cuentas_cobrar_detalle_cobros_fk` (`id_venta`,`cta_nro`),
  CONSTRAINT `cobros_detalle_cobros_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cuentas_cobrar_detalle_cobros_fk` FOREIGN KEY (`id_venta`, `cta_nro`) REFERENCES `cuentas_cobrar` (`id_venta`, `cta_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_cobros
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_fac_compra
-- ----------------------------
DROP TABLE IF EXISTS `detalle_fac_compra`;
CREATE TABLE `detalle_fac_compra` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_mercaderia` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_mercaderia`,`id_compra`),
  KEY `mercaderias_detalle_fac_compra_fk` (`id_mercaderia`),
  KEY `factura_compra_detalle_fac_compra_fk` (`id_compra`),
  CONSTRAINT `factura_compra_detalle_fac_compra_fk` FOREIGN KEY (`id_compra`) REFERENCES `factura_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mercaderias_detalle_fac_compra_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_fac_compra
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_inventario
-- ----------------------------
DROP TABLE IF EXISTS `detalle_inventario`;
CREATE TABLE `detalle_inventario` (
  `id_inventario` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_inventario`,`id_lote`,`id_mercaderia`,`id_deposito`),
  KEY `depositos_detalle_inventario_fk` (`id_deposito`),
  KEY `lote_detalle_inventario_fk` (`id_lote`,`id_mercaderia`),
  CONSTRAINT `inventario_detalle_inventario_fk` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lote_detalle_inventario_fk` FOREIGN KEY (`id_lote`, `id_mercaderia`) REFERENCES `lote` (`id_lote`, `id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_inventario
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_orden_compra
-- ----------------------------
DROP TABLE IF EXISTS `detalle_orden_compra`;
CREATE TABLE `detalle_orden_compra` (
  `id_orden_compra` varchar(300) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `cantidad_orden` int(11) NOT NULL,
  `precio_orden` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_compra`,`id_mercaderia`),
  KEY `mercaderias_detalle_orden_compra_fk` (`id_mercaderia`),
  CONSTRAINT `mercaderias_detalle_orden_compra_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_orden_compra
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_transferncias
-- ----------------------------
DROP TABLE IF EXISTS `detalle_transferncias`;
CREATE TABLE `detalle_transferncias` (
  `id_Trans_ajuste` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `cantidad_transferencia` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_Trans_ajuste`,`id_lote`,`id_mercaderia`),
  KEY `depositos_detalle_transferncias_fk` (`id_deposito`),
  KEY `lote_detalle_transferncias_fk` (`id_lote`,`id_mercaderia`),
  CONSTRAINT `lote_detalle_transferncias_fk` FOREIGN KEY (`id_lote`, `id_mercaderia`) REFERENCES `lote` (`id_lote`, `id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transferencia_ajuste_detalle_transferncias_fk` FOREIGN KEY (`id_Trans_ajuste`) REFERENCES `transferencia_ajuste` (`id_Trans_ajuste`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_transferncias
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_ventas
-- ----------------------------
DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE `detalle_ventas` (
  `id_venta` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `dv_cantidad` int(11) NOT NULL,
  `dv_precio` int(11) NOT NULL,
  `subtotal` int(100) NOT NULL,
  PRIMARY KEY (`id_venta`,`id_mercaderia`),
  KEY `mercaderias_detalle_ventas_fk` (`id_mercaderia`),
  CONSTRAINT `mercaderias_detalle_ventas_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_detalle_ventas_fk` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_ventas
-- ----------------------------

-- ----------------------------
-- Table structure for entidad_emisoras
-- ----------------------------
DROP TABLE IF EXISTS `entidad_emisoras`;
CREATE TABLE `entidad_emisoras` (
  `id_entidad` int(11) NOT NULL,
  `ent_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of entidad_emisoras
-- ----------------------------

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'ACTIVO');
INSERT INTO `estado` VALUES ('2', 'INACTIVO');

-- ----------------------------
-- Table structure for factura_compra
-- ----------------------------
DROP TABLE IF EXISTS `factura_compra`;
CREATE TABLE `factura_compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(300) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_compra`),
  KEY `estado_factura_compra_fk` (`id_estado`),
  KEY `proveedor_factura_compra_fk` (`id_proveedor`),
  KEY `funcionarios_factura_compra_fk` (`id_funcionario`),
  CONSTRAINT `estado_factura_compra_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionarios_factura_compra_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedor_factura_compra_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factura_compra
-- ----------------------------

-- ----------------------------
-- Table structure for forma_pago
-- ----------------------------
DROP TABLE IF EXISTS `forma_pago`;
CREATE TABLE `forma_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forma_pago
-- ----------------------------

-- ----------------------------
-- Table structure for funcionarios
-- ----------------------------
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `fun_ci` varchar(300) NOT NULL,
  `fun_nombres` varchar(300) NOT NULL,
  `fun_apellidos` varchar(300) NOT NULL,
  `fun_telefono` varchar(300) NOT NULL,
  `fun_direccion` varchar(300) NOT NULL,
  `fun_email` varchar(300) DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `cargos_funcionarios_fk` (`id_cargo`),
  KEY `ciudades_funcionarios_fk` (`id_ciudad`),
  CONSTRAINT `cargos_funcionarios_fk` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ciudades_funcionarios_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of funcionarios
-- ----------------------------
INSERT INTO `funcionarios` VALUES ('0', '4587821', 'Emilio', 'Garcia', '0981501203', 'Itaugua km30', 'egarcia@gmail.com', '1', '9');
INSERT INTO `funcionarios` VALUES ('1', '4538212', 'Rodrigo', 'Gonzalez', '0994447065', 'Itaugua km 30', 'rodrigo@gmail.com', '1', '10');
INSERT INTO `funcionarios` VALUES ('3', '4538245', 'Pedro', 'Miranda', '0971545254', 'Capiata kM21', 'pmiranda@gmail.com', '1', '9');

-- ----------------------------
-- Table structure for impuesto
-- ----------------------------
DROP TABLE IF EXISTS `impuesto`;
CREATE TABLE `impuesto` (
  `id_impuesto` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_impuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of impuesto
-- ----------------------------
INSERT INTO `impuesto` VALUES ('1', 'Iva 5%');
INSERT INTO `impuesto` VALUES ('2', 'Iva 10%');

-- ----------------------------
-- Table structure for inventario
-- ----------------------------
DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `usuarios_inventario_fk` (`id_usuario`),
  CONSTRAINT `usuarios_inventario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventario
-- ----------------------------

-- ----------------------------
-- Table structure for lote
-- ----------------------------
DROP TABLE IF EXISTS `lote`;
CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL AUTO_INCREMENT,
  `id_mercaderia` int(11) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `numero_lote` varchar(300) NOT NULL,
  `fecha_fabricacion` datetime NOT NULL,
  PRIMARY KEY (`id_lote`,`id_mercaderia`),
  KEY `mercaderias_lote_fk` (`id_mercaderia`),
  CONSTRAINT `mercaderias_lote_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lote
-- ----------------------------

-- ----------------------------
-- Table structure for marca_tarjetas
-- ----------------------------
DROP TABLE IF EXISTS `marca_tarjetas`;
CREATE TABLE `marca_tarjetas` (
  `id_marca` int(11) NOT NULL,
  `mar_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marca_tarjetas
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Operaciones');
INSERT INTO `menu` VALUES ('3', 'Reportes');
INSERT INTO `menu` VALUES ('4', 'Mantenimientos');

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
-- Table structure for mercaderias
-- ----------------------------
DROP TABLE IF EXISTS `mercaderias`;
CREATE TABLE `mercaderias` (
  `id_mercaderia` int(11) NOT NULL AUTO_INCREMENT,
  `mer_descripcion` varchar(300) NOT NULL,
  `mer_costo` int(11) NOT NULL,
  `mer_precio` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_impuesto` int(11) NOT NULL,
  `id_tipo_mercaderia` int(11) NOT NULL,
  PRIMARY KEY (`id_mercaderia`),
  KEY `impuesto_mercaderias_fk` (`id_impuesto`),
  KEY `nacionalidad_mercaderias_fk` (`id_nacionalidad`),
  KEY `tipo_mercaderias_mercaderias_fk` (`id_tipo_mercaderia`),
  CONSTRAINT `impuesto_mercaderias_fk` FOREIGN KEY (`id_impuesto`) REFERENCES `impuesto` (`id_impuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nacionalidad_mercaderias_fk` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_mercaderias_mercaderias_fk` FOREIGN KEY (`id_tipo_mercaderia`) REFERENCES `tipo_mercaderias` (`id_tipo_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mercaderias
-- ----------------------------
INSERT INTO `mercaderias` VALUES ('1', 'Cerveza Brama de Litro', '7500', '9000', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('2', 'Cerveza Brama de 3/4', '5000', '7500', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('4', 'Cerveza Brama (Bramita)', '3500', '5000', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('5', 'Cerveza Pilsen de Litro', '7500', '9000', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('6', 'Cerveza Pilsen de 3/4', '5000', '7500', '1', '2', '1');
INSERT INTO `mercaderias` VALUES ('7', 'Cerveza Pilsen (PilsenI)', '3500', '5000', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('8', 'Gaseosa Litro CocaCola', '5000', '7500', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('9', 'Coca Coca 350', '500', '1000', '1', '1', '1');
INSERT INTO `mercaderias` VALUES ('12', 'Coca Cola de 200 ', '1000', '1500', '1', '1', '1');

-- ----------------------------
-- Table structure for nacionalidad
-- ----------------------------
DROP TABLE IF EXISTS `nacionalidad`;
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nacionalidad
-- ----------------------------
INSERT INTO `nacionalidad` VALUES ('1', 'py');

-- ----------------------------
-- Table structure for orden_compra
-- ----------------------------
DROP TABLE IF EXISTS `orden_compra`;
CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT,
  `orden_fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_compra`),
  KEY `usuarios_orden_compra_fk` (`id_usuario`),
  CONSTRAINT `usuarios_orden_compra_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orden_compra
-- ----------------------------

-- ----------------------------
-- Table structure for parametro
-- ----------------------------
DROP TABLE IF EXISTS `parametro`;
CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `ultimo_numero` int(11) NOT NULL,
  `numero_fin` int(11) NOT NULL,
  `numero_inicio` int(11) NOT NULL,
  `id_timbrado` int(100) NOT NULL,
  `id_tipo_doc` int(11) NOT NULL,
  `id_caja` int(100) NOT NULL,
  PRIMARY KEY (`id_parametro`),
  KEY `tipo_documento_parametro_fk` (`id_tipo_doc`),
  KEY `id_timbrado` (`id_timbrado`),
  KEY `id_caja` (`id_caja`),
  CONSTRAINT `parametro_ibfk_1` FOREIGN KEY (`id_timbrado`) REFERENCES `timbrados` (`id_timbrado`),
  CONSTRAINT `parametro_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`),
  CONSTRAINT `tipo_documento_parametro_fk` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parametro
-- ----------------------------
INSERT INTO `parametro` VALUES ('3', '1979', '2021', '1979', '1', '4', '1');

-- ----------------------------
-- Table structure for perfiles
-- ----------------------------
DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `per_descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfiles
-- ----------------------------
INSERT INTO `perfiles` VALUES ('1', 'cajeros');
INSERT INTO `perfiles` VALUES ('2', 'Administracion');
INSERT INTO `perfiles` VALUES ('3', 'Contabilidad');
INSERT INTO `perfiles` VALUES ('4', 'Deposito');

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
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(300) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `ruc` varchar(300) NOT NULL,
  `razon_social` varchar(300) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `ciudades_proveedor_fk` (`id_ciudad`),
  CONSTRAINT `ciudades_proveedor_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES ('1', '0984566582', 'caacupe', 'rg@gmail.com', '466484515', 'cervpar', '12');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id_deposito` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `stk_cantidad` int(11) NOT NULL,
  `id_unidad_medida` int(11) NOT NULL,
  PRIMARY KEY (`id_deposito`,`id_mercaderia`),
  KEY `unidad_medida_stock_fk` (`id_unidad_medida`),
  KEY `mercaderias_stock_fk` (`id_mercaderia`),
  CONSTRAINT `mercaderias_stock_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unidad_medida_stock_fk` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for tarjetas
-- ----------------------------
DROP TABLE IF EXISTS `tarjetas`;
CREATE TABLE `tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `tarj_tipo` varchar(300) NOT NULL,
  `id_marca` int(11) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  KEY `marca_tarjetas_tarjetas_fk` (`id_marca`),
  CONSTRAINT `marca_tarjetas_tarjetas_fk` FOREIGN KEY (`id_marca`) REFERENCES `marca_tarjetas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tarjetas
-- ----------------------------

-- ----------------------------
-- Table structure for timbrados
-- ----------------------------
DROP TABLE IF EXISTS `timbrados`;
CREATE TABLE `timbrados` (
  `id_timbrado` int(11) NOT NULL AUTO_INCREMENT,
  `numero_timbrado` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  PRIMARY KEY (`id_timbrado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of timbrados
-- ----------------------------
INSERT INTO `timbrados` VALUES ('1', '10001980', '2017-01-01', '2018-01-01');

-- ----------------------------
-- Table structure for tipo_ajuste
-- ----------------------------
DROP TABLE IF EXISTS `tipo_ajuste`;
CREATE TABLE `tipo_ajuste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_ajuste
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES ('1', 'facturaVenta');
INSERT INTO `tipo_documento` VALUES ('2', 'OrdenCompra');
INSERT INTO `tipo_documento` VALUES ('3', 'Tiket');
INSERT INTO `tipo_documento` VALUES ('4', 'FacturaCompra');

-- ----------------------------
-- Table structure for tipo_mercaderias
-- ----------------------------
DROP TABLE IF EXISTS `tipo_mercaderias`;
CREATE TABLE `tipo_mercaderias` (
  `id_tipo_mercaderia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_tipo_mercaderia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_mercaderias
-- ----------------------------
INSERT INTO `tipo_mercaderias` VALUES ('1', 'bebidas');
INSERT INTO `tipo_mercaderias` VALUES ('2', 'lacteos');

-- ----------------------------
-- Table structure for transferencia_ajuste
-- ----------------------------
DROP TABLE IF EXISTS `transferencia_ajuste`;
CREATE TABLE `transferencia_ajuste` (
  `id_Trans_ajuste` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_Trans_ajuste`),
  KEY `tipo_ajuste_transferencia_ajuste_fk` (`id`),
  KEY `depositos_transferencia_ajuste_fk` (`id_deposito`),
  KEY `usuarios_transferencia_ajuste_fk` (`id_usuario`),
  CONSTRAINT `tipo_ajuste_transferencia_ajuste_fk` FOREIGN KEY (`id`) REFERENCES `tipo_ajuste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_transferencia_ajuste_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transferencia_ajuste
-- ----------------------------

-- ----------------------------
-- Table structure for unidad_medida
-- ----------------------------
DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(300) NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unidad_medida
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usu_nombre` varchar(300) NOT NULL,
  `usu_clave` varchar(300) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `perfiles_usuarios_fk` (`id_perfil`),
  KEY `funcionarios_usuarios_fk` (`id_funcionario`),
  CONSTRAINT `funcionarios_usuarios_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `perfiles_usuarios_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'rgonzalez', '12345', '1', '1');
INSERT INTO `usuarios` VALUES ('2', 'egarcia', '12345', '1', '1');
INSERT INTO `usuarios` VALUES ('3', 'r', 'r', '1', '2');
INSERT INTO `usuarios` VALUES ('4', 'pmiranda', '12345', '0', '1');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `ven_nrofactura` int(11) NOT NULL,
  `ven_fecha` date NOT NULL,
  `ven_tipo` varchar(300) NOT NULL,
  `ven_intervalo` int(11) NOT NULL,
  `ven_cantcuotas` int(11) NOT NULL,
  `ven_estado` varchar(300) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_apercierre` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_parametro` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `estado_ventas_fk` (`id_estado`),
  KEY `parametro_ventas_fk` (`id_parametro`),
  KEY `condicion_ventas_ventas_fk` (`id`),
  KEY `funcionarios_ventas_fk` (`id_funcionario`),
  KEY `clientes_ventas_fk` (`id_cliente`),
  KEY `id_apercierre` (`id_apercierre`),
  CONSTRAINT `clientes_ventas_fk` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `condicion_ventas_ventas_fk` FOREIGN KEY (`id`) REFERENCES `condicion_ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado_ventas_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `forma_pago_ventas_fk` FOREIGN KEY (`id`) REFERENCES `forma_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionarios_ventas_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `parametro_ventas_fk` FOREIGN KEY (`id_parametro`) REFERENCES `parametro` (`id_parametro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_apercierre`) REFERENCES `apertura_cierres` (`id_apercierre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ventas
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
