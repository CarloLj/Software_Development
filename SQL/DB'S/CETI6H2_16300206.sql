-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2019 a las 21:13:54
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
-- Base de datos: `ceti6h2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia`
--

CREATE TABLE `academia` (
  `ID_Acad` tinyint(4) NOT NULL,
  `Nombre` varchar(48) DEFAULT NULL,
  `Carrera` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `academia`
--

INSERT INTO `academia` (`ID_Acad`, `Nombre`, `Carrera`) VALUES
(1, 'Informática', 100),
(2, 'Computación', 100),
(3, '\" Infraestructura de Tecnologias de\nInformacion\"', 100),
(4, 'Sistemas Analógicos', 100),
(5, 'Sistemas Digitales', 100),
(6, 'Inglés', 900),
(7, 'Matemáticas', 1000),
(9, 'Química', 1000),
(10, 'Dibujo', 1000),
(11, 'Técnicas Industriales', 900),
(12, 'Ciencias Sociales y Humanidades', 900),
(13, 'Metodologías', 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Registro` int(11) NOT NULL,
  `Nombre` varchar(17) DEFAULT NULL,
  `Apellidos` varchar(18) DEFAULT NULL,
  `Domicilio` varchar(32) DEFAULT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Municipio` tinyint(125) DEFAULT NULL,
  `Carrera` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Registro`, `Nombre`, `Apellidos`, `Domicilio`, `Celular`, `Sexo`, `Municipio`, `Carrera`) VALUES
(16100030, 'Sydney Alejandro', 'Ayala Pérez', 'Marina Puerto Melaque #12', 3317649385, 'M', 120, 100),
(16300065, 'Cristopher David', 'Ceja Sánchez', 'Santa Laura #118', 3322275374, 'M', 120, 100),
(16300098, 'Alan Mauricio', 'Farfan Pita', 'Valle de los Ruiseñores #2611', 3335522882, 'M', 120, 100),
(16300109, 'Mauricio Andrés', 'Flores Pérez', 'Plutarco Elías Calles #1426', 3316040498, 'M', 40, 100),
(16300171, 'Nhala Fernanda', 'Hernández Ruiz', 'Loma Real #273', 3321647768, 'F', 120, 100),
(16300175, 'Judith Alejandra', 'Hinojosa Rábago', 'Perla #2561', 3315581323, 'F', 40, 100),
(16300196, 'Miguel de Jesus', 'Lopez Esparza', 'Remanso de los alerces #1286', 3321089888, 'M', 120, 100),
(16300198, 'Erick Arturo', 'Lopez Jauregui', 'Prado de los Lirios #4216', 3312286807, 'M', 120, 100),
(16300206, 'Carlo Angel', 'Lujan Garcia', 'Paseo de las Aves #2220', 3322512297, 'M', 120, 100),
(16300231, 'Gabriela Nakeisha', 'Martínez Verduzco', 'Reino de Luxemburgo #99', 3321323247, 'F', 120, 100),
(16300266, 'Angel', 'Padilla Esqueda', 'Castillo #244', 3322513356, 'M', 120, 100),
(16300336, 'Angel Manuel', 'Ruvalcaba Garcia', 'Bahia Chamela #12', 3333984181, 'M', 120, 100),
(16301029, 'Ricardo', 'González Leal', 'Lázaro Cárdenas 2959', 3310851164, 'M', 40, 100),
(16301031, 'Alfredo Ahmed', 'Kuri Valencia', 'Leonidas #3164', 3321467268, 'M', 40, 100),
(16301095, 'Tania Sofia', 'Garcia Lopez', 'Primavera #203', 3334509242, 'F', 120, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `Clave` varchar(11) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Academia` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`Clave`, `Nombre`, `Academia`) VALUES
('MBCS2405BT', 'Ciencia, Tecnología, Sociedad y Valores', 13),
('MPF1605DSO', 'Arquitectura de Computadoras', 5),
('MPF1705DSO', 'Base de Datos I', 1),
('MPF1805DSO', 'Redes WAN', 3),
('MPF1905DSO', 'Estructura de Datos', 2),
('MPF2005DSO', 'Interfaces', 4),
('MPF2106DSO', 'Organización de Computadoras', 4),
('MPF2206DSO', 'Bases de Datos II', 1),
('MPF2306DSO', 'Sistemas Operativos', 3),
('MPF2406DSO', 'Programación Móvil I', 2),
('MPF2505MCC', 'Administración', 11),
('MPF2506DSO', 'Sistemas de Medición y Control', 4),
('MPF2806MCC', 'Metodología de la Investigación Aplicada', 13),
('MPF3006MCC', 'Inglés VI', 6),
('MPPCO2605BT', 'Inglés V', 6),
('MPPHU2906BT', 'Filosofía', 12),
('MPPMT2305BT', 'Matemáticas V', 7),
('MPPMT2706BT', 'Matemáticas VI', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `Cod` smallint(6) NOT NULL,
  `Periodo` char(11) DEFAULT NULL,
  `Calificacion` tinyint(4) DEFAULT NULL,
  `Alumno` int(11) DEFAULT NULL,
  `Docente` smallint(6) DEFAULT NULL,
  `Asignatura` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`Cod`, `Periodo`, `Calificacion`, `Alumno`, `Docente`, `Asignatura`) VALUES
(3, 'Feb-Jun2019', 88, 16300336, 1313, 'MPPMT2706BT'),
(10, 'Ago-Dic2018', 98, 16300336, 4444, 'MBCS2405BT'),
(11, 'Ago-Dic2018', 93, 16300336, 1215, 'MPF1605DSO'),
(12, 'Ago-Dic2018', 92, 16300336, 1320, 'MPF1705DSO'),
(13, 'Ago-Dic2018', 90, 16300336, 5444, 'MPF1805DSO'),
(14, 'Ago-Dic2018', 92, 16300336, 3222, 'MPF1905DSO'),
(15, 'Ago-Dic2018', 97, 16300336, 1818, 'MPF2005DSO'),
(16, 'Ago-Dic2018', 79, 16300336, 7777, 'MPF2505MCC'),
(17, 'Ago-Dic2018', 91, 16300336, 2828, 'MPPCO2605BT'),
(18, 'Ago-Dic2018', 93, 16300336, 6464, 'MPPMT2305BT'),
(19, 'Feb-Jun2019', 100, 16301029, 1550, 'MPPHU2906BT'),
(27, 'Feb-Jun2019', 100, 16301029, 3333, 'MPF2806MCC'),
(28, 'Ago-Dic2018', 98, 16301029, 4444, 'MBCS2405BT'),
(29, 'Ago-Dic2018', 91, 16301029, 1215, 'MPF1605DSO'),
(30, 'Ago-Dic2018', 87, 16301029, 1320, 'MPF1705DSO'),
(31, 'Ago-Dic2018', 95, 16301029, 1453, 'MPF1805DSO'),
(32, 'Ago-Dic2018', 83, 16301029, 1111, 'MPF1905DSO'),
(33, 'Ago-Dic2018', 95, 16301029, 1818, 'MPF2005DSO'),
(34, 'Ago-Dic2018', 90, 16301029, 7777, 'MPF2505MCC'),
(35, 'Ago-Dic2018', 97, 16301029, 2828, 'MPPCO2605BT'),
(36, 'Ago-Dic2018', 88, 16301029, 1313, 'MPPMT2305BT'),
(37, 'Feb-Jun2019', 94, 16300266, 1550, 'MPPHU2906BT'),
(45, 'Feb-Jun2019', 100, 16300266, 3333, 'MPF2806MCC'),
(46, 'Ago-Dic2018', 86, 16300266, 4444, 'MBCS2405BT'),
(47, 'Ago-Dic2018', 79, 16300266, 1215, 'MPF1605DSO'),
(48, 'Ago-Dic2018', 89, 16300266, 1320, 'MPF1705DSO'),
(49, 'Ago-Dic2018', 87, 16300266, 5444, 'MPF1805DSO'),
(50, 'Ago-Dic2018', 94, 16300266, 3222, 'MPF1905DSO'),
(51, 'Ago-Dic2018', 84, 16300266, 1818, 'MPF2005DSO'),
(52, 'Ago-Dic2018', 75, 16300266, 7777, 'MPF2505MCC'),
(53, 'Ago-Dic2018', 93, 16300266, 2828, 'MPPCO2605BT'),
(54, 'Ago-Dic2018', 89, 16300266, 6464, 'MPPMT2305BT'),
(63, 'Feb-Jun2019', 95, 16300198, 3333, 'MPF2806MCC'),
(64, 'Ago-Dic2018', 94, 16300198, 4444, 'MBCS2405BT'),
(65, 'Ago-Dic2018', 80, 16300198, 1215, 'MPF1605DSO'),
(66, 'Ago-Dic2018', 93, 16300198, 1320, 'MPF1705DSO'),
(67, 'Ago-Dic2018', 92, 16300198, 5444, 'MPF1805DSO'),
(68, 'Ago-Dic2018', 88, 16300198, 3222, 'MPF1905DSO'),
(69, 'Ago-Dic2018', 98, 16300198, 1818, 'MPF2005DSO'),
(70, 'Ago-Dic2018', 81, 16300198, 7777, 'MPF2505MCC'),
(71, 'Ago-Dic2018', 97, 16300198, 2828, 'MPPCO2605BT'),
(72, 'Ago-Dic2018', 93, 16300198, 6464, 'MPPMT2305BT'),
(82, 'Ago-Dic2018', 100, 16300231, 4444, 'MBCS2405BT'),
(83, 'Ago-Dic2018', 78, 16300231, 1215, 'MPF1605DSO'),
(84, 'Ago-Dic2018', 92, 16300231, 1320, 'MPF1705DSO'),
(85, 'Ago-Dic2018', 91, 16300231, 5444, 'MPF1805DSO'),
(86, 'Ago-Dic2018', 89, 16300231, 3222, 'MPF1905DSO'),
(87, 'Ago-Dic2018', 94, 16300231, 1818, 'MPF2005DSO'),
(88, 'Ago-Dic2018', 92, 16300231, 7777, 'MPF2505MCC'),
(89, 'Ago-Dic2018', 91, 16300231, 2828, 'MPPMT2305BT'),
(90, 'Ago-Dic2018', 89, 16300231, 6464, 'MPPMT2305BT'),
(100, 'Ago-Dic2018', 100, 16300175, 4444, 'MBCS2405BT'),
(101, 'Ago-Dic2018', 87, 16300175, 1215, 'MPF1605DSO'),
(102, 'Ago-Dic2018', 94, 16300175, 1320, 'MPF1705DSO'),
(103, 'Ago-Dic2018', 95, 16300175, 5444, 'MPF1805DSO'),
(104, 'Ago-Dic2018', 92, 16300175, 3222, 'MPF1905DSO'),
(105, 'Ago-Dic2018', 98, 16300175, 1818, 'MPF2005DSO'),
(106, 'Ago-Dic2018', 95, 16300175, 7777, 'MPF2505MCC'),
(107, 'Ago-Dic2018', 96, 16300175, 5544, 'MPPCO2605BT'),
(108, 'Ago-Dic2018', 100, 16300175, 6464, 'MPPMT2305BT'),
(118, 'Ago-Dic2018', 94, 16300196, 4444, 'MBCS2405BT'),
(119, 'Ago-Dic2018', 85, 16300196, 1215, 'MPF1605DSO'),
(120, 'Ago-Dic2018', 90, 16300196, 1320, 'MPF1705DSO'),
(121, 'Ago-Dic2018', 92, 16300196, 5444, 'MPF1805DSO'),
(122, 'Ago-Dic2018', 93, 16300196, 3222, 'MPF1905DSO'),
(123, 'Ago-Dic2018', 89, 16300196, 1818, 'MPF2005DSO'),
(124, 'Ago-Dic2018', 95, 16300196, 7777, 'MPF2505MCC'),
(125, 'Ago-Dic2018', 90, 16300196, 2828, 'MPPCO2605BT'),
(126, 'Ago-Dic2018', 97, 16300196, 6464, 'MPPMT2305BT'),
(127, 'Feb-Jun2019', 100, 16300206, 1550, 'MPPHU2906BT'),
(135, 'Feb-Jun2019', 100, 16300206, 3333, 'MPF2806MCC'),
(136, 'Ago-Dic2018', 100, 16300206, 4444, 'MBCS2405BT'),
(137, 'Ago-Dic2018', 89, 16300206, 1215, 'MPF1605DSO'),
(138, 'Ago-Dic2018', 89, 16300206, 1320, 'MPF1705DSO'),
(139, 'Ago-Dic2018', 93, 16300206, 5444, 'MPF1805DSO'),
(140, 'Ago-Dic2018', 86, 16300206, 3222, 'MPF1905DSO'),
(141, 'Ago-Dic2018', 94, 16300206, 1818, 'MPF2005DSO'),
(142, 'Ago-Dic2018', 81, 16300206, 7777, 'MPF2505MCC'),
(143, 'Ago-Dic2018', 80, 16300206, 2828, 'MPPCO2605BT'),
(144, 'Ago-Dic2018', 80, 16300206, 6464, 'MPPMT2305BT'),
(154, 'Ago-Dic2018', 99, 16300109, 4444, 'MBCS2405BT'),
(155, 'Ago-Dic2018', 96, 16300109, 1215, 'MPF1605DSO'),
(156, 'Ago-Dic2018', 92, 16300109, 1320, 'MPF1705DSO'),
(157, 'Ago-Dic2018', 93, 16300109, 5444, 'MPF1805DSO'),
(158, 'Ago-Dic2018', 100, 16300109, 3222, 'MPF1905DSO'),
(159, 'Ago-Dic2018', 97, 16300109, 1818, 'MPF2005DSO'),
(160, 'Ago-Dic2018', 93, 16300109, 7777, 'MPF2505MCC'),
(161, 'Ago-Dic2018', 87, 16300109, 5544, 'MPPCO2605BT'),
(162, 'Ago-Dic2018', 97, 16300109, 6464, 'MPPMT2305BT'),
(163, 'Feb-Jun2018', 98, 16100030, 4444, 'MBCS2405BT'),
(164, 'Feb-Jun2018', 72, 16100030, 1215, 'MPF1605DSO'),
(165, 'Feb-Jun2018', 80, 16100030, 9888, 'MPF1705DSO'),
(166, 'Feb-Jun2018', 88, 16100030, 1453, 'MPF1805DSO'),
(167, 'Feb-Jun2018', 73, 16100030, 1320, 'MPF1905DSO'),
(168, 'Feb-Jun2018', 82, 16100030, 1215, 'MPF2005DSO'),
(169, 'Feb-Jun2018', 76, 16100030, 7777, 'MPF2505MCC'),
(170, 'Feb-Jun2018', 81, 16100030, 8777, 'MPPCO2605BT'),
(171, 'Feb-Jun2018', 96, 16100030, 6464, 'MPPMT2305BT'),
(172, 'Ago-Dic2018', 95, 16100030, 2111, 'MPPHU2906BT'),
(173, 'Ago-Dic2018', 82, 16100030, 8777, 'MPF3006MCC'),
(174, 'Ago-Dic2018', 90, 16100030, 7666, 'MPPMT2706BT'),
(175, 'Ago-Dic2018', 82, 16100030, 1215, 'MPF2106DSO'),
(176, 'Ago-Dic2018', 69, 16100030, 1111, 'MPF2206DSO'),
(177, 'Ago-Dic2018', 82, 16100030, 9000, 'MPF2306DSO'),
(178, 'Ago-Dic2018', 69, 16100030, 1212, 'MPF2406DSO'),
(179, 'Ago-Dic2018', 79, 16100030, 2222, 'MPF2506DSO'),
(180, 'Ago-Dic2018', 93, 16100030, 3333, 'MPF2806MCC'),
(190, 'Ago-Dic2018', 97, 16300065, 4444, 'MBCS2405BT'),
(191, 'Ago-Dic2018', 95, 16300065, 1215, 'MPF1605DSO'),
(192, 'Ago-Dic2018', 96, 16300065, 1320, 'MPF1705DSO'),
(193, 'Ago-Dic2018', 97, 16300065, 5444, 'MPF1805DSO'),
(194, 'Ago-Dic2018', 98, 16300065, 3222, 'MPF1905DSO'),
(195, 'Ago-Dic2018', 99, 16300065, 1818, 'MPF2005DSO'),
(196, 'Ago-Dic2018', 95, 16300065, 7777, 'MPF2505MCC'),
(197, 'Ago-Dic2018', 91, 16300065, 2828, 'MPPCO2605BT'),
(198, 'Ago-Dic2018', 100, 16300065, 6464, 'MPPMT2305BT'),
(201, 'Feb-Jun2019', 90, 16300098, 1313, 'MPPMT2706BT'),
(208, 'Ago-Dic2018', 99, 16300098, 4444, 'MBCS2405BT'),
(209, 'Ago-Dic2018', 98, 16300098, 1215, 'MPF1605DSO'),
(210, 'Ago-Dic2018', 95, 16300098, 1320, 'MPF1705DSO'),
(211, 'Ago-Dic2018', 95, 16300098, 5444, 'MPF1805DSO'),
(212, 'Ago-Dic2018', 94, 16300098, 3222, 'MPF1905DSO'),
(213, 'Ago-Dic2018', 99, 16300098, 1818, 'MPF2005DSO'),
(214, 'Ago-Dic2018', 93, 16300098, 7777, 'MPF2505MCC'),
(215, 'Ago-Dic2018', 97, 16300098, 2828, 'MPPCO2605BT'),
(216, 'Ago-Dic2018', 100, 16300098, 6464, 'MPPMT2305BT'),
(226, 'Ago-Dic2018', 99, 16300171, 4444, 'MBCS2405BT'),
(228, 'Ago-Dic2018', 74, 16300171, 1320, 'MPF1705DSO'),
(229, 'Ago-Dic2018', 83, 16300171, 5444, 'MPF1805DSO'),
(231, 'Ago-Dic2018', 72, 16300171, 1818, 'MPF2005DSO'),
(232, 'Ago-Dic2018', 85, 16300171, 7777, 'MPF2505MCC'),
(233, 'Ago-Dic2018', 70, 16300171, 5544, 'MPPCO2605BT'),
(234, 'Ago-Dic2018', 70, 16300171, 6464, 'MPPMT2305BT'),
(244, 'Ago-Dic2018', 100, 16301095, 4444, 'MBCS2405BT'),
(246, 'Ago-Dic2018', 80, 16301095, 1320, 'MPF1705DSO'),
(247, 'Ago-Dic2018', 77, 16301095, 5444, 'MPF1805DSO'),
(249, 'Ago-Dic2018', 76, 16301095, 1818, 'MPF2005DSO'),
(250, 'Ago-Dic2018', 82, 16301095, 7777, 'MPF2505MCC'),
(251, 'Ago-Dic2018', 93, 16301095, 5544, 'MPPCO2605BT'),
(252, 'Ago-Dic2018', 74, 16301095, 6464, 'MPPMT2305BT'),
(262, 'Ago-Dic2018', 93, 16301031, 4444, 'MBCS2405BT'),
(264, 'Ago-Dic2018', 71, 16301031, 1320, 'MPF1705DSO'),
(265, 'Ago-Dic2018', 75, 16301031, 5444, 'MPF1805DSO'),
(266, 'Ago-Dic2018', 70, 16301031, 3222, 'MPF1905DSO'),
(267, 'Ago-Dic2018', 85, 16301031, 1818, 'MPF2005DSO'),
(268, 'Ago-Dic2018', 88, 16301031, 7777, 'MPF2505MCC'),
(269, 'Ago-Dic2018', 75, 16301031, 2828, 'MPPCO2605BT'),
(270, 'Ago-Dic2018', 88, 16301031, 6464, 'MPPMT2305BT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `ID_Carrera` smallint(6) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`ID_Carrera`, `Nombre`) VALUES
(100, 'Tecnólogo en Desarrollo de Software'),
(200, 'Tecnólogo en Electronica y Comunicaciones'),
(300, 'Tecnólogo en Control Automático e Instrumentación'),
(400, 'Tecnólogo en Electromecánica'),
(500, 'Tecnólogo en Mecánica Automotriz'),
(600, 'Tecnólogo en Máquinas y Herramientas'),
(700, 'Tecnólogo en Construcción'),
(800, 'Tecnólogo en Químico en Fármacos'),
(900, 'Administrativas'),
(1000, 'Básicas'),
(1100, 'Ingeniero en Diseño Electrónico y Sistemas Intelig'),
(1200, 'Ingeniero en Desarrollo de Software'),
(1300, 'Ingeniero Industrial'),
(1400, 'Ingeniero en Mecatrónica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `Nomina` smallint(6) NOT NULL,
  `Nombre` varchar(16) DEFAULT NULL,
  `Apellidos` varchar(18) DEFAULT NULL,
  `Academia` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`Nomina`, `Nombre`, `Apellidos`, `Academia`) VALUES
(1111, 'Karla Areli', 'Isaac Rodriguez', 1),
(1212, 'Ramiro', 'Lupercio Coronel', 2),
(1215, 'Carlos Alberto', 'Ramirez Garcia', 4),
(1313, 'Carlos Tomás', 'Santana Collin', 7),
(1320, 'Susana Elizabeth', 'Ferrer Hernandez', 2),
(1453, 'Rodolfo Ulyses', 'Vázquez Cárdenas', 3),
(1550, 'María de Lourdes', 'Bustos Hernández', 7),
(1818, 'Nancy del Carmen', 'Benavides Medina', 4),
(2111, 'Karla Guadalupe', 'Diaz Ruelas', 12),
(2222, 'Diana Marisol ', 'Figueroa Flores', 4),
(2828, 'Laura Josefina', 'Martínez', 6),
(3222, 'Sergio', 'Becerra Delgado', 2),
(3333, 'Maricela Alicia', 'Loredo Guzman', 12),
(4333, 'Juan Antonio', 'Garcia Santos', 7),
(4444, 'Misael', 'Rivera Cortes', 12),
(4562, 'Mario Alberto', 'Soto Ramírez', 3),
(5444, 'Andrés', 'Figueroa Flores', 3),
(5544, 'Silvia Guillermi', 'Delgado Barba', 6),
(6464, 'Lourdes', 'Gandara Cantú', 7),
(7666, 'Teresita', 'Betancourt Pérez', 7),
(7777, 'Claudia Bethzabe', 'Pardo Rosales', 12),
(8777, 'José Victor', 'Ramos Flores', 6),
(8888, 'Juan Manuel', 'Haros Vargas', 12),
(9000, 'Jorge', 'Pamplona Campa', 3),
(9888, 'Luis Rene', 'Durán Hernández', 1),
(9999, 'Luis Fernando', 'Ortiz Hernandez', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `Clave` tinyint(125) NOT NULL,
  `Municipio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`Clave`, `Municipio`) VALUES
(1, 'Acatic'),
(2, 'Acatlán de Juárez'),
(3, 'Ahualulco de Mercado'),
(4, 'Amacueca'),
(5, 'Amatitán'),
(6, 'Ameca'),
(7, 'Arandas'),
(8, 'Atemajac de Brizuela'),
(9, 'Atengo'),
(10, 'Atenguillo'),
(11, 'Atotonilco el Alto'),
(12, 'Atoyac'),
(13, 'Autlán de Navarro'),
(14, 'Ayotlán'),
(15, 'Ayutla'),
(16, 'Bolaños'),
(17, 'Cabo Corrientes'),
(18, 'Cañadas de Obregón'),
(19, 'Casimiro Castillo'),
(20, 'Chapala'),
(21, 'Chimaltitán'),
(22, 'Chiquilistlán'),
(23, 'Cihuatlán'),
(24, 'Cocula'),
(25, 'Colotlán'),
(26, 'Concepción de Buenos Aires'),
(27, 'Cuautitlán de García Barragán'),
(28, 'Cuautla'),
(29, 'Cuquío'),
(30, 'Degollado'),
(31, 'Ejutla'),
(32, 'El Arenal'),
(33, 'El Grullo'),
(34, 'El Limón'),
(35, 'El Salto'),
(36, 'Encarnación de Díaz'),
(37, 'Etzatlán'),
(38, 'Gómez Farías'),
(39, 'Guachinango'),
(40, 'Guadalajara'),
(41, 'Hostotipaquillo'),
(42, 'Huejúcar'),
(43, 'Huejuquilla el Alto'),
(44, 'Ixtlahuacán de los Membrillos'),
(45, 'Ixtlahuacán del Río'),
(46, 'Jalostotitlán'),
(47, 'Jamay'),
(48, 'Jesús María'),
(49, 'Jilotlán de los Dolores'),
(50, 'Jocotepec'),
(51, 'Juanacatlán'),
(52, 'Juchitlán'),
(53, 'La Barca'),
(54, 'La Huerta'),
(55, 'La Manzanilla de la Paz'),
(56, 'Lagos de Moreno'),
(57, 'Magdalena'),
(58, 'Mascota'),
(59, 'Mazamitla'),
(60, 'Mexticacán'),
(61, 'Mezquitic'),
(62, 'Mixtlán'),
(63, 'Ocotlán'),
(64, 'Ojuelos de Jalisco'),
(65, 'Pihuamo'),
(66, 'Poncitlán'),
(67, 'Puerto Vallarta'),
(68, 'Quitupan'),
(69, 'San Cristóbal de la Barranca'),
(70, 'San Diego de Alejandría'),
(71, 'San Gabriel'),
(72, 'San Ignacio Cerro Gordo'),
(73, 'San Juan de los Lagos'),
(74, 'San Juanito de Escobedo'),
(75, 'San Julián'),
(76, 'San Marcos'),
(77, 'San Martín de Bolaños'),
(78, 'San Martín Hidalgo'),
(79, 'San Miguel el Alto'),
(80, 'San Pedro Tlaquepaque'),
(81, 'San Sebastián del Oeste'),
(82, 'Santa María de los Ángeles'),
(83, 'Santa María del Oro'),
(84, 'Sayula'),
(85, 'Tala'),
(86, 'Talpa de Allende'),
(87, 'Tamazula de Gordiano'),
(88, 'Tapalpa'),
(89, 'Tecalitlán'),
(90, 'Techaluta de Montenegro'),
(91, 'Tecolotlán'),
(92, 'Tenamaxtlán'),
(93, 'Teocaltiche'),
(94, 'Teocuitatlán de Corona'),
(95, 'Tepatitlán de Morelos'),
(96, 'Tequila'),
(97, 'Teuchitlán'),
(98, 'Tizapán el Alto'),
(99, 'Tlajomulco de Zúñiga'),
(100, 'Tolimán'),
(101, 'Tomatlán'),
(102, 'Tonalá'),
(103, 'Tonaya'),
(104, 'Tonila'),
(105, 'Totatiche'),
(106, 'Tototlán'),
(107, 'Tuxcacuesco'),
(108, 'Tuxcueca'),
(109, 'Tuxpan'),
(110, 'Unión de San Antonio'),
(111, 'Unión de Tula'),
(112, 'Valle de Guadalupe'),
(113, 'Valle de Juárez'),
(114, 'Villa Corona'),
(115, 'Villa Guerrero'),
(116, 'Villa Hidalgo'),
(117, 'Villa Purificación'),
(118, 'Yahualica de González Gallo'),
(119, 'Zacoalco de Torres'),
(120, 'Zapopan'),
(121, 'Zapotiltic'),
(122, 'Zapotitlán de Vadillo'),
(123, 'Zapotlán del Rey'),
(124, 'Zapotlán el Grande'),
(125, 'Zapotlanejo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academia`
--
ALTER TABLE `academia`
  ADD PRIMARY KEY (`ID_Acad`),
  ADD KEY `Carrera` (`Carrera`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Registro`),
  ADD KEY `Municipio` (`Municipio`),
  ADD KEY `Carrera` (`Carrera`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`Clave`),
  ADD KEY `Academia` (`Academia`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`Cod`),
  ADD KEY `Alumno` (`Alumno`),
  ADD KEY `Docente` (`Docente`),
  ADD KEY `Asignatura` (`Asignatura`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`ID_Carrera`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`Nomina`),
  ADD KEY `Academia` (`Academia`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`Clave`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `academia`
--
ALTER TABLE `academia`
  ADD CONSTRAINT `academia_ibfk_1` FOREIGN KEY (`Carrera`) REFERENCES `carrera` (`ID_Carrera`);

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`Municipio`) REFERENCES `municipio` (`Clave`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`Carrera`) REFERENCES `carrera` (`ID_Carrera`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`Academia`) REFERENCES `academia` (`ID_Acad`);

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`Alumno`) REFERENCES `alumno` (`Registro`),
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`Docente`) REFERENCES `docente` (`Nomina`),
  ADD CONSTRAINT `calificacion_ibfk_3` FOREIGN KEY (`Asignatura`) REFERENCES `asignatura` (`Clave`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`Academia`) REFERENCES `academia` (`ID_Acad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
