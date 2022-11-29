USE formula_1;

/*CREATE*/

/*CREAR una tabla de posiciones*/
INSERT INTO tablas_posiciones (scuderia_id, circuito, puntos) VALUES
	(5,2,26);

/*CREAR un piloto*/
INSERT INTO pilotos (nombre, apellido, nacionalidad, numero_campeonatos) VALUES
	("Menganito", "De Tal", 141, 0);

/*CREAR un circuito*/
INSERT INTO circuitos (nombre, pais_id, longitud, clima) VALUES
	("Hermanos Martinez", 141, 5000, "Seco");

/*CREAR una scuderia*/
INSERT INTO scuderias (nombre, piloto_id, fundador, fecha_fundacion, victorias, presidente) VALUES
	("scuderia bon giorno", 2, "Luigi Pignoli", "2015-05-03", 2, "Mario Jr.");

/*CREAR un pais*/
INSERT INTO paises (nombre, dominio) VALUES
	("Dormilandia", "ZZ");

/*READ*/

/*LEER todos los pilotos*/
SELECT * FROM pilotos;

/*LEER todas las escuderias*/
SELECT s.nombre as Escuderia , p.nombre as piloto_nombre, p.apellido as piloto_apellido, pais.nombre as nacionalidad ,s.fundador, s.fecha_fundacion, s.victorias, s.presidente FROM scuderias as s
	INNER JOIN pilotos AS p
		ON s.piloto_id = p.id_piloto
	INNER JOIN paises AS pais
		ON p.nacionalidad = pais.id_pais;
	
/*LEER todos  los circuitos*/
SELECT c.nombre as circuito, p.nombre AS pais, c.longitud, c.clima  FROM circuitos AS c
	INNER JOIN paises as p 
		ON c.pais_id = p.id_pais;

/*LEER todos los paises*/
SELECT * FROM paises;

/*LEER todas las tablas de posiciones*/
SELECT s.nombre AS escuderia,
		p.nombre as piloto_nombre, p.apellido as piloto_apellido, nacionalidad.nombre AS nacionalidad,
		c.nombre AS circuito, pais.nombre AS pais_circuito, c.longitud, c.clima AS circuito_clima,
		tp.puntos
FROM tablas_posiciones AS tp
	INNER JOIN scuderias AS s 
		ON tp.scuderia_id = s.id_scuderia
	INNER JOIN circuitos AS c 
		ON tp.circuito = c.id_circuitos
	INNER JOIN pilotos AS p
		ON s.piloto_id = p.id_piloto 
	INNER JOIN paises AS pais
		ON c.pais_id = pais.id_pais
	INNER JOIN paises AS nacionalidad
		ON p.nacionalidad = nacionalidad.id_pais ;
	
	
/*UPDATE*/

/*ACTUALIZAR un piloto*/
UPDATE pilotos 
	SET nombre = "Checo"
	WHERE id_piloto = 3;

/*ACTUALIZAR una scuderia*/
UPDATE scuderias 
	SET victorias = 67
	WHERE id_scuderia = 5;

/*ACTUALIZAR una tabla de posicion*/
UPDATE tablas_posiciones
	SET puntos = 30
	WHERE scuderia_id = 2;

/*ACTUALIZAR un pais*/
UPDATE paises 
	SET nombre = "Memexico"
	WHERE id_pais = 141;

/*ACTUALIZAR un circuito*/
UPDATE circuitos 
	SET clima = "Continental", longitud = 3400
	WHERE id_circuitos = 3;

/*DELETE*/

/*ELIMINAR un piloto*/
DELETE FROM pilotos WHERE id_piloto = 10;

/*ELIMINAR un circuito por su clima*/
DELETE FROM circuitos WHERE clima = 'Caliente';

/*ELIMINAR una tabla de posicion por puntos*/
DELETE FROM tablas_posiciones WHERE puntos < 15;

/*ELIMINAR una scuderia por victorias*/
DELETE FROM scuderias WHERE victorias > 200;

/*ELIMINAR un dominio*/
DELETE FROM paises WHERE dominio = "ZZ";


	
	
	
	
