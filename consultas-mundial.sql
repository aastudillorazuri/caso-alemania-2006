-- Mostrar la edad de los técnicos en el año en el que se jugó el mundial (2006).

SELECT nomTecnico, (2006 - YEAR(fecNacimiento)) AS edadTecnico 
FROM Tecnico;

/*
Mostrar el nombre, la nacionalidad y la fecha de nacimiento de los técnicos cuyo 
nombre contenga los caracteres "ar" y que hayan nacido después del mes de abril de
cualquier año. Los resultados deben ordenarse en forma descendente según el año de 
nacimiento.
*/

SELECT nomTecnico, nacionalidad, CONVERT(CHAR(10), fecNacimiento, 103) AS fecNacimiento
FROM Tecnico
WHERE MONTH(fecNacimiento) > 4 AND nomTecnico LIKE '%ar%'
ORDER BY YEAR(fecNacimiento) DESC;

/*
Mostrar el nombre del árbitro y su país para aquellos que sean árbitros principales, 
cuyo nombre tenga la letra "a" como segundo carácter y cuyo país contenga la letra "a" 
en cualquier posición.
*/

SELECT nomArbitro, pais
FROM Arbitro
WHERE principal = 1 AND nomArbitro LIKE '_a%' AND pais LIKE '%a%';

/*
Mostrar el nombre, país y continente de los jugadores que pertenezcan al continente 
sudamericano y cuyo nombre tenga la letra "u" como segundo carácter.
*/

SELECT j.nomJugador, p.nomPais, p.continente
FROM Jugador AS j
LEFT JOIN Pais AS p
ON j.idPais = p.idPais
WHERE continente = 'Sudamérica' AND nomJugador LIKE '_u%';

/*
Mostrar el nombre, país y continente de los técnicos que dirigen una selección nacional 
y que pertenecen al continente europeo.
*/

SELECT t.nomTecnico, p.nomPais, p.continente
FROM Tecnico AS t
LEFT JOIN Pais AS p
ON t.idTecnico = p.idTecnico
WHERE continente = 'Europa';

/*
Mostrar el nombre, país y fecha del encuentro de los jugadores que hayan participado el 
9 de junio de 2006.
*/

SELECT j.nomJugador, p.nomPais, CONVERT(CHAR(10),e.fecha, 103) AS fecha
FROM Jugador AS j
LEFT JOIN Encuentro_jugador AS ej
ON j.idJugador = ej.idJugador
LEFT JOIN Pais AS p
ON j.idPais = p.idPais
LEFT JOIN Encuentro AS e
ON ej.idEncuentro = e.idEncuentro
WHERE MONTH(fecha) = 6 AND DAY(fecha) = 9;