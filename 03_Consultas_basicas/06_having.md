### 📝Ejercicios HAVING❓:
1. Sobre la tabla alumno de la base de datos instituto necesitamos contar los alumnos nacidos en cada año, de aquellos años donde haya nacido más de uno.
``` sql
SELECT 
	LEFT(a.fecha_nacimiento, 4) as años,
    COUNT(*) as 'alumnos nacidos'
FROM alumno a
GROUP BY años
HAVING COUNT(*) > 1


1998	2	
```


2. Y si quisieramos contar los alumnos nacidos en cada año, de aquellos años donde haya nacido más de uno, pero sin tener en cuenta los que no tengan teléfono.
``` sql
SELECT 
	a.teléfono,
	LEFT(a.fecha_nacimiento, 4) as años,
    COUNT(*) as 'alumnos nacidos'
FROM alumno a
WHERE a.teléfono IS NULL or a.teléfono IS NOT NULL
GROUP BY años
HAVING COUNT(*) > 1


618253876	1998	2	
```


3. Queremos obtener el número promedio del id de los alumnos que agrupados por la inicial de su primer apellido, tengan una suma de sus id mayor que 5, el resultado debe mostrar la inicial del campo apellido1, junto al número promedio de id que llamaremos ‘media id’.
``` sql
SELECT 
    LEFT(a.apellido1, 1) as inicial_apellido1, 
    ROUND(AVG(a.id), 2) as 'media id' -- , COUNT(a.apellido1) as cantidad, SUM(id) as suma_ids
FROM alumno a
GROUP BY LEFT(a.apellido1, 1)
HAVING SUM(a.id) > 5


inicial_apellido1	media id	
C	8.00	
D	9.00	
F	7.00	
G	6.00	
M	7.50	
S   2.33	
```


4. Si deseáramos mostrar en el ejercicio anterior el campo apellido1 completo, ¿cómo lo podríamos hacer?.
``` sql
SELECT 
	a.apellido1,
	LEFT(a.apellido1, 1) as inicial_apellido1, 
    ROUND(AVG(a.id), 2) as 'media id'-- , 
    -- COUNT(a.apellido1) as cantidad, 
    -- SUM(id) as suma_ids
FROM alumno a
GROUP BY LEFT(a.apellido1, 1)
HAVING SUM(a.id) > 5 


apellido1	inicial_apellido1	media id	
Carretero	C	8.00	
Domínguez	D	9.00	
Fernández	F	7.00	
Gutiérrez	G	6.00	
Martínez	M	7.50	
Sánchez	S	2.33	
```