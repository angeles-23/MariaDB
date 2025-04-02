### 📝Ejercicios GROUP BY❓:
1. ¿Cómo podrías mostrar el nombre del fabricante en lugar de su código, en la consulta que hemos realizado en el apartado anterior?: Contar el número de productos agrupados por fabricante y tipo de producto y obteniendo todos los subtotales disponibles con el modificador ROLLUP, pero sólo de aquellos productos con fabricante.
```sql
SELECT 
    ifnull(f.nombre, 'TOTAL') as código,
    ifnull(p.tipo, 'SUBTOTAL') as tipo,
    COUNT(*) as cantidad_productos
FROM fabricante f INNER JOIN producto p 
    ON f.código = p.código_fabricante
WHERE p.código_fabricante IS NOT NULL
GROUP BY f.código, p.tipo WITH ROLLUP;


código	tipo	cantidad_productos	
Pecado Capital	gráficos	1	
Pecado Capital	SUBTOTAL	1	
Rey Casi Piedra	almacenamiento	1	
Rey Casi Piedra	SUBTOTAL	1	
Puerta Al Mar	almacenamiento	2	
Puerta Al Mar	gráficos	1	
Puerta Al Mar	SUBTOTAL	3	
Puerta Al Mar	SUBTOTAL	5	
```


2. Muestra el número de productos que existen (‘num productos’) de cada tipo y fabricante, incluyendo el ‘nombre fabricante’ en el resultado de la consulta.
```sql
SELECT 
    p.tipo, 
    f.nombre as 'nombre fabricante',
    COUNT(p.tipo) as 'num productos'
FROM producto p INNER JOIN fabricante f
    ON p.código_fabricante = f.código
GROUP BY p.tipo,f.nombre;


tipo	nombre fabricante	num productos	
almacenamiento	Puerta Al Mar	2	
almacenamiento	Rey Casi Piedra	1	
gráficos	Pecado Capital	1	
gráficos	Puerta Al Mar	1	
```


3. Deseamos obtener una consulta que nos sume el precio de todos los productos agrupados por fabricante, en los resultados de la consulta debe aparecer una primera columna llamada fabricante con el nombre del fabricante y la segunda debe ser la suma de los precios de sus productos, que se llamará ‘total productos’.
```sql
SELECT 
	f.nombre as fabricante, 
    SUM(p.precio) as 'total productos'
FROM producto p LEFT JOIN fabricante f 
	ON p.código_fabricante = f.código
GROUP BY f.nombre;


fabricante	total productos	
NULL	1.00	
Pecado Capital	185.00	
Puerta Al Mar	406.00	
Rey Casi Piedra	120.00	
```


4. Realiza el ejercicio anterior (3), pero además de aparecer todos los fabricantes, debe aparecer una linea con el contenido SIN FABRICANTE que sumará el precio de todos aquellos productos que no tuvieran fabricante.
```sql
SELECT 
    ifnull(f.nombre, 'SIN FABRICANTE') as fabricante, 
    SUM(p.precio) as 'total productos'
FROM producto p LEFT JOIN fabricante f 
    ON p.código_fabricante = f.código
GROUP BY f.nombre;


fabricante	total productos	
SIN FABRICANTE	1.00	
Pecado Capital	185.00	
Puerta Al Mar	406.00	
Rey Casi Piedra	120.00	
```