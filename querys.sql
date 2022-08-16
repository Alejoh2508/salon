-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 16-08-2022 a las 08:27:34
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `salon`
--
CREATE DATABASE IF NOT EXISTS `salon` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `salon`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE `asignaturas` (
  `Id_Asignatura` int(11) NOT NULL COMMENT 'Id de la asignatura',
  `Nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la asignatura',
  `Creditos` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Número de creditos de la asignatura',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Asignaturas de los estudiantes';

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`Id_Asignatura`, `Nombre`, `Creditos`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES
(1, 'Calculo Diferencial', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(2, 'Algebra Lineal', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(3, 'Calculo Integral', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(4, 'Ética', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(5, 'Filosofía', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(6, 'Algoritmia', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(7, 'Proyecto de Grado', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(8, 'Inteligencia Artificial', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(9, 'Comprensión y Producción Textual', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(10, 'Lectura Critica', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(11, 'Economía', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(12, 'Física Cuántica', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(13, 'Electromagnetismo', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1),
(14, 'Epistemología', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `Id_Ciudad` int(11) NOT NULL COMMENT 'Id de la ciudad',
  `Nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la ciudad',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ciudad de Nacimiento';

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`Id_Ciudad`, `Nombre`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES
(1, 'Bogotá D.C.', '2022-08-14 19:04:20', '2022-08-14 19:04:20', 1),
(2, 'Cartagena', '2022-08-14 19:04:20', '2022-08-14 19:04:20', 1),
(3, 'Medellin', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(4, 'Ibague', '2022-08-14 19:04:20', '2022-08-14 19:04:20', 1),
(5, 'Ipiales', '2022-08-14 19:04:20', '2022-08-14 19:04:20', 1),
(6, 'Cali', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(7, 'Cucuta', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(8, 'Pereira', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(9, 'Choco', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(10, 'Girardot', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(11, 'Huila', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(12, 'Pasto', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(13, 'Mitú', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(14, 'Leticia', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(15, 'Carmen de Apicala', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(16, 'Guajira', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1),
(17, 'Arauca', '2022-08-14 19:05:37', '2022-08-14 19:05:37', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `Id_Estado` int(11) NOT NULL COMMENT 'Id del Estado',
  `Descripcion` varchar(15) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL COMMENT 'Nombre del Estado',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha creación del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Estados del sistema de estudiantes';

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`Id_Estado`, `Descripcion`, `Fecha_Creacion`) VALUES
(1, 'ACTIVO', '2022-08-14 19:00:00'),
(2, 'INACTIVO', '2022-08-14 19:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE `estudiantes` (
  `Id_Estudiante` int(11) NOT NULL COMMENT 'Id del estudiante',
  `Identificacion` int(11) NOT NULL COMMENT 'Identificacion del estudiante',
  `Nombres` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombres del estudiante',
  `Apellidos` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellidos del estudiante',
  `Fecha_Nacimiento` date NOT NULL COMMENT 'Fecha de nacimiento',
  `FK_Id_Ciudad` int(11) NOT NULL COMMENT 'Referencia de la ciudad',
  `FK_Id_Genero` int(11) NOT NULL COMMENT 'Referencia del genero',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Estudiantes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

DROP TABLE IF EXISTS `generos`;
CREATE TABLE `generos` (
  `Id_Genero` int(11) NOT NULL COMMENT 'Id del Género',
  `Descripcion` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Género',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Géneros de los estudiantes';

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`Id_Genero`, `Descripcion`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES
(1, 'Masculino', '2022-08-15 01:58:15', '2022-08-14 19:00:00', 1),
(2, 'Femenino', '2022-08-15 01:58:15', '2022-08-14 19:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `Id_Horario` int(11) NOT NULL COMMENT 'Id del horario',
  `Dia` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sábado') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Día de la semana',
  `Hora_Inicio` time NOT NULL COMMENT 'Hora Inicio del horario',
  `Hora_Fin` time NOT NULL COMMENT 'Hora Fin del horario',
  `FK_Id_Asignatura` int(11) NOT NULL COMMENT 'Referencia de la asignatura',
  `FK_Id_Salon` int(11) NOT NULL COMMENT 'Referencia del salon',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Horarios para los estudiantes';

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`Id_Horario`, `Dia`, `Hora_Inicio`, `Hora_Fin`, `FK_Id_Asignatura`, `FK_Id_Salon`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES
(1, 'Lunes', '07:00:00', '09:00:00', 1, 1, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(2, 'Lunes', '09:00:00', '11:00:00', 2, 3, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(3, 'Lunes', '11:00:00', '13:00:00', 3, 3, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(4, 'Lunes', '13:00:00', '15:00:00', 4, 4, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(5, 'Martes', '07:00:00', '09:00:00', 5, 5, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(6, 'Martes', '09:00:00', '11:00:00', 6, 6, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(7, 'Martes', '11:00:00', '13:00:00', 7, 7, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(8, 'Martes', '13:00:00', '15:00:00', 8, 1, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(9, 'Miercoles', '07:00:00', '09:00:00', 9, 13, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(10, 'Miercoles', '09:00:00', '11:00:00', 10, 14, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(11, 'Miercoles', '11:00:00', '13:00:00', 11, 17, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(12, 'Miercoles', '13:00:00', '15:00:00', 12, 12, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(13, 'Jueves', '07:00:00', '09:00:00', 13, 20, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(14, 'Jueves', '09:00:00', '11:00:00', 14, 9, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(15, 'Jueves', '11:00:00', '13:00:00', 1, 15, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(16, 'Jueves', '13:00:00', '15:00:00', 2, 17, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(17, 'Viernes', '07:00:00', '09:00:00', 3, 4, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(18, 'Viernes', '09:00:00', '11:00:00', 4, 16, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(19, 'Viernes', '11:00:00', '13:00:00', 5, 9, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(20, 'Viernes', '13:00:00', '15:00:00', 6, 6, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(21, 'Sábado', '07:00:00', '09:00:00', 7, 13, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(22, 'Sábado', '09:00:00', '11:00:00', 8, 10, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(23, 'Sábado', '11:00:00', '13:00:00', 9, 9, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1),
(24, 'Sábado', '13:00:00', '15:00:00', 10, 8, '2022-08-14 20:28:19', '2022-08-14 20:28:19', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE `matriculas` (
  `Id_Matricula` int(11) NOT NULL COMMENT 'Id de Matricula',
  `FK_Id_Estudiante` int(11) NOT NULL COMMENT 'Referencia del estudiante',
  `FK_Id_Asignatura` int(11) NOT NULL COMMENT 'Referencia de la asignatura',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Matriculas de Asignaturas con Estudiantes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

DROP TABLE IF EXISTS `salones`;
CREATE TABLE `salones` (
  `Id_Salon` int(11) NOT NULL COMMENT 'Id del salón',
  `Nombre` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del salón',
  `Capacidad` int(11) NOT NULL COMMENT 'Capacidad de estudiantes',
  `Fecha_Creacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `Fecha_Actualizacion` datetime NOT NULL COMMENT 'Fecha de actualización del registro',
  `FK_Id_Estado` int(11) NOT NULL COMMENT 'Referencia del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Salones para los estudiantes';

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`Id_Salon`, `Nombre`, `Capacidad`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES
(1, '101A', 30, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(2, '102A', 35, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 2),
(3, '103A', 30, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(4, '104A', 20, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(5, '105A', 10, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(6, '106A', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(7, '107A', 50, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(8, '108A', 60, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(9, '109A', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(10, '110A', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(11, '201B', 30, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 2),
(12, '202B', 35, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(13, '203B', 30, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(14, '204B', 20, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(15, '205B', 10, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(16, '206B', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(17, '207B', 50, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1),
(18, '208B', 60, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 2),
(19, '209B', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 2),
(20, '210B', 40, '2022-08-14 20:17:36', '2022-08-14 20:17:36', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`Id_Asignatura`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`Id_Ciudad`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Id_Estudiante`),
  ADD KEY `FK_Id_Ciudad` (`FK_Id_Ciudad`),
  ADD KEY `FK_Id_Genero` (`FK_Id_Genero`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`Id_Genero`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`Id_Horario`),
  ADD KEY `FK_Id_Asignatura` (`FK_Id_Asignatura`),
  ADD KEY `FK_Id_Salon` (`FK_Id_Salon`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`Id_Matricula`,`FK_Id_Estudiante`,`FK_Id_Asignatura`),
  ADD KEY `FK_Id_Estudiante` (`FK_Id_Estudiante`),
  ADD KEY `FK_Id_Asignatura` (`FK_Id_Asignatura`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`Id_Salon`),
  ADD KEY `FK_Id_Estado` (`FK_Id_Estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `Id_Asignatura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la asignatura', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `Id_Ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la ciudad', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del Estado', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `Id_Estudiante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del estudiante';

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `Id_Genero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del Género', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `Id_Horario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del horario', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `Id_Matricula` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de Matricula';

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `Id_Salon` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del salón', AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`FK_Id_Ciudad`) REFERENCES `ciudades` (`Id_Ciudad`),
  ADD CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`FK_Id_Genero`) REFERENCES `generos` (`Id_Genero`),
  ADD CONSTRAINT `estudiantes_ibfk_3` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `generos`
--
ALTER TABLE `generos`
  ADD CONSTRAINT `generos_ibfk_1` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`FK_Id_Asignatura`) REFERENCES `asignaturas` (`Id_Asignatura`),
  ADD CONSTRAINT `horarios_ibfk_2` FOREIGN KEY (`FK_Id_Salon`) REFERENCES `salones` (`Id_Salon`),
  ADD CONSTRAINT `horarios_ibfk_3` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`FK_Id_Estudiante`) REFERENCES `estudiantes` (`Id_Estudiante`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`FK_Id_Asignatura`) REFERENCES `asignaturas` (`Id_Asignatura`),
  ADD CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);

--
-- Filtros para la tabla `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `salones_ibfk_1` FOREIGN KEY (`FK_Id_Estado`) REFERENCES `estados` (`Id_Estado`);
COMMIT;
