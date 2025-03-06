### UNION

## 📝Ejercicios de Operadores de Conjunto:

1. Realiza la UNION del nombre , apellido1 y apellido2 de los alumnos repetidores junto a los alumnos cuyo nombre termine en o.

``` sql
-- Buscamos repetidores
SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno a
WHERE a.es_repetidor = 'si'

UNION
-- Buscamos los que tengan nombre que acaben en o
SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno a
WHERE a.nombre LIKE '%o';


nombre	apellido1	apellido2	
Lucía	Sánchez	Ortega	
Irene	Gutiérrez	Sánchez	
Antonio	Carretero	Ortega	
Paco	Martínez	López	
``` 



2. Sobre el resultado de la consulta anterior elimina aquellos alumnos cuyos dos apellidos acaben en z.
``` sql
(SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno a
WHERE a.es_repetidor = 'si')

UNION

(SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno a
WHERE a.nombre LIKE '%o')

EXCEPT
-- Los 2 apellidos que acaben en z
SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno a
WHERE a.apellido1 LIKE '%z' AND a.apellido2 LIKE '%z';


nombre	apellido1	apellido2	
Lucía	Sánchez	Ortega	
Antonio	Carretero	Ortega	
``` 


3. Selecciona los apellidos que aparecen en el nombre de un alumno, tanto en apellido1 como en apellido2 y ordenalos por ese campo de manera descendente. El nuevo campo se debe llamar apellido1o2.
``` sql
(SELECT a.apellido1 apellido1y2
FROM alumno a)
INTERSECT
(SELECT a.apellido2
FROM alumno a)  
ORDER BY apellido1y2 DESC;


apellido1o2   	
Sánchez	
Ramírez	
``` 