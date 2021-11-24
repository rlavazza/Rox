-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.20-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla rencar.auto
CREATE TABLE IF NOT EXISTS `auto` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `patente` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `modelo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `color` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `marca` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `fk_idgarage` int(11) DEFAULT NULL,
  PRIMARY KEY (`idauto`),
  KEY `fk_idgarage` (`fk_idgarage`),
  CONSTRAINT `FK_auto_garage` FOREIGN KEY (`fk_idgarage`) REFERENCES `garage` (`idgarage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.auto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` (`idauto`, `patente`, `modelo`, `color`, `precio`, `marca`, `fk_idgarage`) VALUES
	(1, 'edk 247', 'gol', 'gris', 2500, 'wwagen', 1),
	(2, 'pko 526', '206', 'rojo', 3000, 'peugeot', 4);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;

-- Volcando estructura para tabla rencar.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `apellido` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `direccioncalle` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `direaltura` int(11) NOT NULL DEFAULT 0,
  `telefono` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.cliente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idcliente`, `dni`, `nombre`, `apellido`, `direccioncalle`, `direaltura`, `telefono`) VALUES
	(1, 22352686, 'lorena', 'britos', 'Larumbe', 1582, 48576582),
	(2, 35829659, 'Martin', 'Moreno', 'las condes', 4589, 1685989);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla rencar.cochera
CREATE TABLE IF NOT EXISTS `cochera` (
  `idcochera` int(11) NOT NULL AUTO_INCREMENT,
  `piso` int(11) NOT NULL,
  `parcela` int(11) NOT NULL,
  `fk_idgarage` int(11) NOT NULL,
  PRIMARY KEY (`idcochera`),
  KEY `fk_idgarage` (`fk_idgarage`),
  CONSTRAINT `FK__garage` FOREIGN KEY (`fk_idgarage`) REFERENCES `garage` (`idgarage`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.cochera: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cochera` DISABLE KEYS */;
INSERT INTO `cochera` (`idcochera`, `piso`, `parcela`, `fk_idgarage`) VALUES
	(2, 2, 4, 2),
	(3, 3, 5, 2),
	(4, 2, 15, 1);
/*!40000 ALTER TABLE `cochera` ENABLE KEYS */;

-- Volcando estructura para tabla rencar.garage
CREATE TABLE IF NOT EXISTS `garage` (
  `idgarage` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `direccioncalle` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `direaltura` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idgarage`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.garage: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` (`idgarage`, `nombre`, `direccioncalle`, `direaltura`) VALUES
	(1, 'caba1', 'Coronel Diaz', 1400),
	(2, 'caba2', 'Monroe', 2456),
	(3, 'znorte1', 'Marquez', 360),
	(4, 'znorte2', 'Italia', 1563);
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;

-- Volcando estructura para tabla rencar.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `idreserva` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `litros` int(11) NOT NULL,
  `importe` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `fk_idcliente` int(11) NOT NULL,
  `fk_idauto` int(11) NOT NULL,
  `fk_idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `fk_idcliente` (`fk_idcliente`),
  KEY `fk_idauto` (`fk_idauto`),
  KEY `fk_idsucursal` (`fk_idsucursal`),
  CONSTRAINT `FK_reserva_auto` FOREIGN KEY (`fk_idauto`) REFERENCES `auto` (`idauto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reserva_cliente` FOREIGN KEY (`fk_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reserva_sucursal` FOREIGN KEY (`fk_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.reserva: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` (`idreserva`, `fecha`, `fecha_ini`, `fecha_fin`, `litros`, `importe`, `fk_idcliente`, `fk_idauto`, `fk_idsucursal`) VALUES
	(1, '2021-11-24', '2021-11-26', '2021-11-26', 20, 12000.000000, 2, 1, 1);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;

-- Volcando estructura para tabla rencar.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `direccioncalle` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `direaltura` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla rencar.sucursal: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` (`idsucursal`, `nombre`, `direccioncalle`, `direaltura`, `telefono`) VALUES
	(1, 'Caba1', 'Cabildo', 3659, NULL),
	(2, 'caba2', 'Berutti', 2560, NULL),
	(3, 'Norte1', 'Marquez', 360, NULL),
	(4, 'Norte2', 'Cazon', 150, NULL),
	(5, 'Caba3', 'Cerrito', 320, NULL);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
