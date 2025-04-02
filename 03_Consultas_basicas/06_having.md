### 📝Ejercicios HAVING❓(CORREGIDOS):
1. Sobre la tabla alumno de la base de datos instituto necesitamos contar los alumnos nacidos en cada año, de aquellos años donde haya nacido más de uno.
``` sql
SELECT 
    YEAR(a.fecha_nacimiento) as año, 
    COUNT(*) as cantidad
FROM alumno a 
GROUP BY YEAR(a.fecha_nacimiento)     -- LEFT(a.fecha_nacimiento, 4)
HAVING COUNT(*) > 1;

1998	2	
```


2. Y si quisieramos contar los alumnos nacidos en cada año, de aquellos años donde haya nacido más de uno, pero **sin tener en cuenta los que no tengan teléfono**.
``` sql
SELECT 
    YEAR(a.fecha_nacimiento) as año, 
    COUNT(*) as cantidad
FROM alumno a 
WHERE a.teléfono IS NOT NULL
GROUP BY YEAR(a.fecha_nacimiento)	 -- LEFT(a.fecha_nacimiento, 4)
HAVING COUNT(*) > 1;

	
```


3. Queremos obtener el número promedio del id de los alumnos que agrupados por la inicial de su primer apellido, tengan una suma de sus id mayor que 5, el resultado debe mostrar la inicial del campo apellido1, junto al número promedio de id que llamaremos ‘media id’.
``` sql
SELECT 
    LEFT(a.apellido1, 1) as 'inicial apellido1', 
    ROUND(AVG(a.id), 2) as 'media id' -- , COUNT(a.apellido1) as cantidad, SUM(id) as suma_ids
FROM alumno a
GROUP BY LEFT(a.apellido1, 1) -- SUBSTRING(a.apellido1, 1, 1): empezar en el  caracter 1 con una longitud de 1
HAVING SUM(a.id) > 5;


inicial apellido1	media id	
C	8.00	
D	9.00	
F	7.00	
G	6.00	
M	7.50	
S   2.33	
```


4. Si deseáramos mostrar en el ejercicio anterior el campo apellido1 completo, ¿cómo lo podríamos hacer?.
```txt
NO SE PUEDE, PORQUE EN CASO DE QUE EXISTA UNA AGRUPACIÓN APARECERÁ UN VALOR CUALQUIERA QUE PUEDE VARIAR EN CUALQUIER MOMENTO.
```
SI NO ESTÁ EN EL GROUP BY NO PUEDE APARECER EN EL SELECT**


5. Calcular el precio medio de los distintos tipos de productos
```sql
SELECT 
    p.tipo, 
    ROUND(AVG(p.precio), 2) as precio
FROM producto p
GROUP BY p.tipo;


tipo	precio	
almacenamiento	118.67	
gráficos	177.50	
higiene	1.00	
```
