-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2019 a las 11:20:13
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
-- Base de datos: `ceveceria_actualizada`
--

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
