### 📝Ejercicios COMPOSICIONES SQL-1❓:
#### Dada la base de datos bd_teoria_productos que te puedes descargar desde el apartado Referencias se pide, utilizando sintáxis SQL-1:
1. Realiza la composición cruzada (producto cartesiano) entre la tabla fabricante y la tabla producto descartando aquellas uniones en las que el código del fabricante sea par

``` sql

SELECT *
FROM fabricante f, producto p
WHERE f.codigo % 2 != 0;


SELECT *
FROM fabricante f INNER JOIN producto p
ON f.codigo % 2 != 0;



1	Asus	1	Disco duro SATA3 1TB	86.99	5	
3	Hewlett-Packard	1	Disco duro SATA3 1TB	86.99	5	
5	Seagate	1	Disco duro SATA3 1TB	86.99	5	
7	Gigabyte	1	Disco duro SATA3 1TB	86.99	5	
9	Xiaomi	1	Disco duro SATA3 1TB	86.99	5	
1	Asus	2	Memoria RAM DDR4 8GB	120.00	6	
3	Hewlett-Packard	2	Memoria RAM DDR4 8GB	120.00	6	
5	Seagate	2	Memoria RAM DDR4 8GB	120.00	6	
7	Gigabyte	2	Memoria RAM DDR4 8GB	120.00	6	
9	Xiaomi	2	Memoria RAM DDR4 8GB	120.00	6	
1	Asus	3	Disco SSD 1 TB	150.99	4	
3	Hewlett-Packard	3	Disco SSD 1 TB	150.99	4	
5	Seagate	3	Disco SSD 1 TB	150.99	4	
7	Gigabyte	3	Disco SSD 1 TB	150.99	4	
9	Xiaomi	3	Disco SSD 1 TB	150.99	4	
1	Asus	4	GeForce GTX 1050Ti	185.00	7	
3	Hewlett-Packard	4	GeForce GTX 1050Ti	185.00	7	
5	Seagate	4	GeForce GTX 1050Ti	185.00	7	
7	Gigabyte	4	GeForce GTX 1050Ti	185.00	7	
9	Xiaomi	4	GeForce GTX 1050Ti	185.00	7	
1	Asus	5	GeForce GTX 1080 Xtreme	755.00	6	
3	Hewlett-Packard	5	GeForce GTX 1080 Xtreme	755.00	6	
5	Seagate	5	GeForce GTX 1080 Xtreme	755.00	6	
7	Gigabyte	5	GeForce GTX 1080 Xtreme	755.00	6	
9	Xiaomi	5	GeForce GTX 1080 Xtreme	755.00	6	
1	Asus	1	Disco duro SATA3 1TB	86.99	5	
3	Hewlett-Packard	1	Disco duro SATA3 1TB	86.99	5	
5	Seagate	1	Disco duro SATA3 1TB	86.99	5	
7	Gigabyte	1	Disco duro SATA3 1TB	86.99	5	
9	Xiaomi	1	Disco duro SATA3 1TB	86.99	5	
1	Asus	2	Memoria RAM DDR4 8GB	120.00	6	
3	Hewlett-Packard	2	Memoria RAM DDR4 8GB	120.00	6	
5	Seagate	2	Memoria RAM DDR4 8GB	120.00	6	
7	Gigabyte	2	Memoria RAM DDR4 8GB	120.00	6	
9	Xiaomi	2	Memoria RAM DDR4 8GB	120.00	6	
1	Asus	3	Disco SSD 1 TB	150.99	4	
3	Hewlett-Packard	3	Disco SSD 1 TB	150.99	4	
5	Seagate	3	Disco SSD 1 TB	150.99	4	
7	Gigabyte	3	Disco SSD 1 TB	150.99	4	
9	Xiaomi	3	Disco SSD 1 TB	150.99	4	
1	Asus	4	GeForce GTX 1050Ti	185.00	7	
3	Hewlett-Packard	4	GeForce GTX 1050Ti	185.00	7	
5	Seagate	4	GeForce GTX 1050Ti	185.00	7	
7	Gigabyte	4	GeForce GTX 1050Ti	185.00	7	
9	Xiaomi	4	GeForce GTX 1050Ti	185.00	7	
1	Asus	5	GeForce GTX 1080 Xtreme	755.00	6	
3	Hewlett-Packard	5	GeForce GTX 1080 Xtreme	755.00	6	
5	Seagate	5	GeForce GTX 1080 Xtreme	755.00	6	
7	Gigabyte	5	GeForce GTX 1080 Xtreme	755.00	6	
9	Xiaomi	5	GeForce GTX 1080 Xtreme	755.00	6	

```



2. Realiza la composición interna (interseccion) entre la tabla fabricante y la tabla producto
``` sql
SELECT *
FROM fabricante f, producto p
WHERE f.codigo = p.codigo;


SELECT *
FROM fabricante f INNER JOIN producto p
ON f.codigo = p.codigo;


codigo	nombre	codigo	nombre	precio	codigo_fabricante	codigo	nombre	codigo	nombre	precio	codigo_fabricante	
1	Asus	1	Disco duro SATA3 1TB	86.99	5	
2	Lenovo	2	Memoria RAM DDR4 8GB	120.00	6	
3	Hewlett-Packard	3	Disco SSD 1 TB	150.99	4	
4	Samsung	4	GeForce GTX 1050Ti	185.00	7	
5	Seagate	5	GeForce GTX 1080 Xtreme	755.00	6	
6	Crucial	6	Monitor 24 LED Full HD	202.00	1	
7	Gigabyte	7	Monitor 27 LED Full HD	245.99	1	
8	Huawei	8	Portátil Yoga 520	559.00	2	
9	Xiaomi	9	Portátil Ideapd 320	444.00	2	
1	Asus	1	Disco duro SATA3 1TB	86.99	5	
2	Lenovo	2	Memoria RAM DDR4 8GB	120.00	6	
3	Hewlett-Packard	3	Disco SSD 1 TB	150.99	4	
4	Samsung	4	GeForce GTX 1050Ti	185.00	7	
5	Seagate	5	GeForce GTX 1080 Xtreme	755.00	6	
6	Crucial	6	Monitor 24 LED Full HD	202.00	1	
7	Gigabyte	7	Monitor 27 LED Full HD	245.99	1	
8	Huawei	8	Portátil Yoga 520	559.00	2	
9	Xiaomi	9	Portátil Ideapd 320	444.00	2	

```