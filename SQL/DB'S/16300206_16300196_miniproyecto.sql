-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2020 a las 04:42:19
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
-- Base de datos: `16300206_16300196_miniproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

CREATE TABLE `accesorios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipoaccesorio` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_accesorios`
--

CREATE TABLE `inventario_accesorios` (
  `idsucursal` int(11) NOT NULL,
  `idaccesorio` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_ropadeportiva`
--

CREATE TABLE `inventario_ropadeportiva` (
  `idsucursal` int(11) NOT NULL,
  `idropadeportiva` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_zapatos`
--

CREATE TABLE `inventario_zapatos` (
  `idsucursal` int(11) NOT NULL,
  `idzapato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ropadeportiva`
--

CREATE TABLE `ropadeportiva` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipoprenda` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zapatos`
--

CREATE TABLE `zapatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `tipozapato` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario_accesorios`
--
ALTER TABLE `inventario_accesorios`
  ADD KEY `idsucursal` (`idsucursal`),
  ADD KEY `idaccesorio` (`idaccesorio`);

--
-- Indices de la tabla `inventario_ropadeportiva`
--
ALTER TABLE `inventario_ropadeportiva`
  ADD KEY `idsucursal` (`idsucursal`),
  ADD KEY `idropadeportiva` (`idropadeportiva`);

--
-- Indices de la tabla `inventario_zapatos`
--
ALTER TABLE `inventario_zapatos`
  ADD KEY `idsucursal` (`idsucursal`),
  ADD KEY `idzapato` (`idzapato`);

--
-- Indices de la tabla `ropadeportiva`
--
ALTER TABLE `ropadeportiva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idsucursal`);

--
-- Indices de la tabla `zapatos`
--
ALTER TABLE `zapatos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ropadeportiva`
--
ALTER TABLE `ropadeportiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idsucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zapatos`
--
ALTER TABLE `zapatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario_accesorios`
--
ALTER TABLE `inventario_accesorios`
  ADD CONSTRAINT `inventario_accesorios_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `inventario_accesorios_ibfk_2` FOREIGN KEY (`idaccesorio`) REFERENCES `accesorios` (`id`);

--
-- Filtros para la tabla `inventario_ropadeportiva`
--
ALTER TABLE `inventario_ropadeportiva`
  ADD CONSTRAINT `inventario_ropadeportiva_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `inventario_ropadeportiva_ibfk_2` FOREIGN KEY (`idropadeportiva`) REFERENCES `ropadeportiva` (`id`);

--
-- Filtros para la tabla `inventario_zapatos`
--
ALTER TABLE `inventario_zapatos`
  ADD CONSTRAINT `inventario_zapatos_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`idsucursal`),
  ADD CONSTRAINT `inventario_zapatos_ibfk_2` FOREIGN KEY (`idzapato`) REFERENCES `zapatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
