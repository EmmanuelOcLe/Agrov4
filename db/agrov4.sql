-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-06-2025 a las 21:55:06
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agrov4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
CREATE TABLE IF NOT EXISTS `colaboradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_identificacion` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
CREATE TABLE IF NOT EXISTS `herramientas` (
  `referencia` varchar(100) NOT NULL,
  `estado` enum('bueno','regular','malo') NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`referencia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

DROP TABLE IF EXISTS `insumos`;
CREATE TABLE IF NOT EXISTS `insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_insumo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_herramientas`
--

DROP TABLE IF EXISTS `mantenimiento_herramientas`;
CREATE TABLE IF NOT EXISTS `mantenimiento_herramientas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_herramienta` varchar(100) NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mantenimiento_id_herramienta` (`id_herramienta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riegos`
--

DROP TABLE IF EXISTS `riegos`;
CREATE TABLE IF NOT EXISTS `riegos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_siembra` int NOT NULL,
  `fecha_riego` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_riegos_id_siembra` (`id_siembra`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `riegos`
--

INSERT INTO `riegos` (`id`, `id_siembra`, `fecha_riego`) VALUES
(2, 2, '2025-06-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siembra`
--

DROP TABLE IF EXISTS `siembra`;
CREATE TABLE IF NOT EXISTS `siembra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_siembra` varchar(255) NOT NULL,
  `fecha_siembra` date NOT NULL,
  `fecha_recoleccion` date NOT NULL,
  `nombre_lote_ubicacion` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `siembra_insumos`
--

DROP TABLE IF EXISTS `siembra_insumos`;
CREATE TABLE IF NOT EXISTS `siembra_insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_siembra` int NOT NULL,
  `id_insumo` int NOT NULL,
  `cantidad_insumo` float(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_siembra_insumos_id_siembra` (`id_siembra`),
  KEY `fk_siembra_insumos_id_insumo` (`id_insumo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`) VALUES
(1, 'Admin', 'admin@admin.com', 'cff6bb6dd557900e9b4bb4d95ce9f233'),
(2, 'Juan', 'juan@example.com', 'cff6bb6dd557900e9b4bb4d95ce9f233'),
(3, 'Juanito', 'juanito@example.com', '509b236a3277a862f53da50f218c6044'),
(4, 'Juanito2', 'juanito2@example.com', '110aaa8376f16df38acd65a2c1155fea'),
(5, 'juanito3', 'juanito3@example.com', '110aaa8376f16df38acd65a2c1155fea');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
