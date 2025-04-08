### [A4.1.4] 📝Consultas multitabla tienda (Composición interna) ❓:
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
```sql
-- SQL1
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p, fabricante f
	WHERE p.codigo_fabricante = f.codigo OR p.codigo_fabricante IS NULL;

-- SQL2
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p LEFT JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;

-- SOLUCION
nombre_producto	precio	nombre_fabricante	nombre_producto	precio	nombre_fabricante	
Disco duro SATA3 1TB	86.99	Seagate	
Memoria RAM DDR4 8GB	120.00	Crucial	
Disco SSD 1 TB	150.99	Samsung	
GeForce GTX 1050Ti	185.00	Gigabyte	
GeForce GTX 1080 Xtreme	755.00	Crucial	
Monitor 24 LED Full HD	202.00	Asus	
Monitor 27 LED Full HD	245.99	Asus	
Portátil Yoga 520	559.00	Lenovo	
Portátil Ideapd 320	444.00	Lenovo	
Impresora HP Deskjet 3720	59.99	Hewlett-Packard	
Impresora HP Laserjet Pro M26nw	180.00	Hewlett-Packard	
Disco duro SATA3 1TB	86.99	Seagate	
Memoria RAM DDR4 8GB	120.00	Crucial	
Disco SSD 1 TB	150.99	Samsung	
GeForce GTX 1050Ti	185.00	Gigabyte	
GeForce GTX 1080 Xtreme	755.00	Crucial	
Monitor 24 LED Full HD	202.00	Asus	
Monitor 27 LED Full HD	245.99	Asus	
Portátil Yoga 520	559.00	Lenovo	
Portátil Ideapd 320	444.00	Lenovo	
Impresora HP Deskjet 3720	59.99	Hewlett-Packard	
Impresora HP Laserjet Pro M26nw	180.00	Hewlett-Packard	
```


2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
```sql
-- SQL1
SELECT p.nombre as nombre_producto, p.precio, f.nombre
FROM producto p, fabricante f
	WHERE p.codigo_fabricante = f.codigo OR p.codigo_fabricante IS NULL
ORDER BY f.nombre ASC;

-- SQL2
SELECT p.nombre as nombre_producto, p.precio, f.nombre
FROM producto p LEFT JOIN fabricante f
	ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- RESULTADO
nombre_producto	precio	nombre   	
Monitor 24 LED Full HD	202.00	Asus	
Monitor 27 LED Full HD	245.99	Asus	
Memoria RAM DDR4 8GB	120.00	Crucial	
GeForce GTX 1080 Xtreme	755.00	Crucial	
GeForce GTX 1050Ti	185.00	Gigabyte	
Impresora HP Deskjet 3720	59.99	Hewlett-Packard	
Impresora HP Laserjet Pro M26nw	180.00	Hewlett-Packard	
Portátil Yoga 520	559.00	Lenovo	
Portátil Ideapd 320	444.00	Lenovo	
Disco SSD 1 TB	150.99	Samsung	
Disco duro SATA3 1TB	86.99	Seagate	
```


3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
```sql
-- SQL1
SELECT p.codigo, p.nombre as nombre_producto, p.codigo_fabricante, f.nombre as nombre_fabricante
FROM producto p, fabricante f
	WHERE p.codigo_fabricante = f.codigo OR p.codigo_fabricante IS NULL;

-- SQL2
SELECT p.codigo, p.nombre as nombre_producto, p.codigo_fabricante, f.nombre as nombre_fabricante
FROM producto p LEFT JOIN fabricante f
	ON p.codigo_fabricante = f.codigo;

-- RESULTADO
codigo	nombre_producto	codigo_fabricante	nombre_fabricante	
1	Disco duro SATA3 1TB	5	Seagate	
2	Memoria RAM DDR4 8GB	6	Crucial	
3	Disco SSD 1 TB	4	Samsung	
4	GeForce GTX 1050Ti	7	Gigabyte	
5	GeForce GTX 1080 Xtreme	6	Crucial	
6	Monitor 24 LED Full HD	1	Asus	
7	Monitor 27 LED Full HD	1	Asus	
8	Portátil Yoga 520	2	Lenovo	
9	Portátil Ideapd 320	2	Lenovo	
10	Impresora HP Deskjet 3720	3	Hewlett-Packard	
11	Impresora HP Laserjet Pro M26nw	3	Hewlett-Packard	
```


4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
```sql
-- SQL1
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo 
ORDER BY p.precio ASC
LIMIT 1;

-- SQL2
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
ORDER BY p.precio ASC
LIMIT 1;

-- RESULTADO
Impresora HP Deskjet 3720	59.99	Hewlett-Packard	
```


5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
```sql
-- SQL1
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo 
ORDER BY p.precio DESC
LIMIT 1;

-- SQL2
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
ORDER BY p.precio DESC
LIMIT 1;

-- RESULTADO
GeForce GTX 1080 Xtreme	755.00	Crucial	
```


6. Devuelve una lista de todos los productos del fabricante Lenovo.
```sql
-- SQL1
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';

-- SQL2
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- RESULTADO
codigo	nombre	precio	codigo_fabricante	
8	Portátil Yoga 520	559	2	
9	Portátil Ideapd 320	444	2	
```


7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
```sql
-- SQL1
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Crucial' AND p.precio > 200;

-- SQL2
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- RESULTADO
5	GeForce GTX 1080 Xtreme	755	6	
```


8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard Seagate. Sin utilizar el operador IN.
```sql
-- SQL1
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND (f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate');

-- SQL2
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- RESULTADO
codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
6	Monitor 24 LED Full HD	202	1	
7	Monitor 27 LED Full HD	245.99	1	
10	Impresora HP Deskjet 3720	59.99	3	
11	Impresora HP Laserjet Pro M26nw	180	3	
```


9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
```sql
-- SQL1
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND f.nombre IN ('Asus','Hewlett-Packard','Seagate');

-- SQL2
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- RESULTADO
codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
6	Monitor 24 LED Full HD	202	1	
7	Monitor 27 LED Full HD	245.99	1	
10	Impresora HP Deskjet 3720	59.99	3	
11	Impresora HP Laserjet Pro M26nw	180	3	
```


10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
```sql
-- SQL1
SELECT p.nombre, p.precio
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE '%e';

-- SQL2
SELECT p.nombre, p.precio
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
WHERE f.nombre LIKE '%e';

-- RESULTADO
nombre	precio	
Disco duro SATA3 1TB	86.99	
GeForce GTX 1050Ti	185	
```


11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
```sql
-- SQL1
SELECT p.nombre, p.precio
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE '%w%';

-- SQL2
SELECT p.nombre, p.precio
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- RESULTADO
nombre	precio	
Impresora HP Deskjet 3720	59.99	
Impresora HP Laserjet Pro M26nw	180	
```


12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre del producto (en orden ascendente).
```sql
-- SQL1
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p, fabricante f 
	WHERE p.codigo_fabricante = f.codigo AND p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- SQL2
SELECT p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- RESULTADO
nombre_producto	precio   	nombre_fabricante	
GeForce GTX 1080 Xtreme	755	Crucial	
Portátil Yoga 520	559	Lenovo	
Portátil Ideapd 320	444	Lenovo	
Monitor 27 LED Full HD	245.99	Asus	
Monitor 24 LED Full HD	202	Asus	
GeForce GTX 1050Ti	185	Gigabyte	
Impresora HP Laserjet Pro M26nw	180	Hewlett-Packard	
```


13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
``` sql
-- SQL1
SELECT DISTINCT(f.codigo), f.nombre
FROM fabricante f, producto p
	WHERE f.codigo = p.codigo_fabricante;

-- SQL2
SELECT DISTINCT(f.codigo), f.nombre
FROM fabricante f INNER JOIN producto p
	ON f.codigo = p.codigo_fabricante;

-- RESULTADO
codigo	nombre	
1	Asus	
2	Lenovo	
3	Hewlett-Packard	
4	Samsung	
5	Seagate	
6	Crucial	
7	Gigabyte	
```



### [A4.1.5] 📝Consultas multitabla tienda (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
```sql
SELECT DISTINCT(f.codigo), f.nombre
FROM fabricante f LEFT JOIN producto p 	
	ON f.codigo = p.codigo_fabricante;

-- RESULTADO
codigo	nombre	
1	Asus	
2	Lenovo	
3	Hewlett-Packard	
4	Samsung	
5	Seagate	
6	Crucial	
7	Gigabyte	
8	Huawei	
9	Xiaomi	
```


2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
```sql
SELECT f.codigo, f.nombre
FROM fabricante f LEFT JOIN producto p 	
	ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NULL;
    
-- RESULTADO
codigo	nombre	
8	Huawei	
9	Xiaomi	
```


3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
```txt
No, porque todo producto tiene que tener una clave foránea (codigo_fabricante) que hace referencia a la clave primaria de fabricante (codigo)
```



### [A4.1.6] 📝Consultas resumen tienda ❓:
1. Calcula el número total de productos que hay en la tabla producto.
```sql
SELECT COUNT(p.codigo) as cantidad_productos
FROM producto p;

-- RESULTADO
11	
```


2. Calcula el número total de fabricantes que hay en la tabla fabricante.
```sql
SELECT COUNT(f.codigo) as cantidad_fabricantes
FROM fabricante f;

-- RESULTADO
9	
```


3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla producto.
```sql
SELECT COUNT(DISTINCT p.codigo_fabricante) AS cantidad_productos_distintos
FROM producto p;

-- RESULTADO
7
```


4. Calcula la media del precio de todos los productos.
```sql
SELECT AVG(p.precio) as media_precio_productos
FROM producto p;

-- RESULTADO
271.72		
```


5. Calcula el precio más barato de todos los productos.
```sql
SELECT MIN(p.precio) as precio_mas_barato
FROM producto p;

-- RESULTADO
59.99	
```


6. Calcula el precio más caro de todos los productos.
```sql
SELECT MAX(p.precio) as precio_mas_caro
FROM producto p;

-- RESULTADO
755	
```


7. Lista el nombre y el precio del producto más barato.
```sql
SELECT p.nombre, p.precio
FROM producto p 
WHERE p.precio = (SELECT MIN(precio)
                 FROM producto);

-- RESULTADO
Impresora HP Deskjet 3720	59.99	
```


8. Lista el nombre y el precio del producto más caro.
```sql
SELECT p.nombre, p.precio
FROM producto p 
WHERE p.precio = (SELECT MAX(precio)
                 FROM producto);

-- RESULTADO
GeForce GTX 1080 Xtreme	755	
```


9. Calcula la suma de los precios de todos los productos.
```sql
SELECT SUM(p.precio) as precio_total
FROM producto p;

-- RESULTADO
2988.96	
```


10. Calcula el número de productos que tiene el fabricante Asus.
```sql
SELECT COUNT(f.codigo) as cantidad_productos_Asus
FROM  fabricante f INNER JOIN producto p
    ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Asus';

-- RESULTADO
2	
```


11. Calcula la media del precio de todos los productos del fabricante Asus.
```sql
SELECT AVG(p.precio) as media_del_precio_Asus
FROM producto p INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- RESULTADO
223.995	
```


12. Calcula el precio más barato de todos los productos del fabricante Asus.
```sql
SELECT MIN(p.precio) AS precio_mas_barato_Asus
FROM producto p INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- RESULTADO
202	
```


13.  Calcula el precio más caro de todos los productos del fabricante Asus.
```sql
SELECT MAX(p.precio) AS precio_mas_caro_Asus
FROM producto p INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- RESULTADO
245.99	
```


14.  Calcula la suma de los precios de todos los productos del fabricante Asus.
```sql
SELECT SUM(p.precio) as precio_total_Asus
FROM producto p INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- RESULTADO
447.99	202	
```


15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
```sql
SELECT 
	MAX(p.precio) AS precio_mayor, 
	MIN(p.precio) as precio_menor, 
	AVG(p.precio) as precio_media, 
	COUNT(p.precio) cantidad_productos
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Crucial';

-- RESULTADO
755	120	437.5	2	
```


16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
```sql
SELECT 
	f.nombre, 
	if((p.codigo_fabricante IS NULL), 0, COUNT(p.codigo_fabricante)) AS cantidad_productos
FROM fabricante f LEFT JOIN producto p 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY COUNT(p.codigo_fabricante) DESC;

-- RESULTADO
nombre	cantidad_productos	
Asus	2	
Crucial	2	
Hewlett-Packard	2	
Lenovo	2	
Gigabyte	1	
Samsung	1	
Seagate	1	
Xiaomi	0	
Huawei	0	
```


17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
```sql
SELECT 
	MAX(p.precio) as precio_maximo, 
	MIN(p.precio) as precio_minimo, 
	AVG(p.precio) as precio_medio, 
	f.nombre AS nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;

-- RESULTADO
precio_maximo	precio_minimo	precio_medio	nombre_fabricante	
245.99	202	223.995	Asus	
755	120	437.5	Crucial	
185	185	185	Gigabyte	
180	59.99	119.995	Hewlett-Packard	
559	444	501.5	Lenovo	
150.99	150.99	150.99	Samsung	
86.99	86.99	86.99	Seagate	
```


18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
```sql
SELECT 
	MAX(p.precio) AS precio_maximo, 
	MIN(p.precio) AS precio_minimo,
	AVG(p.precio) AS precio_medio, 
	COUNT(p.codigo_fabricante) AS total_productos, 
	p.codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

-- RESULTADO
precio_maximo	precio_minimo	precio_medio	total_productos	codigo_fabricante	
245.99	202	223.995	2	1	
755	120	437.5	2	6	
559	444	501.5	2	2	
```


19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
```sql
SELECT 
	f.nombre, 
	MAX(p.precio) AS precio_maximo, 
	MIN(p.precio) AS precio_minimo, 
	AVG(p.precio) AS precio_medio, 
	COUNT(*) AS cantidad_productos
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING  AVG(p.precio) > 200;

-- RESULTADO
nombre	precio_maximo	precio_minimo	precio_medio	cantidad_productos	
Asus	245.99	202	223.995	2	
Crucial	755	120	437.5	2	
Lenovo	559	444	501.5	2	
```


20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
```sql
SELECT COUNT(p.precio) AS cantidad_productos_mayor_o_igual_180
FROM producto p
WHERE p.precio >= 180;

-- RESULTADO
7	
```


21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
```sql
SELECT COUNT(p.codigo) as cantidad_productos_con_fabricante_con_precio_mayor_o_igual_180
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180;

-- RESULTADO
7	
```


22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
```sql
SELECT AVG(p.precio) AS precio_medio, f.codigo AS codigo_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.codigo;

-- RESULTADO
precio_medio	codigo_fabricante	
223.995	1	
501.5	2	
119.995	3	
150.99	4	
86.99	5	
437.5	6	
185	7	
```


23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
```sql
SELECT AVG(p.precio) AS precio_medio, f.nombre AS nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.codigo;

-- RESULTADO
precio_medio	nombre_fabricante	
223.995	Asus	
501.5	Lenovo	
119.995	Hewlett-Packard	
150.99	Samsung	
86.99	Seagate	
437.5	Crucial	
185	Gigabyte	
```


24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
```sql
SELECT f.nombre AS nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

-- RESULTADO
nombre_fabricante	precio	
Asus	202	
Crucial	120	
Gigabyte	185	
Lenovo	559	
Samsung	150.99	
```


25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
```sql
SELECT f.nombre AS nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING COUNT(p.precio) >= 2;

-- RESULTADO
nombre_fabricante	
Asus	
Crucial	
Hewlett-Packard	
Lenovo	
```


26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
Ejemplo del resultado esperado: 

| Nombre | Total |
|--------|-------|
| Lenovo |   2   |
| Asus   |   1   |
| Crucial |   1   |

```sql
SELECT f.nombre AS Nombre, COUNT(*) AS Total
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.nombre
ORDER BY COUNT(*) DESC;

-- RESULTADO
Nombre	Total	
Lenovo	2	
Asus	1	
Crucial	1	
```


27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
Ejemplo del resultado esperado:

| nombre | total|
|-------|------|
|Lenovo|2|
|Crucial|1|
|Asus|1|
|Huawei|0|
|Samsung|	0|
|Gigabyte|	0|
|Hewlett-Packard|	0|
|Xiaomi|	0|
|Seagate|	0|

```sql
SELECT 
    f.nombre, 
    COUNT(p.codigo_fabricante) as total
FROM fabricante f LEFT JOIN producto p 
	ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.nombre
ORDER BY total DESC;

-- RESULTADO
nombre	total   	
Lenovo	2	
Asus	1	
Crucial	1	
Samsung	0	
Xiaomi	0	
Hewlett-Packard	0	
Huawei	0	
Seagate	0	
Gigabyte	0	
```


28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
```sql
SELECT f.nombre, SUM(p.precio) as total
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING total > 1000;

-- RESULTADO
Lenovo	1003	
```


29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
```sql
SELECT 
	p.nombre AS nombre_fabricante, 
	MAX(p.precio) AS precio_maximo, 
	f.nombre AS nombre_fabricante
FROM producto p INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
ORDER BY f.nombre ASC;

-- RESULTADO
nombre_fabricante	precio_maximo	nombre_fabricante	
Monitor 24 LED Full HD	245.99	Asus	
Memoria RAM DDR4 8GB	755	Crucial	
GeForce GTX 1050Ti	185	Gigabyte	
Impresora HP Deskjet 3720	180	Hewlett-Packard	
Portátil Yoga 520	559	Lenovo	
Disco SSD 1 TB	150.99	Samsung	
Disco duro SATA3 1TB	86.99	Seagate	
```



### [A4.1.7] 📝Subconsultas tienda ❓:
#### [A4.1.7.1] Con operadores básicos de comparación
1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
```sql
SELECT p.nombre
FROM producto p
WHERE p.codigo_fabricante = (
                            SELECT f.codigo
                            FROM fabricante f 
                            WHERE f.nombre = 'Lenovo'
                            );

-- RESULTADO
nombre	
Portátil Yoga 520	
Portátil Ideapd 320	
```


2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
```sql
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p 
WHERE p.precio = (SELECT MAX(precio)
                  FROM producto
                 WHERE producto.codigo_fabricante = (SELECT f.codigo
                                                     FROM fabricante f
                                                     WHERE f.nombre = 'Lenovo'));

-- RESULTADO
8	Portátil Yoga 520	559	2	
```


3. Lista el nombre del producto más caro del fabricante Lenovo.
```sql
SELECT p1.nombre
FROM producto p1
WHERE p1.precio = (
                    SELECT MAX(p2.precio)
                    FROM producto p2
                    WHERE p2.codigo_fabricante = (
                                                    SELECT f.codigo
                                                    FROM fabricante f 
                                                    WHERE f.nombre = 'Lenovo'
                                                ));

-- RESULTADO
Portátil Yoga 520	
```


4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
```sql
SELECT p1.nombre
FROM producto p1
WHERE p1.precio = (
                    SELECT MIN(p2.precio)
                    FROM producto p2
                    WHERE p2.codigo_fabricante = (
                                                    SELECT f.codigo
                                                    FROM fabricante f 
                                                    WHERE f.nombre = 'Hewlett-Packard'
                                                 ));

-- RESULTADO
Impresora HP Deskjet 3720	
```


5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
```sql
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p
WHERE p.precio >= (
                    SELECT MIN(p1.precio)
                    FROM producto p1
                    WHERE p1.codigo_fabricante = (
                        							SELECT f.codigo
                                                     FROM fabricante f 
                                                     WHERE f.nombre = 'Lenovo'));

-- RESULTADO
codigo	nombre	precio	codigo_fabricante	
5	GeForce GTX 1080 Xtreme	755	6	
8	Portátil Yoga 520	559	2	
9	Portátil Ideapd 320	444	2	
```


6.  Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
```sql
SELECT p1.*
FROM producto p1
WHERE p1.codigo_fabricante = 
							(
                                SELECT f.codigo
                                FROM fabricante f 
                                WHERE f.nombre = 'Asus'
                            )
                            AND p1.precio >= (
                                				SELECT AVG(p2.precio)
                                                 FROM producto p2
                            				);

-- RESULTADO
-- No hay resultado
```



#### [A4.1.7.2] Subconsultas (En la cláusula HAVING)
7. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
```sql
SELECT f.nombre
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo_fabricante) = (SELECT fabricante.codigo
                                    FROM fabricante
                                    WHERE fabricante.nombre = 'Lenovo');

-- RESULTADO
nombre	
Asus	
Crucial	
Hewlett-Packard	
Lenovo	
```



#### [A4.1.7.3] Subconsultas con ALL y ANY
8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
```sql
SELECT p.nombre
FROM producto p
WHERE p.precio >= ALL (SELECT p2.precio
                   		FROM producto p2);

-- RESULTADO
GeForce GTX 1080 Xtreme	
```


9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
```sql
SELECT p1.nombre
FROM producto p1
WHERE p1.precio <= ALL(SELECT p2.precio
                      	FROM producto p2);

-- RESULTADO
Impresora HP Deskjet 3720	
```


10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
```sql
SELECT f1.nombre
FROM fabricante f1
WHERE f1.codigo = ANY ( SELECT p1.codigo_fabricante
                        FROM producto p1);

-- RESULTADO
nombre	
Asus	
Lenovo	
Hewlett-Packard	
Samsung	
Seagate	
Crucial	
Gigabyte	
```


11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
```sql
SELECT f1.nombre
FROM fabricante f1
WHERE f1.codigo != ALL ( SELECT p1.codigo_fabricante
                        FROM producto p1);

-- RESULTADO
nombre	
Huawei	
Xiaomi	
```



#### [A4.1.7.4] Subconsultas con IN y NOT IN
12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
```sql
SELECT f1.nombre
FROM fabricante f1
WHERE f1.codigo IN ( SELECT p1.codigo_fabricante
                        FROM producto p1);

-- RESULTADO
nombre	
Asus	
Lenovo	
Hewlett-Packard	
Samsung	
Seagate	
Crucial	
Gigabyte	
```


13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
```sql
SELECT f1.nombre
FROM fabricante f1
WHERE f1.codigo NOT IN ( SELECT p1.codigo_fabricante
                        FROM producto p1);

-- RESULTADO
nombre	
Huawei	
Xiaomi	
```



#### [A4.1.7.5] Subconsultas con EXISTS y NOT EXISTS
14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
```sql
SELECT DISTINCT(f1.nombre)
FROM fabricante f1 INNER JOIN producto p1	
	ON f1.codigo = p1.codigo_fabricante
WHERE EXISTS (SELECT p1.codigo_fabricante
              FROM producto p1);

-- RESULTADO
nombre	
Asus	
Lenovo	
Hewlett-Packard	
Samsung	
Seagate	
Crucial	
Gigabyte	
```


15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
```sql
SELECT DISTINCT f.nombre
FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE NOT EXISTS (SELECT DISTINCT p.codigo_fabricante
                  FROM producto p INNER JOIN fabricante 
                    ON f.codigo = p.codigo_fabricante
                );

-- RESULTADO
nombre	
Huawei	
Xiaomi	
```



#### [A4.1.7.6] Subconsultas correlacionadas
16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
```sql
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, MAX(p.precio) AS precio_maximo
FROM producto p INNER JOIN fabricante f 
    ON p.codigo_fabricante = f.codigo 
GROUP BY f.nombre;

-- RESULTADO
nombre_fabricante	nombre_producto	precio_maximo	
Asus	Monitor 24 LED Full HD	245.99	
Crucial	Memoria RAM DDR4 8GB	755	
Gigabyte	GeForce GTX 1050Ti	185	
Hewlett-Packard	Impresora HP Deskjet 3720	180	
Lenovo	Portátil Yoga 520	559	
Samsung	Disco SSD 1 TB	150.99	
Seagate	Disco duro SATA3 1TB	86.99	
```


17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
```sql
SELECT Nombre AS 'Nombre Fabricante', Promedio AS 'Promedio Fabricante', Precio AS 'Precio Producto' 
FROM producto h
INNER JOIN (SELECT p.codigo_fabricante, AVG(p.precio) AS 'Promedio'
            FROM producto p
            GROUP BY p.codigo_fabricante) w ON h.codigo_fabricante = w.codigo_fabricante
WHERE precio > Promedio

-- RESULTADO
Nombre Fabricante	Promedio Fabricante	Precio Producto	
GeForce GTX 1080 Xtreme	437.5	755	
Monitor 27 LED Full HD	223.995	245.99	
Portátil Yoga 520	501.5	559	
Impresora HP Laserjet Pro M26nw	119.995	180	
```


18. Lista el nombre del producto más caro del fabricante Lenovo.
```sql
SELECT p.nombre 
FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE f.nombre = (SELECT f.nombre 
                  FROM fabricante f
                  WHERE f.nombre = 'Lenovo') 
  AND p.precio = (SELECT MAX(p.precio) 
                  FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo
                  WHERE f.nombre = 'Lenovo')

-- RESULTADO
Portátil Yoga 520	
```
