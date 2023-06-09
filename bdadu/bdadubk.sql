-- MySQL Script generated by MySQL Workbench
-- Thu Apr 18 17:26:16 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bdadu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdadu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdadu` DEFAULT CHARACTER SET utf8 ;
USE `bdadu` ;

-- -----------------------------------------------------
-- Table `bdadu`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`ciudad` (
  `cod_ciu` INT(255) UNSIGNED NOT NULL,
  `descrip_ciu` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_ciu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`nacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`nacion` (
  `cod_nacion` INT(255) UNSIGNED NOT NULL,
  `descrip_nacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_nacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`aduana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`aduana` (
  `cod_adu` INT(255) UNSIGNED NOT NULL,
  `ciudad_cod_ciu` INT(255) UNSIGNED NOT NULL,
  `nacion_cod_nacion` INT(255) UNSIGNED NOT NULL,
  `aduana_cod_adu` INT(255) UNSIGNED NOT NULL,
  `descrip_adu` VARCHAR(45) NULL DEFAULT NULL,
  `nro_adu` VARCHAR(45) NULL DEFAULT NULL,
  `dir_adu` VARCHAR(45) NULL DEFAULT NULL,
  `telf` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_adu`),
  INDEX `aduana_FKIndex1` (`ciudad_cod_ciu` ASC),
  INDEX `fk_aduana_aduana1_idx` (`aduana_cod_adu` ASC),
  INDEX `fk_aduana_nacion1_idx` (`nacion_cod_nacion` ASC),
  CONSTRAINT `aduana_ibfk_1`
    FOREIGN KEY (`ciudad_cod_ciu`)
    REFERENCES `bdadu`.`ciudad` (`cod_ciu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aduana_aduana1`
    FOREIGN KEY (`aduana_cod_adu`)
    REFERENCES `bdadu`.`aduana` (`cod_adu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aduana_nacion1`
    FOREIGN KEY (`nacion_cod_nacion`)
    REFERENCES `bdadu`.`nacion` (`cod_nacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`caja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`caja` (
  `cod_caja` INT(255) UNSIGNED NOT NULL,
  `descrip_caja` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_caja`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`perfil_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`perfil_usuario` (
  `cod_perfil_usu` INT(255) UNSIGNED NOT NULL,
  `descrip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_perfil_usu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`usuario` (
  `cod_usu` INT(255) UNSIGNED NOT NULL,
  `perfil_usuario_cod_perfil_usu` INT(255) UNSIGNED NOT NULL,
  `cod_empresa` INT(255) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `nro_documento` VARCHAR(45) NULL DEFAULT NULL,
  `clave` VARCHAR(45) NULL DEFAULT NULL,
  `estado_usu` VARCHAR(45) NULL DEFAULT 'A',
  `fecha_alta` DATE NULL DEFAULT NULL,
  `usuariocol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  INDEX `fk_usuario_perfil_usuario1_idx` (`perfil_usuario_cod_perfil_usu` ASC),
  CONSTRAINT `fk_usuario_perfil_usuario1`
    FOREIGN KEY (`perfil_usuario_cod_perfil_usu`)
    REFERENCES `bdadu`.`perfil_usuario` (`cod_perfil_usu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`aper_cie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`aper_cie` (
  `cod_aper_cie` INT(255) UNSIGNED NOT NULL,
  `usuario_cod_usu` INT(255) UNSIGNED NOT NULL,
  `caja_cod_caja` INT(255) UNSIGNED NOT NULL,
  `fecha_ape` DATETIME NOT NULL,
  `fecha_cie` DATETIME NULL DEFAULT NULL,
  `monto_ape` INT(15) UNSIGNED NULL DEFAULT NULL,
  `monto_cie` INT(15) UNSIGNED NULL DEFAULT NULL,
  `monto_efect` INT(15) UNSIGNED NULL DEFAULT NULL,
  `monto_cheque` INT(15) UNSIGNED NULL DEFAULT NULL,
  `monto_tarjeta` INT(15) UNSIGNED NULL DEFAULT NULL,
  `nro_lote` INT(15) NOT NULL,
  PRIMARY KEY (`cod_aper_cie`),
  INDEX `aper_cie_FKIndex1` (`caja_cod_caja` ASC),
  INDEX `aper_cie_FKIndex2` (`usuario_cod_usu` ASC),
  CONSTRAINT `aper_cie_ibfk_1`
    FOREIGN KEY (`caja_cod_caja`)
    REFERENCES `bdadu`.`caja` (`cod_caja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `aper_cie_ibfk_2`
    FOREIGN KEY (`usuario_cod_usu`)
    REFERENCES `bdadu`.`usuario` (`cod_usu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`departamento` (
  `cod_dpto` INT(255) NOT NULL,
  `nom_dpto` VARCHAR(45) NULL DEFAULT NULL,
  `nacion_cod_nacion` INT(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_dpto`),
  INDEX `fk_departamento_nacion1_idx` (`nacion_cod_nacion` ASC),
  CONSTRAINT `fk_departamento_nacion1`
    FOREIGN KEY (`nacion_cod_nacion`)
    REFERENCES `bdadu`.`nacion` (`cod_nacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`barrio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`barrio` (
  `cod_barrio` INT(255) NOT NULL,
  `nom_barrio` VARCHAR(45) NULL DEFAULT NULL,
  `ciudad_cod_ciu` INT(255) UNSIGNED NOT NULL,
  `departamento_cod_dpto` INT(255) NOT NULL,
  PRIMARY KEY (`cod_barrio`),
  INDEX `fk_barrio_ciudad1_idx` (`ciudad_cod_ciu` ASC),
  INDEX `fk_barrio_departamento1_idx` (`departamento_cod_dpto` ASC),
  CONSTRAINT `fk_barrio_ciudad1`
    FOREIGN KEY (`ciudad_cod_ciu`)
    REFERENCES `bdadu`.`ciudad` (`cod_ciu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrio_departamento1`
    FOREIGN KEY (`departamento_cod_dpto`)
    REFERENCES `bdadu`.`departamento` (`cod_dpto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cargo` (
  `cod_cargo` INT(255) NOT NULL,
  `descrip_cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_cargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cliente` (
  `cod_clie` INT(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nacionalidad_cod_nacion` INT(255) UNSIGNED NOT NULL,
  `ciudad_cod_ciu` INT(255) UNSIGNED NOT NULL,
  `denom_clie` VARCHAR(45) NULL DEFAULT NULL,
  `ruc_clie` VARCHAR(45) NULL DEFAULT NULL,
  `dir_clie` VARCHAR(45) NULL DEFAULT NULL,
  `mail_clie` VARCHAR(45) NULL DEFAULT NULL,
  `telf` VARCHAR(45) NULL DEFAULT NULL,
  `barrio_cod_barrio` INT(8) NOT NULL,
  PRIMARY KEY (`cod_clie`),
  INDEX `cliente_FKIndex1` (`ciudad_cod_ciu` ASC),
  INDEX `cliente_FKIndex2` (`nacionalidad_cod_nacion` ASC),
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`ciudad_cod_ciu`)
    REFERENCES `bdadu`.`ciudad` (`cod_ciu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cliente_ibfk_2`
    FOREIGN KEY (`nacionalidad_cod_nacion`)
    REFERENCES `bdadu`.`nacion` (`cod_nacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`forma_cobro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`forma_cobro` (
  `cod_form_cob` INT(255) UNSIGNED NOT NULL,
  `descrip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_form_cob`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cobros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cobros` (
  `cod_cob` INT(255) UNSIGNED NOT NULL,
  `forma_cobro_cod_form_cob` INT(255) UNSIGNED NOT NULL,
  `aper_cie_cod_aper_cie` INT(255) UNSIGNED NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `monto_cobro` INT(15) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`cod_cob`),
  INDEX `cobros_FKIndex1` (`aper_cie_cod_aper_cie` ASC),
  INDEX `cobros_FKIndex2` (`forma_cobro_cod_form_cob` ASC),
  CONSTRAINT `cobros_ibfk_1`
    FOREIGN KEY (`aper_cie_cod_aper_cie`)
    REFERENCES `bdadu`.`aper_cie` (`cod_aper_cie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cobros_ibfk_2`
    FOREIGN KEY (`forma_cobro_cod_form_cob`)
    REFERENCES `bdadu`.`forma_cobro` (`cod_form_cob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`condicion_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`condicion_pago` (
  `cod_condi` INT(255) UNSIGNED NOT NULL,
  `descrip_condi` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_condi`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`factura` (
  `cod_fac` INT(255) UNSIGNED NOT NULL,
  `fecha_factura` DATE NULL DEFAULT NULL,
  `estado_factura` VARCHAR(45) NULL DEFAULT NULL,
  `usuario_cod_usu` INT(255) UNSIGNED NOT NULL,
  `condicion_pago_cod_condi` INT(255) UNSIGNED NOT NULL,
  `forma_cobro_cod_form_cob1` INT(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_fac`),
  INDEX `fk_factura_usuario1_idx` (`usuario_cod_usu` ASC),
  INDEX `fk_factura_condicion_pago1_idx` (`condicion_pago_cod_condi` ASC),
  INDEX `fk_factura_forma_cobro1_idx` (`forma_cobro_cod_form_cob1` ASC),
  CONSTRAINT `fk_factura_condicion_pago1`
    FOREIGN KEY (`condicion_pago_cod_condi`)
    REFERENCES `bdadu`.`condicion_pago` (`cod_condi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_forma_cobro1`
    FOREIGN KEY (`forma_cobro_cod_form_cob1`)
    REFERENCES `bdadu`.`forma_cobro` (`cod_form_cob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_usuario1`
    FOREIGN KEY (`usuario_cod_usu`)
    REFERENCES `bdadu`.`usuario` (`cod_usu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cuenta_cobrar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cuenta_cobrar` (
  `cod_cuen_cob` INT(255) UNSIGNED NOT NULL,
  `factura_cod_fac` INT(255) UNSIGNED NOT NULL,
  `monto` INT(15) UNSIGNED NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `nro_cuota` INT(15) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`cod_cuen_cob`),
  INDEX `cuenta_cobrar_FKIndex1` (`factura_cod_fac` ASC),
  CONSTRAINT `cuenta_cobrar_ibfk_1`
    FOREIGN KEY (`factura_cod_fac`)
    REFERENCES `bdadu`.`factura` (`cod_fac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cobros_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cobros_detalle` (
  `cobros_cod_cob` INT(255) UNSIGNED NOT NULL,
  `cuenta_cobrar_cod_cuen_cob` INT(255) UNSIGNED NOT NULL,
  `fecha_vencimiento` DATE NULL DEFAULT NULL,
  `monto_vencimiento` INT(15) NULL DEFAULT NULL,
  `total_monto` INT(15) NULL DEFAULT NULL,
  PRIMARY KEY (`cobros_cod_cob`, `cuenta_cobrar_cod_cuen_cob`),
  INDEX `cobros_has_cuenta_cobrar_FKIndex1` (`cobros_cod_cob` ASC),
  INDEX `cobros_has_cuenta_cobrar_FKIndex2` (`cuenta_cobrar_cod_cuen_cob` ASC),
  CONSTRAINT `cobros_detalle_ibfk_1`
    FOREIGN KEY (`cobros_cod_cob`)
    REFERENCES `bdadu`.`cobros` (`cod_cob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cobros_detalle_ibfk_2`
    FOREIGN KEY (`cuenta_cobrar_cod_cuen_cob`)
    REFERENCES `bdadu`.`cuenta_cobrar` (`cod_cuen_cob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`cotizacion` (
  `cod_cotizacion` INT(255) NOT NULL,
  `fecha_cotizacion` DATETIME NOT NULL,
  `moneda_cod_mone` INT(15) NOT NULL,
  `monto_cotizacion` INT(15) NOT NULL,
  PRIMARY KEY (`cod_cotizacion`, `fecha_cotizacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`moneda` (
  `cod_mone` INT(255) UNSIGNED NOT NULL,
  `descrip_mone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_mone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`modo_transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`modo_transporte` (
  `cod_mo_trans` INT(255) UNSIGNED NOT NULL,
  `descrip_mo_trans` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_mo_trans`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`despacho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`despacho` (
  `cod_despa` INT(255) UNSIGNED NOT NULL,
  `invoice_cod_invo` INT(255) UNSIGNED NOT NULL,
  `modo_transporte_cod_mo_trans` INT(255) UNSIGNED NOT NULL,
  `moneda_cod_mone` INT(255) UNSIGNED NOT NULL,
  `aduana_cod_adu` INT(255) UNSIGNED NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `nro_despa` VARCHAR(45) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `val_impo` INT(15) UNSIGNED NULL DEFAULT NULL,
  `tipo_cambio` INT(15) UNSIGNED NULL DEFAULT NULL,
  `canal` VARCHAR(45) NULL DEFAULT NULL,
  `total` INT(15) UNSIGNED NULL DEFAULT NULL,
  `liquidado_sn` VARCHAR(45) NULL DEFAULT 'N',
  PRIMARY KEY (`cod_despa`),
  INDEX `despacho_FKIndex2` (`aduana_cod_adu` ASC),
  INDEX `despacho_FKIndex3` (`moneda_cod_mone` ASC),
  INDEX `despacho_FKIndex7` (`modo_transporte_cod_mo_trans` ASC),
  INDEX `despacho_FKIndex4` (`invoice_cod_invo` ASC),
  CONSTRAINT `despacho_ibfk_1`
    FOREIGN KEY (`aduana_cod_adu`)
    REFERENCES `bdadu`.`aduana` (`cod_adu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `despacho_ibfk_2`
    FOREIGN KEY (`moneda_cod_mone`)
    REFERENCES `bdadu`.`moneda` (`cod_mone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `despacho_ibfk_3`
    FOREIGN KEY (`modo_transporte_cod_mo_trans`)
    REFERENCES `bdadu`.`modo_transporte` (`cod_mo_trans`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`otros_gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`otros_gastos` (
  `cod_gastos` INT(255) UNSIGNED NOT NULL,
  `descrip_gastos` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_gastos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`despacho_gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`despacho_gastos` (
  `despacho_cod_despa` INT(255) UNSIGNED NOT NULL,
  `otros_gastos_cod_gastos` INT(255) UNSIGNED NOT NULL,
  `monto_gasto` INT(15) UNSIGNED NULL DEFAULT NULL,
  `despacho_gastos_despacho_cod_despa` INT(255) UNSIGNED NOT NULL,
  `despacho_gastos_otros_gastos_cod_gastos` INT(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`despacho_cod_despa`, `otros_gastos_cod_gastos`),
  INDEX `despacho_has_otros_gastos_FKIndex1` (`despacho_cod_despa` ASC),
  INDEX `despacho_has_otros_gastos_FKIndex2` (`otros_gastos_cod_gastos` ASC),
  INDEX `fk_despacho_gastos_despacho_gastos1_idx` (`despacho_gastos_despacho_cod_despa` ASC, `despacho_gastos_otros_gastos_cod_gastos` ASC),
  CONSTRAINT `despacho_gastos_ibfk_1`
    FOREIGN KEY (`despacho_cod_despa`)
    REFERENCES `bdadu`.`despacho` (`cod_despa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `despacho_gastos_ibfk_2`
    FOREIGN KEY (`otros_gastos_cod_gastos`)
    REFERENCES `bdadu`.`otros_gastos` (`cod_gastos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_despacho_gastos_despacho_gastos1`
    FOREIGN KEY (`despacho_gastos_despacho_cod_despa` , `despacho_gastos_otros_gastos_cod_gastos`)
    REFERENCES `bdadu`.`despacho_gastos` (`despacho_cod_despa` , `otros_gastos_cod_gastos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`empleado` (
  `cod_emple` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ciudad_cod_ciu` INT(8) UNSIGNED NOT NULL,
  `cargo_cod_cargo` INT(8) NOT NULL,
  `nom_emple` VARCHAR(30) NULL DEFAULT NULL,
  `ape_emple` VARCHAR(30) NULL DEFAULT NULL,
  `dir_emple` VARCHAR(40) NULL DEFAULT NULL,
  `telf` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_emple`),
  INDEX `empleado_FKIndex1` (`ciudad_cod_ciu` ASC),
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`ciudad_cod_ciu`)
    REFERENCES `bdadu`.`ciudad` (`cod_ciu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`empresa_consolidadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`empresa_consolidadora` (
  `cod_conso` INT(255) UNSIGNED NOT NULL,
  `ciudad_cod_ciu` INT(255) UNSIGNED NOT NULL,
  `descrip_conso` VARCHAR(45) NULL DEFAULT NULL,
  `dir_conso` VARCHAR(45) NULL DEFAULT NULL,
  `telf` VARCHAR(45) NULL DEFAULT NULL,
  `mail` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_conso`),
  INDEX `empresa_consolidadora_FKIndex1` (`ciudad_cod_ciu` ASC),
  CONSTRAINT `empresa_consolidadora_ibfk_1`
    FOREIGN KEY (`ciudad_cod_ciu`)
    REFERENCES `bdadu`.`ciudad` (`cod_ciu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`tipo_expediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`tipo_expediente` (
  `cod_tipo_expe` INT(255) UNSIGNED NOT NULL,
  `descrip_tipo_expe` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_expe`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`seccion` (
  `cod_sec` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `descrip_sec` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_sec`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`expediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`expediente` (
  `cod_expe` INT(255) UNSIGNED NOT NULL,
  `seccion_cod_sec` INT(255) UNSIGNED NOT NULL,
  `aduana_cod_adu` INT(255) UNSIGNED NOT NULL,
  `cliente_cod_clie` INT(255) UNSIGNED NOT NULL,
  `tipo_expediente_cod_tipo_expe` INT(255) UNSIGNED NOT NULL,
  `empleado_cod_emple` INT(255) UNSIGNED NOT NULL,
  `dna_expe` INT(15) UNSIGNED NULL DEFAULT NULL,
  `fecha_entrada` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_expe`),
  INDEX `expediente_FKIndex1` (`empleado_cod_emple` ASC),
  INDEX `expediente_FKIndex2` (`tipo_expediente_cod_tipo_expe` ASC),
  INDEX `expediente_FKIndex3` (`cliente_cod_clie` ASC),
  INDEX `expediente_FKIndex4` (`aduana_cod_adu` ASC),
  INDEX `expediente_FKIndex5` (`seccion_cod_sec` ASC),
  CONSTRAINT `expediente_ibfk_1`
    FOREIGN KEY (`empleado_cod_emple`)
    REFERENCES `bdadu`.`empleado` (`cod_emple`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_2`
    FOREIGN KEY (`tipo_expediente_cod_tipo_expe`)
    REFERENCES `bdadu`.`tipo_expediente` (`cod_tipo_expe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_3`
    FOREIGN KEY (`cliente_cod_clie`)
    REFERENCES `bdadu`.`cliente` (`cod_clie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_4`
    FOREIGN KEY (`aduana_cod_adu`)
    REFERENCES `bdadu`.`aduana` (`cod_adu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `expediente_ibfk_5`
    FOREIGN KEY (`seccion_cod_sec`)
    REFERENCES `bdadu`.`seccion` (`cod_sec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`liquidacion_presupuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`liquidacion_presupuesto` (
  `cod_liqui` INT(255) UNSIGNED NOT NULL,
  `cod_empresa` INT(255) NOT NULL,
  `despacho_cod_despa` INT(255) UNSIGNED NOT NULL,
  `fecha_liqui` DATE NULL DEFAULT NULL,
  `honorario` INT(255) UNSIGNED NULL DEFAULT NULL,
  `iva_hono` INT(255) UNSIGNED NULL DEFAULT NULL,
  `total_liqui` INT(255) UNSIGNED NULL DEFAULT NULL,
  `descrip_liqui` VARCHAR(50) NULL DEFAULT NULL,
  `facturado_sn` VARCHAR(50) NULL DEFAULT NULL,
  `presupuesto_estado` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_liqui`),
  INDEX `liquidacion_FKIndex1` (`despacho_cod_despa` ASC),
  CONSTRAINT `liquidacion_presupuesto_ibfk_1`
    FOREIGN KEY (`despacho_cod_despa`)
    REFERENCES `bdadu`.`despacho` (`cod_despa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`factura_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`factura_detalle` (
  `descrip_fac_det` VARCHAR(45) NULL DEFAULT NULL,
  `cantidad_fac_det` INT(15) NULL DEFAULT NULL,
  `precio_uni_fac_det` INT(15) NULL DEFAULT NULL,
  `exentas_fac_det` INT(15) NULL DEFAULT NULL,
  `iva_5` INT(15) NULL DEFAULT NULL,
  `iva_10` INT(15) NULL DEFAULT NULL,
  `subtotal` INT(15) NULL DEFAULT NULL,
  `total_factura` INT(15) NULL DEFAULT NULL,
  `factura_cod_fac` INT(255) UNSIGNED NOT NULL,
  `liquidacion_presupuesto_cod_liqui` INT(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`factura_cod_fac`, `liquidacion_presupuesto_cod_liqui`),
  INDEX `fk_factura_detalle_factura1_idx` (`factura_cod_fac` ASC),
  INDEX `fk_factura_detalle_liquidacion_presupuesto1_idx` (`liquidacion_presupuesto_cod_liqui` ASC),
  CONSTRAINT `fk_factura_detalle_factura1`
    FOREIGN KEY (`factura_cod_fac`)
    REFERENCES `bdadu`.`factura` (`cod_fac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_detalle_liquidacion_presupuesto1`
    FOREIGN KEY (`liquidacion_presupuesto_cod_liqui`)
    REFERENCES `bdadu`.`liquidacion_presupuesto` (`cod_liqui`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdadu`.`vendedor_comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`vendedor_comprador` (
  `cod_ven` INT(255) UNSIGNED NOT NULL,
  `nacionalidad_cod_nacion` INT(255) UNSIGNED NOT NULL,
  `descrip_ven` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_ven`),
  INDEX `vendedor_comprador_FKIndex1` (`nacionalidad_cod_nacion` ASC),
  CONSTRAINT `vendedor_comprador_ibfk_1`
    FOREIGN KEY (`nacionalidad_cod_nacion`)
    REFERENCES `bdadu`.`nacion` (`cod_nacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`marca` (
  `cod_marca` INT(255) UNSIGNED NOT NULL,
  `descrip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`tipo_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`tipo_producto` (
  `cod_tipo_pro` INT(255) UNSIGNED NOT NULL,
  `descrip` VARCHAR(45) NULL DEFAULT NULL,
  `partida` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_pro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`producto` (
  `cod_pro` INT(255) UNSIGNED NOT NULL,
  `tipo_producto_cod_tipo_pro` INT(255) UNSIGNED NOT NULL,
  `marca_cod_marca` INT(255) UNSIGNED NOT NULL,
  `descrip_pro` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_pro`),
  INDEX `producto_FKIndex1` (`tipo_producto_cod_tipo_pro` ASC),
  INDEX `fk_producto_marca1_idx` (`marca_cod_marca` ASC),
  CONSTRAINT `fk_producto_marca1`
    FOREIGN KEY (`marca_cod_marca`)
    REFERENCES `bdadu`.`marca` (`cod_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `producto_ibfk_1`
    FOREIGN KEY (`tipo_producto_cod_tipo_pro`)
    REFERENCES `bdadu`.`tipo_producto` (`cod_tipo_pro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`invoice` (
  `cod_invo` INT(255) UNSIGNED NOT NULL,
  `nacion_cod_nacion` INT(255) UNSIGNED NOT NULL,
  `producto_cod_pro` INT(255) UNSIGNED NOT NULL,
  `vendedor_comprador_cod_ven` INT(255) UNSIGNED NOT NULL,
  `cliente_cod_clie` INT(255) UNSIGNED NOT NULL,
  `nro_invo` VARCHAR(45) NULL DEFAULT NULL,
  `fob` INT(15) UNSIGNED NULL DEFAULT NULL,
  `flete` INT(15) UNSIGNED NULL DEFAULT NULL,
  `seguro` INT(15) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT 'IM',
  PRIMARY KEY (`cod_invo`),
  INDEX `invoice_FKIndex1` (`cliente_cod_clie` ASC),
  INDEX `invoice_FKIndex2` (`vendedor_comprador_cod_ven` ASC),
  INDEX `invoice_FKIndex3` (`producto_cod_pro` ASC),
  INDEX `fk_invoice_nacion1_idx` (`nacion_cod_nacion` ASC),
  CONSTRAINT `fk_invoice_nacion1`
    FOREIGN KEY (`nacion_cod_nacion`)
    REFERENCES `bdadu`.`nacion` (`cod_nacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_1`
    FOREIGN KEY (`cliente_cod_clie`)
    REFERENCES `bdadu`.`cliente` (`cod_clie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_2`
    FOREIGN KEY (`vendedor_comprador_cod_ven`)
    REFERENCES `bdadu`.`vendedor_comprador` (`cod_ven`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoice_ibfk_3`
    FOREIGN KEY (`producto_cod_pro`)
    REFERENCES `bdadu`.`producto` (`cod_pro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`liquidacion_gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`liquidacion_gastos` (
  `liquidacion_presupuesto_cod_liqui` INT(255) UNSIGNED NOT NULL,
  `otros_gastos_cod_gastos` INT(255) UNSIGNED NOT NULL,
  `monto_gasto` INT(15) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`liquidacion_presupuesto_cod_liqui`, `otros_gastos_cod_gastos`),
  INDEX `liquidacion_presupuesto_has_otros_gastos_FKIndex1` (`liquidacion_presupuesto_cod_liqui` ASC),
  INDEX `liquidacion_presupuesto_has_otros_gastos_FKIndex2` (`otros_gastos_cod_gastos` ASC),
  CONSTRAINT `liquidacion_gastos_ibfk_1`
    FOREIGN KEY (`liquidacion_presupuesto_cod_liqui`)
    REFERENCES `bdadu`.`liquidacion_presupuesto` (`cod_liqui`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `liquidacion_gastos_ibfk_2`
    FOREIGN KEY (`otros_gastos_cod_gastos`)
    REFERENCES `bdadu`.`otros_gastos` (`cod_gastos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdadu`.`logeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdadu`.`logeo` (
  `usuario_logeo` VARCHAR(255) NOT NULL,
  `fecha_logeo` DATETIME NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
