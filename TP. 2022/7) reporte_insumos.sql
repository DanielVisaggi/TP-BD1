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
END