### [A4.3.3] 📝Consultas básicas ventas❓:
1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
```sql 
SELECT p.id, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p
ORDER BY p.fecha DESC;

-- RESULTADO
id	total	fecha   	id_cliente	id_comercial	
16	2389.23	2019-03-11	1	5	
15	370.85	2019-03-11	1	5	
13	545.75	2019-01-25	6	1	
8	1983.43	2017-10-10	4	6	
1	150.5	2017-10-05	5	2	
3	65.26	2017-10-05	2	1	
5	948.5	2017-09-10	5	2	
12	3045.6	2017-04-25	2	1	
14	145.82	2017-02-02	6	1	
9	2480.4	2016-10-10	8	3	
2	270.65	2016-09-10	1	5	
11	75.29	2016-08-17	3	7	
4	110.5	2016-08-17	8	3	
6	2400.6	2016-07-27	7	1	
7	5760	2015-09-10	2	1	
10	250.45	2015-06-27	8	2	
```



2. Devuelve todos los datos de los dos pedidos de mayor valor.
```sql 
SELECT p.id, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p
ORDER BY p.total DESC
LIMIT 2;

-- SQL Server
SELECT TOP 2 p.id, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p
ORDER BY p.total DESC;

-- RESULTADO
id	total   	fecha	id_cliente	id_comercial	
7	5760	2015-09-10	2	1	
12	3045.6	2017-04-25	2	1	
```



3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que que no debe mostrar identificadores que estén repetidos.
```sql 
SELECT DISTINCT(cl.id)
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente;

-- RESULTADO
id	
1	
2	
3	
4	
5	
6	
7	
8	
```



4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad sea superior a 500€.
```sql 
SELECT 
	p.id, 
    p.total, 
    p.fecha, 
    p.id_cliente, 
    p.id_comercial
FROM pedido p 
WHERE YEAR(p.fecha) = 2017 AND p.total > 500;

-- RESULTADO
id	total	fecha	id_cliente	id_comercial	
5	948.5	2017-09-10	5	2	
8	1983.43	2017-10-10	4	6	
12	3045.6	2017-04-25	2	1	
```



5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
```sql 
SELECT 
	co.nombre, 
    co.apellido1, 
    co.apellido2
FROM comercial co
WHERE co.comisión BETWEEN 0.05 AND 0.11;

-- RESULTADO
nombre	apellido1	apellido2	
Diego	Flores	Salas	
Antonio	Vega	Hernández	
Alfredo	Ruiz	Flores	
```



6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
```sql 
SELECT 
	MAX(co.comisión) AS comision_mayor
FROM comercial co

-- RESULTADO
0.15	
```



7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
```sql 
SELECT cl.id, cl.nombre, cl.apellido1
FROM cliente cl
WHERE cl.apellido2 IS NOT NULL
ORDER BY cl.apellido1 ASC, cl.apellido2 ASC, cl.nombre ASC;

-- RESULTADO
id	nombre	apellido1   	
9	Guillermo	López	
5	Marcos	Loyola	
1	Aarón	Rivero	
3	Adolfo	Rubio	
8	Pepe	Ruiz	
2	Adela	Salas	
10	Daniel	Santana	
6	María	Santana	
```



8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
```sql 
SELECT cl.nombre
FROM cliente cl
WHERE cl.nombre LIKE 'A%n' OR cl.nombre LIKE 'P%'
ORDER BY cl.nombre ASC;

-- RESULTADO
nombre   	
Aarón	
Adrián	
Pepe	
Pilar	
```



9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
```sql 
SELECT cl.nombre
FROM cliente cl
WHERE cl.nombre LIKE 'A%'
ORDER BY cl.nombre ASC;

-- RESULTADO
nombre   	
Aarón	
Adela	
Adolfo	
Adrián	
```



10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
```sql 
SELECT DISTINCT(co.nombre)
FROM comercial co
WHERE co.nombre LIKE '%el' OR co.nombre LIKE '%o';

-- RESULTADO
nombre	
Daniel	
Diego	
Antonio	
Manuel	
Alfredo	
```




### [A4.3.4] 📝Consultas multitabla ventas (Composición interna) ❓:
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
```sql
-- SQL1
SELECT DISTINCT(cl.id), cl.nombre, cl.apellido1, cl.apellido2
FROM cliente cl, pedido p 
	WHERE cl.id = p.id_cliente
ORDER BY cl.nombre ASC, cl.apellido1 ASC, cl.apellido2 ASC;

-- SQL2
SELECT DISTINCT(cl.id), cl.nombre, cl.apellido1, cl.apellido2
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente
ORDER BY cl.nombre ASC, cl.apellido1 ASC, cl.apellido2 ASC;

-- RESULTADO
id	nombre   	apellido1	apellido2	
1	Aarón	Rivero	Gómez	
2	Adela	Salas	Díaz	
3	Adolfo	Rubio	Flores	
4	Adrián	Suárez	NULL	
5	Marcos	Loyola	Méndez	
6	María	Santana	Moreno	
8	Pepe	Ruiz	Santana	
7	Pilar	Ruiz	NULL	
```



2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
```sql
-- SQL1
SELECT 
	p.id AS id_del_pedido,
    p.total,
    p.fecha,
    p.id_cliente,
    p.id_comercial,
    cl.id AS id_del_cliente,
    cl.nombre,
    cl.apellido1,
    cl.apellido2,
    cl.ciudad,
    cl.categoría
FROM pedido p, cliente cl
	WHERE p.id_cliente = cl.id
ORDER BY cl.nombre ASC, cl.apellido1 ASC, cl.apellido2 ASC;

-- SQL2
SELECT 
	p.id AS id_del_pedido,
    p.total,
    p.fecha,
    p.id_cliente,
    p.id_comercial,
    cl.id AS id_del_cliente,
    cl.nombre,
    cl.apellido1,
    cl.apellido2,
    cl.ciudad,
    cl.categoría
FROM pedido p INNER JOIN cliente cl
	ON p.id_cliente = cl.id
ORDER BY cl.nombre ASC, cl.apellido1 ASC, cl.apellido2 ASC;

-- RESULTADO
id_del_pedido	total	fecha	id_cliente	id_comercial	id_del_cliente	nombre   	apellido1	apellido2	ciudad	categoría	
2	270.65	2016-09-10	1	5	1	Aarón	Rivero	Gómez	Almería	100	
15	370.85	2019-03-11	1	5	1	Aarón	Rivero	Gómez	Almería	100	
16	2389.23	2019-03-11	1	5	1	Aarón	Rivero	Gómez	Almería	100	
3	65.26	2017-10-05	2	1	2	Adela	Salas	Díaz	Granada	200	
7	5760	2015-09-10	2	1	2	Adela	Salas	Díaz	Granada	200	
12	3045.6	2017-04-25	2	1	2	Adela	Salas	Díaz	Granada	200	
11	75.29	2016-08-17	3	7	3	Adolfo	Rubio	Flores	Sevilla	NULL	
8	1983.43	2017-10-10	4	6	4	Adrián	Suárez	NULL	Jaén	300	
1	150.5	2017-10-05	5	2	5	Marcos	Loyola	Méndez	Almería	200	
5	948.5	2017-09-10	5	2	5	Marcos	Loyola	Méndez	Almería	200	
13	545.75	2019-01-25	6	1	6	María	Santana	Moreno	Cádiz	100	
14	145.82	2017-02-02	6	1	6	María	Santana	Moreno	Cádiz	100	
4	110.5	2016-08-17	8	3	8	Pepe	Ruiz	Santana	Huelva	200	
9	2480.4	2016-10-10	8	3	8	Pepe	Ruiz	Santana	Huelva	200	
10	250.45	2015-06-27	8	2	8	Pepe	Ruiz	Santana	Huelva	200	
6	2400.6	2016-07-27	7	1	7	Pilar	Ruiz	NULL	Sevilla	300	
```



3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
```sql
-- SQL1
SELECT 
	p.id AS id_tabla_pedido,
    p.total,
    p.fecha,
    p.id_cliente,
    p.id_comercial,
    co.id AS id_tabla_comercial,
    co.nombre, 
    co.apellido1, 
    co.apellido2, 
    co.comisión
FROM pedido p, comercial co
	WHERE p.id_comercial = co.id
ORDER BY co.nombre ASC, co.apellido1 ASC, co.apellido2 ASC;

-- SQL2
SELECT 
	p.id AS id_tabla_pedido,
    p.total,
    p.fecha,
    p.id_cliente,
    p.id_comercial,
    co.id AS id_tabla_comercial,
    co.nombre, 
    co.apellido1, 
    co.apellido2, 
    co.comisión
FROM pedido p INNER JOIN comercial co
	ON p.id_comercial = co.id
ORDER BY co.nombre ASC, co.apellido1 ASC, co.apellido2 ASC;

-- RESULTADO
id_tabla_pedido	total	fecha	id_cliente	id_comercial	id_tabla_comercial	nombre   	apellido1	apellido2	comisión	
2	270.65	2016-09-10	1	5	5	Antonio	Carretero	Ortega	0.12	
15	370.85	2019-03-11	1	5	5	Antonio	Carretero	Ortega	0.12	
16	2389.23	2019-03-11	1	5	5	Antonio	Carretero	Ortega	0.12	
11	75.29	2016-08-17	3	7	7	Antonio	Vega	Hernández	0.11	
3	65.26	2017-10-05	2	1	1	Daniel	Sáez	Vega	0.15	
6	2400.6	2016-07-27	7	1	1	Daniel	Sáez	Vega	0.15	
7	5760	2015-09-10	2	1	1	Daniel	Sáez	Vega	0.15	
12	3045.6	2017-04-25	2	1	1	Daniel	Sáez	Vega	0.15	
13	545.75	2019-01-25	6	1	1	Daniel	Sáez	Vega	0.15	
14	145.82	2017-02-02	6	1	1	Daniel	Sáez	Vega	0.15	
4	110.5	2016-08-17	8	3	3	Diego	Flores	Salas	0.11	
9	2480.4	2016-10-10	8	3	3	Diego	Flores	Salas	0.11	
1	150.5	2017-10-05	5	2	2	Juan	Gómez	López	0.13	
5	948.5	2017-09-10	5	2	2	Juan	Gómez	López	0.13	
10	250.45	2015-06-27	8	2	2	Juan	Gómez	López	0.13	
8	1983.43	2017-10-10	4	6	6	Manuel	Domínguez	Hernández	0.13	
```



4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
```sql
-- SQL1
SELECT 
	cl.id AS id_tabla_cliente, cl.nombre AS nombre_cliente, cl.apellido1 AS apellido1_cliente, cl.apellido2 AS apellido2_cliente, cl.ciudad, cl.categoría,
    p.id AS id_tabla_pedido, p.total, p.fecha, p.id_cliente, p.id_comercial,
    co.id AS id_tabla_comercial, co.nombre AS nombre_comercial, co.apellido1 AS apellido1_comercial, co.apellido2 AS apellido2_comercial, co.comisión
FROM cliente cl, pedido p, comercial co
	WHERE cl.id = p.id_cliente AND p.id_comercial = co.id;

-- SQL2
SELECT 
	cl.id AS id_tabla_cliente, cl.nombre AS nombre_cliente, cl.apellido1 AS apellido1_cliente, cl.apellido2 AS apellido2_cliente, cl.ciudad, cl.categoría,
    p.id AS id_tabla_pedido, p.total, p.fecha, p.id_cliente, p.id_comercial,
    co.id AS id_tabla_comercial, co.nombre AS nombre_comercial, co.apellido1 AS apellido1_comercial, co.apellido2 AS apellido2_comercial, co.comisión
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente INNER JOIN comercial co 
    ON p.id_comercial = co.id;

-- RESULTADO
id_tabla_cliente	nombre_cliente	apellido1_cliente	apellido2_cliente	ciudad	categoría	id_tabla_pedido	total	fecha	id_cliente	id_comercial	id_tabla_comercial	nombre_comercial	apellido1_comercial	apellido2_comercial	comisión	
2	Adela	Salas	Díaz	Granada	200	3	65.26	2017-10-05	2	1	1	Daniel	Sáez	Vega	0.15	
7	Pilar	Ruiz	NULL	Sevilla	300	6	2400.6	2016-07-27	7	1	1	Daniel	Sáez	Vega	0.15	
2	Adela	Salas	Díaz	Granada	200	7	5760	2015-09-10	2	1	1	Daniel	Sáez	Vega	0.15	
2	Adela	Salas	Díaz	Granada	200	12	3045.6	2017-04-25	2	1	1	Daniel	Sáez	Vega	0.15	
6	María	Santana	Moreno	Cádiz	100	13	545.75	2019-01-25	6	1	1	Daniel	Sáez	Vega	0.15	
6	María	Santana	Moreno	Cádiz	100	14	145.82	2017-02-02	6	1	1	Daniel	Sáez	Vega	0.15	
5	Marcos	Loyola	Méndez	Almería	200	1	150.5	2017-10-05	5	2	2	Juan	Gómez	López	0.13	
5	Marcos	Loyola	Méndez	Almería	200	5	948.5	2017-09-10	5	2	2	Juan	Gómez	López	0.13	
8	Pepe	Ruiz	Santana	Huelva	200	10	250.45	2015-06-27	8	2	2	Juan	Gómez	López	0.13	
8	Pepe	Ruiz	Santana	Huelva	200	4	110.5	2016-08-17	8	3	3	Diego	Flores	Salas	0.11	
8	Pepe	Ruiz	Santana	Huelva	200	9	2480.4	2016-10-10	8	3	3	Diego	Flores	Salas	0.11	
1	Aarón	Rivero	Gómez	Almería	100	2	270.65	2016-09-10	1	5	5	Antonio	Carretero	Ortega	0.12	
1	Aarón	Rivero	Gómez	Almería	100	15	370.85	2019-03-11	1	5	5	Antonio	Carretero	Ortega	0.12	
1	Aarón	Rivero	Gómez	Almería	100	16	2389.23	2019-03-11	1	5	5	Antonio	Carretero	Ortega	0.12	
4	Adrián	Suárez	NULL	Jaén	300	8	1983.43	2017-10-10	4	6	6	Manuel	Domínguez	Hernández	0.13	
3	Adolfo	Rubio	Flores	Sevilla	NULL	11	75.29	2016-08-17	3	7	7	Antonio	Vega	Hernández	0.11	
```



5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
```sql
-- SQL1
SELECT 
	cl.id AS id_cliente, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl, pedido p
	WHERE cl.id = p.id_cliente AND SUBSTRING(p.fecha,1,4) = 2017 AND p.total BETWEEN 300 AND 1000;

-- SQL2
SELECT 
	cl.id AS id_cliente, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl INNER JOIN pedido p
	ON cl.id = p.id_cliente
WHERE SUBSTRING(p.fecha,1,4) = 2017 AND p.total BETWEEN 300 AND 1000;

-- RESULTADO
5	Marcos	Loyola	Méndez	Almería	200	
```



6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
```sql
-- SQL1
SELECT 
	DISTINCT(co.nombre), co.apellido1, co.apellido2
FROM comercial co, pedido p, cliente cl
	WHERE co.id = p.id_comercial AND p.id_cliente = cl.id AND cl.nombre = 'María' AND cl.apellido1 = 'Santana' AND cl.apellido2 = 'Moreno';

-- SQL2
SELECT 
	DISTINCT(co.nombre), co.apellido1, co.apellido2
FROM comercial co INNER JOIN pedido p 
	ON co.id = p.id_comercial INNER JOIN cliente cl 
    ON p.id_cliente = cl.id
WHERE cl.nombre = 'María' AND cl.apellido1 = 'Santana' AND cl.apellido2 = 'Moreno';

-- RESULTADO
Daniel	Sáez	Vega	
```



7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
```sql
-- SQL1
SELECT 
	DISTINCT(cl.nombre)
FROM cliente cl, pedido p, comercial co
	WHERE cl.id = p.id_comercial AND p.id_comercial = co.id 
AND co.nombre = 'Daniel' AND co.apellido1 = 'Sáez' AND co.apellido2 = 'Vega';

-- SQL2
SELECT 
	DISTINCT(cl.nombre)
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_comercial INNER JOIN comercial co 
    ON p.id_comercial = co.id
WHERE co.nombre = 'Daniel' AND co.apellido1 = 'Sáez' AND co.apellido2 = 'Vega';

-- RESULTADO
Aarón	
```





### [A4.3.5] 📝Consultas multitabla ventas (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
```sql
SELECT 
	cl.id AS ID_cliente, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría,
    p.id AS ID_pedido, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM cliente cl LEFT JOIN pedido p
	ON cl.id = p.id_cliente
ORDER BY cl.apellido1 ASC, cl.apellido2 ASC, cl.nombre ASC;

-- RESULTADO
ID_cliente	nombre	apellido1   	apellido2	ciudad	categoría	ID_pedido	total	fecha	id_cliente	id_comercial	
9	Guillermo	López	Gómez	Granada	225	NULL	NULL	NULL	NULL	NULL	
5	Marcos	Loyola	Méndez	Almería	200	1	150.5	2017-10-05	5	2	
5	Marcos	Loyola	Méndez	Almería	200	5	948.5	2017-09-10	5	2	
1	Aarón	Rivero	Gómez	Almería	100	2	270.65	2016-09-10	1	5	
1	Aarón	Rivero	Gómez	Almería	100	15	370.85	2019-03-11	1	5	
1	Aarón	Rivero	Gómez	Almería	100	16	2389.23	2019-03-11	1	5	
3	Adolfo	Rubio	Flores	Sevilla	NULL	11	75.29	2016-08-17	3	7	
7	Pilar	Ruiz	NULL	Sevilla	300	6	2400.6	2016-07-27	7	1	
8	Pepe	Ruiz	Santana	Huelva	200	4	110.5	2016-08-17	8	3	
8	Pepe	Ruiz	Santana	Huelva	200	9	2480.4	2016-10-10	8	3	
8	Pepe	Ruiz	Santana	Huelva	200	10	250.45	2015-06-27	8	2	
2	Adela	Salas	Díaz	Granada	200	3	65.26	2017-10-05	2	1	
2	Adela	Salas	Díaz	Granada	200	7	5760	2015-09-10	2	1	
2	Adela	Salas	Díaz	Granada	200	12	3045.6	2017-04-25	2	1	
10	Daniel	Santana	Loyola	Sevilla	125	NULL	NULL	NULL	NULL	NULL	
6	María	Santana	Moreno	Cádiz	100	13	545.75	2019-01-25	6	1	
6	María	Santana	Moreno	Cádiz	100	14	145.82	2017-02-02	6	1	
4	Adrián	Suárez	NULL	Jaén	300	8	1983.43	2017-10-10	4	6	
```



2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
```sql
SELECT 
	DISTINCT(co.id) AS ID_comercial, co.nombre, co.apellido1, co.apellido2, co.comisión
FROM comercial co LEFT JOIN pedido p 
	ON co.id = p.id_comercial
ORDER BY co.apellido1 ASC, co.apellido2 ASC, co.nombre ASC;    

-- RESULTADO
ID_comercial	nombre	apellido1   	apellido2	comisión	
5	Antonio	Carretero	Ortega	0.12	
6	Manuel	Domínguez	Hernández	0.13	
3	Diego	Flores	Salas	0.11	
2	Juan	Gómez	López	0.13	
4	Marta	Herrera	Gil	0.14	
8	Alfredo	Ruiz	Flores	0.05	
1	Daniel	Sáez	Vega	0.15	
7	Antonio	Vega	Hernández	0.11	
```



3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
```sql
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl LEFT JOIN pedido p 
	ON cl.id = p.id_cliente
WHERE p.id_cliente IS NULL;    

-- RESULTADO
id	nombre	apellido1	apellido2	ciudad	categoría	
9	Guillermo	López	Gómez	Granada	225	
10	Daniel	Santana	Loyola	Sevilla	125	
```



4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
```sql
SELECT 
	co.id, co.nombre, co.apellido1, co.apellido2, co.comisión
FROM comercial co LEFT JOIN pedido p 
	ON co.id = p.id_comercial
WHERE p.id_comercial IS NULL;    

-- RESULTADO
id	nombre	apellido1	apellido2	comisión	
4	Marta	Herrera	Gil	0.14	
8	Alfredo	Ruiz	Flores	0.05	
```



5. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
```sql
(SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2, 'cliente' AS tipo
FROM cliente cl LEFT JOIN pedido p 
	ON cl.id = p.id_cliente
WHERE p.id_cliente IS NULL) 

UNION

(SELECT 
	co.id, co.nombre, co.apellido1, co.apellido2, 'comercial' AS tipo
FROM comercial co LEFT JOIN pedido p 
	ON co.id = p.id_comercial
WHERE p.id_comercial  IS NULL);

-- RESULTADO: En la columna "tipo" aparece el valor 'cliente' o 'comercial' según corresponda.
id	nombre      apellido1	apellido2	tipo	
9	Guillermo   López	Gómez	        cliente	
10	Daniel	    Santana	Loyola	        cliente	
4	Marta	    Herrera	Gil	        comercial	
8	Alfredo	    Ruiz	Flores	        comercial	


-- OTRA FORMA:
(SELECT 
	CONCAT_WS(' ', cl.nombre, cl.apellido1, cl.apellido2, '(cliente)') AS resultado
FROM cliente cl LEFT JOIN pedido p 
	ON cl.id = p.id_cliente
WHERE p.id_cliente IS NULL) 

UNION

(SELECT 
	CONCAT_WS(' ', co.nombre, co.apellido1, co.apellido2, '(comercial)') AS resultado
FROM comercial co LEFT JOIN pedido p 
	ON co.id = p.id_comercial
WHERE p.id_comercial  IS NULL);

-- RESULTADO
resultado	
Guillermo López Gómez (cliente)	
Daniel Santana Loyola (cliente)	
Marta Herrera Gil (comercial)	
Alfredo Ruiz Flores (comercial)	
```



6. ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
```text
❌ No, no es adecuado ni seguro usar NATURAL LEFT JOIN o NATURAL RIGHT JOIN para las consultas anteriores.
✅ Es mucho mejor usar JOIN ... ON ... para tener el control total y claridad sobre qué columnas se están comparando.
```





### [A4.3.6] 📝Consultas resumen ventas ❓:
1. Calcula la cantidad total de todos los pedidos que aparecen en la tabla pedido.
```sql 
SELECT COUNT(p.id) AS cantidad_pedidos
FROM pedido p;

-- RESULTADO
16	
```



2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
```sql 
SELECT avg(p.id) AS media_pedidos
FROM pedido p;

-- RESULTADO
8.5000	
```



3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
```sql 
SELECT COUNT(DISTINCT p.id_comercial) AS total_comerciales
FROM pedido p;

-- RESULTADO
6	
```



4. Calcula el número total de clientes que aparecen en la tabla cliente.
```sql 
SELECT COUNT(cl.id) AS total_clientes
FROM cliente cl;

-- RESULTADO
10	
```



5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
```sql 
SELECT MAX(p.total) AS cantidad_mayor
FROM pedido p;

-- RESULTADO
5760	
```



6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
```sql 
SELECT MIN(p.total) AS cantidad_menor
FROM pedido p;

-- RESULTADO
65.26
```



7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
```sql 
SELECT cl.ciudad, MAX(cl.categoría) AS categoria_maxima
FROM cliente cl
GROUP BY cl.ciudad;

-- RESULTADO
ciudad	categoria_maxima	
Almería	200	
Cádiz	100	
Granada	225	
Huelva	200	
Jaén	300	
Sevilla	300	
```



8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
```sql 
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2,
	p.fecha, MAX(p.total) AS cantidad_maxima
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente
GROUP BY p.fecha;

-- RESULTADO
id	nombre	apellido1	apellido2	fecha	cantidad_maxima	
8	Pepe	Ruiz	Santana	2015-06-27	250.45	
2	Adela	Salas	Díaz	2015-09-10	5760	
7	Pilar	Ruiz	NULL	2016-07-27	2400.6	
3	Adolfo	Rubio	Flores	2016-08-17	110.5	
1	Aarón	Rivero	Gómez	2016-09-10	270.65	
8	Pepe	Ruiz	Santana	2016-10-10	2480.4	
6	María	Santana	Moreno	2017-02-02	145.82	
2	Adela	Salas	Díaz	2017-04-25	3045.6	
5	Marcos	Loyola	Méndez	2017-09-10	948.5	
2	Adela	Salas	Díaz	2017-10-05	150.5	
4	Adrián	Suárez	NULL	2017-10-10	1983.43	
6	María	Santana	Moreno	2019-01-25	545.75	
1	Aarón	Rivero	Gómez	2019-03-11	2389.23	
```



9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
```sql 
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2,
	p.fecha, MAX(p.total) AS cantidad_maxima
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente
GROUP BY p.fecha
HAVING cantidad_maxima > 2000;

-- RESULTADO
id	nombre	apellido1	apellido2	fecha	cantidad_maxima	
2	Adela	Salas	Díaz	2015-09-10	5760	
7	Pilar	Ruiz	NULL	2016-07-27	2400.6	
8	Pepe	Ruiz	Santana	2016-10-10	2480.4	
2	Adela	Salas	Díaz	2017-04-25	3045.6	
1	Aarón	Rivero	Gómez	2019-03-11	2389.23	
```



10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
```sql 
SELECT 
    co.id, co.nombre, co.apellido1, co.apellido2, 
    MAX(p.total) AS pedido_maximo
FROM pedido p INNER JOIN comercial co
	ON p.id_comercial = co.id
WHERE p.fecha = '2016-08-17'
GROUP BY co.nombre;

-- RESULTADO
id	nombre	apellido1	apellido2	pedido_maximo	
7	Antonio	Vega	Hernández	75.29	
3	Diego	Flores	Salas	110.5	
```



11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
```sql 
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2,
    COUNT(p.id) AS cantidad_pedidos
FROM cliente cl LEFT JOIN pedido p
	ON cl.id =  p.id_cliente
GROUP BY cl.id;

-- RESULTADO
id	nombre	apellido1	apellido2	cantidad_pedidos	
1	Aarón	Rivero	Gómez	3	
2	Adela	Salas	Díaz	3	
3	Adolfo	Rubio	Flores	1	
4	Adrián	Suárez	NULL	1	
5	Marcos	Loyola	Méndez	2	
6	María	Santana	Moreno	2	
7	Pilar	Ruiz	NULL	1	
8	Pepe	Ruiz	Santana	3	
9	Guillermo	López	Gómez	0	
10	Daniel	Santana	Loyola	0	
```



12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
```sql 
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2,
    COUNT(p.id) AS cantidad_pedidos
FROM cliente cl INNER JOIN pedido p
	ON cl.id =  p.id_cliente
WHERE YEAR(p.fecha) = 2017
GROUP BY cl.nombre;

-- RESULTADO
id	nombre	apellido1	apellido2	cantidad_pedidos	
2	Adela	Salas	Díaz	2	
4	Adrián	Suárez	NULL	1	
5	Marcos	Loyola	Méndez	2	
6	María	Santana	Moreno	1	
```



13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
```sql 
SELECT 
    cl.id, cl.nombre, cl.apellido1, cl.apellido2,
    ifnull(MAX(p.total), 0) AS cantidad_maxima
FROM cliente cl LEFT JOIN pedido p
	ON cl.id =  p.id_cliente
WHERE p.id_cliente IS NULL
GROUP BY cl.id;

-- SQL Server
SELECT 
    cl.id, cl.nombre, cl.apellido1, cl.apellido2,
    isnull(MAX(p.total), 0) AS cantidad_maxima
FROM cliente cl LEFT JOIN pedido p
	ON cl.id =  p.id_cliente
WHERE p.id_cliente IS NULL
GROUP BY cl.id;

-- RESULTADO
id	nombre	apellido1	apellido2	cantidad_maxima	
9	Guillermo	López	Gómez	0	
10	Daniel	Santana	Loyola	0	
```



14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
```sql 
SELECT 
	p.id, MAX(p.total) AS maximo_valor, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p 
GROUP BY YEAR(p.fecha);

-- RESULTADO
id	maximo_valor	fecha	id_cliente	id_comercial	
7	5760	2015-09-10	2	1	
2	2480.4	2016-09-10	1	5	
1	3045.6	2017-10-05	5	2	
13	2389.23	2019-01-25	6	1	
```



15. Devuelve el número total de pedidos que se han realizado cada año.
```sql 
SELECT 
	COUNT(p.id) AS cantidad_total_pedido, YEAR(p.fecha) AS año
FROM pedido p 
GROUP BY YEAR(p.fecha);

-- RESULTADO
cantidad_total_pedido	año	
2	2015	
5	2016	
6	2017	
3	2019	
```





### [A4.3.7] 📝Subconsultas ventas ❓:
#### [A4.3.7.1] Con operadores básicos de comparación
1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
```sql 
SELECT 
	p.id, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p 
WHERE p.id_cliente = (
                        SELECT cl.id
                        FROM cliente cl
                        WHERE cl.nombre = 'Adela' AND cl.apellido1 = 'Salas' AND cl.apellido2 = 'Díaz'
                        );

-- RESULTADO
id	total	fecha	id_cliente	id_comercial	
3	65.26	2017-10-05	2	1	
7	5760	2015-09-10	2	1	
12	3045.6	2017-04-25	2	1	
```



2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
```sql 
SELECT 
	COUNT(p.id) AS cantidad_pedidos
FROM pedido p 
WHERE p.id_cliente = (
                        SELECT co.id
                        FROM comercial co
                        WHERE co.nombre = 'Daniel ' AND co.apellido1 = 'Sáez ' AND co.apellido2 = 'Vega'
    	                );

-- RESULTADO
3	
```



3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
```sql 
SELECT 
	cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl 
WHERE cl.id = (
                SELECT p.id_cliente
                FROM pedido p 
                WHERE YEAR(p.fecha) = 2019
                ORDER BY p.total DESC
                LIMIT 1
			);

-- RESULTADO
1	Aarón	Rivero	Gómez	Almería	100	
```



4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
```sql 
SELECT p.fecha, p.total
FROM pedido p 
WHERE p.id_cliente = (
                        SELECT cl.id
                        FROM cliente cl
                        WHERE cl.nombre = 'Pepe' AND cl.apellido1 = 'Ruiz' AND cl.apellido2 = 'Santana'
                    )
ORDER BY p.total ASC
LIMIT 1;

-- RESULTADO
2016-08-17	110.5	
```



5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
```sql 
SELECT 
	cl.id AS ID_cliente, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría,
	p.id AS ID_pedido, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM cliente cl INNER JOIN pedido p 
	ON cl.id = p.id_cliente
WHERE YEAR(p.fecha) = 2017 AND p.total >= (
                                            SELECT AVG(total)
                                            FROM pedido
                                            WHERE YEAR(pedido.fecha) = 2017
                                            );

-- RESULTADO
ID_cliente	nombre	apellido1	apellido2	ciudad	categoría	ID_pedido	total	fecha	id_cliente	id_comercial	
4	Adrián	Suárez	NULL	Jaén	300	8	1983.43	2017-10-10	4	6	
2	Adela	Salas	Díaz	Granada	200	12	3045.6	2017-04-25	2	1	
```





#### [A4.3.7.2] Subconsultas con ALL y ANY
6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
```sql 
SELECT 
    p.id, p.total, p.fecha, p.id_cliente, p.id_comercial
FROM pedido p 
WHERE p.total >= ALL (
    					SELECT p1.total
                     	FROM pedido p1
                     );

-- RESULTADO
7	5760	2015-09-10	2	1	
```



7. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
```sql 
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl
WHERE cl.id <> ALL (
                    SELECT p.id_cliente
                    FROM pedido p
                    WHERE p.id_cliente IS NOT NULL
                  );

-- RESULTADO
id	nombre	apellido1	apellido2	ciudad	categoría	
9	Guillermo	López	Gómez	Granada	225	
10	Daniel	Santana	Loyola	Sevilla	125	
```



8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
```sql 
SELECT
	co.id, co.nombre, co.apellido1, co.apellido2, co.comisión
FROM comercial co
WHERE co.id <> ALL (
                    SELECT 
                    	p.id_comercial
                    FROM pedido p 
                    WHERE p.id_comercial IS NOT NULL
                    );
-- RESULTADO
id	nombre	apellido1	apellido2	comisión	
4	Marta	Herrera	Gil	0.14	
8	Alfredo	Ruiz	Flores	0.05	
```





#### [A4.3.7.3] Subconsultas con IN y NOT IN
9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql 
SELECT
	cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl
WHERE cl.id NOT IN (
                    SELECT p.id_cliente
                    FROM pedido p
                    );

-- RESULTADO
id	nombre	apellido1	apellido2	ciudad	categoría	
9	Guillermo	López	Gómez	Granada	225	
10	Daniel	Santana	Loyola	Sevilla	125	
```



10.  Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql 
SELECT
	co.id, co.nombre, co.apellido1, co.apellido2, co.comisión
FROM comercial co
WHERE co.id NOT IN (
                    SELECT p.id_comercial
                    FROM pedido p
                    );

-- RESULTADO
id	nombre	apellido1	apellido2	comisión	
4	Marta	Herrera	Gil	0.14	
8	Alfredo	Ruiz	Flores	0.05	
```





#### [A4.3.7.4] Subconsultas con EXISTS y NOT EXISTS
11. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql 
SELECT
	cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoría
FROM cliente cl
WHERE NOT EXISTS (
                    SELECT p.id_cliente
                    FROM pedido p
                    WHERE cl.id = p.id_cliente
                );

-- RESULTADO
id	nombre	apellido1	apellido2	ciudad	categoría	
9	Guillermo	López	Gómez	Granada	225	
10	Daniel	Santana	Loyola	Sevilla	125	
```



12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
```sql 
SELECT
	co.id, co.nombre, co.apellido1, co.apellido2, co.comisión
FROM comercial co
WHERE NOT EXISTS (
                    SELECT p.id_comercial
                    FROM pedido p
                    WHERE co.id = p.id_comercial
                );

-- RESULTADO
id	nombre	apellido1	apellido2	comisión	
4	Marta	Herrera	Gil	0.14	
8	Alfredo	Ruiz	Flores	0.05	
```
