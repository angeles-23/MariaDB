
# A3.05. Consultas SQL Relación R04

## Modelo Entidad Relación y Relacional
📝Ejercicio R04_01❓:
Lista el nombre de todos los productos que hay en la tabla producto.
``` sql
SELECT p.nombre 
FROM producto as p;


nombre	
Disco duro SATA3 1TB	
Memoria RAM DDR4 8GB	
Disco SSD 1 TB	
GeForce GTX 1050Ti	
GeForce GTX 1080 Xtreme	
Monitor 24 LED Full HD	
Monitor 27 LED Full HD	
Portátil Yoga 520	
Portátil Ideapd 320	
Impresora HP Deskjet 3720	
Impresora HP Laserjet Pro M26nw	

```

📝Ejercicio R04_02❓:
Lista los nombres y los precios de todos los productos de la tabla producto.
``` sql
SELECT p.nombre, p.precio 
FROM producto as p;


nombre	precio	
Disco duro SATA3 1TB	86.99	
Memoria RAM DDR4 8GB	120.00	
Disco SSD 1 TB	150.99	
GeForce GTX 1050Ti	185.00	
GeForce GTX 1080 Xtreme	755.00	
Monitor 24 LED Full HD	202.00	
Monitor 27 LED Full HD	245.99	
Portátil Yoga 520	559.00	
Portátil Ideapd 320	444.00	
Impresora HP Deskjet 3720	59.99	
Impresora HP Laserjet Pro M26nw	180.00	

```

📝Ejercicio R04_03❓:
Lista todas las columnas de la tabla producto.
``` sql
SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p;

SELECT p.*
FROM producto p;


codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
2	Memoria RAM DDR4 8GB	120.00	6	
3	Disco SSD 1 TB	150.99	4	
4	GeForce GTX 1050Ti	185.00	7	
5	GeForce GTX 1080 Xtreme	755.00	6	
6	Monitor 24 LED Full HD	202.00	1	
7	Monitor 27 LED Full HD	245.99	1	
8	Portátil Yoga 520	559.00	2	
9	Portátil Ideapd 320	444.00	2	
10	Impresora HP Deskjet 3720	59.99	3	
11	Impresora HP Laserjet Pro M26nw	180.00	3	

```

📝Ejercicio R04_04❓:
Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
``` sql
SELECT p.nombre, p.precio, ROUND((p.precio*0.96),2)
FROM producto as p;


nombre	precio	ROUND((p.precio*0.96),2)	
Disco duro SATA3 1TB	86.99	83.51	
Memoria RAM DDR4 8GB	120.00	115.20	
Disco SSD 1 TB	150.99	144.95	
GeForce GTX 1050Ti	185.00	177.60	
GeForce GTX 1080 Xtreme	755.00	724.80	
Monitor 24 LED Full HD	202.00	193.92	
Monitor 27 LED Full HD	245.99	236.15	
Portátil Yoga 520	559.00	536.64	
Portátil Ideapd 320	444.00	426.24	
Impresora HP Deskjet 3720	59.99	57.59	
Impresora HP Laserjet Pro M26nw	180.00	172.80	

```

📝Ejercicio R04_05❓:
Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
``` sql
SELECT p.nombre, p.precio euros, ROUND((p.precio*1.04),2) dólares
FROM producto as p;


nombre	euros	dólares	
Disco duro SATA3 1TB	86.99	83.51	
Memoria RAM DDR4 8GB	120.00	115.20	
Disco SSD 1 TB	150.99	144.95	
GeForce GTX 1050Ti	185.00	177.60	
GeForce GTX 1080 Xtreme	755.00	724.80	
Monitor 24 LED Full HD	202.00	193.92	
Monitor 27 LED Full HD	245.99	236.15	
Portátil Yoga 520	559.00	536.64	
Portátil Ideapd 320	444.00	426.24	
Impresora HP Deskjet 3720	59.99	57.59	
Impresora HP Laserjet Pro M26nw	180.00	172.80	

```

📝Ejercicio R04_06❓:
Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
``` sql
SELECT UPPER(p.nombre) as NOMBRE_MAYUSCULA, p.precio
FROM producto p;


nombre NOMBRE_MAYUSCULA	precio	
DISCO DURO SATA3 1TB	86.99	
MEMORIA RAM DDR4 8GB	120.00	
DISCO SSD 1 TB	150.99	
GEFORCE GTX 1050TI	185.00	
GEFORCE GTX 1080 XTREME	755.00	
MONITOR 24 LED FULL HD	202.00	
MONITOR 27 LED FULL HD	245.99	
PORTÁTIL YOGA 520	559.00	
PORTÁTIL IDEAPD 320	444.00	
IMPRESORA HP DESKJET 3720	59.99	
IMPRESORA HP LASERJET PRO M26NW	180.00	

```

📝Ejercicio R04_07❓:
Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
``` sql
SELECT LOWER(p.nombre) as nombre_minúscula, p.precio
FROM producto as p;


nombre_minúscula	precio	
disco duro sata3 1tb	86.99	
memoria ram ddr4 8gb	120.00	
disco ssd 1 tb	150.99	
geforce gtx 1050ti	185.00	
geforce gtx 1080 xtreme	755.00	
monitor 24 led full hd	202.00	
monitor 27 led full hd	245.99	
portátil yoga 520	559.00	
portátil ideapd 320	444.00	
impresora hp deskjet 3720	59.99	
impresora hp laserjet pro m26nw	180.00	

```

📝Ejercicio R04_08❓:
Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
``` sql
SELECT f.nombre, UPPER(SUBSTRING(f.nombre, 1, 2)) as mayuscula_2_primeros_caracteres
FROM fabricante as f;

SELECT f.nombre, UPPER(LEFT(f.nombre, 2)) as mayuscul_a_2_primeros_caracteres
FROM fabricante as f;


nombre	mayuscula_2_primeros_caracteres	
Asus	AS	
Lenovo	LE	
Hewlett-Packard	HE	
Samsung	SA	
Seagate	SE	
Crucial	CR	
Gigabyte	GI	
Huawei	HU	
Xiaomi	XI	
```

📝Ejercicio R04_09❓:
Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
``` sql
SELECT p.nombre, ROUND(p.precio, 0) as precio_redondeado
FROM producto as p;


nombre	precio_redondeado	
Disco duro SATA3 1TB	87	
Memoria RAM DDR4 8GB	120	
Disco SSD 1 TB	151	
GeForce GTX 1050Ti	185	
GeForce GTX 1080 Xtreme	755	
Monitor 24 LED Full HD	202	
Monitor 27 LED Full HD	246	
Portátil Yoga 520	559	
Portátil Ideapd 320	444	
Impresora HP Deskjet 3720	60	
Impresora HP Laserjet Pro M26nw	180	

```

📝Ejercicio R04_10❓:
Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
``` sql
SELECT p.nombre, TRUNCATE(p.precio, 0) precio_truncado
FROM producto as p;


nombre	precio_truncado	
Disco duro SATA3 1TB	86	
Memoria RAM DDR4 8GB	120	
Disco SSD 1 TB	150	
GeForce GTX 1050Ti	185	
GeForce GTX 1080 Xtreme	755	
Monitor 24 LED Full HD	202	
Monitor 27 LED Full HD	245	
Portátil Yoga 520	559	
Portátil Ideapd 320	444	
Impresora HP Deskjet 3720	59	
Impresora HP Laserjet Pro M26nw	180	

```


📝Ejercicio R04_11❓:
Lista el código de los fabricantes que tienen productos en la tabla producto.
``` sql

SELECT p.codigo_fabricante
FROM producto p;

SELECT f.codigo
FROM fabricante f INNER JOIN producto p
WHERE f.codigo = p.codigo_fabricante;


codigo	
1	
1	
2	
2	
3	
3	
4	
5	
6	
6	
7	

```

📝Ejercicio R04_12❓:
Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
``` sql
SELECT DISTINCT(p.codigo_fabricante)
FROM producto p;


SELECT DISTINCT(f.codigo)
FROM fabricante f INNER JOIN producto p
WHERE f.codigo = p.codigo_fabricante;


codigo	
1	
2	
3	
4	
5	
6	
7	

```

📝Ejercicio R04_13❓:
Lista los nombres de los fabricantes ordenados de forma ascendente.
``` sql
SELECT f.nombre
FROM fabricante f 
ORDER BY f.nombre ASC; -- 1, es la posicion en el SELECT


nombre   	
Asus	
Crucial	
Gigabyte	
Hewlett-Packard	
Huawei	
Lenovo	
Samsung	
Seagate	
Xiaomi	

```

📝Ejercicio R04_14❓:
Lista los nombres de los fabricantes ordenados de forma descendente.
``` sql
SELECT f.nombre
FROM fabricante f 
ORDER BY f.nombre DESC; -- 1, es la posicion en el SELECT


nombre   	
Xiaomi	
Seagate	
Samsung	
Lenovo	
Huawei	
Hewlett-Packard	
Gigabyte	
Crucial	
Asus	

```

📝Ejercicio R04_15❓:
Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
``` sql
SELECT p.nombre
FROM producto p
ORDER BY p.nombre ASC, p.precio DESC;


nombre   	
Disco duro SATA3 1TB	
Disco SSD 1 TB	
GeForce GTX 1050Ti	
GeForce GTX 1080 Xtreme	
Impresora HP Deskjet 3720	
Impresora HP Laserjet Pro M26nw	
Memoria RAM DDR4 8GB	
Monitor 24 LED Full HD	
Monitor 27 LED Full HD	
Portátil Ideapd 320	
Portátil Yoga 520	


```

📝Ejercicio R04_16❓:
Devuelve una lista con las 5 primeras filas de la tabla fabricante.
``` sql                  
SELECT f.*            -- SQL SERVER:  -- SELECT TOP 5
FROM fabricante f                     -- FROM fabricante;
LIMIT 5;


codigo	nombre	
1	Asus	
2	Lenovo	
3	Hewlett-Packard	
4	Samsung	
5	Seagate	

```

📝Ejercicio R04_17❓:
Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
``` sql
SELECT f.*
FROM fabricante f
LIMIT 3,2;  -- Desplazamiento/Saltarse a la derecha, cantidad


codigo	nombre	
4	Samsung	
5	Seagate	

```

📝Ejercicio R04_18❓:
Lista el nombre y el precio del producto más barato.(Utilice solamente las cláusulas ORDER BY y LIMIT).
``` sql
SELECT p.nombre, p.precio
FROM producto p
ORDER BY p.precio ASC
LIMIT 1;


Impresora HP Deskjet 3720	59.99	

```

📝Ejercicio R04_19❓:
Lista el nombre y el precio del producto más caro (Utilice solamente las cláusulas ORDER BY y LIMIT).
``` sql
SELECT p.nombre, p.precio
FROM producto p
ORDER BY p.precio DESC
LIMIT 1;


GeForce GTX 1080 Xtreme	755.00	

```

📝Ejercicio R04_20❓:
Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
``` sql
SELECT f.nombre
FROM fabricante f
WHERE f.codigo = 2;


Lenovo	
```



📝Ejercicio R04_21❓:
Lista el nombre de los productos que tienen un precio menor o igual a 120€.
``` sql
SELECT p.nombre 
FROM producto p 
WHERE p.precio <= 120; 

SELECT p.nombre 
FROM producto p 
WHERE NOT (p.precio > 120); 
 
 
nombre   
Disco duro SATA3 1TB   
Memoria RAM DDR4 8GB   
Impresora HP Deskjet 3720

```

📝Ejercicio R04_22❓:
Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
``` sql
SELECT p.nombre 
FROM producto p 
WHERE p.precio >= 400; 
 
 
nombre    
GeForce GTX 1080 Xtreme   
Portátil Yoga 520    
Portátil Ideapd 320 

```

📝Ejercicio R04_23❓:
Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
``` sql
SELECT p.nombre 
FROM producto p 
WHERE NOT p.precio >= 400; 
 
 
nombre   
Disco duro SATA3 1TB   
Memoria RAM DDR4 8GB   
Disco SSD 1 TB   
GeForce GTX 1050Ti   
Monitor 24 LED Full HD   
Monitor 27 LED Full HD   
Impresora HP Deskjet 3720   
Impresora HP Laserjet Pro M26nw

```

📝Ejercicio R04_24❓:
Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
``` sql
SELECT p.* 
FROM producto p 
WHERE p.precio >= 80 AND p.precio <= 300; 

SELECT p.* 
FROM producto p 
WHERE NOT (p.precio < 80 OR p.precio > 300); 


codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
2	Memoria RAM DDR4 8GB	120.00	6	
3	Disco SSD 1 TB	150.99	4	
4	GeForce GTX 1050Ti	185.00	7	
6	Monitor 24 LED Full HD	202.00	1	
7	Monitor 27 LED Full HD	245.99	1	
11	Impresora HP Laserjet Pro M26nw	180.00	3	

```

📝Ejercicio R04_25❓:
Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
``` sql
SELECT p.* 
FROM producto p 
WHERE p.precio BETWEEN 60 AND 200;


codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
2	Memoria RAM DDR4 8GB	120.00	6	
3	Disco SSD 1 TB	150.99	4	
4	GeForce GTX 1050Ti	185.00	7	
11	Impresora HP Laserjet Pro M26nw	180.00	3	

```

📝Ejercicio R04_26❓:
Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
``` sql
SELECT p.* 
FROM producto p 
WHERE p.precio > 200 AND p.codigo_fabricante = 6;


5	GeForce GTX 1080 Xtreme	755.00	6	

```

📝Ejercicio R04_27❓:
Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
``` sql
SELECT p.* 
FROM producto p 
WHERE p.codigo_fabricante = 1 OR p.codigo_fabricante = 3 OR p.codigo_fabricante = 5; 
 
 
codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
6	Monitor 24 LED Full HD	202.00	1	
7	Monitor 27 LED Full HD	245.99	1	
10	Impresora HP Deskjet 3720	59.99	3	
11	Impresora HP Laserjet Pro M26nw	180.00	3	

```

📝Ejercicio R04_28❓:
Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
``` sql
SELECT p.* 
FROM producto p 
WHERE p.codigo_fabricante IN (1,3,5);


codigo	nombre	precio	codigo_fabricante	
1	Disco duro SATA3 1TB	86.99	5	
6	Monitor 24 LED Full HD	202.00	1	
7	Monitor 27 LED Full HD	245.99	1	
10	Impresora HP Deskjet 3720	59.99	3	
11	Impresora HP Laserjet Pro M26nw	180.00	3	


```

📝Ejercicio R04_29❓:
Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
``` sql
SELECT p.nombre, p.precio*100 céntimos 
FROM producto p; 
 
 
nombre  céntimos   
Disco duro SATA3 1TB  8699.00  
Memoria RAM DDR4 8GB  12000.00   
Disco SSD 1 TB  15099.00   
GeForce GTX 1050Ti  18500.00   
GeForce GTX 1080 Xtreme 75500.00   
Monitor 24 LED Full HD  20200.00   
Monitor 27 LED Full HD  24599.00   
Portátil Yoga 520  55900.00   
Portátil Ideapd 320 44400.00   
Impresora HP Deskjet 3720  5999.00  
Impresora HP Laserjet Pro M26nw 18000.00

```

📝Ejercicio R04_30❓:
Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
``` sql
SELECT f.nombre 
FROM fabricante f 
WHERE f.nombre LIKE 'S%'; 
 
 
nombre   
Samsung  
Seagate

```

📝Ejercicio R04_31❓:
Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
``` sql
SELECT f.nombre 
FROM fabricante f 
WHERE f.nombre LIKE '%e'; 
 
 
nombre   
Seagate  
Gigabyte

```

📝Ejercicio R04_32❓:
Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
``` sql
SELECT f.nombre 
FROM fabricante f 
WHERE f.nombre LIKE '%w%'; 
 
 
nombre   
Hewlett-Packard  
Huawei

```

📝Ejercicio R04_33❓:
Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
``` sql
SELECT f.nombre 
FROM fabricante f 
WHERE f.nombre LIKE '____';


Asus

```

📝Ejercicio R04_34❓:
Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
``` sql
SELECT p.nombre 
FROM producto p 
WHERE p.nombre LIKE '%Portátil%'; 
 
 
nombre   
Portátil Yoga 520   
Portátil Ideapd 320

```

📝Ejercicio R04_35❓:
Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
``` sql
SELECT p.nombre 
FROM producto p 
WHERE p.nombre LIKE '%Monitor%' AND p.precio < 215; 

 
Monitor 24 LED Full HD

```

📝Ejercicio R04_36❓:
Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
``` sql
SELECT p.nombre, p.precio 
FROM producto p 
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.precio ASC;   -- ORDER BY 2 DESC, 1 ASC 
 
 
nombre  precio     nombre  precio   
GeForce GTX 1080 Xtreme 755.00   
Portátil Yoga 520  559.00   
Portátil Ideapd 320 444.00   
Monitor 27 LED Full HD  245.99   
Monitor 24 LED Full HD  202.00   
GeForce GTX 1050Ti  185.00   
Impresora HP Laserjet Pro M26nw 180.00   
GeForce GTX 1080 Xtreme 755.00   
Portátil Yoga 520  559.00   
Portátil Ideapd 320 444.00   
Monitor 27 LED Full HD  245.99   
Monitor 24 LED Full HD  202.00   
GeForce GTX 1050Ti  185.00   
Impresora HP Laserjet Pro M26nw 180.00

```
