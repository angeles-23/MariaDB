/*
1. EJERCICIO (2 puntos)
Crea una función llamada getPuntuacion , que dado el id de un piloto, calcule y devuelva como resultado para ese piloto los puntos que tiene en la clasificación actualmente.
Para calcular los puntos debes tener en cuenta que cuando un piloto termina primer_clasificado en una carrera, se le otorgan 25 puntos, cuando termina segundo_clasificado son 10 puntos y al tercer_clasificado se le dan 5 puntos.
Si el piloto no existe debe devolver la puntuación -1

Pon un ejemplo del resultado de la ejecución para ver la puntuación del piloto con id 3 (Fernando Alonso) y del piloto con id 100 (inexistente)

Alonso	Inexistente
95	-1
*/
DELIMITER $$
DROP FUNCTION IF EXISTS getPuntuacion$$
CREATE FUNCTION getPuntuacion(p_id int)
RETURNS int

BEGIN
	-- Me pasan el id de un piloto, si existe sigo, sino -1 en sus puntos
    DECLARE v_id int;
    DECLARE v_cantidad_puntos int;
    
    DECLARE v_fin BOOLEAN DEFAULT FALSE;
    DECLARE v_primer_clasificado int;
    DECLARE v_cantidad_primer_clasificado int;
    DECLARE v_cantidad_segundo_clasificado int;
    DECLARE v_cantidad_tercer_clasificado int;
    
    SELECT c.id
    INTO v_id
    FROM carreras c
    WHERE c.id = p_id;
    
    
    IF v_id IS NOT NULL THEN
        -- Cuenta cuantas veces ha quedado en primer, segundo y tercer lugar
        SELECT count(c1.primer_clasificado)
        INTO v_cantidad_primer_clasificado
        FROM carreras c1
        WHERE c1.primer_clasificado = v_id;

        SELECT count(c1.segundo_clasificado)
        INTO v_cantidad_segundo_clasificado
        FROM carreras c1
        WHERE c1.segundo_clasificado = v_id;

        SELECT count(c1.tercer_clasificado)
        INTO v_cantidad_tercer_clasificado
        FROM carreras c1
        WHERE c1.tercer_clasificado = v_id;
        
        SET v_cantidad_puntos = (v_cantidad_primer_clasificado*25) + (v_cantidad_segundo_clasificado*10) + (v_cantidad_tercer_clasificado*5);
        
    ELSE
    	SET v_cantidad_puntos = -1;
    END IF;
    
	RETURN v_cantidad_puntos;
/*
SELECT getPuntuacion(3);    -- 95
SELECT getPuntuacion(100);  -- -1
*/
END $$












/*
2. EJERCICIO (2 puntos)
Crea un procedimiento llamado clasificacionPorEquipos que imprima junto al nombre del equipo (columna llamada equipo), el número de pilotos del equipo (pilotos) y la suma de los puntos de sus pilotos (puntos). Se ordenará por la suma de puntos de los pilotos en orden inverso y en caso de empate estará primero el equipo que menos pilotos tenga.
El procedimiento debe admitir un parámetro llamado pCantidad que indicará la cantidad de equipos que se van a mostrar en el resultado.
Nota: Utiliza la función creada en el ejercicio anterior getPuntuacion() , pero si no la has realizado puedes en lugar de sumar los puntos de los pilotos, sumar los id de los mismos y llamar al campo ids , en cuyo caso penalizarás 0.25 en esta pregunta.
Ejemplo de ejecución real

call clasificacionPorEquipos(5);
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS clasificacionPorEquipos$$
CREATE PROCEDURE clasificacionPorEquipos(pCantidad int)

BEGIN

	SELECT e.nombre AS equipo, COUNT(e.nombre) AS pilotos, getPuntuacion(p.id) AS puntos
    FROM equipos e INNER JOIN pilotos p 
        ON e.id = p.equipo_id
    GROUP BY e.nombre
    ORDER BY puntos DESC, COUNT(p.id) ASC
    LIMIT pCantidad;
/*
CALL clasificacionPorEquipos(5); 
*/
END $$






/*
3. EJERCICIO (2 puntos)
Se desea imprimir el nombre de los pilotos del pais (de pilotos) con menos victorias en carreras (al menos debe haber alguna victoria), en caso de empate se ordenará por el nombre del país alfabéticamente.
Idea: Calcula primero cual es el país de pilotos con más victorias en carreras, después imprime el nombre de los pilotos de ese país.
*/
-- contar la cnatidad de veces que aparece el p.id en 
SELECT p.nombre
FROM pilotos p
WHERE p.pais = 
-- contar la cantidad de veces que aparece el p.id en 
(SELECT p1.pais
FROM pilotos p1 INNER JOIN carreras c 
	ON p1.id = c.primer_clasificado
GROUP BY p1.id
HAVING count(c.primer_clasificado) >= 1
ORDER BY count(c.primer_clasificado) ASC, p1.pais ASC
LIMIT 1)
ORDER BY p.pais ASC;












/*
4. EJERCICIO (2 puntos)
La FIA ha decidido penalizar al piloto Max Verstappen quitándole las victorias de todas las carreras que haya ganado en el mes de marzo de 2024.
Por tanto, se desea crear un bloque de código en el que debes iniciar una transacción.
Calcular y almacenar el id del piloto penalizado en una variable.
Mostrar todos los datos de las carreras del mes de marzo en las que el piloto haya ganado.
Actualizar el resultado de esas carreras, estableciendo como primer_clasificado el piloto null.
Mostrar todos los datos de las carreras del mes de marzo.
Abortar la transacción para evitar que las modificaciones se hagan permanentes.
*/

START TRANSACTION;

-- ID piloto penalizado
SELECT p.id
INTO @id_Max
FROM pilotos p
WHERE p.nombre = 'Max Verstappen';

-- Carreras ganadas por Max
SELECT c.primer_clasificado
INTO @clasificacion_primer_lugar
FROM carreras c
WHERE MONTH(c.fecha) = 3 and c.primer_clasificado = @id_Max;

UPDATE carreras SET carreras.primer_clasificado = NULL WHERE carreras.primer_clasificado = @id_Max;

SELECT *
FROM carreras 
WHERE MONTH(carreras.fecha) = 3;

ROLLBACK;











/*
5. EJERCICIO (2 puntos)
Crea un procedimiento llamado checkCircuitos() que tenga dos parámetros de salida:
pCuenta : que almacenará el número de circuitos en los que no se disputa ninguna carrera .
pSinCarrera : que contendrá la ubicacion separadas por ';' de los circuitos en los que no se disputa ninguna carrera. Declara este parámetro de tamaño 1000
Para generar estos datos debes utilizar un cursor que recorra la tabla circuitos (con los que no se disputa ninguna carrera o comprobar si se disputa una carrera dentro del bucle)
En el bucle que recorre el resultado del cursor debes ir creando el parámetro pPaises y contando el número de los que cumplen la condición.
Se pide también un ejemplo de ejecución en el que muestres el resultado obtenido.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS checkCircuitos $$
CREATE PROCEDURE checkCircuitos(OUT pCuenta int, OUT pSinCarrera varchar(1000))

BEGIN
	
    DECLARE v_fin BOOLEAN DEFAULT FALSE;
    DECLARE v_cuenta int DEFAULT 0;
    DECLARE v_resultado varchar(10000);
    
    DECLARE v_id_circuito int;
    DECLARE v_nombre varchar(255);
    DECLARE v_ubicacion varchar(255);
    DECLARE v_pais varchar(50);
    
    DECLARE c CURSOR FOR 
    	SELECT ci.id, ci.nombre, ci.ubicacion, ci.pais
        FROM circuitos ci LEFT JOIN carreras ca	
            ON ci.id = ca.circuito_id
        WHERE ca.circuito_id IS NULL;
        
  	DECLARE CONTINUE HANDLER FOR NOT FOUND
    	BEGIN
        	SET v_fin = TRUE;
        END;
        
  	OPEN c;
    		bucle: LOOP
        		FETCH c INTO v_id_circuito, v_nombre, v_ubicacion, v_pais;
                
                IF v_fin THEN 
                	LEAVE bucle;
                END IF;
                
                SET v_cuenta = v_cuenta + 1;
                
                IF v_resultado IS NULL THEN
                	SET v_resultado = v_ubicacion;
                ELSE
                	SET v_resultado = CONCAT(v_resultado, ';', v_ubicacion);
                END IF;
                
        	END LOOP;
   	CLOSE c;
    
    SET pCuenta = v_cuenta;
    SET pSinCarrera = v_resultado;
    
/*
CALL checkCircuitos(@cuenta, @ubicaciones);
SELECT @cuenta AS circuitos_sin_carreras, @ubicaciones AS ubicaciones_sin_carreras;
*/
    
END $$