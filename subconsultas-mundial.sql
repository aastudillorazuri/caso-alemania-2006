/*
Mostrar el nombre, aforo y ubicación de todos los estadios cuyo aforo sea mayor 
que el promedio general.
*/

SELECT nomEstadio, aforo, ciudad
FROM Estadio
WHERE aforo > (
                SELECT AVG(aforo)
				FROM Estadio
                );

/*
Mostrar los técnicos y sus respectivas edades para aquellos cuya edad sea menor que 
el promedio general, tomando como referencia el año del Mundial.
*/

SELECT nomTecnico, (2006 - YEAR(fecNacimiento)) AS edad
FROM Tecnico
WHERE 2006 - YEAR(fecNacimiento) < (
				SELECT AVG(2006 - YEAR(fecNacimiento))
				FROM Tecnico
				);

