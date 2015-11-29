-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-11-2015 a las 00:47:58
-- Versión del servidor: 5.5.46-0+deb8u1
-- Versión de PHP: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `escaneo3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ips`
--

CREATE TABLE IF NOT EXISTS `ips` (
`id` int(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `isp` varchar(255) DEFAULT NULL,
  `ciudad` varchar(120) DEFAULT NULL,
  `zona` int(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ips`
--

INSERT INTO `ips` (`id`, `ip`, `isp`, `ciudad`, `zona`) VALUES
(1, '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puertos`
--

CREATE TABLE IF NOT EXISTS `puertos` (
`id` int(11) NOT NULL,
  `idip` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL DEFAULT 'TCP/UDP',
  `puerto` int(255) NOT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  `respuesta` text
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puertos`
--

INSERT INTO `puertos` (`id`, `idip`, `tipo`, `puerto`, `servicio`, `respuesta`) VALUES
(1, 1, 'TCP/UDP', 1, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ips`
--
ALTER TABLE `ips`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puertos`
--
ALTER TABLE `puertos`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ips`
--
ALTER TABLE `ips`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `puertos`
--
ALTER TABLE `puertos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
