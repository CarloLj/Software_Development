-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2020 a las 04:11:05
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
-- Base de datos: `16300206_examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `IdComentario` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdLibro` int(11) NOT NULL,
  `Comentario` varchar(256) DEFAULT NULL,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
PARTITION BY RANGE (IdLibro)
(
PARTITION WilliamShakespeare VALUES LESS THAN (4) ENGINE=InnoDB,
PARTITION JamesJoyce VALUES LESS THAN (7) ENGINE=InnoDB,
PARTITION GabrielGarcíaMárquez VALUES LESS THAN (10) ENGINE=InnoDB,
PARTITION PauloCoelho VALUES LESS THAN (13) ENGINE=InnoDB,
PARTITION ErnestHemmingway VALUES LESS THAN (16) ENGINE=InnoDB
);

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`IdComentario`, `IdUsuario`, `IdLibro`, `Comentario`, `Fecha`) VALUES
(1, 1, 1, 'Este libro hizo llorar a mi abuelo...', '2020-01-01'),
(2, 1, 1, 'El tiempo lo cura todo', '2020-02-02'),
(3, 2, 2, 'Aburrido', '2020-03-03'),
(4, 2, 2, 'Como hacer que una persona se decepcione con las primeras paginas, malisimo', '2020-04-04'),
(5, 2, 3, 'Obra magistral', '2020-05-05'),
(6, 3, 3, 'Mi tia me dijo que lo leyera y hasta el momento no me arrepiento ni un solo segundo', '2020-06-06'),
(7, 3, 4, 'Si tan solo ella me quisiera...', '2020-07-07'),
(8, 4, 4, '¿Quieres llorar de tan buena redaccion?, este es tu libro', '2020-08-08'),
(9, 4, 5, '5 estrellas', '2020-09-09'),
(10, 5, 5, 'Hora de tirarlo a la basura', '2020-10-10'),
(11, 5, 6, 'Quieres morir de aburrimiento, lee este libro', '2020-11-11'),
(12, 1, 6, 'Lo lei todo sin parar, es adictivo', '2020-12-12'),
(13, 1, 7, 'Un poco mas de basura del siglo pasado', '2020-01-01'),
(14, 2, 7, 'Una obra hermosa, y sentimental, me encanto', '2020-02-02'),
(15, 2, 8, 'Ser o no ser', '2020-02-02'),
(16, 3, 8, 'Profe si lee esto pongame cien jajajaj', '2020-02-03'),
(17, 3, 9, '¿Que es lo mejor que he leido? este libro por supuesto', '2020-04-04'),
(18, 4, 9, 'Quise gritar, pero mi vecino me pego', '2020-04-04'),
(19, 4, 10, 'Que si es bueno... bueno... mi gato vomito al verlo', '2020-05-05'),
(20, 5, 10, 'Un final espectacular', '2020-05-05'),
(21, 5, 11, 'Sin duda lo volveria a comprar', '2020-05-09'),
(22, 1, 11, 'Definitivamene me gusto', '2020-04-01'),
(23, 1, 12, 'Que es lo mejor de ser feliz sin leer un libro', '2020-05-05'),
(24, 2, 12, 'Esto es una obra maestra, 5 estrellas', '2020-01-05'),
(25, 2, 13, 'Si pudiera leerlo 1000 veces en un dia lo haria', '2020-01-02'),
(26, 3, 13, 'Quise gritar de felicidad', '2020-03-02'),
(27, 3, 14, 'Quise llorar de tristeza', '2020-03-23'),
(28, 4, 14, 'Jjajja pongame cien profe andele', '2020-01-20'),
(29, 4, 15, 'Esta chida mi base de datos', '2020-01-01'),
(30, 5, 15, '¡Feliz cumpleaños margaret!', '2020-01-01');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ernesthmwy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ernesthmwy` (
`IdComentario` int(11)
,`IdUsuario` int(11)
,`IdLibro` int(11)
,`Comentario` varchar(256)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `gabrielgm`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `gabrielgm` (
`IdComentario` int(11)
,`IdUsuario` int(11)
,`IdLibro` int(11)
,`Comentario` varchar(256)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `jamesjyce`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `jamesjyce` (
`IdComentario` int(11)
,`IdUsuario` int(11)
,`IdLibro` int(11)
,`Comentario` varchar(256)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `IdLibro` int(11) NOT NULL,
  `Titulo` varchar(50) DEFAULT NULL,
  `Autor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`IdLibro`, `Titulo`, `Autor`) VALUES
(1, 'Sueño de una noche de verano', 'William Shakespeare'),
(2, 'El Rey Lear', 'William Shakespeare'),
(3, 'Noche de Reyes', 'William Shakespeare'),
(4, 'Ulises', 'James Joyce'),
(5, 'Dublineses', 'James Joyce'),
(6, 'Retrato del artista adolescente', 'James Joyce'),
(7, 'Cien años de Soledad', 'Gabriel García Márquez'),
(8, 'El Amor en los Tiempos del Cólera', 'Gabriel García Márquez'),
(9, 'Crónica de una Muerte Anunciada', 'Gabriel García Márquez'),
(10, 'El peregrino de Compostela', 'Paulo Coelho'),
(11, 'El alquimista ', 'Paulo Coelho'),
(12, 'Brida', 'Paulo Coelho'),
(13, 'París era una fiesta', 'Ernest Hemmingway'),
(14, 'El viejo y el mar', 'Ernest Hemmingway'),
(15, 'Adiós a las armas', 'Ernest Hemmingway');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `paulocho`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `paulocho` (
`IdComentario` int(11)
,`IdUsuario` int(11)
,`IdLibro` int(11)
,`Comentario` varchar(256)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ApellidoP` varchar(255) DEFAULT NULL,
  `ApellidoM` varchar(255) DEFAULT NULL,
  `Nick` varchar(20) DEFAULT NULL,
  `Password` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `nombre`, `ApellidoP`, `ApellidoM`, `Nick`, `Password`) VALUES
(1, 'Carlo Angel', 'Lujan', 'Garcia', 'carlouxljlj', '123456'),
(2, 'Angel', 'Padilla', 'Esqueda', 'intAngel', '123456'),
(3, 'Miguel de Jesus', 'Lopez', 'Esparza', 'GreatMaic', '123456'),
(4, 'Erick Arturo', 'Lopez', 'Jauregui', 'ErickLj', '123456'),
(5, 'Ricardo', 'Goznalez', 'Leal', 'Snogle', '123456');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `williamshk`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `williamshk` (
`IdComentario` int(11)
,`IdUsuario` int(11)
,`IdLibro` int(11)
,`Comentario` varchar(256)
,`Fecha` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ernesthmwy`
--
DROP TABLE IF EXISTS `ernesthmwy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ernesthmwy`  AS  select `comentario`.`IdComentario` AS `IdComentario`,`comentario`.`IdUsuario` AS `IdUsuario`,`comentario`.`IdLibro` AS `IdLibro`,`comentario`.`Comentario` AS `Comentario`,`comentario`.`Fecha` AS `Fecha` from `comentario` PARTITION (`ErnestHemmingway`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `gabrielgm`
--
DROP TABLE IF EXISTS `gabrielgm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gabrielgm`  AS  select `comentario`.`IdComentario` AS `IdComentario`,`comentario`.`IdUsuario` AS `IdUsuario`,`comentario`.`IdLibro` AS `IdLibro`,`comentario`.`Comentario` AS `Comentario`,`comentario`.`Fecha` AS `Fecha` from `comentario` PARTITION (`GabrielGarcíaMárquez`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `jamesjyce`
--
DROP TABLE IF EXISTS `jamesjyce`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jamesjyce`  AS  select `comentario`.`IdComentario` AS `IdComentario`,`comentario`.`IdUsuario` AS `IdUsuario`,`comentario`.`IdLibro` AS `IdLibro`,`comentario`.`Comentario` AS `Comentario`,`comentario`.`Fecha` AS `Fecha` from `comentario` PARTITION (`JamesJoyce`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `paulocho`
--
DROP TABLE IF EXISTS `paulocho`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `paulocho`  AS  select `comentario`.`IdComentario` AS `IdComentario`,`comentario`.`IdUsuario` AS `IdUsuario`,`comentario`.`IdLibro` AS `IdLibro`,`comentario`.`Comentario` AS `Comentario`,`comentario`.`Fecha` AS `Fecha` from `comentario` PARTITION (`PauloCoelho`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `williamshk`
--
DROP TABLE IF EXISTS `williamshk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `williamshk`  AS  select `comentario`.`IdComentario` AS `IdComentario`,`comentario`.`IdUsuario` AS `IdUsuario`,`comentario`.`IdLibro` AS `IdLibro`,`comentario`.`Comentario` AS `Comentario`,`comentario`.`Fecha` AS `Fecha` from `comentario` PARTITION (`WilliamShakespeare`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`IdComentario`,`IdLibro`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`IdLibro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
