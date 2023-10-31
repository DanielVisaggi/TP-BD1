CREATE DATABASE  IF NOT EXISTS `terminal_automotriz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `terminal_automotriz`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: terminal_automotriz
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `automoviles`
--

DROP TABLE IF EXISTS `automoviles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automoviles` (
  `nro_chasis` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(6) NOT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `modelo_idModelo` int NOT NULL,
  `pedido_idPedido` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`nro_chasis`),
  KEY `modelo_idModelo` (`modelo_idModelo`),
  KEY `pedido_idPedido` (`pedido_idPedido`),
  CONSTRAINT `automoviles_ibfk_1` FOREIGN KEY (`modelo_idModelo`) REFERENCES `modelos` (`id_modelo`),
  CONSTRAINT `automoviles_ibfk_2` FOREIGN KEY (`pedido_idPedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automoviles`
--

LOCK TABLES `automoviles` WRITE;
/*!40000 ALTER TABLE `automoviles` DISABLE KEYS */;
INSERT INTO `automoviles` VALUES (62,'AAA001','2022-10-21 17:24:22',3,2,'2022-10-08 01:48:24'),(63,'AAA163',NULL,3,2,'2022-10-08 01:48:24'),(64,'AAA164',NULL,3,2,'2022-10-08 01:48:24'),(65,'AAA175','2022-10-12 23:40:12',1,1,'2022-10-08 01:48:50'),(66,'AAA176','2022-10-15 23:56:06',1,1,'2022-10-08 01:48:51'),(67,'AAA177','2022-10-22 20:47:08',2,1,'2022-10-08 01:48:51'),(68,'AAA178',NULL,2,3,'2022-10-08 11:03:56'),(69,'AAA179',NULL,2,4,'2022-10-21 20:15:30');
/*!40000 ALTER TABLE `automoviles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_insumos`
--

DROP TABLE IF EXISTS `compra_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_insumos` (
  `id_compra_insumos` int NOT NULL,
  `fecha_compra_insumos` datetime NOT NULL,
  `proveedores_idProveedores` int NOT NULL,
  PRIMARY KEY (`id_compra_insumos`),
  KEY `proveedores_idProveedores` (`proveedores_idProveedores`),
  CONSTRAINT `compra_insumos_ibfk_1` FOREIGN KEY (`proveedores_idProveedores`) REFERENCES `proveedores` (`id_proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_insumos`
--

LOCK TABLES `compra_insumos` WRITE;
/*!40000 ALTER TABLE `compra_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionarias`
--

DROP TABLE IF EXISTS `concesionarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concesionarias` (
  `id_concesionaria` int NOT NULL,
  `nombre_concesionaria` varchar(45) NOT NULL,
  `tel_concesionaria` varchar(45) NOT NULL,
  `direc_concesionaria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_concesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionarias`
--

LOCK TABLES `concesionarias` WRITE;
/*!40000 ALTER TABLE `concesionarias` DISABLE KEYS */;
INSERT INTO `concesionarias` VALUES (1,'SUR-CAM',' 1142094209','Av.Rivadavia 664'),(2,'LUIS STRIANESE',' 1141605096','Av. Hipolito Yrigoyen 8679'),(3,'AUTOS DEL SUR','1141166600','Av. Mitre 2900');
/*!40000 ALTER TABLE `concesionarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compre_insumos`
--

DROP TABLE IF EXISTS `detalle_compre_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compre_insumos` (
  `compra_insumos_idCompraInsumos` int NOT NULL,
  `insumos_idInsumos` int NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int NOT NULL,
  KEY `compra_insumos_idCompraInsumos` (`compra_insumos_idCompraInsumos`),
  KEY `insumos_idInsumos` (`insumos_idInsumos`),
  CONSTRAINT `detalle_compre_insumos_ibfk_1` FOREIGN KEY (`compra_insumos_idCompraInsumos`) REFERENCES `compra_insumos` (`id_compra_insumos`),
  CONSTRAINT `detalle_compre_insumos_ibfk_2` FOREIGN KEY (`insumos_idInsumos`) REFERENCES `insumos` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compre_insumos`
--

LOCK TABLES `detalle_compre_insumos` WRITE;
/*!40000 ALTER TABLE `detalle_compre_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compre_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `pedido_idPedido` int NOT NULL,
  `modelo_idModelo` int NOT NULL,
  `cantidad` int NOT NULL,
  KEY `pedido_idPedido` (`pedido_idPedido`),
  KEY `modelo_idModelo` (`modelo_idModelo`),
  CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`pedido_idPedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`modelo_idModelo`) REFERENCES `modelos` (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` VALUES (1,1,2),(1,2,1),(2,3,3),(3,2,1),(4,2,1);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion_de_trabajo`
--

DROP TABLE IF EXISTS `estacion_de_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion_de_trabajo` (
  `id_estacion_de_trabajo` int NOT NULL,
  `descripcion_estacion` varchar(45) NOT NULL,
  `tarea_idTarea` int NOT NULL,
  `linea_montaje_idLineaMontaje` int NOT NULL,
  `orden` int NOT NULL,
  PRIMARY KEY (`id_estacion_de_trabajo`),
  KEY `tarea_idTarea` (`tarea_idTarea`),
  KEY `linea_montaje_idLineaMontaje` (`linea_montaje_idLineaMontaje`),
  CONSTRAINT `estacion_de_trabajo_ibfk_1` FOREIGN KEY (`tarea_idTarea`) REFERENCES `tareas` (`id_tarea`),
  CONSTRAINT `estacion_de_trabajo_ibfk_2` FOREIGN KEY (`linea_montaje_idLineaMontaje`) REFERENCES `linea_de_montaje` (`id_linea_de_montaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion_de_trabajo`
--

LOCK TABLES `estacion_de_trabajo` WRITE;
/*!40000 ALTER TABLE `estacion_de_trabajo` DISABLE KEYS */;
INSERT INTO `estacion_de_trabajo` VALUES (1,'Carrocería',1,3,1),(2,'Ensamblado',2,3,2),(3,'Carrocería',1,2,1),(4,'Ensamblado',2,2,2),(5,'Pintura',3,2,3),(6,'Carrocería',1,4,1);
/*!40000 ALTER TABLE `estacion_de_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL,
  `descripcion_insumo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'Tornillos'),(2,'Tuercas'),(3,'Pintura');
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos_por_tareas`
--

DROP TABLE IF EXISTS `insumos_por_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_por_tareas` (
  `insumos_idInsumos` int NOT NULL,
  `tarea_idTarea` int NOT NULL,
  `stock` int NOT NULL,
  `cant_insumos_necesario` int NOT NULL,
  KEY `insumos_idInsumos` (`insumos_idInsumos`),
  KEY `tarea_idTarea_indice` (`tarea_idTarea`),
  CONSTRAINT `insumos_por_tareas_ibfk_1` FOREIGN KEY (`insumos_idInsumos`) REFERENCES `insumos` (`id_insumo`),
  CONSTRAINT `insumos_por_tareas_ibfk_2` FOREIGN KEY (`tarea_idTarea`) REFERENCES `tareas` (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos_por_tareas`
--

LOCK TABLES `insumos_por_tareas` WRITE;
/*!40000 ALTER TABLE `insumos_por_tareas` DISABLE KEYS */;
INSERT INTO `insumos_por_tareas` VALUES (1,1,100,10),(2,1,100,10),(1,2,500,300),(2,2,500,300),(3,3,200,150);
/*!40000 ALTER TABLE `insumos_por_tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_de_montaje`
--

DROP TABLE IF EXISTS `linea_de_montaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea_de_montaje` (
  `id_linea_de_montaje` int NOT NULL AUTO_INCREMENT,
  `capacidad_productiva` float NOT NULL,
  `modelo_idModelo` int NOT NULL,
  `cantidad_para_producir` int NOT NULL,
  PRIMARY KEY (`id_linea_de_montaje`),
  UNIQUE KEY `modelo_idModelo_indice` (`modelo_idModelo`),
  CONSTRAINT `linea_de_montaje_ibfk_1` FOREIGN KEY (`modelo_idModelo`) REFERENCES `modelos` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_de_montaje`
--

LOCK TABLES `linea_de_montaje` WRITE;
/*!40000 ALTER TABLE `linea_de_montaje` DISABLE KEYS */;
INSERT INTO `linea_de_montaje` VALUES (2,7,3,2),(3,10,1,0),(4,8,2,0);
/*!40000 ALTER TABLE `linea_de_montaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos` (
  `id_modelo` int NOT NULL,
  `nombre_modelo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos`
--

LOCK TABLES `modelos` WRITE;
/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
INSERT INTO `modelos` VALUES (1,'Ka'),(2,'Fiesta'),(3,'Focus');
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL,
  `fecha_hora_pedido` datetime NOT NULL,
  `concesionaria_idConcesionaria` int NOT NULL,
  `fecha_entrega_estimada` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `concesionaria_idConcesionaria` (`concesionaria_idConcesionaria`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`concesionaria_idConcesionaria`) REFERENCES `concesionarias` (`id_concesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2022-10-08 00:00:00',1,NULL,NULL),(2,'2022-10-08 00:00:00',2,NULL,NULL),(3,'2022-10-08 11:03:21',3,NULL,NULL),(4,'2022-10-21 20:11:55',1,'2022-10-28 20:11:55',NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedores` int NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `tel_proveedor` varchar(45) NOT NULL,
  `direc_proveedor` varchar(45) NOT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id_tarea` int NOT NULL,
  `descripcion_tarea` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Prepara las piezas para armar la carroceria'),(2,'Ensamblar partes de la carrocería'),(3,'Pintar chasis');
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo_por_estacion`
--

DROP TABLE IF EXISTS `tiempo_por_estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiempo_por_estacion` (
  `automovil_nroChasis` int NOT NULL,
  `estacion_trabajo_idEstacionTrabajo` int NOT NULL,
  `fecha_hora_ingreso` datetime NOT NULL,
  `fecha_hora_egreso` datetime DEFAULT NULL,
  KEY `automovil_nroChasis` (`automovil_nroChasis`),
  KEY `estacion_trabajo_idEstacionTrabajo` (`estacion_trabajo_idEstacionTrabajo`),
  CONSTRAINT `tiempo_por_estacion_ibfk_1` FOREIGN KEY (`automovil_nroChasis`) REFERENCES `automoviles` (`nro_chasis`),
  CONSTRAINT `tiempo_por_estacion_ibfk_2` FOREIGN KEY (`estacion_trabajo_idEstacionTrabajo`) REFERENCES `estacion_de_trabajo` (`id_estacion_de_trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo_por_estacion`
--

LOCK TABLES `tiempo_por_estacion` WRITE;
/*!40000 ALTER TABLE `tiempo_por_estacion` DISABLE KEYS */;
INSERT INTO `tiempo_por_estacion` VALUES (65,1,'2022-10-08 13:38:40','2022-10-08 23:10:46'),(65,2,'2022-10-08 23:10:46','2022-10-08 23:40:12'),(66,1,'2022-10-08 23:11:06','2022-10-08 23:55:20'),(66,2,'2022-10-08 23:55:20','2022-10-08 23:55:58'),(62,3,'2022-10-21 16:49:55','2022-10-21 17:13:48'),(62,4,'2022-10-21 17:13:48','2022-10-21 17:15:04'),(63,3,'2022-10-21 17:13:56','2022-10-21 17:15:18'),(62,5,'2022-10-21 17:15:04','2022-10-21 17:24:22'),(63,4,'2022-10-21 17:15:18',NULL),(64,3,'2022-10-21 17:15:29',NULL),(67,6,'2022-10-22 20:46:37','2022-10-22 20:47:08');
/*!40000 ALTER TABLE `tiempo_por_estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'terminal_automotriz'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_fecha_estimada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_fecha_estimada`(id_ped int) RETURNS datetime
    READS SQL DATA
    DETERMINISTIC
BEGIN
-- Calcula la fecha estimada de un pedido en base a la cantidad de autos asignados en la linea de motaje, y la capacidad productiva de cada una de ellas. 
-- Funcion usada en el procedimiento "alta_pedido".
declare fech_actual datetime;
declare fech_estimada datetime;
declare capacidad float; -- capacidad productiva de cada linea de montaje
declare cantidad int; -- cantidad de autos pedidos
declare capacidadTotal float default 0; -- suma de la capacidad productiva total
declare cantidadTotal int default 0; -- suma de la cantidad de autos pedidos total
declare dias float; -- dias totales de espera
DECLARE termino INTEGER;
DECLARE curLineaMontaje CURSOR FOR SELECT capacidad_productiva, cantidad_para_producir FROM linea_de_montaje;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;

set fech_actual = now();

OPEN curLineaMontaje;
	 getCapacidad: LOOP
		 FETCH curLineaMontaje INTO capacidad, cantidad;
		 IF termino = 1 THEN 
			LEAVE getCapacidad;
		 END IF;
		 set capacidadTotal = (capacidadTotal +capacidad);
         set cantidadTotal = (cantidadTotal + cantidad);
	 END LOOP getCapacidad;
CLOSE curLineaMontaje;	

set dias = ((cantidadTotal/capacidadTotal)+7);
set fech_estimada = (SELECT DATE_ADD(fech_actual, INTERVAL dias DAY));
RETURN fech_estimada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generar_patente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generar_patente`(num_chas int) RETURNS varchar(6) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
-- Esta funcion contiene un algoritmo para el calculo de la patente con fromato "AAA001";
declare patente varchar(6);
declare pos1 char;
declare pos2 char;
declare pos3 char;
declare pos4 char;
declare pos5 char;
declare pos6 char;

set pos1 = char(((num_chas / 260000) % 26 )+ 65);
set pos2 = char(((num_chas / 10000) % 26) + 65); 
set pos3 = char(((num_chas / 1000 )% 26) + 65); 
set pos4 = char(((num_chas / 100) % 10) + 48); 
set pos5 = char(((num_chas / 10) % 10) + 48); 
set pos6 = char((num_chas % 10) + 48); 
set patente = (select concat(pos1, pos2, pos3, pos4,pos5,pos6));

return patente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_concesionaria`(in id_con int, in nombre_con varchar(45), in tel_con varchar(45), in direc_con varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select  id_concesionaria from  concesionarias where id_concesionaria = id_con) then -- verifica que no exista una concesionaria con el mismo id
       insert into concesionarias values(id_con, nombre_con, tel_con, direc_con);
       set nResultado = 0;
else
       set nResultado = -1;
       set cMensaje = "Error, ya existe concesionaria";
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_detalle_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_detalle_pedidos`(in pedido_idPed int, in modelo_idMod int, in cant int, out nResultado int, out cMensaje varchar(45))
BEGIN
-- Alta de detalle_pedidos usado en el procedimiento "alta_pedido".
if exists(select id_modelo from modelos WHERE id_modelo = modelo_idMod) then 
			  insert into detalle_pedidos values(pedido_idPed, modelo_idMod, cant);
			  set nResultado = 0;
else 
			  set nResultado = -1;
	          set cMensaje = "Error, no se encontro modelo";
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_insumo`(in id_ind int, in descripcion_ind varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select  id_insumo from  insumos where id_insumo = id_ind) then -- verifica que no exista in insumo con el mismo id
       insert into  insumos values( id_ind, descripcion_ind);
       set nResultado = 0;
else
       set nResultado = -1;
       set cMensaje = "Error, ya existe insumo";
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_pedido`(in id_ped int, in id_con int, in id_mod int, in cant int, out nResultado int, out cMensaje varchar(45))
BEGIN
declare fecha_ped dateTime;
declare fech_estimada dateTime;
set fech_estimada = (select calcular_fecha_estimada(id_ped));
if not exists(select id_concesionaria from concesionarias WHERE id_concesionaria = id_con ) then
         set nResultado = -1;
		 set cMensaje = "Error, no se encontro concesionaria"; 
else
      if (select id_pedido from pedidos WHERE id_pedido= id_ped) then
           call alta_detalle_pedidos(id_ped,id_mod,cant,nResultado, cMensaje);         
      else
		   set fecha_ped = now();
		   insert into pedidos(id_pedido, fecha_hora_pedido,fecha_entrega_estimada, fecha_entrega, concesionaria_idConcesionaria) values(id_ped, fecha_ped ,fech_estimada, null, id_con);
           call alta_detalle_pedidos(id_ped,id_mod,cant,nResultado,cMensaje); 
      end if;   
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_proveedor`(in id_prov int, in nombre_prov varchar(45), in tel_prov varchar(45), in direc_prov varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select  id_proveedores from  proveedores where id_proveedores = id_prov) then -- verifica que no exista un proveedor con el mismo id
       insert into proveedores values(id_prov, nombre_prov, tel_prov, direc_prov);
       set nResultado = 0;
else
       set nResultado = -1;
       set cMensaje = "Error, ya existe proveedor";
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asignar_lineaMontaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_lineaMontaje`(in cant int, in id_mod int, out nResultado int, out cMensaje varchar(45))
BEGIN
-- Asigna la linea de montaje correspondiente a los autos generados.
declare cant_actual int;

set cant_actual =(select cantidad_para_producir from linea_de_montaje where modelo_idModelo = id_mod);
if exists (select modelo_idModelo from linea_de_montaje where modelo_idModelo = id_mod) then -- si el modelo ya esta asignado a una linea de montaje, se actuliza la cantidad de autos a fabricar.
            update linea_de_montaje set cantidad_para_producir = (cant_actual + cant) where modelo_idModelo = id_mod;
            set nResultado = 0;
else
           insert into linea_de_montaje (capacidad_productiva,cantidad_para_producir, modelo_idModelo) values(0 , cant, id_mod); -- si el modelo no esta asignado a una linea de montaje se da de alta.
           set nResultado = 0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asignar_primera_estacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_primera_estacion`(in patenteParametro varchar(6),out nResultado int, out cMensaje varchar(80) )
BEGIN
-- 4) Se requiere crear un procedimiento que al recibir como parámetro la patente del
-- automóvil, se le dé inicio al montaje del mismo, es decir, que al ejecutar dicho
-- procedimiento el automóvil con la patente indicada es “posicionado” en la primer
-- estación de la línea de montaje que le fue asignada al crear el vehículo con el
-- procedimiento (8) 

declare idChasis int;
declare idChasisOcupado int;
declare idModelo int;
declare idLineaMontaje int;
declare idEstacion int;
declare fech_ingreso datetime;

set idChasis = (select nro_chasis from automoviles where patente = patenteParametro); -- chasis del auto ingresado
set idModelo = (select modelo_idModelo from automoviles where patente = patenteParametro); -- modelo del auto ingresado
set idLineaMontaje = (select id_linea_de_montaje from linea_de_montaje where modelo_idModelo = idModelo); -- linea de montaje correspondiente al modelo del auto ingresado
set idEstacion = (select id_estacion_de_trabajo from estacion_de_trabajo where (linea_montaje_idLineaMontaje =idLineaMontaje and orden = 1)); -- selecciono la primera estacion de la linea de montaje correspondiente al modelo del auto ingresado
set fech_ingreso = now();

-- if not exists (select automovil_nroChasis from tiempo_por_estacion where automovil_nroChasis = idChasis) 

if exists (select patente from automoviles where patente = patenteParametro) then -- verifica que exista la patente
   if not exists (select automovil_nroChasis from tiempo_por_estacion where automovil_nroChasis = idChasis) then -- verifica que no se haya ingresado la patente previamente
          if not exists (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where estacion_trabajo_idEstacionTrabajo = idEstacion ) then -- si la estacion no esta dada de alta en tiempo_por_estacion se da de alta
					    insert into tiempo_por_estacion(automovil_nroChasis,estacion_trabajo_idEstacionTrabajo, fecha_hora_ingreso ) values (idChasis, idEstacion ,fech_ingreso);
                        set nResultado = 0;
		 else
             if exists (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where (estacion_trabajo_idEstacionTrabajo = idEstacion and fecha_hora_egreso is not null)) then -- si ya esta dada de alta la estacion verifica que la fecha de egreso no sea null, osea que el auto que estaba en esa esatacion ya termino
                       insert into tiempo_por_estacion(automovil_nroChasis,estacion_trabajo_idEstacionTrabajo, fecha_hora_ingreso ) values (idChasis, idEstacion ,fech_ingreso);
					   set nResultado = 0;
		     else -- hay un auto en la estacion ,por lo que no puedo insertar otro auto
                       set idChasisOcupado = (select automovil_nroChasis from tiempo_por_estacion where (estacion_trabajo_idEstacionTrabajo = idEstacion and fecha_hora_egreso is null));
                       set nResultado = -2;
		               set cMensaje = (select concat("Error, el auto con nro chasis ", idChasisOcupado, " esta en la estacion"));
			end if;
		end if;
	else -- verfica que no se vuelva a iniciar un auto previamente ingresado
         set nResultado = -1;
		 set cMensaje = "Error, ya se asigno auto con esa patente a la primera estacion "; 
         end if;
else
         set nResultado = -1;
		 set cMensaje = "Error, no se encontro patente"; 
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asignar_siguiente_estacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_siguiente_estacion`(in patenteParametro varchar(6),out nResultado int, out cMensaje varchar(60))
BEGIN
-- 5) Se requiere crear un procedimiento que al recibir como parámetro la patente del
-- automóvil, se finaliza la labor de la estación en la que se encuentra y se le ingresa en
-- la estación siguiente.

declare estacionActual int;
declare ordenActual int;
declare idChasis int;
declare idModelo int;
declare idLineaMontaje int;
declare estacionSiguiente int;
declare fech_ingreso datetime;
declare fech_egreso datetime;
declare idChasisOcupado int;

set idChasis = (select nro_chasis from automoviles where patente = patenteParametro); -- chasis del auto ingresado.
set idModelo = (select modelo_idModelo from automoviles where patente = patenteParametro); -- modelo del auto ingresado.
set idLineaMontaje = (select id_linea_de_montaje from linea_de_montaje where modelo_idModelo = idModelo); -- liena de montaje correspondiente al modelo del auto ingresado.
set estacionActual= (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where (automovil_nroChasis = idChasis and fecha_hora_egreso is null )); -- estacion actual donde se encuantra el auto ingresado.
set ordenActual = (select orden from estacion_de_trabajo where id_estacion_de_trabajo = estacionActual ); -- numero de orden correspondiente a la estacion actual donde se encuantra el auto ingresado.
set estacionSiguiente= (select id_estacion_de_trabajo from estacion_de_trabajo where (linea_montaje_idLineaMontaje = idLineaMontaje and (orden = ordenActual+1))); -- estacion a donde debe pasar el auto, si el resultado del query es null significa que ya se encuentra en la estacion final.
set fech_ingreso = now();
set fech_egreso = now();


if exists(select patente from automoviles where patente = patenteParametro) then -- verifica que exista la patente.
   if exists (select fecha_finalizacion from automoviles where patente = patenteParametro) then -- verifica que el auto no se encuentre finalizado.
           if (estacionSiguiente is not null) then -- verifica que no sea la ultima estacion
                      if not exists (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where estacion_trabajo_idEstacionTrabajo = estacionSiguiente ) then -- verifica si la estacion ya esta dada de alta en la tabla tiempo_por_estacion, si ya esta dada hay que verificar si ya hay un auto en esa estacion. 
									 update tiempo_por_estacion set fecha_hora_egreso = fech_egreso where (automovil_nroChasis = idChasis and estacion_trabajo_idEstacionTrabajo =estacionActual ); -- se actualiza la fecha de egreso de la estacion actual donde se encuentra el auto ingresado.
									 insert into tiempo_por_estacion(automovil_nroChasis,estacion_trabajo_idEstacionTrabajo, fecha_hora_ingreso ) values (idChasis, estacionSiguiente ,fech_ingreso); -- se ingresa el auto a la nueva estacion.
									 set nResultado = 0;
					  else
                           if exists (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where (estacion_trabajo_idEstacionTrabajo = estacionSiguiente and fecha_hora_egreso is not null)) then -- si ya esta dada de alta la estacion verifica que la fecha de egreso no sea null, osea que el auto que estaba en esa esatacion ya termino
									  update tiempo_por_estacion set fecha_hora_egreso = fech_egreso where (automovil_nroChasis = idChasis and estacion_trabajo_idEstacionTrabajo =estacionActual ); 
									  insert into tiempo_por_estacion(automovil_nroChasis,estacion_trabajo_idEstacionTrabajo, fecha_hora_ingreso ) values (idChasis, estacionSiguiente ,fech_ingreso);
									  set nResultado = 0;
						   else -- hay un auto en la estacion ,por lo que no puedo insertar otro auto
                                     set idChasisOcupado = (select automovil_nroChasis from tiempo_por_estacion where (estacion_trabajo_idEstacionTrabajo = estacionSiguiente and fecha_hora_egreso is null));
                                     set nResultado = -2;
									 set cMensaje = (select concat("Error, el auto con nro chasis ", idChasisOcupado, " esta en la estacion"));
						   end if;
					  end if;
		   else -- es la ultima estacion
                update tiempo_por_estacion set fecha_hora_egreso = fech_egreso where (automovil_nroChasis = idChasis and estacion_trabajo_idEstacionTrabajo =estacionActual );
                update automoviles set fecha_finalizacion = fech_egreso where nro_chasis = idChasis;
                update linea_de_montaje set cantidad_para_producir = (cantidad_para_producir -1) where id_linea_de_montaje = idLineaMontaje;
		  end if;
	else -- evita que se vuelva a ingresar un auto ya finalizado
		set nResultado = -2;
	    set cMensaje = "Error, el auto con la patente ingresada ya esta finalizado"; 
	end if;
else  
	 set nResultado = -1;
	 set cMensaje = "Error, no se encontro patente"; 
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `baja_concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `baja_concesionaria`(in id_con int, out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select  id_concesionaria from  concesionarias where id_concesionaria = id_con) then -- verifica que exista el id ingresado
         set nResultado = -1;
		 set cMensaje = "Error, no se encontro concesionaria";   
else        
    if not exists(select id_concesionaria from  concesionarias c INNER JOIN pedidos p ON c.id_concesionaria = p.concesionaria_idConcesionaria WHERE (c.id_concesionaria = id_con AND p.fecha_entrega IS NULL)) then 
    -- verfica que la concesionaria no tenga pedidos pendientes, si tiene pedidos pendientes no se puede dar de baja
		 DELETE FROM concesionarias WHERE id_concesionaria =id_con;
	     set nResultado = 0;
	else
	     set nResultado = -2;
         set cMensaje = "Error, hay pedidos pendientes";
	end if;
end if; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `baja_detalle_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `baja_detalle_pedidos`(in pedido_idPed int, out nResultado int, out cMensaje varchar(45))
BEGIN
-- Baja de detalle_pedidos usado en el procedimiento "baja_pedido". Da de baja todos los detalle pedidos correspondientes al pedido ingresado.
DECLARE idPed INTEGER;
DECLARE termino INTEGER;
DECLARE curDetallePedido CURSOR FOR SELECT pedido_idPedido FROM detalle_pedidos WHERE pedido_idPedido = pedido_idPed;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;

OPEN curDetallePedido;
	 getPedidos: LOOP
		 FETCH curDetallePedido INTO idPed;
		 IF termino = 1 THEN 
			LEAVE getPedidos;
		 END IF;
		 delete from detalle_pedidos where pedido_idPedido = idPed;
	 END LOOP getPedidos;
CLOSE curDetallePedido;			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `baja_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `baja_insumo`(in id_ins int,out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select  id_insumo from  insumos where id_insumo = id_ins) then -- verifica que exista el id ingresado
         set nResultado = -1;
		 set cMensaje = "Error, no se encontro insumo";   
 else        
    if not exists(select id_insumo from  insumos i INNER JOIN insumos_por_tareas it ON i.id_insumo = it.insumos_idInsumos WHERE i.id_insumo = id_ins ) then 
         -- verifica que el insumo no es usado en ninguna tarea, si es asi no puede darse de baja
		 DELETE FROM insumos WHERE id_insumo = id_ins;
	     set nResultado = 0;
	else
	     set nResultado = -2;
         set cMensaje = "Error, el insumo es usado en alguna tarea";
	end if;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `baja_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `baja_pedido`(in id_ped int, out nResultado int, out cMensaje varchar(45))
BEGIN
if not exists(select id_pedido from pedidos where id_pedido = id_ped) then -- no existe pedido
         set nResultado = -1;
		 set cMensaje = "Error, no se encontro pedido";   
else     
         call baja_detalle_pedidos(id_ped,nResultado,cMensaje); -- elimina los detalle_pedido correspondientes al pedido a eliminar   
		 DELETE FROM pedidos WHERE id_pedido = id_ped; -- elimina el pedido
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `baja_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `baja_proveedor`(in  id_prov int, out nResultado int, out cMensaje varchar(45))
BEGIN
if exists(select id_proveedores from  proveedores where id_proveedores = id_prov) then  -- verifica que exista el id ingresado
       DELETE FROM proveedores where id_proveedores = id_prov;
       set nResultado = 0;
    else
       set nResultado = -1;
       set cMensaje = "Error, no se encontro proveedor";
    end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_autos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_autos`(in id_ped int, out nResultado int, out cMensaje varchar(45))
BEGIN
-- 3) Se requiere crear un procedimiento que dada la información de un pedido en
--    particular, se generan los automóviles con la patente asignada al azar en la tabla
--    correspondiente según el modelo. La idea es que se deben generar los automóviles y
--    dejarlos en el estado inicial, es decir, con la línea de montaje asignada, pero sin
--    ingresar a la primer estación de dicha línea. 

DECLARE termino INTEGER;
DECLARE idChasis INTEGER;
DECLARE nPatente varchar(6);
DECLARE fechaIngreso DATETIME;
DECLARE nInsertados INT;
DECLARE idModeloParametro INTEGER;
DECLARE nCantidadDetalle INT;
DECLARE curDetallePedido CURSOR FOR SELECT modelo_idModelo, cantidad FROM detalle_pedidos WHERE pedido_idPedido = id_ped;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;

-- verifica el numero de chasis para la asigancion de la patente, para que no se repitan
if ((select max(nro_chasis) from automoviles) is null) then
     set idChasis = 1;
else
     SET idChasis = (select max(nro_chasis) from automoviles) +1;
end if;

  if not exists(select id_pedido from pedidos where id_pedido = id_ped) then -- verifica si existe pedido, si no existe se genera un error
           set nResultado = -1;
		   set cMensaje = "Error, no se encontro pedido";   
  else
    OPEN curDetallePedido;
         getDetalle: LOOP
            FETCH curDetallePedido INTO idModeloParametro, nCantidadDetalle;
                  IF termino = 1 THEN
                      LEAVE getDetalle;
		  	     END IF;
  	        SET nInsertados = 0;
	        WHILE nInsertados < nCantidadDetalle DO
				 set nPatente = (SELECT generar_patente(idChasis));
                 set fechaIngreso = now();
	             INSERT INTO automoviles(patente, fecha_ingreso,modelo_idModelo, pedido_idPedido) VALUES (nPatente, fechaIngreso,idModeloParametro, id_ped);
			     SET nInsertados = nInsertados  + 1;
                 SET idChasis = (select max(nro_chasis) from automoviles) +1; -- para asignar una patente diferente al siguiente auto
	       END WHILE;
	    call asignar_lineaMontaje(nCantidadDetalle, idModeloParametro, @nResultado, @cMensaje);
        END LOOP getDetalle;
    CLOSE curDetallePedido;
    set nResultado = 0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modif_concesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modif_concesionaria`(in id_con int, in nombre_con varchar(45), in tel_con varchar(45), in direc_con varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN
if exists(select  id_concesionaria from  concesionarias where id_concesionaria = id_con) then -- verifica que exista el id ingresado
        update concesionarias set nombre_concesionaria = nombre_con, tel_concesionaria = tel_con, direc_concesionaria = direc_con where id_concesionaria = id_con;
        set nResultado = 0;
else
		set cMensaje = "Error, no se encontro concesionaria";
        set nResultado = -1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modif_detalle_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modif_detalle_pedidos`(in pedido_idPed int, in modelo_idMod int, in cant int, out nResultado int, out cMensaje varchar(45))
BEGIN
-- Modificacion de detalle_pedidos, solo se puede modificar la cantidad.
if exists(select pedido_idPedido from detalle_pedidos d INNER JOIN pedidos p ON d.pedido_idPedido = p.id_pedido WHERE d.pedido_idPedido = pedido_idPed) then -- Verifica que exista el id del pedido
       if exists(select modelo_idModelo from detalle_pedidos d INNER JOIN modelos m ON d.modelo_idModelo = m.id_modelo WHERE d.modelo_idModeloo = modelo_idMod) then -- Verifica que exista el id del modelo
                     update detalle_pedidos set cantidad = cant  where pedido_idPedido = pedido_idPed and modelo_idModelo = modelo_idMod;
                     set nResultado = 0;
       else
                    set nResultado = -1;
                    set cMensaje = "Error, no se encontro modelo";
	   end if;
else 
	   set nResultado = -1;
	   set cMensaje = "Error, no se encontro pedido";
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modif_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modif_insumo`(in id_ind int, in descripcion_ind varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN
if exists(select id_insumo from  insumos where id_insumo = id_ind) then -- verifica que exista el id ingresado
       update insumos set descripcion_insumo = descripcion_ind where id_insumo = id_ind;
       set nResultado = 0;
else
		set cMensaje = "Error, no se encontro insumo";
        set nResultado = -1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modif_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modif_pedido`(in id_ped int,in fech_entrega datetime, out nResultado int, out cMensaje varchar(45))
BEGIN
-- Modificacion de pedido, solo se puede modificar la fecha de entrega
if exists(select id_pedido from pedidos where id_pedido = id_ped) then
       update pedidos set  fecha_entrega = fech_entrega  where id_pedido = id_ped;
       set nResultado = 0;
else
		set cMensaje = "Error, no se encontro pedido";
        set nResultado = -1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modif_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modif_proveedor`(in  id_prov int, in nombre_prov varchar(45), in tel_prov varchar(45), in direc_prov varchar(45), out nResultado int, out cMensaje varchar(45))
BEGIN  
if exists(select id_proveedores from  proveedores where id_proveedores = id_prov) then -- verifica que exista el id ingresado
       update proveedores set nombre_proveedor = nombre_prov, tel_proveedor = tel_prov, direc_proveedor = direc_prov where id_proveedores = id_prov;
       set nResultado = 0;
else
		set cMensaje = "Error, no se encontro proveedor";
        set nResultado = -1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba`(in idPed int ,out nResultado int, out prueba datetime )
BEGIN
declare idChasis int;
declare idChasisOcupado int;
declare idModelo int;
declare idLineaMontaje int;
declare idEstacion int;
declare fech_ingreso datetime;
declare estacionSiguiente int;
declare ordenActual int;
declare estacionActual int;

-- set idChasis = (select nro_chasis from automoviles where patente = patenteParametro LIMIT 1); -- chasis del auto ingresado
-- set idModelo = (select modelo_idModelo from automoviles where patente = patenteParametro); -- modelo del auto ingresado
-- set idLineaMontaje = (select id_linea_de_montaje from linea_de_montaje where modelo_idModelo = idModelo); -- linea de montaje correspondiente al modelo del auto ingresado
-- set idEstacion = (select id_estacion_de_trabajo from estacion_de_trabajo where (linea_montaje_idLineaMontaje = idLineaMontaje )); -- selecciono la primera estacion de la linea de montaje correspondiente al modelo del auto ingresado
-- set estacionSiguiente= (select id_estacion_de_trabajo from estacion_de_trabajo where (linea_montaje_idLineaMontaje = idLineaMontaje and (orden = ordenActual+1))); 
-- set ordenActual = (select orden from estacion_de_trabajo where id_estacion_de_trabajo = estacionActual );
-- set estacionActual= (select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where (automovil_nroChasis = idChasis and fecha_hora_egreso is null));
-- and orden = 1
-- set nResultado = idChasis;
declare fech_actual datetime;
declare fech_estimada datetime;
declare capacidad float; -- capacidad productiva de cada linea de montaje
declare cantidad int; -- cantidad de autos pedidos
declare capacidadTotal float default 0; -- suma de la capacidad productiva total
declare cantidadTotal int default 0; -- suma de la cantidad de autos pedidos total
declare dias float; -- dias totales de espera
DECLARE termino INTEGER default 0;
DECLARE termino2 INTEGER default 0;
DECLARE curLienaMontaje CURSOR FOR SELECT capacidad_productiva FROM linea_de_montaje;
DECLARE curDetallePedidos CURSOR FOR (SELECT cantidad FROM detalle_pedidos d INNER JOIN pedidos p ON d.pedido_idPedido = p.id_pedido WHERE p.fecha_entrega IS NULL);

set fech_actual = now();
-- begin 
-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;
-- OPEN curLienaMontaje;
-- 	 getCapacidad: LOOP
-- 		 FETCH curLienaMontaje INTO capacidad;
-- 		 IF termino = 1 THEN 
-- 			LEAVE getCapacidad;
-- 		 END IF;
-- 		 set capacidadTotal = (capacidadTotal +capacidad );
-- 	 END LOOP getCapacidad;
-- CLOSE curLienaMontaje;	
-- end;

begin
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino2 = 1;
OPEN curDetallePedidos;
	 getCant: LOOP
		 FETCH curDetallePedidos INTO cantidad;
		 IF termino2 = 1 THEN 
			LEAVE  getCant;
		 END IF;
		 set cantidadTotal = (cantidadTotal + cantidad);
	 END LOOP  getCant;
CLOSE curDetallePedidos;
end;

set dias = ((cantidadTotal/capacidadTotal)+7);
set fech_estimada = (SELECT DATE_ADD(fech_actual, INTERVAL dias DAY));
set prueba = fech_estimada;
set nResultado = cantidad;
-- set nResultado = capacidadTotal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pueba`(in id_ped int )
BEGIN
-- declare pos1 char;
-- declare pos2 char;
-- declare pos3 char;
-- declare pos4 char;
-- declare pos5 char;
-- declare pos6 char;

-- set pos1 = char(((num_chas / 260000) % 26 )+ 65);
-- set pos2 = char(((num_chas / 10000) % 26) + 65);
-- set pos3 = char(((num_chas / 1000 )% 26) + 65);
-- set pos4 = char(((num_chas / 100) % 10) + 48);
-- set pos5 = char(((num_chas / 10) % 10) + 48);
-- set pos6 = char((num_chas % 10) + 48);
-- set prueba = (select concat(pos1, pos2, pos3, pos4,pos5,pos6));
-- select * from automoviles where pedido_idPedido = num_pedido;
DECLARE contador, contador2, contador3 INTEGER default 1;
DECLARE modelo INTEGER;
declare cantidadAutos INTEGER;
DECLARE lineaMontaje INTEGER;
DECLARE idInsumo INTEGER;
DECLARE estacion INTEGER;
DECLARE tarea INTEGER;

DECLARE cantModelos INTEGER default 0;
DECLARE cantEstaciones INTEGER default 0;
DECLARE cantInsumos INTEGER default 0;
declare cantInsumo integer;
declare cantidadInsumo INTEGER default 0;
-- DECLARE curDetallePedido CURSOR FOR SELECT modelo_idModelo, cantidad  FROM detalle_pedidos WHERE pedido_idPedido = id_ped;
-- DECLARE curEstacionTrabajo CURSOR FOR SELECT id_estacion_de_trabajo, tarea_idTarea FROM estacion_de_trabajo WHERE linea_montaje_idLineaMontaje = lineaMontaje;
-- DECLARE curInsumos CURSOR FOR SELECT insumos_idInsumos, cant_insumos_necesario FROM insumos_por_tareas WHERE tarea_idTarea = tarea;


DROP TABLE IF EXISTS tempReporteInsumos;
	CREATE TEMPORARY TABLE tempReporteInsumos
	(
        insumo int,
        cantidad_insumo INT
	);
    
    DROP TABLE IF EXISTS tempAux;
	CREATE TEMPORARY TABLE tempAux
	(
        id_modelo int,
        cantidad_por_modelo INT,
        linea_de_montaje int,
        id_estacion int,
        id_tarea int,
        id_insumo int,
        cantidad_por_insumo int
	);
    
insert into tempAux (id_modelo,cantidad_por_modelo,linea_de_montaje,id_estacion, id_tarea,id_insumo, cantidad_por_insumo  )
select dp.modelo_idModelo, dp.cantidad, l.id_linea_de_montaje, e.id_estacion_de_trabajo, t.id_tarea, it.insumos_idInsumos, it.cant_insumos_necesario  FROM detalle_pedidos dp 
join linea_de_montaje l on dp.modelo_idModelo = l.modelo_idModelo 
join estacion_de_trabajo e on e.linea_montaje_idLineaMontaje = l.id_linea_de_montaje 
join tareas t on e.tarea_idTarea = t.id_tarea
join insumos_por_tareas it on t.id_tarea = it.tarea_idTarea
WHERE dp.pedido_idPedido = id_ped;

insert into tempReporteInsumos (insumo, cantidad_insumo) 
select id_insumo, sum(cantidad_por_insumo) as suma from tempAux group by id_insumo ;


select * from tempReporteInsumos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_insumos`(in id_ped int)
BEGIN
-- 7) Dado un número de pedido, se requiere listar los insumos que será necesario
-- solicitar, indicando código de insumo y cantidad requerida para ese pedido. 

-- Tabla temporal en donde se almacenan los datos del reporte.
DROP TABLE IF EXISTS tempReporteInsumos;
	CREATE TEMPORARY TABLE tempReporteInsumos
	(
        insumo int,
        cantidad_insumo INT
	);

-- Tabla temporal en donde se almacenan los datos necesarios para la generacion del reporte.
	 DROP TABLE IF EXISTS tempAux;
	CREATE TEMPORARY TABLE tempAux
	(
        id_modelo int,
        cantidad_por_modelo INT,
        linea_de_montaje int,
        id_estacion int,
        id_tarea int,
        id_insumo int,
        cantidad_por_insumo int
	);

-- Se insertan valores en la tabla tempAux.
insert into tempAux (id_modelo,cantidad_por_modelo,linea_de_montaje,id_estacion, id_tarea,id_insumo, cantidad_por_insumo  )
select dp.modelo_idModelo, dp.cantidad, l.id_linea_de_montaje, e.id_estacion_de_trabajo, e.tarea_idTarea, it.insumos_idInsumos, it.cant_insumos_necesario  FROM detalle_pedidos dp 
join linea_de_montaje l on dp.modelo_idModelo = l.modelo_idModelo 
join estacion_de_trabajo e on e.linea_montaje_idLineaMontaje = l.id_linea_de_montaje 
join insumos_por_tareas it on e.tarea_idTarea = it.tarea_idTarea
WHERE dp.pedido_idPedido = id_ped;

-- se insertan valores en la tabla tempReporteInsumos.
insert into tempReporteInsumos (insumo, cantidad_insumo) 
select id_insumo, sum(cantidad_por_insumo) from tempAux group by id_insumo ;

select * from tempReporteInsumos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_promedio_construccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_promedio_construccion`(in id_lineaMontaje int)
BEGIN

-- 8) Dada una línea de montaje, indicar el tiempo promedio de construcción de los 
--    vehículos (tener en cuenta sólo los vehículos terminados).
declare fech_inicio date;
declare fech_final date;
DECLARE dias INTEGER default 0;
DECLARE totalDias INTEGER default 0;
DECLARE totalAutos INTEGER default 0;
DECLARE promedio float;

-- Tabla temporal en donde se almacenan los datos necesarios para la generacion del reporte.
	 DROP TABLE IF EXISTS tempAux;
	CREATE TEMPORARY TABLE tempAux
	(
        num_chasis int,
        fecha_incio date,
        fecha_final date
	);
    
-- Se insertan valores en la tabla tempAux.
insert into tempAux (num_chasis,fecha_incio,fecha_final )   
select  t.automovil_nroChasis, t.fecha_hora_ingreso,a.fecha_finalizacion  FROM estacion_de_trabajo e
join tiempo_por_estacion t on e.id_estacion_de_trabajo = t.estacion_trabajo_idEstacionTrabajo
join automoviles a on t.automovil_nroChasis = a.nro_chasis
WHERE (e.linea_montaje_idLineaMontaje = id_lineaMontaje) and (e.orden =1 ) and (a.fecha_finalizacion is not null);

-- se calculan el total de autos finalizados en la lines de montaje ingresada.
set totalAutos = (select count(num_chasis) from tempAux);

-- Se utiliza un cursor en tabla tempAux, para recorrer y calcular los dias en que se tardo en fabricar cada auto.
cur: BEGIN
DECLARE termino INTEGER default 0;
DECLARE curtempAux CURSOR FOR SELECT fecha_incio,fecha_final  FROM tempAux;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;
OPEN curtempAux;
	 getDias: LOOP
		 FETCH curtempAux INTO fech_inicio, fech_final;
		 IF termino = 1 THEN 
			LEAVE getDias;
		 END IF;
         set dias =  DATEDIFF(fech_final, fech_inicio);
         set totalDias = totalDias + dias;
	 END LOOP getDias;
CLOSE curtempAux;
END cur;

-- Se calcula los dias promedio de la fabricacion de todos los autos finalizados correspondientes a la linea de montaje ingresada.
set promedio = totalDias/totalAutos;
select promedio as  promedio_de_construcción;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_promedio_vehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_promedio_vehiculos`(in id_lineaMontaje int)
BEGIN

-- 8) Dada una línea de montaje, indicar el tiempo promedio de construcción de los 
--    vehículos (tener en cuenta sólo los vehículos terminados).
declare fech_inicio date;
declare fech_final date;
DECLARE dias INTEGER default 0;
DECLARE totalDias INTEGER default 0;
DECLARE totalAutos INTEGER default 0;
DECLARE promedio float;

-- Tabla temporal en donde se almacenan los datos necesarios para la generacion del reporte.
	 DROP TABLE IF EXISTS tempAux;
	CREATE TEMPORARY TABLE tempAux
	(
        num_chasis int,
        fecha_incio date,
        fecha_final date
	);
    
-- Se insertan valores en la tabla tempAux.
insert into tempAux (num_chasis,fecha_incio,fecha_final )   
select  t.automovil_nroChasis, t.fecha_hora_ingreso,a.fecha_finalizacion  FROM estacion_de_trabajo e
join tiempo_por_estacion t on e.id_estacion_de_trabajo = t.estacion_trabajo_idEstacionTrabajo
join automoviles a on t.automovil_nroChasis = a.nro_chasis
WHERE (e.linea_montaje_idLineaMontaje = id_lineaMontaje) and (e.orden =1 ) and (a.fecha_finalizacion is not null);

-- se calculan el total de autos finalizados en la lines de montaje ingresada.
set totalAutos = (select count(num_chasis) from tempAux);

-- Se utiliza un cursor en tabla tempAux, para recorrer y calcular los dias en que se tardo en fabricar cada auto.
cur: BEGIN
DECLARE termino INTEGER default 0;
DECLARE curtempAux CURSOR FOR SELECT fecha_incio,fecha_final  FROM tempAux;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;
OPEN curtempAux;
	 getDias: LOOP
		 FETCH curtempAux INTO fech_inicio, fech_final;
		 IF termino = 1 THEN 
			LEAVE getDias;
		 END IF;
         set dias =  DATEDIFF(fech_final, fech_inicio);
         set totalDias = totalDias + dias;
	 END LOOP getDias;
CLOSE curtempAux;
END cur;

-- Se calcula los dias promedio de la fabricacion de todos los autos finalizados correspondientes a la linea de montaje ingresada.
set promedio = totalDias/totalAutos;
select promedio as  promedio_de_construcción;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_vehiculos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_vehiculos`(in id_ped int)
BEGIN
-- 6) Dado un número de pedido, se requiere listar los vehículos indicando el chasis, si se
-- encuentra finalizado, y si no esta terminado, indicar en qué estación se encuentra. 
DECLARE chasis INTEGER;
declare fechaFin datetime;
declare idEstacion int;
DECLARE termino INTEGER default 0;
DECLARE curAutomoviles CURSOR FOR SELECT nro_chasis,fecha_finalizacion  FROM automoviles WHERE pedido_idPedido = id_ped;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET termino = 1;

-- Tabla temporal en donde se almacenan los datos del reporte.
DROP TABLE IF EXISTS tempReporteVehiculos;
	CREATE TEMPORARY TABLE tempReporteVehiculos
	(
		chasis INT not null,
        FechaFinalizado datetime,
        Estacion INT
	);

-- Se utiliza un cursor en tabla automoviles, para recorrer y obtener los datos necesarios para generar el reporte.
OPEN curAutomoviles;
	 getAutos: LOOP
		 FETCH curAutomoviles INTO chasis, fechaFin;
		 IF termino = 1 THEN 
			LEAVE getAutos;
		 END IF;
         set idEstacion = null;
         if(fechaFin is null) then
             set idEstacion = (Select estacion_trabajo_idEstacionTrabajo from tiempo_por_estacion where automovil_nroChasis= chasis and fecha_hora_egreso is null );
         end if;    
		 insert into tempReporteVehiculos values(chasis, fechaFin,idEstacion);
	 END LOOP getAutos;
CLOSE curAutomoviles;

select * from tempReporteVehiculos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23 13:52:58
