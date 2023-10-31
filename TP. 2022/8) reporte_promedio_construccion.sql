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

END