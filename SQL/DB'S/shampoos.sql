-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-06-2020 a las 01:04:38
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
-- Base de datos: `edenbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shampoos`
--

CREATE TABLE `shampoos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(120) NOT NULL,
  `ingredientes` varchar(255) NOT NULL,
  `olor` varchar(120) NOT NULL,
  `ml` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `shampoos`
--

INSERT INTO `shampoos` (`id`, `nombre`, `color`, `ingredientes`, `olor`, `ml`) VALUES
(2, 'Eden minus,', 'azul', '-lavanda', 'rosas', '1000'),
(4, 'Eden triple plus', 'amarillo', 'aceite de argan y almendras', 'Lavanda', '1000'),
(6, 'hj', 'jklj', 'hjkhkj', 'khkj', 'kjhkj'),
(7, 'Hola', 'como', 'estas', '123', '45678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `shampoos`
--
ALTER TABLE `shampoos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `shampoos`
--
ALTER TABLE `shampoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
