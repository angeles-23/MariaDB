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

-- SOLUCIÓN
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

-- SQL2

-- SOLUCIÓN
```


4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


6. Devuelve una lista de todos los productos del fabricante Lenovo.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre del producto (en orden ascendente).
```sql
-- SQL1

-- SQL2

-- SOLUCIÓN
```


13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
``` sql
-- SQL1

-- SQL2

-- SOLUCIÓN

```

### [A4.1.5] 📝Consultas multitabla tienda (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
```sql

```

2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
```sql

```

3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
```sql

```



### [A4.1.6] 📝Consultas resumen tienda ❓:
1. Calcula el número total de productos que hay en la tabla producto.
```sql

```

2. Calcula el número total de fabricantes que hay en la tabla fabricante.
```sql

```

3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla producto.
```sql

```

4. Calcula la media del precio de todos los productos.
```sql

```

5. Calcula el precio más barato de todos los productos.
```sql

```

6. Calcula el precio más caro de todos los productos.
```sql

```

7. Lista el nombre y el precio del producto más barato.
```sql

```

8. Lista el nombre y el precio del producto más caro.
```sql

```

9. Calcula la suma de los precios de todos los productos.
```sql

```

10. Calcula el número de productos que tiene el fabricante Asus.
```sql

```

11. Calcula la media del precio de todos los productos del fabricante Asus.
```sql

```

12. Calcula el precio más barato de todos los productos del fabricante Asus.
```sql

```

13. Calcula el precio más caro de todos los productos del fabricante Asus.
```sql

```

14. Calcula la suma de los precios de todos los productos del fabricante Asus.
```sql

```

15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
```sql

```

16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
```sql

```

17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
```sql

```

18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
```sql

```

19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
```sql

```

20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
```sql

```

21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
```sql

```

22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
```sql

```

23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
```sql

```

24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
```sql

```

25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
```sql

```

26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
```sql

```

Ejemplo del resultado esperado: 
| Nombre | Total |
|--------|-------|
| Lenovo |   2   |
| Asus   |   1   |
| Crucial |   1   |

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

```

28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
```sql

```

29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
```sql

```



### [A4.1.7] 📝Subconsultas tienda ❓:
#### [A4.1.7.1] Con operadores básicos de comparación
1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
```sql

```

2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
```sql

```

3. Lista el nombre del producto más caro del fabricante Lenovo.
```sql

```

4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
```sql

```

5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
```sql

```

6.  Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
```sql

```


#### [A4.1.7.2] Subconsultas (En la cláusula HAVING)
7. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
```sql

```



#### [A4.1.7.3] Subconsultas con ALL y ANY
8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
```sql

```

9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
```sql

```

10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
```sql

```

11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
```sql

```



#### [A4.1.7.4] Subconsultas con IN y NOT IN
12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
```sql

```

13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
```sql

```



#### [A4.1.7.5] Subconsultas con EXISTS y NOT EXISTS
14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
```sql

```

15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
```sql

```



#### [A4.1.7.6] Subconsultas correlacionadas
16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
```sql

```

17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
```sql

```

18. Lista el nombre del producto más caro del fabricante Lenovo.
```sql

```
