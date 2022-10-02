/*
Navicat MySQL Data Transfer

Source Server         : localxamp
Source Server Version : 100422
Source Host           : localhost:3306
Source Database       : bdadu

Target Server Type    : MYSQL
Target Server Version : 100422
File Encoding         : 65001

Date: 2022-07-08 09:10:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aduana
-- ----------------------------
DROP TABLE IF EXISTS `aduana`;
CREATE TABLE `aduana` (
  `cod_adu` int(255) unsigned NOT NULL,
  `ciudad_cod_ciu` int(255) unsigned NOT NULL,
  `nacion_cod_nacion` int(255) unsigned NOT NULL,
  `aduana_cod_adu` int(255) unsigned NOT NULL,
  `descrip_adu` varchar(45) DEFAULT NULL,
  `nro_adu` varchar(45) DEFAULT NULL,
  `dir_adu` varchar(45) DEFAULT NULL,
  `telf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_adu`),
  KEY `aduana_FKIndex1` (`ciudad_cod_ciu`),
  KEY `fk_aduana_aduana1_idx` (`aduana_cod_adu`),
  KEY `fk_aduana_nacion1_idx` (`nacion_cod_nacion`),
  CONSTRAINT `aduana_ibfk_1` FOREIGN KEY (`ciudad_cod_ciu`) REFERENCES `ciudad` (`cod_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aduana_aduana1` FOREIGN KEY (`aduana_cod_adu`) REFERENCES `aduana` (`cod_adu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aduana_nacion1` FOREIGN KEY (`nacion_cod_nacion`) REFERENCES `nacion` (`cod_nacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aduana
-- ----------------------------

-- ----------------------------
-- Table structure for aper_cie
-- ----------------------------
DROP TABLE IF EXISTS `aper_cie`;
CREATE TABLE `aper_cie` (
  `cod_aper_cie` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `cod_usu` int(255) unsigned NOT NULL,
  `cod_caja` int(255) unsigned NOT NULL,
  `fecha_ape` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_cie` timestamp NULL DEFAULT NULL,
  `monto_ape` int(15) unsigned NOT NULL DEFAULT 0,
  `monto_cie` int(15) unsigned NOT NULL DEFAULT 0,
  `monto_efect` int(15) unsigned NOT NULL DEFAULT 0,
  `monto_cheque` int(15) unsigned NOT NULL DEFAULT 0,
  `monto_tarjeta` int(15) unsigned DEFAULT 0,
  `nro_lote` int(15) NOT NULL,
  PRIMARY KEY (`cod_aper_cie`),
  KEY `aper_cie_FKIndex1` (`cod_caja`),
  KEY `aper_cie_FKIndex2` (`cod_usu`),
  CONSTRAINT `aper_cie_ibfk_1` FOREIGN KEY (`cod_caja`) REFERENCES `caja` (`cod_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aper_cie_ibfk_2` FOREIGN KEY (`cod_usu`) REFERENCES `usuario` (`cod_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aper_cie
-- ----------------------------
INSERT INTO `aper_cie` VALUES ('1', '1', '1', '2022-03-07 11:05:00', null, '10000', '0', '0', '0', null, '0');
INSERT INTO `aper_cie` VALUES ('2', '1', '1', '2022-03-07 11:12:59', null, '10000', '0', '0', '0', '0', '0');
INSERT INTO `aper_cie` VALUES ('3', '1', '1', '2022-03-07 11:14:35', null, '10000', '0', '0', '0', '0', '0');
INSERT INTO `aper_cie` VALUES ('4', '1', '1', '2022-03-07 11:15:06', null, '10000', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for barrio
-- ----------------------------
DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
  `cod_barrio` int(255) NOT NULL,
  `nom_barrio` varchar(45) DEFAULT NULL,
  `ciudad_cod_ciu` int(255) unsigned NOT NULL,
  `departamento_cod_dpto` int(255) NOT NULL,
  PRIMARY KEY (`cod_barrio`),
  KEY `fk_barrio_ciudad1_idx` (`ciudad_cod_ciu`),
  KEY `fk_barrio_departamento1_idx` (`departamento_cod_dpto`),
  CONSTRAINT `fk_barrio_ciudad1` FOREIGN KEY (`ciudad_cod_ciu`) REFERENCES `ciudad` (`cod_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrio_departamento1` FOREIGN KEY (`departamento_cod_dpto`) REFERENCES `departamento` (`cod_dpto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of barrio
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caja
-- ----------------------------
INSERT INTO `caja` VALUES ('1', 'CAJA0', '0', 'A');

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `cod_cargo` int(255) NOT NULL AUTO_INCREMENT,
  `descrip_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'INFORMATICA');
INSERT INTO `cargo` VALUES ('4', 'ANALISTA FUNCIONAL');
INSERT INTO `cargo` VALUES ('6', 'RECEPCIÓN');

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `cod_ciu` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_ciu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ciu`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('1', 'ASUNCION');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cod_clie` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `nacionalidad_cod_nacion` int(255) unsigned NOT NULL,
  `ciudad_cod_ciu` int(255) unsigned NOT NULL,
  `denom_clie` varchar(45) DEFAULT NULL,
  `ruc_clie` varchar(45) DEFAULT NULL,
  `dir_clie` varchar(45) DEFAULT NULL,
  `mail_clie` varchar(45) DEFAULT NULL,
  `telf` varchar(45) DEFAULT NULL,
  `barrio_cod_barrio` int(8) NOT NULL,
  PRIMARY KEY (`cod_clie`),
  KEY `cliente_FKIndex1` (`ciudad_cod_ciu`),
  KEY `cliente_FKIndex2` (`nacionalidad_cod_nacion`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ciudad_cod_ciu`) REFERENCES `ciudad` (`cod_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`nacionalidad_cod_nacion`) REFERENCES `nacion` (`cod_nacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cliente
-- ----------------------------

-- ----------------------------
-- Table structure for cobros
-- ----------------------------
DROP TABLE IF EXISTS `cobros`;
CREATE TABLE `cobros` (
  `cod_cob` int(255) unsigned NOT NULL,
  `forma_cobro_cod_form_cob` int(255) unsigned NOT NULL,
  `cod_aper_cie` int(255) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto_cobro` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`cod_cob`),
  KEY `cobros_FKIndex1` (`cod_aper_cie`),
  KEY `cobros_FKIndex2` (`forma_cobro_cod_form_cob`),
  CONSTRAINT `cobros_ibfk_1` FOREIGN KEY (`cod_aper_cie`) REFERENCES `aper_cie` (`cod_aper_cie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cobros_ibfk_2` FOREIGN KEY (`forma_cobro_cod_form_cob`) REFERENCES `forma_cobro` (`cod_for_cob`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobros
-- ----------------------------

-- ----------------------------
-- Table structure for cobros_detalle
-- ----------------------------
DROP TABLE IF EXISTS `cobros_detalle`;
CREATE TABLE `cobros_detalle` (
  `cobros_cod_cob` int(255) unsigned NOT NULL,
  `cuenta_cobrar_cod_cuen_cob` int(255) unsigned NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `monto_vencimiento` int(15) DEFAULT NULL,
  `total_monto` int(15) DEFAULT NULL,
  PRIMARY KEY (`cobros_cod_cob`,`cuenta_cobrar_cod_cuen_cob`),
  KEY `cobros_has_cuenta_cobrar_FKIndex1` (`cobros_cod_cob`),
  KEY `cobros_has_cuenta_cobrar_FKIndex2` (`cuenta_cobrar_cod_cuen_cob`),
  CONSTRAINT `cobros_detalle_ibfk_1` FOREIGN KEY (`cobros_cod_cob`) REFERENCES `cobros` (`cod_cob`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cobros_detalle_ibfk_2` FOREIGN KEY (`cuenta_cobrar_cod_cuen_cob`) REFERENCES `cuenta_cobrar` (`cod_cuen_cob`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobros_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for condicion_pago
-- ----------------------------
DROP TABLE IF EXISTS `condicion_pago`;
CREATE TABLE `condicion_pago` (
  `cod_condi` int(255) unsigned NOT NULL,
  `descrip_condi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_condi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of condicion_pago
-- ----------------------------

-- ----------------------------
-- Table structure for cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE `cotizacion` (
  `cod_cotizacion` int(255) NOT NULL,
  `fecha_cotizacion` datetime NOT NULL,
  `moneda_cod_mone` int(15) NOT NULL,
  `monto_cotizacion` int(15) NOT NULL,
  PRIMARY KEY (`cod_cotizacion`,`fecha_cotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cotizacion
-- ----------------------------

-- ----------------------------
-- Table structure for cuenta_cobrar
-- ----------------------------
DROP TABLE IF EXISTS `cuenta_cobrar`;
CREATE TABLE `cuenta_cobrar` (
  `cod_cuen_cob` int(255) unsigned NOT NULL,
  `factura_cod_fac` int(255) unsigned NOT NULL,
  `monto` int(15) unsigned DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nro_cuota` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`cod_cuen_cob`),
  KEY `cuenta_cobrar_FKIndex1` (`factura_cod_fac`),
  CONSTRAINT `cuenta_cobrar_ibfk_1` FOREIGN KEY (`factura_cod_fac`) REFERENCES `factura` (`cod_fac`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuenta_cobrar
-- ----------------------------

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `cod_dpto` int(255) NOT NULL,
  `nom_dpto` varchar(45) DEFAULT NULL,
  `nacion_cod_nacion` int(255) unsigned NOT NULL,
  PRIMARY KEY (`cod_dpto`),
  KEY `fk_departamento_nacion1_idx` (`nacion_cod_nacion`),
  CONSTRAINT `fk_departamento_nacion1` FOREIGN KEY (`nacion_cod_nacion`) REFERENCES `nacion` (`cod_nacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departamento
-- ----------------------------

-- ----------------------------
-- Table structure for despacho
-- ----------------------------
DROP TABLE IF EXISTS `despacho`;
CREATE TABLE `despacho` (
  `cod_despa` int(255) unsigned NOT NULL,
  `invoice_cod_invo` int(255) unsigned NOT NULL,
  `modo_transporte_cod_mo_trans` int(255) unsigned NOT NULL,
  `moneda_cod_mone` int(255) unsigned NOT NULL,
  `aduana_cod_adu` int(255) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `nro_despa` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `val_impo` int(15) unsigned DEFAULT NULL,
  `tipo_cambio` int(15) unsigned DEFAULT NULL,
  `canal` varchar(45) DEFAULT NULL,
  `total` int(15) unsigned DEFAULT NULL,
  `liquidado_sn` varchar(45) DEFAULT 'N',
  PRIMARY KEY (`cod_despa`),
  KEY `despacho_FKIndex2` (`aduana_cod_adu`),
  KEY `despacho_FKIndex3` (`moneda_cod_mone`),
  KEY `despacho_FKIndex7` (`modo_transporte_cod_mo_trans`),
  KEY `despacho_FKIndex4` (`invoice_cod_invo`),
  CONSTRAINT `despacho_ibfk_1` FOREIGN KEY (`aduana_cod_adu`) REFERENCES `aduana` (`cod_adu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `despacho_ibfk_2` FOREIGN KEY (`moneda_cod_mone`) REFERENCES `moneda` (`cod_mone`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `despacho_ibfk_3` FOREIGN KEY (`modo_transporte_cod_mo_trans`) REFERENCES `modo_transporte` (`cod_mo_trans`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of despacho
-- ----------------------------

-- ----------------------------
-- Table structure for despacho_gastos
-- ----------------------------
DROP TABLE IF EXISTS `despacho_gastos`;
CREATE TABLE `despacho_gastos` (
  `despacho_cod_despa` int(255) unsigned NOT NULL,
  `otros_gastos_cod_gastos` int(255) unsigned NOT NULL,
  `monto_gasto` int(15) unsigned DEFAULT NULL,
  `despacho_gastos_despacho_cod_despa` int(255) unsigned NOT NULL,
  `despacho_gastos_otros_gastos_cod_gastos` int(255) unsigned NOT NULL,
  PRIMARY KEY (`despacho_cod_despa`,`otros_gastos_cod_gastos`),
  KEY `despacho_has_otros_gastos_FKIndex1` (`despacho_cod_despa`),
  KEY `despacho_has_otros_gastos_FKIndex2` (`otros_gastos_cod_gastos`),
  KEY `fk_despacho_gastos_despacho_gastos1_idx` (`despacho_gastos_despacho_cod_despa`,`despacho_gastos_otros_gastos_cod_gastos`),
  CONSTRAINT `despacho_gastos_ibfk_1` FOREIGN KEY (`despacho_cod_despa`) REFERENCES `despacho` (`cod_despa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `despacho_gastos_ibfk_2` FOREIGN KEY (`otros_gastos_cod_gastos`) REFERENCES `otros_gastos` (`cod_gastos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_despacho_gastos_despacho_gastos1` FOREIGN KEY (`despacho_gastos_despacho_cod_despa`, `despacho_gastos_otros_gastos_cod_gastos`) REFERENCES `despacho_gastos` (`despacho_cod_despa`, `otros_gastos_cod_gastos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of despacho_gastos
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', '1', '1', 'GONZALO GERMAN', 'MARECO SANDOVAL', '', null, '4717567');

-- ----------------------------
-- Table structure for empresa_consolidadora
-- ----------------------------
DROP TABLE IF EXISTS `empresa_consolidadora`;
CREATE TABLE `empresa_consolidadora` (
  `cod_conso` int(255) unsigned NOT NULL,
  `ciudad_cod_ciu` int(255) unsigned NOT NULL,
  `descrip_conso` varchar(45) DEFAULT NULL,
  `dir_conso` varchar(45) DEFAULT NULL,
  `telf` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_conso`),
  KEY `empresa_consolidadora_FKIndex1` (`ciudad_cod_ciu`),
  CONSTRAINT `empresa_consolidadora_ibfk_1` FOREIGN KEY (`ciudad_cod_ciu`) REFERENCES `ciudad` (`cod_ciu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresa_consolidadora
-- ----------------------------

-- ----------------------------
-- Table structure for expediente
-- ----------------------------
DROP TABLE IF EXISTS `expediente`;
CREATE TABLE `expediente` (
  `cod_expe` int(255) unsigned NOT NULL,
  `seccion_cod_sec` int(255) unsigned NOT NULL,
  `aduana_cod_adu` int(255) unsigned NOT NULL,
  `cliente_cod_clie` int(255) unsigned NOT NULL,
  `tipo_expediente_cod_tipo_expe` int(255) unsigned NOT NULL,
  `empleado_cod_emple` int(255) unsigned NOT NULL,
  `dna_expe` int(15) unsigned DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_expe`),
  KEY `expediente_FKIndex1` (`empleado_cod_emple`),
  KEY `expediente_FKIndex2` (`tipo_expediente_cod_tipo_expe`),
  KEY `expediente_FKIndex3` (`cliente_cod_clie`),
  KEY `expediente_FKIndex4` (`aduana_cod_adu`),
  KEY `expediente_FKIndex5` (`seccion_cod_sec`),
  CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`empleado_cod_emple`) REFERENCES `empleado` (`cod_emple`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_2` FOREIGN KEY (`tipo_expediente_cod_tipo_expe`) REFERENCES `tipo_expediente` (`cod_tipo_expe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_3` FOREIGN KEY (`cliente_cod_clie`) REFERENCES `cliente` (`cod_clie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_4` FOREIGN KEY (`aduana_cod_adu`) REFERENCES `aduana` (`cod_adu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_5` FOREIGN KEY (`seccion_cod_sec`) REFERENCES `seccion` (`cod_sec`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expediente
-- ----------------------------

-- ----------------------------
-- Table structure for factura
-- ----------------------------
DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `cod_fac` int(255) unsigned NOT NULL,
  `fecha_factura` date DEFAULT NULL,
  `estado_factura` varchar(45) DEFAULT NULL,
  `usuario_cod_usu` int(255) unsigned NOT NULL,
  `condicion_pago_cod_condi` int(255) unsigned NOT NULL,
  `forma_cobro_cod_form_cob1` int(255) unsigned NOT NULL,
  PRIMARY KEY (`cod_fac`),
  KEY `fk_factura_usuario1_idx` (`usuario_cod_usu`),
  KEY `fk_factura_condicion_pago1_idx` (`condicion_pago_cod_condi`),
  KEY `fk_factura_forma_cobro1_idx` (`forma_cobro_cod_form_cob1`),
  CONSTRAINT `fk_factura_condicion_pago1` FOREIGN KEY (`condicion_pago_cod_condi`) REFERENCES `condicion_pago` (`cod_condi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_forma_cobro1` FOREIGN KEY (`forma_cobro_cod_form_cob1`) REFERENCES `forma_cobro` (`cod_for_cob`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_usuario1` FOREIGN KEY (`usuario_cod_usu`) REFERENCES `usuario` (`cod_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factura
-- ----------------------------

-- ----------------------------
-- Table structure for factura_detalle
-- ----------------------------
DROP TABLE IF EXISTS `factura_detalle`;
CREATE TABLE `factura_detalle` (
  `descrip_fac_det` varchar(45) DEFAULT NULL,
  `cantidad_fac_det` int(15) DEFAULT NULL,
  `precio_uni_fac_det` int(15) DEFAULT NULL,
  `exentas_fac_det` int(15) DEFAULT NULL,
  `iva_5` int(15) DEFAULT NULL,
  `iva_10` int(15) DEFAULT NULL,
  `subtotal` int(15) DEFAULT NULL,
  `total_factura` int(15) DEFAULT NULL,
  `factura_cod_fac` int(255) unsigned NOT NULL,
  `liquidacion_presupuesto_cod_liqui` int(255) unsigned NOT NULL,
  PRIMARY KEY (`factura_cod_fac`,`liquidacion_presupuesto_cod_liqui`),
  KEY `fk_factura_detalle_factura1_idx` (`factura_cod_fac`),
  KEY `fk_factura_detalle_liquidacion_presupuesto1_idx` (`liquidacion_presupuesto_cod_liqui`),
  CONSTRAINT `fk_factura_detalle_factura1` FOREIGN KEY (`factura_cod_fac`) REFERENCES `factura` (`cod_fac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_detalle_liquidacion_presupuesto1` FOREIGN KEY (`liquidacion_presupuesto_cod_liqui`) REFERENCES `liquidacion_presupuesto` (`cod_liqui`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factura_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for forma_cobro
-- ----------------------------
DROP TABLE IF EXISTS `forma_cobro`;
CREATE TABLE `forma_cobro` (
  `cod_for_cob` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_for_cob` varchar(45) DEFAULT '',
  PRIMARY KEY (`cod_for_cob`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forma_cobro
-- ----------------------------
INSERT INTO `forma_cobro` VALUES ('1', 'Efectivo');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `cod_invo` int(255) unsigned NOT NULL,
  `nacion_cod_nacion` int(255) unsigned NOT NULL,
  `producto_cod_pro` int(255) unsigned NOT NULL,
  `vendedor_comprador_cod_ven` int(255) unsigned NOT NULL,
  `cliente_cod_clie` int(255) unsigned NOT NULL,
  `nro_invo` varchar(45) DEFAULT NULL,
  `fob` int(15) unsigned DEFAULT NULL,
  `flete` int(15) unsigned DEFAULT NULL,
  `seguro` int(15) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT 'IM',
  PRIMARY KEY (`cod_invo`),
  KEY `invoice_FKIndex1` (`cliente_cod_clie`),
  KEY `invoice_FKIndex2` (`vendedor_comprador_cod_ven`),
  KEY `invoice_FKIndex3` (`producto_cod_pro`),
  KEY `fk_invoice_nacion1_idx` (`nacion_cod_nacion`),
  CONSTRAINT `fk_invoice_nacion1` FOREIGN KEY (`nacion_cod_nacion`) REFERENCES `nacion` (`cod_nacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`cliente_cod_clie`) REFERENCES `cliente` (`cod_clie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`vendedor_comprador_cod_ven`) REFERENCES `vendedor_comprador` (`cod_ven`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`producto_cod_pro`) REFERENCES `producto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for liquidacion_gastos
-- ----------------------------
DROP TABLE IF EXISTS `liquidacion_gastos`;
CREATE TABLE `liquidacion_gastos` (
  `liquidacion_presupuesto_cod_liqui` int(255) unsigned NOT NULL,
  `otros_gastos_cod_gastos` int(255) unsigned NOT NULL,
  `monto_gasto` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`liquidacion_presupuesto_cod_liqui`,`otros_gastos_cod_gastos`),
  KEY `liquidacion_presupuesto_has_otros_gastos_FKIndex1` (`liquidacion_presupuesto_cod_liqui`),
  KEY `liquidacion_presupuesto_has_otros_gastos_FKIndex2` (`otros_gastos_cod_gastos`),
  CONSTRAINT `liquidacion_gastos_ibfk_1` FOREIGN KEY (`liquidacion_presupuesto_cod_liqui`) REFERENCES `liquidacion_presupuesto` (`cod_liqui`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `liquidacion_gastos_ibfk_2` FOREIGN KEY (`otros_gastos_cod_gastos`) REFERENCES `otros_gastos` (`cod_gastos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of liquidacion_gastos
-- ----------------------------

-- ----------------------------
-- Table structure for liquidacion_presupuesto
-- ----------------------------
DROP TABLE IF EXISTS `liquidacion_presupuesto`;
CREATE TABLE `liquidacion_presupuesto` (
  `cod_liqui` int(255) unsigned NOT NULL,
  `cod_empresa` int(255) NOT NULL,
  `despacho_cod_despa` int(255) unsigned NOT NULL,
  `fecha_liqui` date DEFAULT NULL,
  `honorario` int(255) unsigned DEFAULT NULL,
  `iva_hono` int(255) unsigned DEFAULT NULL,
  `total_liqui` int(255) unsigned DEFAULT NULL,
  `descrip_liqui` varchar(50) DEFAULT NULL,
  `facturado_sn` varchar(50) DEFAULT NULL,
  `presupuesto_estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_liqui`),
  KEY `liquidacion_FKIndex1` (`despacho_cod_despa`),
  CONSTRAINT `liquidacion_presupuesto_ibfk_1` FOREIGN KEY (`despacho_cod_despa`) REFERENCES `despacho` (`cod_despa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of liquidacion_presupuesto
-- ----------------------------

-- ----------------------------
-- Table structure for logeo
-- ----------------------------
DROP TABLE IF EXISTS `logeo`;
CREATE TABLE `logeo` (
  `usuario_logeo` varchar(255) NOT NULL,
  `fecha_logeo` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logeo
-- ----------------------------

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `cod_marca` int(255) unsigned NOT NULL,
  `descrip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marca
-- ----------------------------

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
INSERT INTO `menu` VALUES ('1', 'Operaciones', '1');
INSERT INTO `menu` VALUES ('3', 'Reportes', '1');
INSERT INTO `menu` VALUES ('4', 'Mantenimientos', '1');

-- ----------------------------
-- Table structure for menuitem
-- ----------------------------
DROP TABLE IF EXISTS `menuitem`;
CREATE TABLE `menuitem` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  `id_menu` int(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menuitem
-- ----------------------------
INSERT INTO `menuitem` VALUES ('0', 'Mantener Proveedor', '4', '/recursos/html/Mantener_proveedor.html');
INSERT INTO `menuitem` VALUES ('1', 'Caja', '1', 'recursos/html/caja.html');
INSERT INTO `menuitem` VALUES ('2', 'ventas', '1', 'recursos/html/Venta.html');
INSERT INTO `menuitem` VALUES ('3', 'Anulacion', '1', 'html/mantener');
INSERT INTO `menuitem` VALUES ('5', 'Gestor Reportes', '3', 'html/mantener');
INSERT INTO `menuitem` VALUES ('6', 'Mantener Clientes', '4', 'recursos/html/Mantener_clientes.html');
INSERT INTO `menuitem` VALUES ('7', 'Mantener Usuarios ', '4', 'recursos/html/Mantener_usuarios.html');
INSERT INTO `menuitem` VALUES ('8', 'Mantener Perfiles', '4', 'recursos/html/Mantener_perfil.html');
INSERT INTO `menuitem` VALUES ('9', 'Mantener Ciudad', '4', 'recursos/html/Mantener_ciudad.html');
INSERT INTO `menuitem` VALUES ('10', 'Mantener Deposito', '4', 'recursos/html/Mantener_deposito.html');
INSERT INTO `menuitem` VALUES ('11', 'Mantener Funcionarios', '4', 'recursos/html/Mantener_funcionarios.html');
INSERT INTO `menuitem` VALUES ('12', 'Mantener Mercaderia ', '4', 'recursos/html/Mantener_mercaderia.html');
INSERT INTO `menuitem` VALUES ('13', 'Mantener Proveedor', '4', 'recursos/html/Mantener_proveedor.html');
INSERT INTO `menuitem` VALUES ('15', 'Comprar', '1', 'recursos/html/Compra.html');
INSERT INTO `menuitem` VALUES ('16', 'Mantener Caja', '4', 'recursos/html/Mantener_caja.html');
INSERT INTO `menuitem` VALUES ('17', 'Mantener Cargo', '4', 'recursos/html/Mantener_cargo.html');
INSERT INTO `menuitem` VALUES ('18', 'Mantemer Forma de Cobro', '4', 'recursos/html/Mantener_formaCobro.html');

-- ----------------------------
-- Table structure for modo_transporte
-- ----------------------------
DROP TABLE IF EXISTS `modo_transporte`;
CREATE TABLE `modo_transporte` (
  `cod_mo_trans` int(255) unsigned NOT NULL,
  `descrip_mo_trans` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_mo_trans`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modo_transporte
-- ----------------------------

-- ----------------------------
-- Table structure for moneda
-- ----------------------------
DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda` (
  `cod_mone` int(255) unsigned NOT NULL,
  `descrip_mone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_mone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of moneda
-- ----------------------------

-- ----------------------------
-- Table structure for nacion
-- ----------------------------
DROP TABLE IF EXISTS `nacion`;
CREATE TABLE `nacion` (
  `cod_nacion` int(255) unsigned NOT NULL,
  `descrip_nacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_nacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nacion
-- ----------------------------

-- ----------------------------
-- Table structure for otros_gastos
-- ----------------------------
DROP TABLE IF EXISTS `otros_gastos`;
CREATE TABLE `otros_gastos` (
  `cod_gastos` int(255) unsigned NOT NULL,
  `descrip_gastos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_gastos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of otros_gastos
-- ----------------------------

-- ----------------------------
-- Table structure for perfil_usuario
-- ----------------------------
DROP TABLE IF EXISTS `perfil_usuario`;
CREATE TABLE `perfil_usuario` (
  `cod_perfil_usu` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_perfil` varchar(45) DEFAULT '',
  PRIMARY KEY (`cod_perfil_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perfil_usuario
-- ----------------------------
INSERT INTO `perfil_usuario` VALUES ('1', 'ADMIN');
INSERT INTO `perfil_usuario` VALUES ('2', 'OPERACIONES');
INSERT INTO `perfil_usuario` VALUES ('3', 'ADMINISTRATIVOS');

-- ----------------------------
-- Table structure for permisomenu
-- ----------------------------
DROP TABLE IF EXISTS `permisomenu`;
CREATE TABLE `permisomenu` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `cod_perfil_usu` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idorden`,`cod_perfil_usu`,`id`),
  KEY `menuiten_permisomenu_fk` (`id`),
  KEY `perfiles_permisomenu_fk` (`cod_perfil_usu`),
  CONSTRAINT `menuiten_permisomenu_fk` FOREIGN KEY (`id`) REFERENCES `menuitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisomenu
-- ----------------------------
INSERT INTO `permisomenu` VALUES ('1', '1', '2', '1');
INSERT INTO `permisomenu` VALUES ('2', '1', '1', '1');
INSERT INTO `permisomenu` VALUES ('3', '1', '6', '1');
INSERT INTO `permisomenu` VALUES ('4', '1', '5', '1');
INSERT INTO `permisomenu` VALUES ('7', '1', '7', '1');
INSERT INTO `permisomenu` VALUES ('8', '1', '8', '1');
INSERT INTO `permisomenu` VALUES ('9', '1', '9', '1');
INSERT INTO `permisomenu` VALUES ('10', '1', '10', '1');
INSERT INTO `permisomenu` VALUES ('11', '1', '12', '1');
INSERT INTO `permisomenu` VALUES ('12', '1', '11', '1');
INSERT INTO `permisomenu` VALUES ('13', '1', '9', '1');
INSERT INTO `permisomenu` VALUES ('14', '1', '13', '1');
INSERT INTO `permisomenu` VALUES ('15', '1', '15', '1');
INSERT INTO `permisomenu` VALUES ('16', '1', '9', '1');
INSERT INTO `permisomenu` VALUES ('17', '1', '17', '1');
INSERT INTO `permisomenu` VALUES ('18', '1', '18', '1');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `cod_pro` int(255) unsigned NOT NULL,
  `tipo_producto_cod_tipo_pro` int(255) unsigned NOT NULL,
  `marca_cod_marca` int(255) unsigned NOT NULL,
  `descrip_pro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pro`),
  KEY `producto_FKIndex1` (`tipo_producto_cod_tipo_pro`),
  KEY `fk_producto_marca1_idx` (`marca_cod_marca`),
  CONSTRAINT `fk_producto_marca1` FOREIGN KEY (`marca_cod_marca`) REFERENCES `marca` (`cod_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipo_producto_cod_tipo_pro`) REFERENCES `tipo_producto` (`cod_tipo_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of producto
-- ----------------------------

-- ----------------------------
-- Table structure for seccion
-- ----------------------------
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `cod_sec` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `descrip_sec` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_sec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of seccion
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_expediente
-- ----------------------------
DROP TABLE IF EXISTS `tipo_expediente`;
CREATE TABLE `tipo_expediente` (
  `cod_tipo_expe` int(255) unsigned NOT NULL,
  `descrip_tipo_expe` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_expe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_expediente
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_producto
-- ----------------------------
DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE `tipo_producto` (
  `cod_tipo_pro` int(255) unsigned NOT NULL,
  `descrip` varchar(45) DEFAULT NULL,
  `nro_partida` varchar(45) DEFAULT '',
  PRIMARY KEY (`cod_tipo_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_producto
-- ----------------------------

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

-- ----------------------------
-- Table structure for vendedor_comprador
-- ----------------------------
DROP TABLE IF EXISTS `vendedor_comprador`;
CREATE TABLE `vendedor_comprador` (
  `cod_ven` int(255) unsigned NOT NULL,
  `nacionalidad_cod_nacion` int(255) unsigned NOT NULL,
  `descrip_ven` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_ven`),
  KEY `vendedor_comprador_FKIndex1` (`nacionalidad_cod_nacion`),
  CONSTRAINT `vendedor_comprador_ibfk_1` FOREIGN KEY (`nacionalidad_cod_nacion`) REFERENCES `nacion` (`cod_nacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vendedor_comprador
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
