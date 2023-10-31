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

END