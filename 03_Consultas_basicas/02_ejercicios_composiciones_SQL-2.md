### 📝Ejercicios COMPOSICIONES SQL-2❓:
#### Dada la base de datos bd_teoria_productos que te puedes descargar desde el apartado Referencias se pide, utilizando sintáxis SQL-2:

1. Realiza la composición cruzada entre la tabla fabricante y la tabla producto descartando aquellas uniones en las que el código del fabricante sea impar

``` sql
SELECT *
FROM fabricante f CROSS JOIN producto p
WHERE f.código % 2 = 0;

código	nombre	id	nombre	tipo	precio	código_fabricante	
2	Tecnología Lógica	1	Disco duro SATA3 1TB	almacenamiento	86.00	5	
4	Rey Casi Piedra	1	Disco duro SATA3 1TB	almacenamiento	86.00	5	
2	Tecnología Lógica	2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	
4	Rey Casi Piedra	2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	
2	Tecnología Lógica	3	Disco SSD 1 TB	almacenamiento	150.00	5	
4	Rey Casi Piedra	3	Disco SSD 1 TB	almacenamiento	150.00	5	
2	Tecnología Lógica	4	GeForce GTX 1050Ti	gráficos	185.00	3	
4	Rey Casi Piedra	4	GeForce GTX 1050Ti	gráficos	185.00	3	
2	Tecnología Lógica	5	Ati 7000Ti	gráficos	170.00	5	
4	Rey Casi Piedra	5	Ati 7000Ti	gráficos	170.00	5	
2	Tecnología Lógica	6	Guantes Covid-19	higiene	1.00	NULL	
4	Rey Casi Piedra	6	Guantes Covid-19	higiene	1.00	NULL	
```



2. Realiza la composición interna (interseccion) entre la tabla fabricante y la tabla producto, en la que se muestren solo aquellos productos cuyo precio sea mayor o igual que 120€ ordenados por precio ascendentemente.

``` sql

SELECT *
FROM fabricante f INNER JOIN producto p
	ON f.código = p.código_fabricante
WHERE p.precio >= 120
ORDER BY p.precio ASC;

código	nombre	id	nombre	tipo	precio   	código_fabricante	
4	Rey Casi Piedra	2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	
5	Puerta Al Mar	3	Disco SSD 1 TB	almacenamiento	150.00	5	
5	Puerta Al Mar	5	Ati 7000Ti	gráficos	170.00	5	
3	Pecado Capital	4	GeForce GTX 1050Ti	gráficos	185.00	3	
```



3. Deseamos obtener de todos los productos un listado de todos sus campos, junto al nombre del fabricante de los mismos. En la consulta deben aparecer los datos de los productos incluso si no tienen un fabricante asignado. Realiza la consulta usando la sintaxis SQL-2 de más de una forma.

``` sql
SELECT p.*, f.nombre
FROM producto p LEFT JOIN fabricante f
	ON f.código = p.código_fabricante;

id	nombre	tipo	precio	código_fabricante	nombre	
1	Disco duro SATA3 1TB	almacenamiento	86.00	5	Puerta Al Mar	
2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	Rey Casi Piedra	
3	Disco SSD 1 TB	almacenamiento	150.00	5	Puerta Al Mar	
4	GeForce GTX 1050Ti	gráficos	185.00	3	Pecado Capital	
5	Ati 7000Ti	gráficos	170.00	5	Puerta Al Mar	
6	Guantes Covid-19	higiene	1.00	NULL	NULL	
```



4. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también aquellos fabricantes que no tienen productos asociados.

``` sql
SELECT p.*, f.nombre
FROM fabricante f LEFT JOIN producto p
	ON f.código = p.código_fabricante;

id	nombre	tipo	precio	código_fabricante	nombre	
NULL	NULL	NULL	NULL	NULL	El hijo de Ep	
NULL	NULL	NULL	NULL	NULL	Tecnología Lógica	
4	GeForce GTX 1050Ti	gráficos	185.00	3	Pecado Capital	
2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	Rey Casi Piedra	
1	Disco duro SATA3 1TB	almacenamiento	86.00	5	Puerta Al Mar	
3	Disco SSD 1 TB	almacenamiento	150.00	5	Puerta Al Mar	
5	Ati 7000Ti	gráficos	170.00	5	Puerta Al Mar	



-- EN CASO DE QUE NO EXISTAN, INDICARLO CON EL VALOR 'SIN PRODUCTOS'
SELECT ifnull(p.nombre, 'SIN PRODUCTOS') nombre_producto, f.nombre nombre_fabricante
FROM fabricante f LEFT JOIN producto p
	ON f.código = p.código_fabricante;

nombre_producto	nombre_fabricante	
sin productos	El hijo de Ep	
sin productos	Tecnología Lógica	
GeForce GTX 1050Ti	Pecado Capital	
Memoria RAM DDR4 8GB	Rey Casi Piedra	
Disco duro SATA3 1TB	Puerta Al Mar	
Disco SSD 1 TB	Puerta Al Mar	
Ati 7000Ti	Puerta Al Mar	
```



5. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también tanto los producto que no tienen un fabricante asignado, como aquellos fabricantes que no tienen productos asociados. Indica las instrucciones para realizarlo tanto en SQL Server como en MySQL/MariaDB.

``` sql
(SELECT p.*, f.nombre nombre_fabricante
FROM producto p LEFT JOIN fabricante f 
	ON p.código_fabricante = f.código)
UNION         -- UNION añade más filas debajo, deben tener la misma cantidad de columnas en el select
(SELECT p.*, f.nombre nombre_fabricante
FROM  producto p RIGHT JOIN fabricante f
	ON p.código_fabricante = f.código);


-- SQL SERVER
SELECT p.*, f.nombre nombre_fabricante
FROM  producto p FULL JOIN fabricante f
	ON p.código_fabricante = f.código;


id	nombre	tipo	precio	código_fabricante	nombre_fabricante	
1	Disco duro SATA3 1TB	almacenamiento	86.00	5	Puerta Al Mar	
2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	Rey Casi Piedra	
3	Disco SSD 1 TB	almacenamiento	150.00	5	Puerta Al Mar	
4	GeForce GTX 1050Ti	gráficos	185.00	3	Pecado Capital	
5	Ati 7000Ti	gráficos	170.00	5	Puerta Al Mar	
6	Guantes Covid-19	higiene	1.00	NULL	NULL	
NULL	NULL	NULL	NULL	NULL	El hijo de Ep	
NULL	NULL	NULL	NULL	NULL	Tecnología Lógica	



(SELECT p.*, f.nombre nombre_fabricante
FROM producto p LEFT JOIN fabricante f 
	ON p.código_fabricante = f.código)
UNION ALL               -- UNION ALL: hace la unión muestra todos, incluido los repetidos
(SELECT p.*, f.nombre nombre_fabricante
FROM  producto p RIGHT JOIN fabricante f
	ON p.código_fabricante = f.código);

id	nombre	tipo	precio	código_fabricante	nombre_fabricante	
1	Disco duro SATA3 1TB	almacenamiento	86.00	5	Puerta Al Mar	
2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	Rey Casi Piedra	
3	Disco SSD 1 TB	almacenamiento	150.00	5	Puerta Al Mar	
4	GeForce GTX 1050Ti	gráficos	185.00	3	Pecado Capital	
5	Ati 7000Ti	gráficos	170.00	5	Puerta Al Mar	
6	Guantes Covid-19	higiene	1.00	NULL	NULL	
NULL	NULL	NULL	NULL	NULL	El hijo de Ep	
NULL	NULL	NULL	NULL	NULL	Tecnología Lógica	
4	GeForce GTX 1050Ti	gráficos	185.00	3	Pecado Capital	
2	Memoria RAM DDR4 8GB	almacenamiento	120.00	4	Rey Casi Piedra	
1	Disco duro SATA3 1TB	almacenamiento	86.00	5	Puerta Al Mar	
3	Disco SSD 1 TB	almacenamiento	150.00	5	Puerta Al Mar	
5	Ati 7000Ti	gráficos	170.00	5	Puerta Al Mar	
```