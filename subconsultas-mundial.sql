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

/*
Mostrar el nombre, nacionalidad, fecha de nacimiento y continente de todos los 
técnicos, excluyendo a los nacidos en Europa.
*/

SELECT 
		t.nomTecnico, 
		t.nacionalidad, 
		CONVERT(CHAR(10), t.fecNacimiento, 103) AS fecNacimiento,
		p.continente
FROM Tecnico AS t
LEFT JOIN Pais AS p
ON t.idTecnico = p.idTecnico
WHERE continente IN (
					SELECT continente
					FROM Pais
					WHERE continente <> 'Europa'
					);

/*
Mostrar el país, la posición y la cantidad total de jugadores por posición, agrupados 
por país y ordenados por el nombre del país, excluyendo a los jugadores que ocupen la 
posición de defensa.
*/

SELECT 
		p.nomPais, 
		j.posicion, 
		COUNT(idJugador) AS cantidadJugadores
FROM Jugador AS j
LEFT JOIN Pais AS p
ON j.idPais = p.idPais
WHERE j.posicion IN (
					SELECT posicion
					FROM Jugador
					WHERE posicion <> 'Defensa'
					)
GROUP BY p.nomPais, j.posicion
ORDER BY p.nomPais ASC;