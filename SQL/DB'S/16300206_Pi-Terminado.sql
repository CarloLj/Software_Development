-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2018 a las 22:59:18
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `16300206_pi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadora`
--

CREATE TABLE `computadora` (
  `ID_Computadora` int(5) NOT NULL,
  `ID_Laboratorio` int(4) NOT NULL,
  `Mantenimiento` varchar(15) COLLATE latin1_bin NOT NULL,
  `Garantia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `computadora`
--

INSERT INTO `computadora` (`ID_Computadora`, `ID_Laboratorio`, `Mantenimiento`, `Garantia`) VALUES
(1, 4, 'Ninguno', '2019-01-01'),
(2, 4, 'Ninguno', '2018-12-21'),
(3, 5, 'Ninguno', '2018-12-14'),
(4, 5, 'Ninguno', '2019-03-26'),
(5, 5, 'Ninguno', '2019-04-13'),
(6, 5, 'Ninguno', '2019-02-20'),
(7, 3, 'Ninguno', '2018-12-08'),
(8, 3, 'Ninguno', '2018-12-09'),
(9, 3, 'Ninguno', '2019-03-13'),
(10, 3, 'Ninguno', '2018-12-01'),
(11, 5, 'Ninguno', '2019-04-07'),
(12, 5, 'Ninguno', '2019-03-18'),
(13, 5, 'Ninguno', '2019-05-16'),
(14, 5, 'Ninguno', '2019-06-22'),
(15, 4, 'Ninguno', '2019-08-19'),
(16, 4, 'Ninguno', '2018-08-21'),
(17, 4, 'Ninguno', '2019-10-17'),
(18, 4, 'Ninguno', '2019-05-13'),
(19, 4, 'Ninguno', '2019-01-16'),
(20, 5, 'Ninguno', '2019-12-14'),
(21, 5, 'Ninguno', '2018-05-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras_reporte`
--

CREATE TABLE `computadoras_reporte` (
  `ID_ComRep` int(5) NOT NULL,
  `Folio` int(4) NOT NULL,
  `ID_Computadora` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `computadoras_reporte`
--

INSERT INTO `computadoras_reporte` (`ID_ComRep`, `Folio`, `ID_Computadora`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 4, 7),
(8, 4, 8),
(9, 4, 9),
(10, 4, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 5, 14),
(15, 11, 15),
(16, 11, 16),
(17, 13, 17),
(18, 15, 18),
(19, 15, 19),
(20, 16, 20),
(21, 16, 21),
(22, 6, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `ID_Encargado` int(4) NOT NULL,
  `ID_Password` int(4) NOT NULL,
  `Nombre` varchar(30) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `ID_Laboratorio` int(4) NOT NULL,
  `Laboratorio` varchar(25) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`ID_Laboratorio`, `Laboratorio`) VALUES
(1, 'LAB A'),
(2, 'LAB B'),
(3, 'LAB C'),
(4, 'LAB D'),
(5, 'LAB E'),
(6, 'SOFTWARE LIBRE 1'),
(7, 'SOFTWARE LIBRE 2'),
(8, 'SOFTWARE LIBRE 3'),
(9, 'REDES 1'),
(10, 'REDES 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `Maestro` int(4) NOT NULL,
  `ID_Password` int(4) DEFAULT NULL,
  `Nombre` varchar(50) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`Maestro`, `ID_Password`, `Nombre`) VALUES
(1321, 1, 'ALEJANDRA ALCARAZ TORRES'),
(2116, 1, 'ANDRES FIGUEROA FLORES'),
(1047, 1, 'ANNEL MARIN RODRIGUEZ'),
(1729, 1, 'ANTONIO LOZANO GONZALEZ'),
(1215, 1, 'CARLOS ALBERTO RAMIREZ GARCIA'),
(1396, 1, 'CARLOS MOLINA MATINEZ'),
(1512, 1, 'CLARA GABRIELA GARCIA DURAN'),
(1221, 1, 'CRISTINA RIVERA ELIZONDO'),
(1559, 1, 'DIANA MARISOL FIGUEROA FLORES'),
(1388, 1, 'ELIZABETH ALVAREZ DEL CATILLO'),
(2222, 1, 'ELSY DENEB PATRON SALAS'),
(1272, 1, 'ERNESTO ALEJANDRO PLAYA'),
(1872, 1, 'ERNESTO CHUMACERA VERA'),
(355, 1, 'FRANCISCO JAVIER NIÑO ROBLES'),
(2201, 1, 'GUSTAVO ROJAS GARCIA'),
(1481, 1, 'ISMAEL LOPEZ BUENROSTRO'),
(3133, 1, 'JASMIN VARGAS COBOS'),
(1996, 1, 'JORGE PAMPLONA CAMPA'),
(1530, 1, 'KARLA ARELI ISAAC RODRIGUEZ'),
(1881, 1, 'LUIS RENE DURAN HERNANDEZ'),
(2074, 1, 'LUZ ARACELI GARCIA BELTRAN'),
(1297, 1, 'NANCY DEL CARMEN BENAVIDES'),
(1453, 1, 'RODOLFO ULYSES VAZQUEZ'),
(1510, 1, 'SERGIO BECERRA DELGADO'),
(1659, 1, 'SONIA ERIKA IBAÑEZ DE LA TORRE'),
(1320, 1, 'SUSANA ELIZABETH FERRER HERNANDEZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `ID_Observacion` int(4) NOT NULL,
  `Folio` int(4) NOT NULL,
  `Basura_en_el_piso` varchar(2) COLLATE latin1_bin NOT NULL,
  `Mesas_maltratadas` varchar(2) COLLATE latin1_bin NOT NULL,
  `Muros_maltratados` varchar(2) COLLATE latin1_bin NOT NULL,
  `Mal_comportamiento` varchar(2) COLLATE latin1_bin NOT NULL,
  `Basura_en_las_mesas` varchar(2) COLLATE latin1_bin NOT NULL,
  `Sillas_maltratadas` varchar(2) COLLATE latin1_bin NOT NULL,
  `Sillas _fuera _de _lugar` varchar(2) COLLATE latin1_bin NOT NULL,
  `Pintarron` varchar(2) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`ID_Observacion`, `Folio`, `Basura_en_el_piso`, `Mesas_maltratadas`, `Muros_maltratados`, `Mal_comportamiento`, `Basura_en_las_mesas`, `Sillas_maltratadas`, `Sillas _fuera _de _lugar`, `Pintarron`) VALUES
(1, 6, 'si', 'no', 'no', 'no', 'si', 'no', 'si', 'no'),
(2, 7, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `ID_Password` int(4) NOT NULL,
  `Usuario` varchar(30) COLLATE latin1_bin NOT NULL,
  `Contraseña` varchar(15) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`ID_Password`, `Usuario`, `Contraseña`) VALUES
(1, 'Carlo', 'CarlangasTangas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `Folio` int(4) NOT NULL,
  `Plantel` varchar(15) COLLATE latin1_bin NOT NULL,
  `Periodo` varchar(15) COLLATE latin1_bin NOT NULL,
  `Division` varchar(15) COLLATE latin1_bin NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time(4) DEFAULT NULL,
  `ID_Laboratorio` int(4) NOT NULL,
  `Descripcion` varchar(144) COLLATE latin1_bin DEFAULT NULL,
  `Otros` varchar(60) COLLATE latin1_bin DEFAULT NULL,
  `ID_M` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`Folio`, `Plantel`, `Periodo`, `Division`, `Fecha`, `Hora`, `ID_Laboratorio`, `Descripcion`, `Otros`, `ID_M`) VALUES
(1, 'Colomos', '2018B', 'Software', '2018-11-28', '09:50:00.0000', 4, '2 Computadoras sin software Net Beans', NULL, 1481),
(2, 'Colomos', '2018B', 'Software', '2018-11-28', '13:10:00.0000', 5, '4 computadoras sin internet', NULL, 1530),
(3, 'Colomos', '2018B', 'Software', '2018-11-28', '07:00:00.0000', 2, 'No están 2 computadoras', NULL, 2201),
(4, 'Colomos', '2018B', 'Software', '2018-11-28', '09:31:00.0000', 3, 'No están 4 computadoras', NULL, 2222),
(5, 'Colomos', '2018B', 'Software', '2018-11-29', '09:30:00.0000', 5, '4 computadoras sin internet', NULL, 1510),
(6, 'Colomos', '2018B', 'Software', '2018-11-29', '11:10:00.0000', 7, NULL, NULL, 1659),
(7, 'Colomos', '2018B', 'Software', '2018-11-29', '13:10:00.0000', 4, 'Pintarron con marcador permanente', NULL, 1659),
(8, 'Colomos', '2018B', 'Software', '2018-11-29', '01:00:00.0000', 7, 'No se encuentra el cable del cañon', NULL, 1396),
(9, 'Colomos', '2018B', 'Software', '2018-11-30', '08:50:00.0000', 4, 'No hay Internet en todo el salón', NULL, 1320),
(10, 'Colomos', '2018B', 'Software', '2018-12-03', NULL, 5, 'Falla en la tv', NULL, 1396),
(11, 'Colomos', '2018B', 'Software', '2018-12-03', NULL, 4, 'Falla por corto de 2 computadoras', NULL, 1320),
(12, 'Colomos', '2018B', 'Software', '2018-12-03', NULL, 4, 'Falla en la tv', NULL, 2222),
(13, 'Colomos', '2018B', 'Software', '2018-12-03', NULL, 4, 'Falta Internet y 1 computadora no prende', NULL, 1530),
(14, 'Colomos', '2018B', 'Software', '2018-12-04', NULL, 8, 'Pintaron sucio, mal funcionamiento ventilador y computadora no enciende', NULL, 355),
(15, 'Colomos', '2018B', 'Software', '2018-12-04', NULL, 4, 'Falla en la tv y 2 computadoras no encienden', NULL, 2201),
(16, 'Colomos', '2018B', 'Software', '2018-12-04', NULL, 5, 'f 2 computadoras', NULL, 1530);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `computadora`
--
ALTER TABLE `computadora`
  ADD PRIMARY KEY (`ID_Computadora`),
  ADD KEY `ID_L` (`ID_Laboratorio`);

--
-- Indices de la tabla `computadoras_reporte`
--
ALTER TABLE `computadoras_reporte`
  ADD PRIMARY KEY (`ID_ComRep`),
  ADD KEY `Folio` (`Folio`),
  ADD KEY `computadoras_reporte_ibfk_1` (`ID_Computadora`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`ID_Encargado`),
  ADD KEY `ID_P` (`ID_Password`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`ID_Laboratorio`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`Nombre`),
  ADD KEY `ID_P` (`ID_Password`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`ID_Observacion`),
  ADD KEY `Folio` (`Folio`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`ID_Password`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`Folio`),
  ADD KEY `reporte_ibfk_1` (`ID_M`),
  ADD KEY `ID_L` (`ID_Laboratorio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `computadoras_reporte`
--
ALTER TABLE `computadoras_reporte`
  MODIFY `ID_ComRep` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `Folio` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `computadora`
--
ALTER TABLE `computadora`
  ADD CONSTRAINT `computadora_ibfk_1` FOREIGN KEY (`ID_Laboratorio`) REFERENCES `laboratorio` (`ID_Laboratorio`);

--
-- Filtros para la tabla `computadoras_reporte`
--
ALTER TABLE `computadoras_reporte`
  ADD CONSTRAINT `computadoras_reporte_ibfk_1` FOREIGN KEY (`ID_Computadora`) REFERENCES `computadora` (`ID_Computadora`);

--
-- Filtros para la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD CONSTRAINT `encargado_ibfk_1` FOREIGN KEY (`ID_Password`) REFERENCES `perfil` (`ID_Password`);

--
-- Filtros para la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD CONSTRAINT `maestro_ibfk_1` FOREIGN KEY (`ID_Password`) REFERENCES `perfil` (`ID_Password`);

--
-- Filtros para la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD CONSTRAINT `observaciones_ibfk_1` FOREIGN KEY (`Folio`) REFERENCES `reporte` (`Folio`);

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`ID_Laboratorio`) REFERENCES `laboratorio` (`ID_Laboratorio`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
