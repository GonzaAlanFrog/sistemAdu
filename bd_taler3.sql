-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2019 a las 12:58:17
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_taler3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apertura_cierres`
--

CREATE TABLE `apertura_cierres` (
  `id_apercierre` int(11) NOT NULL,
  `fecha_apertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aper_monto` int(11) NOT NULL,
  `cierre_fecha` timestamp NULL DEFAULT NULL,
  `cierre_monto` int(11) DEFAULT NULL,
  `id_caja` int(11) NOT NULL,
  `id_funcionario` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `apertura_cierres`
--

INSERT INTO `apertura_cierres` (`id_apercierre`, `fecha_apertura`, `aper_monto`, `cierre_fecha`, `cierre_monto`, `id_caja`, `id_funcionario`) VALUES
(8, '2018-08-18 18:07:13', 25000000, '2018-08-18 22:10:39', 0, 1, 1),
(9, '2018-08-18 18:11:49', 25000000, '2018-08-18 22:11:53', 0, 1, 1),
(10, '2018-08-18 18:15:35', 25000000, '2018-08-18 22:19:10', 0, 1, 1),
(11, '2018-08-18 18:19:38', 25000000, '2018-08-18 22:19:46', 0, 1, 1),
(12, '2018-08-18 18:20:49', 25000000, '2018-08-18 22:20:51', 0, 1, 1),
(13, '2018-08-18 18:21:34', 25000000, '2018-08-18 22:21:36', 0, 1, 1),
(14, '2018-08-18 18:23:45', 25000000, '2018-08-18 22:23:49', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL,
  `razon_social` varchar(300) NOT NULL,
  `ruc` varchar(300) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `Telefono` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL,
  `caja_descripcion` varchar(300) NOT NULL,
  `caja_ultfactura` int(11) DEFAULT NULL,
  `caja_estado` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id_caja`, `caja_descripcion`, `caja_ultfactura`, `caja_estado`) VALUES
(1, 'Caja 1', 0, ''),
(2, 'Caja 2', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id_cargo` int(11) NOT NULL,
  `car_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `car_descripcion`) VALUES
(1, 'administrador'),
(2, 'cajeros'),
(3, 'Operacional'),
(4, 'Gerencia'),
(5, 'Desarrollador'),
(6, 'DBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `ciu_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `ciu_descripcion`) VALUES
(0, 'Capiata'),
(9, 'Aregua'),
(10, 'Itaugua'),
(12, 'Caacupe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `cli_ruc` varchar(300) NOT NULL,
  `cli_razonsocial` varchar(300) NOT NULL,
  `cli_telefono` varchar(300) NOT NULL,
  `cli_direccion` varchar(300) DEFAULT NULL,
  `cli_email` varchar(300) DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `cli_ruc`, `cli_razonsocial`, `cli_telefono`, `cli_direccion`, `cli_email`, `id_ciudad`) VALUES
(0, '4538212', 'roberto perez', '0994 447065', 'itaugua km30', 'rperez@gmail.com', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros`
--

CREATE TABLE `cobros` (
  `id_cobros` int(11) NOT NULL,
  `cob_fecha` datetime NOT NULL,
  `cob_efectivo` int(11) NOT NULL,
  `cob_estado` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobro_cheques`
--

CREATE TABLE `cobro_cheques` (
  `id_cobros` int(11) NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `nro_cheque` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_cobro` date NOT NULL,
  `importe` int(11) NOT NULL,
  `titular` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobro_tarjetas`
--

CREATE TABLE `cobro_tarjetas` (
  `id_cobros` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `nro_tarjeta` int(11) NOT NULL,
  `cod_auto` int(11) NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `importe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_ventas`
--

CREATE TABLE `condicion_ventas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_cobrar`
--

CREATE TABLE `cuentas_cobrar` (
  `id_venta` int(11) NOT NULL,
  `cta_nro` int(11) NOT NULL,
  `cta_vencimiento` date NOT NULL,
  `cta_monto` int(11) NOT NULL,
  `cta_saldo` int(11) NOT NULL,
  `cta_estado` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancarias`
--

CREATE TABLE `cuenta_bancarias` (
  `id_cuenta_bancaria` int(11) NOT NULL,
  `numero_cuentas` varchar(300) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `id_banco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE `depositos` (
  `id_deposito` int(11) NOT NULL,
  `dep_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `depositos`
--

INSERT INTO `depositos` (`id_deposito`, `dep_descripcion`) VALUES
(3, 'modidixs'),
(4, 'modidixs'),
(6, 'perra faldera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cobros`
--

CREATE TABLE `detalle_cobros` (
  `id_cobros` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cta_nro` int(11) NOT NULL,
  `detc_monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_fac_compra`
--

CREATE TABLE `detalle_fac_compra` (
  `id_orden` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE `detalle_inventario` (
  `id_inventario` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden_compra`
--

CREATE TABLE `detalle_orden_compra` (
  `id_orden_compra` varchar(300) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `cantidad_orden` int(11) NOT NULL,
  `precio_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_transferncias`
--

CREATE TABLE `detalle_transferncias` (
  `id_Trans_ajuste` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `cantidad_transferencia` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_venta` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `dv_cantidad` int(11) NOT NULL,
  `dv_precio` int(11) NOT NULL,
  `subtotal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_emisoras`
--

CREATE TABLE `entidad_emisoras` (
  `id_entidad` int(11) NOT NULL,
  `ent_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripccion`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_compra`
--

CREATE TABLE `factura_compra` (
  `id_compra` int(11) NOT NULL,
  `numero_factura` varchar(300) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `fun_ci` varchar(300) NOT NULL,
  `fun_nombres` varchar(300) NOT NULL,
  `fun_apellidos` varchar(300) NOT NULL,
  `fun_telefono` varchar(300) NOT NULL,
  `fun_direccion` varchar(300) NOT NULL,
  `fun_email` varchar(300) DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `fun_ci`, `fun_nombres`, `fun_apellidos`, `fun_telefono`, `fun_direccion`, `fun_email`, `id_cargo`, `id_ciudad`) VALUES
(0, '4587821', 'Emilio', 'Garcia', '0981501203', 'Itaugua km30', 'egarcia@gmail.com', 1, 9),
(1, '4538212', 'Rodrigo', 'Gonzalez', '0994447065', 'Itaugua km 30', 'rodrigo@gmail.com', 1, 10),
(3, '4538245', 'Pedro', 'Miranda', '0971545254', 'Capiata kM21', 'pmiranda@gmail.com', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE `impuesto` (
  `id_impuesto` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id_impuesto`, `descripccion`) VALUES
(1, 'Iva 5%'),
(2, 'Iva 10%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `numero_lote` varchar(300) NOT NULL,
  `fecha_fabricacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_tarjetas`
--

CREATE TABLE `marca_tarjetas` (
  `id_marca` int(11) NOT NULL,
  `mar_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `descripccion`) VALUES
(1, 'Operaciones'),
(3, 'Reportes'),
(4, 'Mantenimientos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuiten`
--

CREATE TABLE `menuiten` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL,
  `id_menu` int(100) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menuiten`
--

INSERT INTO `menuiten` (`id`, `descripccion`, `id_menu`, `url`) VALUES
(0, 'Mantener Proveedor', 4, '/recursos/html/Mantener_proveedor.html'),
(1, 'Caja', 1, 'recursos/html/caja.html'),
(2, 'ventas', 1, 'recursos/html/Venta.html'),
(3, 'Anulacion', 1, 'html/mantener'),
(5, 'Gestor Reportes', 3, 'html/mantener'),
(6, 'Mantener Clientes', 4, 'recursos/html/Mantener_clientes.html'),
(7, 'Mantener Usuarios ', 4, 'recursos/html/Mantener_usuarios.html'),
(8, 'Mantener Perfiles', 4, 'recursos/html/Mantener_perfil.html'),
(9, 'Mantener Ciudad', 4, 'recursos/html/Mantener_ciudad.html'),
(10, 'Mantener Deposito', 4, 'recursos/html/Mantener_deposito.html'),
(11, 'Mantener Funcionarios', 4, 'recursos/html/Mantener_funcionarios.html'),
(12, 'Mantener Mercaderia ', 4, 'recursos/html/Mantener_mercaderia.html'),
(13, 'Mantener Proveedor', 4, 'recursos/html/Mantener_proveedor.html'),
(15, 'Comprar', 1, 'recursos/html/Compra.html');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercaderias`
--

CREATE TABLE `mercaderias` (
  `id_mercaderia` int(11) NOT NULL,
  `mer_descripcion` varchar(300) NOT NULL,
  `mer_costo` int(11) NOT NULL,
  `mer_precio` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_impuesto` int(11) NOT NULL,
  `id_tipo_mercaderia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mercaderias`
--

INSERT INTO `mercaderias` (`id_mercaderia`, `mer_descripcion`, `mer_costo`, `mer_precio`, `id_nacionalidad`, `id_impuesto`, `id_tipo_mercaderia`) VALUES
(1, 'Cerveza Brama de Litro', 7500, 9000, 1, 1, 1),
(2, 'Cerveza Brama de 3/4', 5000, 7500, 1, 1, 1),
(4, 'Cerveza Brama (Bramita)', 3500, 5000, 1, 1, 1),
(5, 'Cerveza Pilsen de Litro', 7500, 9000, 1, 1, 1),
(6, 'Cerveza Pilsen de 3/4', 5000, 7500, 1, 2, 1),
(7, 'Cerveza Pilsen (PilsenI)', 3500, 5000, 1, 1, 1),
(8, 'Gaseosa Litro CocaCola', 5000, 7500, 1, 1, 1),
(9, 'Coca Coca 350', 500, 1000, 1, 1, 1),
(12, 'Coca Cola de 200 ', 1000, 1500, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`id_nacionalidad`, `descripccion`) VALUES
(1, 'py');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL,
  `orden_fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL,
  `ultimo_numero` int(11) NOT NULL,
  `numero_fin` int(11) NOT NULL,
  `numero_inicio` int(11) NOT NULL,
  `id_timbrado` int(100) NOT NULL,
  `id_tipo_doc` int(11) NOT NULL,
  `id_caja` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id_parametro`, `ultimo_numero`, `numero_fin`, `numero_inicio`, `id_timbrado`, `id_tipo_doc`, `id_caja`) VALUES
(3, 1979, 2021, 1979, 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `per_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `per_descripcion`) VALUES
(1, 'cajeros'),
(2, 'Administracion'),
(3, 'Contabilidad'),
(4, 'Deposito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisomenu`
--

CREATE TABLE `permisomenu` (
  `idorden` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisomenu`
--

INSERT INTO `permisomenu` (`idorden`, `id_perfil`, `id`, `estado`) VALUES
(1, 2, 2, 1),
(2, 2, 1, 1),
(3, 2, 6, 1),
(4, 2, 5, 1),
(7, 2, 7, 1),
(8, 2, 8, 1),
(10, 2, 10, 1),
(11, 2, 12, 1),
(12, 2, 11, 1),
(13, 2, 9, 1),
(14, 2, 13, 1),
(15, 2, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `telefono` varchar(300) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `ruc` varchar(300) NOT NULL,
  `razon_social` varchar(300) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `telefono`, `direccion`, `email`, `ruc`, `razon_social`, `id_ciudad`) VALUES
(1, '0984566582', 'caacupe', 'rg@gmail.com', '466484515', 'cervpar', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_deposito` int(11) NOT NULL,
  `id_mercaderia` int(11) NOT NULL,
  `stk_cantidad` int(11) NOT NULL,
  `id_unidad_medida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `tarj_tipo` varchar(300) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timbrados`
--

CREATE TABLE `timbrados` (
  `id_timbrado` int(11) NOT NULL,
  `numero_timbrado` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `timbrados`
--

INSERT INTO `timbrados` (`id_timbrado`, `numero_timbrado`, `fecha_desde`, `fecha_hasta`) VALUES
(1, 10001980, '2017-01-01', '2018-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ajuste`
--

CREATE TABLE `tipo_ajuste` (
  `id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Id` int(11) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`Id`, `descripccion`) VALUES
(1, 'facturaVenta'),
(2, 'OrdenCompra'),
(3, 'Tiket'),
(4, 'FacturaCompra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mercaderias`
--

CREATE TABLE `tipo_mercaderias` (
  `id_tipo_mercaderia` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_mercaderias`
--

INSERT INTO `tipo_mercaderias` (`id_tipo_mercaderia`, `descripcion`) VALUES
(1, 'bebidas'),
(2, 'lacteos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia_ajuste`
--

CREATE TABLE `transferencia_ajuste` (
  `id_Trans_ajuste` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id` int(11) NOT NULL,
  `id_deposito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL,
  `estado` varchar(300) NOT NULL,
  `descripccion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usu_nombre` varchar(300) NOT NULL,
  `usu_clave` varchar(300) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usu_nombre`, `usu_clave`, `id_funcionario`, `id_perfil`) VALUES
(1, 'rgonzalez', '12345', 1, 1),
(2, 'egarcia', '12345', 1, 1),
(3, 'r', 'r', 1, 2),
(4, 'pmiranda', '12345', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

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
  `id_parametro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apertura_cierres`
--
ALTER TABLE `apertura_cierres`
  ADD PRIMARY KEY (`id_apercierre`),
  ADD KEY `cajas_apertura_cierres_fk` (`id_caja`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `ciudades_clientes_fk` (`id_ciudad`);

--
-- Indices de la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD PRIMARY KEY (`id_cobros`);

--
-- Indices de la tabla `cobro_cheques`
--
ALTER TABLE `cobro_cheques`
  ADD PRIMARY KEY (`id_cobros`,`id_entidad`,`nro_cheque`),
  ADD KEY `entidad_emisoras_cobro_cheques_fk` (`id_entidad`);

--
-- Indices de la tabla `cobro_tarjetas`
--
ALTER TABLE `cobro_tarjetas`
  ADD PRIMARY KEY (`id_cobros`,`id_tarjeta`,`nro_tarjeta`,`cod_auto`),
  ADD KEY `tarjetas_cobro_tarjetas_fk` (`id_tarjeta`),
  ADD KEY `entidad_emisoras_cobro_tarjetas_fk` (`id_entidad`);

--
-- Indices de la tabla `condicion_ventas`
--
ALTER TABLE `condicion_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas_cobrar`
--
ALTER TABLE `cuentas_cobrar`
  ADD PRIMARY KEY (`id_venta`,`cta_nro`);

--
-- Indices de la tabla `cuenta_bancarias`
--
ALTER TABLE `cuenta_bancarias`
  ADD PRIMARY KEY (`id_cuenta_bancaria`),
  ADD KEY `bancos_cuenta_bancarias_fk` (`id_banco`);

--
-- Indices de la tabla `depositos`
--
ALTER TABLE `depositos`
  ADD PRIMARY KEY (`id_deposito`);

--
-- Indices de la tabla `detalle_cobros`
--
ALTER TABLE `detalle_cobros`
  ADD PRIMARY KEY (`id_cobros`,`id_venta`,`cta_nro`),
  ADD KEY `cuentas_cobrar_detalle_cobros_fk` (`id_venta`,`cta_nro`);

--
-- Indices de la tabla `detalle_fac_compra`
--
ALTER TABLE `detalle_fac_compra`
  ADD PRIMARY KEY (`id_orden`,`id_mercaderia`,`id_compra`),
  ADD KEY `mercaderias_detalle_fac_compra_fk` (`id_mercaderia`),
  ADD KEY `factura_compra_detalle_fac_compra_fk` (`id_compra`);

--
-- Indices de la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD PRIMARY KEY (`id_inventario`,`id_lote`,`id_mercaderia`,`id_deposito`),
  ADD KEY `depositos_detalle_inventario_fk` (`id_deposito`),
  ADD KEY `lote_detalle_inventario_fk` (`id_lote`,`id_mercaderia`);

--
-- Indices de la tabla `detalle_orden_compra`
--
ALTER TABLE `detalle_orden_compra`
  ADD PRIMARY KEY (`id_orden_compra`,`id_mercaderia`),
  ADD KEY `mercaderias_detalle_orden_compra_fk` (`id_mercaderia`);

--
-- Indices de la tabla `detalle_transferncias`
--
ALTER TABLE `detalle_transferncias`
  ADD PRIMARY KEY (`id_Trans_ajuste`,`id_lote`,`id_mercaderia`),
  ADD KEY `depositos_detalle_transferncias_fk` (`id_deposito`),
  ADD KEY `lote_detalle_transferncias_fk` (`id_lote`,`id_mercaderia`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_venta`,`id_mercaderia`),
  ADD KEY `mercaderias_detalle_ventas_fk` (`id_mercaderia`);

--
-- Indices de la tabla `entidad_emisoras`
--
ALTER TABLE `entidad_emisoras`
  ADD PRIMARY KEY (`id_entidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `estado_factura_compra_fk` (`id_estado`),
  ADD KEY `proveedor_factura_compra_fk` (`id_proveedor`),
  ADD KEY `funcionarios_factura_compra_fk` (`id_funcionario`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `cargos_funcionarios_fk` (`id_cargo`),
  ADD KEY `ciudades_funcionarios_fk` (`id_ciudad`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`id_impuesto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `usuarios_inventario_fk` (`id_usuario`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`,`id_mercaderia`),
  ADD KEY `mercaderias_lote_fk` (`id_mercaderia`);

--
-- Indices de la tabla `marca_tarjetas`
--
ALTER TABLE `marca_tarjetas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menuiten`
--
ALTER TABLE `menuiten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indices de la tabla `mercaderias`
--
ALTER TABLE `mercaderias`
  ADD PRIMARY KEY (`id_mercaderia`),
  ADD KEY `impuesto_mercaderias_fk` (`id_impuesto`),
  ADD KEY `nacionalidad_mercaderias_fk` (`id_nacionalidad`),
  ADD KEY `tipo_mercaderias_mercaderias_fk` (`id_tipo_mercaderia`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_orden_compra`),
  ADD KEY `usuarios_orden_compra_fk` (`id_usuario`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id_parametro`),
  ADD KEY `tipo_documento_parametro_fk` (`id_tipo_doc`),
  ADD KEY `id_timbrado` (`id_timbrado`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `permisomenu`
--
ALTER TABLE `permisomenu`
  ADD PRIMARY KEY (`idorden`,`id_perfil`,`id`),
  ADD KEY `menuiten_permisomenu_fk` (`id`),
  ADD KEY `perfiles_permisomenu_fk` (`id_perfil`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `ciudades_proveedor_fk` (`id_ciudad`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_deposito`,`id_mercaderia`),
  ADD KEY `unidad_medida_stock_fk` (`id_unidad_medida`),
  ADD KEY `mercaderias_stock_fk` (`id_mercaderia`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `marca_tarjetas_tarjetas_fk` (`id_marca`);

--
-- Indices de la tabla `timbrados`
--
ALTER TABLE `timbrados`
  ADD PRIMARY KEY (`id_timbrado`);

--
-- Indices de la tabla `tipo_ajuste`
--
ALTER TABLE `tipo_ajuste`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tipo_mercaderias`
--
ALTER TABLE `tipo_mercaderias`
  ADD PRIMARY KEY (`id_tipo_mercaderia`);

--
-- Indices de la tabla `transferencia_ajuste`
--
ALTER TABLE `transferencia_ajuste`
  ADD PRIMARY KEY (`id_Trans_ajuste`),
  ADD KEY `tipo_ajuste_transferencia_ajuste_fk` (`id`),
  ADD KEY `depositos_transferencia_ajuste_fk` (`id_deposito`),
  ADD KEY `usuarios_transferencia_ajuste_fk` (`id_usuario`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `perfiles_usuarios_fk` (`id_perfil`),
  ADD KEY `funcionarios_usuarios_fk` (`id_funcionario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `estado_ventas_fk` (`id_estado`),
  ADD KEY `parametro_ventas_fk` (`id_parametro`),
  ADD KEY `condicion_ventas_ventas_fk` (`id`),
  ADD KEY `funcionarios_ventas_fk` (`id_funcionario`),
  ADD KEY `clientes_ventas_fk` (`id_cliente`),
  ADD KEY `id_apercierre` (`id_apercierre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apertura_cierres`
--
ALTER TABLE `apertura_cierres`
  MODIFY `id_apercierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id_banco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condicion_ventas`
--
ALTER TABLE `condicion_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuenta_bancarias`
--
ALTER TABLE `cuenta_bancarias`
  MODIFY `id_cuenta_bancaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `depositos`
--
ALTER TABLE `depositos`
  MODIFY `id_deposito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_fac_compra`
--
ALTER TABLE `detalle_fac_compra`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mercaderias`
--
ALTER TABLE `mercaderias`
  MODIFY `id_mercaderia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `permisomenu`
--
ALTER TABLE `permisomenu`
  MODIFY `idorden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `timbrados`
--
ALTER TABLE `timbrados`
  MODIFY `id_timbrado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_ajuste`
--
ALTER TABLE `tipo_ajuste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_mercaderias`
--
ALTER TABLE `tipo_mercaderias`
  MODIFY `id_tipo_mercaderia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apertura_cierres`
--
ALTER TABLE `apertura_cierres`
  ADD CONSTRAINT `apertura_cierres_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `cajas` (`id_caja`),
  ADD CONSTRAINT `cajas_apertura_cierres_fk` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `ciudades_clientes_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cobro_cheques`
--
ALTER TABLE `cobro_cheques`
  ADD CONSTRAINT `cobros_cobro_cheques_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entidad_emisoras_cobro_cheques_fk` FOREIGN KEY (`id_entidad`) REFERENCES `entidad_emisoras` (`id_entidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cobro_tarjetas`
--
ALTER TABLE `cobro_tarjetas`
  ADD CONSTRAINT `cobros_cobro_tarjetas_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `entidad_emisoras_cobro_tarjetas_fk` FOREIGN KEY (`id_entidad`) REFERENCES `entidad_emisoras` (`id_entidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tarjetas_cobro_tarjetas_fk` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id_tarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentas_cobrar`
--
ALTER TABLE `cuentas_cobrar`
  ADD CONSTRAINT `ventas_cuentas_cobrar_fk` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuenta_bancarias`
--
ALTER TABLE `cuenta_bancarias`
  ADD CONSTRAINT `bancos_cuenta_bancarias_fk` FOREIGN KEY (`id_banco`) REFERENCES `bancos` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_cobros`
--
ALTER TABLE `detalle_cobros`
  ADD CONSTRAINT `cobros_detalle_cobros_fk` FOREIGN KEY (`id_cobros`) REFERENCES `cobros` (`id_cobros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cuentas_cobrar_detalle_cobros_fk` FOREIGN KEY (`id_venta`,`cta_nro`) REFERENCES `cuentas_cobrar` (`id_venta`, `cta_nro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_fac_compra`
--
ALTER TABLE `detalle_fac_compra`
  ADD CONSTRAINT `factura_compra_detalle_fac_compra_fk` FOREIGN KEY (`id_compra`) REFERENCES `factura_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mercaderias_detalle_fac_compra_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD CONSTRAINT `inventario_detalle_inventario_fk` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `lote_detalle_inventario_fk` FOREIGN KEY (`id_lote`,`id_mercaderia`) REFERENCES `lote` (`id_lote`, `id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_orden_compra`
--
ALTER TABLE `detalle_orden_compra`
  ADD CONSTRAINT `mercaderias_detalle_orden_compra_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_transferncias`
--
ALTER TABLE `detalle_transferncias`
  ADD CONSTRAINT `lote_detalle_transferncias_fk` FOREIGN KEY (`id_lote`,`id_mercaderia`) REFERENCES `lote` (`id_lote`, `id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transferencia_ajuste_detalle_transferncias_fk` FOREIGN KEY (`id_Trans_ajuste`) REFERENCES `transferencia_ajuste` (`id_Trans_ajuste`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `mercaderias_detalle_ventas_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_detalle_ventas_fk` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD CONSTRAINT `estado_factura_compra_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `funcionarios_factura_compra_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `proveedor_factura_compra_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `cargos_funcionarios_fk` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ciudades_funcionarios_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `usuarios_inventario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `mercaderias_lote_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menuiten`
--
ALTER TABLE `menuiten`
  ADD CONSTRAINT `menuiten_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `mercaderias`
--
ALTER TABLE `mercaderias`
  ADD CONSTRAINT `impuesto_mercaderias_fk` FOREIGN KEY (`id_impuesto`) REFERENCES `impuesto` (`id_impuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nacionalidad_mercaderias_fk` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipo_mercaderias_mercaderias_fk` FOREIGN KEY (`id_tipo_mercaderia`) REFERENCES `tipo_mercaderias` (`id_tipo_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `usuarios_orden_compra_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD CONSTRAINT `parametro_ibfk_1` FOREIGN KEY (`id_timbrado`) REFERENCES `timbrados` (`id_timbrado`),
  ADD CONSTRAINT `parametro_ibfk_2` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`),
  ADD CONSTRAINT `tipo_documento_parametro_fk` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documento` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisomenu`
--
ALTER TABLE `permisomenu`
  ADD CONSTRAINT `menuiten_permisomenu_fk` FOREIGN KEY (`id`) REFERENCES `menuiten` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `perfiles_permisomenu_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `ciudades_proveedor_fk` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `mercaderias_stock_fk` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderias` (`id_mercaderia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `unidad_medida_stock_fk` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `marca_tarjetas_tarjetas_fk` FOREIGN KEY (`id_marca`) REFERENCES `marca_tarjetas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `transferencia_ajuste`
--
ALTER TABLE `transferencia_ajuste`
  ADD CONSTRAINT `tipo_ajuste_transferencia_ajuste_fk` FOREIGN KEY (`id`) REFERENCES `tipo_ajuste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarios_transferencia_ajuste_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `funcionarios_usuarios_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `perfiles_usuarios_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `clientes_ventas_fk` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `condicion_ventas_ventas_fk` FOREIGN KEY (`id`) REFERENCES `condicion_ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estado_ventas_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `forma_pago_ventas_fk` FOREIGN KEY (`id`) REFERENCES `forma_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `funcionarios_ventas_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `parametro_ventas_fk` FOREIGN KEY (`id_parametro`) REFERENCES `parametro` (`id_parametro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_apercierre`) REFERENCES `apertura_cierres` (`id_apercierre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
