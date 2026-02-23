 -- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2026 a las 19:09:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(30) NOT NULL,
  `mail` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `mail`) VALUES
('juan', 'juan@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_viajes`
--

CREATE TABLE `usuarios_viajes` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_viajes`
--

INSERT INTO `usuarios_viajes` (`id`, `usuario`, `password`, `email`) VALUES
(1, 'gerard', 'gery123', 'gerard@gmail.com'),
(2, 'dieguito', '1234', 'diego@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `COL 1` varchar(4) DEFAULT NULL,
  `COL 2` varchar(22) DEFAULT NULL,
  `COL 3` varchar(9) DEFAULT NULL,
  `COL 4` varchar(38) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`COL 1`, `COL 2`, `COL 3`, `COL 4`) VALUES
('Name', 'FullName', 'Password', 'Description'),
('Ana', 'Ana Roig Sanchez', 'Welcome25', 'Usuari del Departament de Contabilitat'),
('Eva', 'Eva Moyo Sanchez', 'Welcome25', 'Usuari del Departament de Contabilitat'),
('Jan', 'Jan Herrero Bergada', 'Welcome25', 'Usuari del Departament de Marketing'),
('Mar', 'Mar Calafell Cervantes', 'Welcome25', 'Usuari del Departament Finances'),
('Max', 'Max Bonas Fuertes', 'Welcome25', 'Usuari del Departament de IT'),
('Pau', 'Pau Haro Perez', 'Welcome25', 'Usuari del Departament de Vendes'),
('Pol', 'Pol Suria Olivera', 'Welcome25', 'Usuari del Departament de Compres'),
('Abel', 'Abel Romero Garcia', 'Welcome25', 'Usuari del Departament de Marketing'),
('Aida', 'Aida Soler Hervas', 'Welcome25', 'Usuari del Departament de Finances');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` int(11) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id`, `destino`, `pais`, `precio`, `fecha`) VALUES
(2, 'Safari Aventura', 'Kenia', 1200, '2024-08-15'),
(3, 'marbella', 'españa', 2000, '2026-02-13'),
(4, 'marbella', 'españa', 2147483647, '2006-01-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `usuarios_viajes`
--
ALTER TABLE `usuarios_viajes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios_viajes`
--
ALTER TABLE `usuarios_viajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
