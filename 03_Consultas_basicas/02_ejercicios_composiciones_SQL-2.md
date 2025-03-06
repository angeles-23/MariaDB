### 📝Ejercicios COMPOSICIONES SQL-2❓:
#### Dada la base de datos bd_teoria_productos que te puedes descargar desde el apartado Referencias se pide, utilizando sintáxis SQL-2:

1. Realiza la composición cruzada entre la tabla fabricante y la tabla producto descartando aquellas uniones en las que el código del fabricante sea impar

``` sql
SELECT f.*, p.*
FROM fabricante f, producto p    /* , -> CROSS JOIN */
WHERE f.codigo = p.codigo_fabricante AND  f.codigo % 2 != 0;


codigo	nombre	codigo	nombre	precio	codigo_fabricante	
5	Seagate	1	Disco duro SATA3 1TB	86.99	5	
7	Gigabyte	4	GeForce GTX 1050Ti	185.00	7	
1	Asus	6	Monitor 24 LED Full HD	202.00	1	
1	Asus	7	Monitor 27 LED Full HD	245.99	1	
3	Hewlett-Packard	10	Impresora HP Deskjet 3720	59.99	3	
3	Hewlett-Packard	11	Impresora HP Laserjet Pro M26nw	180.00	3	

```



2. Realiza la composición interna (interseccion) entre la tabla fabricante y la tabla producto, en la que se muestren solo aquellos productos cuyo precio sea mayor o igual que 120€ ordenados por precio ascendentemente.

``` sql
SELECT *
FROM fabricante f INNER JOIN producto p
	ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 120
ORDER BY p.precio ASC;


codigo	nombre	codigo	nombre	precio   	codigo_fabricante	
6	Crucial	2	Memoria RAM DDR4 8GB	120.00	6	
4	Samsung	3	Disco SSD 1 TB	150.99	4	
3	Hewlett-Packard	11	Impresora HP Laserjet Pro M26nw	180.00	3	
7	Gigabyte	4	GeForce GTX 1050Ti	185.00	7	
1	Asus	6	Monitor 24 LED Full HD	202.00	1	
1	Asus	7	Monitor 27 LED Full HD	245.99	1	
2	Lenovo	9	Portátil Ideapd 320	444.00	2	
2	Lenovo	8	Portátil Yoga 520	559.00	2	
6	Crucial	5	GeForce GTX 1080 Xtreme	755.00	6	


```



3. Deseamos obtener de todos los producto un listado de todos sus campos, junto al nombre del fabricante de los mismos. En la consulta deben aparecer los datos de los productos incluso si no tienen un fabricante asignado. Realiza la consulta usando la sintaxis SQL-2 de más de una forma.

``` sql
SELECT p.*, f.nombre as nombre_fabricante
FROM producto p LEFT JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo;

SELECT p.*, f.nombre as nombre_fabricante
FROM fabricante f RIGHT JOIN  producto p
	ON f.codigo = p.codigo_fabricante;


codigo	nombre	precio	codigo_fabricante	nombre_fabricante	
1	Disco duro SATA3 1TB	86.99	5	Seagate	
2	Memoria RAM DDR4 8GB	120.00	6	Crucial	
3	Disco SSD 1 TB	150.99	4	Samsung	
4	GeForce GTX 1050Ti	185.00	7	Gigabyte	
5	GeForce GTX 1080 Xtreme	755.00	6	Crucial	
6	Monitor 24 LED Full HD	202.00	1	Asus	
7	Monitor 27 LED Full HD	245.99	1	Asus	
8	Portátil Yoga 520	559.00	2	Lenovo	
9	Portátil Ideapd 320	444.00	2	Lenovo	
10	Impresora HP Deskjet 3720	59.99	3	Hewlett-Packard	
11	Impresora HP Laserjet Pro M26nw	180.00	3	Hewlett-Packard	

```



4. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también aquellos fabricantes que no tienen productos asociados.

``` sql



```



5. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también tanto los producto que no tienen un fabricante asignado, como aquellos fabricantes que no tienen productos asociados. Indica las instrucciones para realizarlo tanto en SQL Server como en MySQL/MariaDB.

``` sql
SELECT p.*, f.nombre nombre_fabricante
FROM producto p LEFT JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo

UNION

SELECT p.*, f.nombre nombre_fabricante
FROM  producto p RIGHT JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;




SELECT p.*, f.nombre nombre_fabricante
FROM  producto p FULL JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;


codigo	nombre	precio	codigo_fabricante	nombre_fabricante	
1	Disco duro SATA3 1TB	86.99	5	Seagate	
2	Memoria RAM DDR4 8GB	120.00	6	Crucial	
3	Disco SSD 1 TB	150.99	4	Samsung	
4	GeForce GTX 1050Ti	185.00	7	Gigabyte	
5	GeForce GTX 1080 Xtreme	755.00	6	Crucial	
6	Monitor 24 LED Full HD	202.00	1	Asus	
7	Monitor 27 LED Full HD	245.99	1	Asus	
8	Portátil Yoga 520	559.00	2	Lenovo	
9	Portátil Ideapd 320	444.00	2	Lenovo	
10	Impresora HP Deskjet 3720	59.99	3	Hewlett-Packard	
11	Impresora HP Laserjet Pro M26nw	180.00	3	Hewlett-Packard	
NULL	NULL	NULL	NULL	Huawei	
NULL	NULL	NULL	NULL	Xiaomi	


```