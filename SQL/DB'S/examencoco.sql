-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2020 a las 19:35:36
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examencoco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `IdComentario` int(11) NOT NULL,
  `Comentario` varchar(250) NOT NULL,
  `Fecha` date NOT NULL,
  `IdLibro` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`IdComentario`, `Comentario`, `Fecha`, `IdLibro`, `IdUsuario`) VALUES
(1, 'Me encanto este libro!! no puedo creer que lo termine :c', '2020-04-01', 1, 1),
(2, 'WOW! un amigo me lo recomendo y yo se los quiero recomentar, esta genial', '2020-04-02', 1, 2),
(3, 'meh, esta parte esta mas aburrida, hasta el final se empieza a poner mejor', '2020-04-10', 2, 1),
(4, 'Mis expectativas siguen altas para el tercer libro', '2020-04-17', 2, 2),
(5, 'INCREIBLE, esat trilogia es un aobra maestra', '2020-04-30', 3, 1),
(6, '100% recomendado, da un buen final', '2020-04-28', 3, 2),
(7, 'Se vienen cosas geniales!!!', '2020-04-13', 4, 5),
(8, 'SUPER epico', '2020-04-10', 4, 3),
(9, 'no esperaba que me gustara tanto este libro, le doy 5 estrellas', '2020-04-14', 5, 4),
(10, 'ps mas o menos, prefiero lo clasico', '2020-04-09', 5, 3),
(11, 'realemnte prefiero las pelis', '2020-06-18', 6, 2),
(12, 'no pude dormir por 1 semana', '2020-05-14', 6, 4),
(13, 'que trae este autor en la cabeza?\r\nES GENIAL!!', '2020-05-09', 7, 5),
(14, '2 de 5 estrellas', '2020-05-26', 7, 3),
(15, 'Me gusto bastante', '2020-06-26', 8, 1),
(16, 'Se lo recomendé a mi mamá para que se asuste!!!', '2020-06-12', 8, 2),
(17, 'Dsepciona', '2020-07-29', 9, 4),
(18, 'no decepciona', '2020-06-14', 9, 5),
(19, 'No me gusto tanto este libro la verdad..', '2020-06-10', 10, 2),
(20, 'Al principio va bien, se siente el miedo, pero el final es horroroso', '2020-06-30', 10, 3),
(21, 'De esto estaba hablando', '2020-08-27', 11, 3),
(22, 'Que libro tan loco', '2020-07-29', 11, 1),
(23, 'Habia leido libros de terror, pero esto es otra cosa', '2020-05-06', 12, 5),
(24, 'Sin palabras', '2020-05-05', 12, 2),
(25, 'El mejor libro de la vida', '2020-06-02', 13, 3),
(26, 'WTF! ESTA MUY TERRORIFICO D:', '2020-06-02', 13, 4),
(27, 'Cada vez me sorprendo mas!', '2020-09-23', 14, 3),
(28, 'no me gusto la verdad', '2020-05-26', 14, 2),
(29, 'esta bien, he leido cosas mejores como brandon sanderson, ese si rifa', '2020-07-31', 15, 1),
(30, 'Este libro es realmente legendario, OBRA MAESTRA SALU2', '2020-06-30', 15, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `IdLibro` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Autor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`IdLibro`, `Titulo`, `Autor`) VALUES
(1, 'SteelHeart', 'Brandon Sanderson'),
(2, 'FireFight', 'Brandon Sanderson'),
(3, 'Calamity', 'Brandon Sanderson'),
(4, 'El Camino De Los Reyes', 'Brandon Sanderson'),
(5, 'Palabras Radiantes', 'Brandon Sanderson'),
(6, 'It', 'Stephen King'),
(7, 'El Resplandor', 'Stephen King'),
(8, 'Doctor Sueño', 'Stephen King'),
(9, 'Cementerio de Animales', 'Stephen King'),
(10, '1922', 'Stephen King'),
(11, 'En las Montañas de la Locura', 'Howard Phillips Lovecraft'),
(12, 'La sombra sobre Innsmouth', 'Howard Phillips Lovecraft'),
(13, 'El horror de Dunwich', 'Howard Phillips Lovecraft'),
(14, 'Los gatos de Ulthar', 'Howard Phillips Lovecraft'),
(15, 'El Intruso', 'Howard Phillips Lovecraft');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoP` varchar(50) NOT NULL,
  `ApellidoM` varchar(50) NOT NULL,
  `Nick` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `ApellidoP`, `ApellidoM`, `Nick`, `Password`) VALUES
(1, 'Angel', 'Padilla', 'Esqueda', 'IntAngel', 'pasemeCon100'),
(2, 'Marco', 'Ramirez', 'Garcia', 'Velocirraptor8000', 'GatosCantantes1234'),
(3, 'Daniela', 'Mercado', 'Martinez', 'DaniLove', 'contra123'),
(4, 'Max', 'Steel', 'Gonzalez', 'Maximus', 'M4xSTEEL45'),
(5, 'Karla', 'Gonzalez', 'Garcia', 'Karlita', 'libros123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`IdComentario`);

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
