-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2019 a las 06:16:06
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c0860121_cerve`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DireccionesUsuario` (IN `‘p_id’` INT)  SELECT cliente.correo,cliente.Nombre, cliente.apellido, direccion.id, direccion.Colonia, direccion.calle FROM cliente INNER JOIN direccion ON cliente.id = direccion.idcliente
WHERE cliente.id =  ‘p_id’$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` smallint(6) NOT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Contraseña` varchar(40) DEFAULT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `Correo`, `Contraseña`, `Nombre`, `Apellido`) VALUES
(39, 'carlouxljlj@gmail.com', '123456', 'Carlo', 'Lujan'),
(40, '12245@gmail', 'hola', 'Mauricio', 'Lujan'),
(42, 'pancho@gmail', 'holamundo', 'pancho', 'lopez'),
(47, 'Cristopher@gmail.com', '1234', 'Cristopher', 'Ceja '),
(48, 'fabio@gmail.com', '1234', 'Fabio', 'Lujan'),
(51, 'sergii@gmail.com', 'sergioselacome', 'Sergio', 'Sabe'),
(52, 'fabio1245@hotmail.com', 'fabiox35', 'fabio', 'lujan'),
(54, 'cristopher.ceja.731@gmail.com', 'Roblox.tiddies', 'Cristopher', 'Ceja'),
(56, 'hola', 'probandodesdemicelular', 'sirveono', 'ruegoquesi'),
(57, 'mfarfan', '12345', 'Mauricio', 'Farfan'),
(60, 'kuribeirut@gmail.com', 'alfredo123', 'alfredo', 'kuri'),
(61, 'msoto@ceti.mx', 'qwerty', 'mario', 'soto'),
(66, 'C', 'B', 'A', 'A'),
(67, 'andresperez1024@gmail.com', '123', 'Mauricio', 'Flores'),
(69, 'nombre@gmail.com', 'contrseñaqueseencriptara', 'NOMBREDEUSER', 'APELLIDOUSER'),
(70, 'correo', '21bcdcad71ee0ddb12aebe057983a94d52f012af', 'nombre', 'apellido'),
(71, 'correo', '5e884898da28047151d0e56f8dc6292773603d0d', 'nombre', 'apellido'),
(72, 'nombre', '21bcdcad71ee0ddb12aebe057983a94d52f012af', 'nombre', 'apellido');

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `hash_password` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
IF CHAR_LENGTH(NEW.Contraseña) != 64 THEN
SET NEW.Contraseña = SHA2(NEW.Contraseña,256);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cliente_2021`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cliente_2021` (
`nombre` varchar(40)
,`apellido` varchar(40)
,`id` smallint(6)
,`numerotarjeta` varchar(16)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` smallint(6) NOT NULL,
  `Nombredest` varchar(40) DEFAULT NULL,
  `Apellidodest` varchar(40) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Codigopostal` varchar(5) DEFAULT NULL,
  `Colonia` varchar(40) DEFAULT NULL,
  `Calle` varchar(40) DEFAULT NULL,
  `Numeroext` smallint(6) DEFAULT NULL,
  `Numeroint` smallint(6) DEFAULT NULL,
  `Referencias` varchar(40) DEFAULT NULL,
  `idcliente` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `Nombredest`, `Apellidodest`, `Telefono`, `Codigopostal`, `Colonia`, `Calle`, `Numeroext`, `Numeroint`, `Referencias`, `idcliente`) VALUES
(1, 'Pancho', 'Lopez', '3322512297', '45133', 'Mision del Bosque', 'Paseo de las aves 2220', 13, 0, 'Entre rio blanco y paseo de las aves', 42),
(2, 'Carlo', 'Lujan', '3313232038', '45130', 'Parques del centinela', 'Av Rio blanco', 567, 0, 'Entre rio blanco', 39),
(7, 'Farfan', 'Lopez', '3454432345', '45600', 'Mision de los cerezos', 'hamsters locos', 13, 0, 'Entre cuyo 110 y paloma 32', 57),
(8, 'Cristopher', 'Ceja', '3456564565', '45678', 'Mision del platano', 'monos locos', 239, 0, 'En la mera entrada', 54),
(9, 'Sergio', 'Sabe', '4567898721', '34567', 'Bosque loco', 'Encino verde 22', 345, 0, 'Entre la avenida y la calle', 51),
(10, 'Fabio', 'Lujan', '2233445566', '23456', 'Paseo de los fresnos', 'La calle', 1112, 0, 'Entre la avenida y la otra avenida', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` smallint(6) NOT NULL,
  `paqueteria` varchar(20) DEFAULT NULL,
  `costo` smallint(6) DEFAULT NULL,
  `enviado` tinyint(1) DEFAULT NULL,
  `fechaenvio` datetime DEFAULT NULL,
  `fechaestimada` datetime DEFAULT NULL,
  `iddomicilio` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `paqueteria`, `costo`, `enviado`, `fechaenvio`, `fechaestimada`, `iddomicilio`) VALUES
(1, 'DHL', 145, 1, '2019-06-17 19:37:52', '2019-06-17 19:49:02', 1),
(2, 'DHL', 145, 1, '0000-00-00 00:00:00', '2019-06-17 19:49:02', 2),
(3, 'DHL', 145, 1, '0000-00-00 00:00:00', '2019-06-17 19:49:02', 2),
(5, 'DHL', 145, 1, '2019-06-17 19:38:32', '0000-00-00 00:00:00', 1),
(6, 'DHL', 145, 1, '2019-06-17 19:38:42', '0000-00-00 00:00:00', 2),
(7, 'DHL', 145, 1, '2019-06-17 19:38:52', '0000-00-00 00:00:00', 2),
(9, 'DHL', 145, 1, '2019-06-17 19:39:31', '2019-06-17 19:39:31', 1),
(10, 'DHL', 145, 1, '2019-06-17 19:39:31', '2019-06-17 19:39:31', 2),
(11, 'DHL', 145, 1, '2019-06-17 19:39:31', '2019-06-17 19:39:31', 2),
(13, 'DHL', 145, 1, '2019-06-17 19:39:50', '2019-06-17 19:39:50', 1),
(14, 'DHL', 145, 1, '2019-06-17 19:39:50', '2019-06-17 19:39:50', 2),
(15, 'DHL', 145, 1, '2019-06-17 19:39:50', '2019-06-17 19:39:50', 2),
(16, 'ESTAFETA', 200, 1, '2019-06-17 19:39:50', '2019-06-17 19:39:50', 2),
(18, 'DHL', 145, 1, '2019-06-17 19:40:07', '2019-06-17 19:40:07', 1),
(19, 'DHL', 145, 1, '2019-06-17 19:40:07', '2019-06-17 19:40:07', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` smallint(6) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `preciototal` int(11) DEFAULT NULL,
  `idproveedor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `estado`, `fecha`, `preciototal`, `idproveedor`) VALUES
(1, 'Jalisco', '2019-06-16 00:00:00', 30000, 1),
(2, 'Jalisco', '2019-06-16 00:00:00', 3400, 5),
(3, 'Aguascalientes', '2019-06-16 00:00:00', 2345, 4),
(4, 'Guerrero', '2019-06-16 00:00:00', 12345, 3),
(5, 'Jalisco', '2019-06-16 00:00:00', 67000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemfactura`
--

CREATE TABLE `itemfactura` (
  `id` smallint(6) NOT NULL,
  `cantidad` tinyint(4) DEFAULT NULL,
  `descuento` tinyint(4) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `idfactura` smallint(6) DEFAULT NULL,
  `idproducto` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `itemfactura`
--

INSERT INTO `itemfactura` (`id`, `cantidad`, `descuento`, `subtotal`, `idfactura`, `idproducto`) VALUES
(1, 50, 50, 15000, 1, 1),
(2, 127, 50, 1700, 2, 1),
(3, 15, 0, 2345, 3, 1),
(4, 127, 0, 12345, 4, 2),
(5, 127, 50, 33500, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemorden`
--

CREATE TABLE `itemorden` (
  `id` smallint(6) NOT NULL,
  `cantidad` tinyint(4) DEFAULT NULL,
  `descuento` tinyint(4) DEFAULT NULL,
  `subtotal` int(20) DEFAULT NULL,
  `idproducto` smallint(6) DEFAULT NULL,
  `idorden` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` smallint(6) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `preciototal` int(11) DEFAULT NULL,
  `idpago` smallint(6) DEFAULT NULL,
  `idcliente` smallint(6) DEFAULT NULL,
  `idenvio` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `estado`, `fecha`, `preciototal`, `idpago`, `idcliente`, `idenvio`) VALUES
(1, 'Aguascalientes', '2019-06-17 19:57:55', 1, 2, 42, 1),
(2, 'Jalisco', '2019-06-17 19:57:55', 23, 2, 39, 1),
(3, 'Aguascalientes', '2019-06-17 19:57:55', 23, 2, 39, 1),
(4, 'Jalisco', '2019-06-17 19:57:55', 23, 2, 42, 1),
(5, 'Jalisco', '2019-06-17 19:57:55', 23, 2, 39, 1),
(6, 'Jalisco', '2019-06-17 19:57:55', 23, 2, 42, 1),
(7, 'Aguascalientes', '2019-06-17 19:57:55', 23, 2, 39, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` smallint(6) NOT NULL,
  `comision` smallint(6) DEFAULT NULL,
  `pagado` tinyint(1) DEFAULT NULL,
  `fechapago` datetime DEFAULT NULL,
  `idtarjeta` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id`, `comision`, `pagado`, `fechapago`, `idtarjeta`) VALUES
(1, 0, 1, '2019-06-17 19:49:50', 1),
(2, 0, 127, '2019-06-17 19:49:50', 2),
(3, 0, 127, '2019-06-17 19:49:50', 1),
(4, 0, 88, '2019-06-17 19:49:50', 2),
(5, 0, 56, '2019-06-17 19:49:50', 1),
(6, 0, 44, '2019-06-17 19:49:50', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id` smallint(6) NOT NULL,
  `numerotracking` varchar(12) DEFAULT NULL,
  `idorden` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` smallint(6) NOT NULL,
  `concepto` varchar(40) DEFAULT NULL,
  `preciolista` int(11) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `ml` smallint(6) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `sabor` varchar(20) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `concepto`, `preciolista`, `marca`, `ml`, `descripcion`, `imagen`, `sabor`, `tipo`) VALUES
(1, 'Cerveza', 15, 'Tecate', 355, 'cerveza barata para paladares poco exigentes, deliciosa', 'IMAGES/0.png', 'Clasico', 'Normal'),
(2, 'Cerveza', 16, 'Tecate', 355, 'cerveza barata light para paladares poco exigentes, deliciosa', 'IMAGES/1.png', 'Clasico', 'Normal'),
(3, 'Vino', 133, 'Riunite', 650, 'vino de baja calidad, bastante bueno', 'IMAGES/2.png', 'Clasico', 'Tinto'),
(4, 'Vino', 135, 'Riunite', 650, 'vino blanco', 'IMAGES/3.png', 'Clasico', 'Blanco'),
(5, 'Cerveza', 17, 'Indio', 355, 'cerveza barata para paladares poco exigentes, deliciosa', 'IMAGES/4.png', 'Clasico', 'Normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `codigopostal` varchar(5) DEFAULT NULL,
  `colonia` varchar(40) DEFAULT NULL,
  `calle` varchar(40) DEFAULT NULL,
  `número` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `correo`, `telefono`, `codigopostal`, `colonia`, `calle`, `número`) VALUES
(1, 'Tecate', 'tecate@gmail.com', '3334343434', '45678', 'Mision de las cervezas', 'manguito', 101),
(2, 'Chapultepec', 'Chapultepec@gmail.com', '3334322434', '45578', 'Mision de las gaviotas', 'manguito', 102),
(3, 'Indio', 'Indio@gmail.com', '3322567890', '45678', 'Mision de los vinos', 'arandanito', 1),
(4, 'Dosequis', 'Dosequis@gmail.com', '6789890767', '43648', 'Las lomas', 'lomudo', 11),
(5, 'Riunite', 'Riunite@gmail.com', '3322526789', '42578', 'las cervezas', 'trololo', 89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` smallint(6) NOT NULL,
  `Nombretarjeta` varchar(40) DEFAULT NULL,
  `Numerotarjeta` varchar(16) DEFAULT NULL,
  `Fechavencimiento` date DEFAULT NULL,
  `CCV` varchar(3) DEFAULT NULL,
  `idcliente` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`id`, `Nombretarjeta`, `Numerotarjeta`, `Fechavencimiento`, `CCV`, `idcliente`) VALUES
(1, 'TARJETAPRUEBA', '3456789012344321', '2020-02-02', '330', 42),
(2, 'mitarjeta', '4567234545675432', '2021-01-01', '567', 39);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tecate`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tecate` (
`id` smallint(6)
,`descripcion` varchar(255)
,`sabor` varchar(20)
,`tipo` varchar(20)
,`preciolista` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `cliente_2021`
--
DROP TABLE IF EXISTS `cliente_2021`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cliente_2021`  AS  select `cliente`.`Nombre` AS `nombre`,`cliente`.`Apellido` AS `apellido`,`tarjeta`.`id` AS `id`,`tarjeta`.`Numerotarjeta` AS `numerotarjeta` from (`cliente` join `tarjeta` on((`cliente`.`id` = `tarjeta`.`idcliente`))) where (`tarjeta`.`Fechavencimiento` = '2021-01-01') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tecate`
--
DROP TABLE IF EXISTS `tecate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tecate`  AS  select `producto`.`id` AS `id`,`producto`.`descripcion` AS `descripcion`,`producto`.`sabor` AS `sabor`,`producto`.`tipo` AS `tipo`,`producto`.`preciolista` AS `preciolista` from `producto` where (`producto`.`marca` = 'TECATE') ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddomicilio` (`iddomicilio`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `itemfactura`
--
ALTER TABLE `itemfactura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idfactura` (`idfactura`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `itemorden`
--
ALTER TABLE `itemorden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idorden` (`idorden`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpago` (`idpago`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idenvio` (`idenvio`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtarjeta` (`idtarjeta`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idorden` (`idorden`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
