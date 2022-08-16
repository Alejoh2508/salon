CREATE TABLE `salon`.`estados` (
  `Id_Estado` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del Estado' , 
  `Descripcion` VARCHAR(15) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL COMMENT 'Nombre del Estado' , 
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha creación del registro' , PRIMARY KEY (`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Estados del sistema de estudiantes';

CREATE TABLE `salon`.`generos` (
  `Id_Genero` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del Género' , 
  `Descripcion` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Género' , 
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Genero`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Géneros de los estudiantes';

CREATE TABLE `salon`.`ciudades` (
  `Id_Ciudad` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de la ciudad' , 
  `Nombre` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la ciudad' , 
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Ciudad`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Ciudad de Nacimiento';

INSERT INTO `ciudades` (`Id_Ciudad`, `Nombre`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES 
(NULL, 'Ibague', '2022-08-14 19:04:20', '2022-08-14 19:04:20', '1'), 
(NULL, 'Ipiales', '2022-08-14 19:04:20', '2022-08-14 19:04:20', '1'), 
(NULL, 'Cali', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Cucuta', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Pereira', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Choco', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Girardot', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Huila', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Pasto', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Mitú', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Leticia', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Carmen de Apicala', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Guajira', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1'),
(NULL, 'Arauca', '2022-08-14 19:05:37', '2022-08-14 19:05:37', '1');

CREATE TABLE `salon`.`estudiantes` (
  `Id_Estudiante` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del estudiante' , 
  `Identificacion` INT NOT NULL COMMENT 'Identificacion del estudiante' , 
  `Nombres` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombres del estudiante' , 
  `Apellidos` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellidos del estudiante' , 
  `Fecha_Nacimiento` DATE NOT NULL COMMENT 'Fecha de nacimiento' , 
  `FK_Id_Ciudad` INT NOT NULL COMMENT 'Referencia de la ciudad' ,
  `FK_Id_Genero` INT NOT NULL COMMENT 'Referencia del genero' ,
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Estudiante`),
  FOREIGN KEY (`FK_Id_Ciudad`) REFERENCES ciudades(`Id_Ciudad`),
  FOREIGN KEY (`FK_Id_Genero`) REFERENCES generos(`Id_Genero`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Estudiantes';

CREATE TABLE `salon`.`asignaturas` (
  `Id_Asignatura` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de la asignatura' , 
  `Nombre` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la asignatura' , 
  `Creditos` ENUM('1', '2', '3') NOT NULL COMMENT 'Número de creditos de la asignatura' , 
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Asignatura`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Asignaturas de los estudiantes';

INSERT INTO `asignaturas` (`Id_Asignatura`, `Nombre`, `Creditos`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES 
(NULL, 'Calculo Integral', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Ética', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'),
(NULL, 'Filosfía', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Algoritmia', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Proyecto de Grado', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Inteligencia Artificial', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Comprensión y Producción Textual', '1', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Lectura Critica', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Economía', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Física Cuantica', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Electromagnetismo', '3', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1'), 
(NULL, 'Epistemología', '2', '2022-08-14 20:03:07', '2022-08-14 20:03:07', '1');

CREATE TABLE `salon`.`matriculas` (
  `Id_Matricula` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de Matricula' , 
  `FK_Id_Estudiante` INT NOT NULL COMMENT 'Referencia del estudiante' , 
  `FK_Id_Asignatura` INT NOT NULL COMMENT 'Referencia de la asignatura' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Matricula`, `FK_Id_Estudiante`, `FK_Id_Asignatura`),
  FOREIGN KEY (`FK_Id_Estudiante`) REFERENCES estudiantes(`Id_Estudiante`),
  FOREIGN KEY (`FK_Id_Asignatura`) REFERENCES asignaturas(`Id_Asignatura`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Matriculas de Asignaturas con Estudiantes';

CREATE TABLE `salon`.`salones` (
  `Id_Salon` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del salón' , 
  `Nombre` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del salón' ,
  `Capacidad` INT NOT NULL COMMENT 'Capacidad de estudiantes' , 
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Salon`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Salones para los estudiantes';

INSERT INTO `salones` (`Id_Salon`, `Nombre`, `Capacidad`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES 
(NULL, '102A', '35', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '2'),
(NULL, '103A', '30', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '104A', '20', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '105A', '10', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '106A', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '107A', '50', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '108A', '60', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '109A', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '110A', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '201B', '30', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '2'),
(NULL, '202B', '35', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '203B', '30', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '204B', '20', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '205B', '10', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '206B', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '207B', '50', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1'),
(NULL, '208B', '60', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '2'),
(NULL, '209B', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '2'),
(NULL, '210B', '40', '2022-08-14 20:17:36', '2022-08-14 20:17:36', '1');


CREATE TABLE `salon`.`horarios` (
  `Id_Horario` INT NOT NULL AUTO_INCREMENT COMMENT 'Id del horario' , 
  `Dia` ENUM('Lunes','Martes','Miercoles','Jueves','Viernes','Sábado') COMMENT 'Día de la semana' , 
  `Hora_Inicio` TIME NOT NULL COMMENT 'Hora Inicio del horario' , 
  `Hora_Fin` TIME NOT NULL COMMENT 'Hora Fin del horario' , 
  `FK_Id_Asignatura` INT NOT NULL COMMENT 'Referencia de la asignatura' ,
  `FK_Id_Salon` INT NOT NULL COMMENT 'Referencia del salon' ,
  `Fecha_Creacion` DATETIME NOT NULL COMMENT 'Fecha de creación del registro' , 
  `Fecha_Actualizacion` DATETIME NOT NULL COMMENT 'Fecha de actualización del registro' , 
  `FK_Id_Estado` INT NOT NULL COMMENT 'Referencia del estado' , 
  PRIMARY KEY (`Id_Horario`),
  FOREIGN KEY (`FK_Id_Asignatura`) REFERENCES asignaturas(`Id_Asignatura`),
  FOREIGN KEY (`FK_Id_Salon`) REFERENCES salones(`Id_Salon`),
  FOREIGN KEY (`FK_Id_Estado`) REFERENCES estados(`Id_Estado`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci COMMENT = 'Horarios para los estudiantes';

INSERT INTO `horarios` (`Id_Horario`, `Dia`, `Hora_Inicio`, `Hora_Fin`, `FK_Id_Asignatura`, `FK_Id_Salon`, `Fecha_Creacion`, `Fecha_Actualizacion`, `FK_Id_Estado`) VALUES 
-- (NULL, 'Lunes', '07:00:00', '09:00:00', '1', '1', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'), 2, 11, 18, 19
(NULL, 'Lunes', '09:00:00', '11:00:00', '2', '3', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Lunes', '11:00:00', '13:00:00', '3', '3', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Lunes', '13:00:00', '15:00:00', '4', '4', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Martes', '07:00:00', '09:00:00', '5', '5', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Martes', '09:00:00', '11:00:00', '6', '6', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Martes', '11:00:00', '13:00:00', '7', '7', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Martes', '13:00:00', '15:00:00', '8', '1', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Miercoles', '07:00:00', '09:00:00', '9', '13', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Miercoles', '09:00:00', '11:00:00', '10', '14', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Miercoles', '11:00:00', '13:00:00', '11', '17', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Miercoles', '13:00:00', '15:00:00', '12', '12', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Jueves', '07:00:00', '09:00:00', '13', '20', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Jueves', '09:00:00', '11:00:00', '14', '9', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Jueves', '11:00:00', '13:00:00', '1', '15', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Jueves', '13:00:00', '15:00:00', '2', '17', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Viernes', '07:00:00', '09:00:00', '3', '4', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Viernes', '09:00:00', '11:00:00', '4', '16', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Viernes', '11:00:00', '13:00:00', '5', '9', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Viernes', '13:00:00', '15:00:00', '6', '6', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Sabado', '07:00:00', '09:00:00', '7', '13', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Sabado', '09:00:00', '11:00:00', '8', '10', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Sabado', '11:00:00', '13:00:00', '9', '9', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1'),
(NULL, 'Sabado', '13:00:00', '15:00:00', '10', '8', '2022-08-14 20:28:19', '2022-08-14 20:28:19', '1');