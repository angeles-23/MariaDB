### [A4.4.4] 📝Consultas básicas jardineria❓:
1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql 
SELECT o.codigo_oficina, o.ciudad
FROM oficina o;

-- RESULTADO
codigo_oficina	ciudad	
BCN-ES	Barcelona	
BOS-USA	Boston	
LON-UK	Londres	
MAD-ES	Madrid	
PAR-FR	Paris	
SFC-USA	San Francisco	
SYD-AU	Sydney	
TAL-ES	Talavera de la Reina	
TOK-JP	Tokyo	
```



2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
```sql 
SELECT o.ciudad, o.telefono
FROM oficina o
WHERE o.pais = 'España';

-- RESULTADO
ciudad	telefono	
Barcelona	+34 93 3561182	
Madrid	+34 91 7514487	
Talavera de la Reina	+34 925 867231	
```



3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
```sql 
SELECT e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado e
WHERE e.codigo_jefe = 7;

-- RESULTADO
nombre	apellido1	apellido2	email	
Mariano	López	Murcia	mlopez@jardineria.es	
Lucio	Campoamor	Martín	lcampoamor@jardineria.es	
Hilario	Rodriguez	Huertas	hrodriguez@jardineria.es	
```



4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
```sql 
SELECT e.puesto, e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado e
WHERE e.codigo_jefe IS NULL;

-- RESULTADO
Director General	Marcos	Magaña	Perez	marcos@jardineria.es	
```



5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
```sql 
SELECT e.nombre, e.apellido1, e.apellido2, e.puesto
FROM empleado e
WHERE e.puesto <> 'Representante Ventas';

-- RESULTADO
nombre	apellido1	apellido2	puesto	
Marcos	Magaña	Perez	Director General	
Ruben	López	Martinez	Subdirector Marketing	
Alberto	Soria	Carrasco	Subdirector Ventas	
Maria	Solís	Jerez	Secretaria	
Carlos	Soria	Jimenez	Director Oficina	
Emmanuel	Magaña	Perez	Director Oficina	
Francois	Fignon		Director Oficina	
Michael	Bolton		Director Oficina	
Hilary	Washington		Director Oficina	
Nei	Nishikori		Director Oficina	
Amy	Johnson		Director Oficina	
Kevin	Fallmer		Director Oficina	
```



6. Devuelve un listado con el nombre de los todos los clientes españoles.
```sql 
SELECT cl.nombre_cliente
FROM cliente cl
WHERE cl.pais = 'Spain';

-- RESULTADO
nombre_cliente	
Lasas S.A.	
Beragua	
Club Golf Puerta del hierro	
Naturagua	
DaraDistribuciones	
Madrileña de riegos	
Lasas S.A.	
Camunas Jardines S.L.	
Dardena S.A.	
Jardin de Flores	
Flores Marivi	
Flowers, S.A	
Naturajardin	
Golf S.A.	
Americh Golf Management SL	
Aloha	
El Prat	
Sotogrande	
Vivero Humanes	
Fuenla City	
Jardines y Mansiones Cactus SL	
Jardinerías Matías SL	
Agrojardin	
Top Campo	
Jardineria Sara	
```



7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
```sql 
SELECT DISTINCT(p.estado)
FROM pedido p;

-- RESULTADO
estado	
Entregado	
Rechazado	
Pendiente	
```



8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
```sql
-- Utilizando la función YEAR de MySQL.
SELECT DISTINCT(cl.codigo_cliente)
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE YEAR(p.fecha_pago) = 2008;

-- Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT(cl.codigo_cliente)
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE DATE_FORMAT(p.fecha_pago, '%Y') = 2008;

-- Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT(cl.codigo_cliente)
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE LEFT(p.fecha_pago, 4) = 2008;

SELECT DISTINCT(cl.codigo_cliente)
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE SUBSTRING(p.fecha_pago, 1, 4) = 2008;


-- RESULTADO
codigo_cliente	
1	
13	
14	
26	
```


9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
```sql
SELECT 
	p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM pedido p
WHERE p.fecha_entrega > p.fecha_esperada;

-- RESULTADO
codigo_pedido	codigo_cliente	fecha_esperada	fecha_entrega	
9	1	2008-12-27	2008-12-28	
13	7	2009-01-14	2009-01-15	
16	7	2009-01-07	2009-01-15	
17	7	2009-01-09	2009-01-11	
18	9	2009-01-06	2009-01-07	
22	9	2009-01-11	2009-01-13	
28	3	2009-02-17	2009-02-20	
31	13	2008-09-30	2008-10-04	
32	4	2007-01-19	2007-01-27	
38	19	2009-03-06	2009-03-07	
39	19	2009-03-07	2009-03-09	
40	19	2009-03-10	2009-03-13	
42	19	2009-03-23	2009-03-27	
43	23	2009-03-26	2009-03-28	
44	23	2009-03-27	2009-03-30	
45	23	2009-03-04	2009-03-07	
46	23	2009-03-04	2009-03-05	
49	26	2008-07-22	2008-07-30	
55	14	2009-01-10	2009-01-11	
60	1	2008-12-27	2008-12-28	
68	3	2009-02-17	2009-02-20	
92	27	2009-04-30	2009-05-03	
96	35	2008-04-12	2008-04-13	
103	30	2009-01-20	2009-01-24	
106	30	2009-05-15	2009-05-20	
```


10.  Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql
-- Utilizando la función ADDDATE de MySQL.
SELECT 
	p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM pedido p
WHERE ADDDATE(p.fecha_entrega, 2) <= p.fecha_esperada;

-- Utilizando la función DATEDIFF de MySQL.
SELECT 
	p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
FROM pedido p
WHERE DATEDIFF(p.fecha_esperada, p.fecha_entrega) >= 2;

-- RESULTADO
codigo_pedido	codigo_cliente	fecha_esperada	fecha_entrega	
2	5	2007-10-28	2007-10-26	
24	14	2008-07-31	2008-07-25	
30	13	2008-09-03	2008-08-31	
36	14	2008-12-15	2008-12-10	
53	13	2008-11-15	2008-11-09	
89	35	2007-12-13	2007-12-10	
91	27	2009-03-29	2009-03-27	
93	27	2009-05-30	2009-05-17	
```


11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
```sql
SELECT 
	p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.estado, p.comentarios, p.codigo_cliente
FROM pedido p
WHERE p.estado = 'Rechazado' AND YEAR(p.fecha_pedido) = 2009;

-- RESULTADO
codigo_pedido	fecha_pedido	fecha_esperada	fecha_entrega	estado	comentarios	codigo_cliente	
14	2009-01-02	2009-01-02	NULL	Rechazado	mal pago	7	
21	2009-01-09	2009-01-09	2009-01-09	Rechazado	mal pago	9	
25	2009-02-02	2009-02-08	NULL	Rechazado	El cliente carece de saldo en la cuenta asociada	1	
26	2009-02-06	2009-02-12	NULL	Rechazado	El cliente anula la operacion para adquirir mas pr...	3	
40	2009-03-09	2009-03-10	2009-03-13	Rechazado	NULL	19	
46	2009-04-03	2009-03-04	2009-03-05	Rechazado	NULL	23	
65	2009-02-02	2009-02-08	NULL	Rechazado	El cliente carece de saldo en la cuenta asociada	1	
66	2009-02-06	2009-02-12	NULL	Rechazado	El cliente anula la operacion para adquirir mas pr...	3	
74	2009-01-14	2009-01-22	NULL	Rechazado	El pedido no llego el dia que queria el cliente po...	15	
81	2009-01-18	2009-01-24	NULL	Rechazado	Los producto estaban en mal estado	28	
101	2009-03-07	2009-03-27	NULL	Rechazado	El pedido fue rechazado por el cliente	16	
105	2009-02-14	2009-02-20	NULL	Rechazado	el producto ha sido rechazado por la pesima calida...	30	
120	2009-03-07	2009-03-27	NULL	Rechazado	El pedido fue rechazado por el cliente	16	
125	2009-02-14	2009-02-20	NULL	Rechazado	el producto ha sido rechazado por la pesima calida...	30	
```



12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
```sql
SELECT 
	p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.estado, p.comentarios, p.codigo_cliente
FROM pedido p
WHERE MONTH(p.fecha_entrega) = 1;

-- RESULTADO
codigo_pedido	fecha_pedido	fecha_esperada	fecha_entrega	estado	comentarios	codigo_cliente	
1	2006-01-17	2006-01-19	2006-01-19	Entregado	Pagado a plazos	5	
13	2009-01-12	2009-01-14	2009-01-15	Entregado	NULL	7	
15	2009-01-09	2009-01-12	2009-01-11	Entregado	NULL	7	
16	2009-01-06	2009-01-07	2009-01-15	Entregado	NULL	7	
17	2009-01-08	2009-01-09	2009-01-11	Entregado	mal estado	7	
18	2009-01-05	2009-01-06	2009-01-07	Entregado	NULL	9	
21	2009-01-09	2009-01-09	2009-01-09	Rechazado	mal pago	9	
22	2009-01-11	2009-01-11	2009-01-13	Entregado	NULL	9	
32	2007-01-07	2007-01-19	2007-01-27	Entregado	Entrega tardia, el cliente puso reclamacion	4	
55	2008-12-10	2009-01-10	2009-01-11	Entregado	Retrasado 1 dia por problemas de transporte	14	
58	2009-01-24	2009-01-31	2009-01-30	Entregado	Todo correcto	3	
64	2009-01-24	2009-01-31	2009-01-30	Entregado	Todo correcto	1	
75	2009-01-11	2009-01-13	2009-01-13	Entregado	El pedido llego perfectamente	15	
79	2009-01-12	2009-01-13	2009-01-13	Entregado	NULL	28	
82	2009-01-20	2009-01-29	2009-01-29	Entregado	El pedido llego un poco mas tarde de la hora fijad...	28	
95	2008-01-04	2008-01-19	2008-01-19	Entregado	NULL	35	
100	2009-01-10	2009-01-15	2009-01-15	Entregado	El pedido llego perfectamente	16	
102	2008-12-28	2009-01-08	2009-01-08	Entregado	Pago pendiente	16	
103	2009-01-15	2009-01-20	2009-01-24	Pendiente	NULL	30	
113	2008-10-28	2008-11-09	2009-01-09	Rechazado	El producto ha sido rechazado por la tardanza de e...	36	
114	2009-01-15	2009-01-29	2009-01-31	Entregado	El envio llego dos dias más tarde debido al mal ti...	36	
119	2009-01-10	2009-01-15	2009-01-15	Entregado	El pedido llego perfectamente	16	
121	2008-12-28	2009-01-08	2009-01-08	Entregado	Pago pendiente	16	
123	2009-01-15	2009-01-20	2009-01-24	Pendiente	NULL	30	
```



13.  Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
```sql
SELECT 
	p.codigo_cliente, p.forma_pago, p.id_transaccion, p.fecha_pago, p.total
FROM pago p
WHERE YEAR(p.fecha_pago) = 2008 AND p.forma_pago =  'Paypal'
ORDER BY p.fecha_pago DESC;

-- RESULTADO
codigo_cliente	forma_pago	id_transaccion	fecha_pago   	total	
1	PayPal	ak-std-000002	2008-12-10	2000.00	
1	PayPal	ak-std-000001	2008-11-10	2000.00	
13	PayPal	ak-std-000014	2008-08-04	2246.00	
14	PayPal	ak-std-000015	2008-07-15	4160.00	
26	PayPal	ak-std-000020	2008-03-18	18846.00	
```



14.  Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
```sql
SELECT DISTINCT(p.forma_pago)
FROM pago p;

-- RESULTADO
forma_pago	
PayPal	
Transferencia	
Cheque	
```



15.  Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
```sql
SELECT 
	p.codigo_producto, p.nombre, p.gama, p.dimensiones, p.proveedor, p.descripcion, p.cantidad_en_stock, p.precio_venta, p.precio_proveedor
FROM producto p INNER JOIN gama_producto g 
	ON p.gama = g.gama
WHERE g.gama = 'Ornamentales' AND p.cantidad_en_stock > 100
ORDER BY p.precio_venta DESC;

-- RESULTADO
codigo_producto	nombre	gama	dimensiones	proveedor	descripcion	cantidad_en_stock	precio_venta   	precio_proveedor	
OR-115	Forsytia Intermedia "Lynwood"	Ornamentales	35-45	Viveros EL OASIS		120	7.00	5.00	
OR-116	Hibiscus Syriacus  "Diana" -Blanco Puro	Ornamentales	35-45	Viveros EL OASIS	Por su capacidad de soportar podas, pueden ser fác...	120	7.00	5.00	
OR-117	Hibiscus Syriacus  "Helene" -Blanco-C.rojo	Ornamentales	35-45	Viveros EL OASIS	Por su capacidad de soportar podas, pueden ser fác...	120	7.00	5.00	
OR-118	Hibiscus Syriacus "Pink Giant" Rosa	Ornamentales	35-45	Viveros EL OASIS	Por su capacidad de soportar podas, pueden ser fác...	120	7.00	5.00	
OR-112	Escallonia (Mix)	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-113	Evonimus Emerald Gayeti	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-114	Evonimus Pulchellus	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-119	Laurus Nobilis Arbusto - Ramificado Bajo	Ornamentales	40-50	Viveros EL OASIS		120	5.00	4.00	
OR-120	Lonicera Nitida 	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-121	Lonicera Nitida "Maigrum"	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-122	Lonicera Pileata	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-123	Philadelphus "Virginal"	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-124	Prunus pisardii  	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-125	Viburnum Tinus "Eve Price"	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
OR-126	Weigelia "Bristol Ruby"	Ornamentales	35-45	Viveros EL OASIS		120	5.00	4.00	
```



16.  Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
```sql
SELECT 
	cl.codigo_cliente, cl.nombre_cliente, cl.nombre_contacto, cl.apellido_contacto, cl.telefono, cl.fax, cl.linea_direccion1, cl.linea_direccion2, cl.ciudad, cl.region, cl.pais, cl.codigo_postal, cl.codigo_empleado_rep_ventas, cl.limite_credito
FROM cliente cl
WHERE cl.ciudad = 'Madrid' AND cl.codigo_empleado_rep_ventas IN (11, 30);

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
7	Beragua	Jose	Bermejo	654987321	916549872	C/pintor segundo	Getafe	Madrid	Madrid	Spain	28942	11	20000.00	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	
9	Naturagua	Guillermo	Rengifo	689234750	916428956	C/majadahonda	Boadilla	Madrid	Madrid	Spain	28947	11	32000.00	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	
15	Jardin de Flores	Javier	Villar	654865643	914538776	C/ Oña 34	NULL	Madrid	Madrid	Spain	28950	30	40000.00	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	
```





### [A4.4.5] 📝Consultas multitabla jardineria (Composición interna) ❓:
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
```sql 
-- SQL1
SELECT cl.nombre_cliente, e.nombre AS nombre_repre_ventas, e.apellido1 AS apellido1_repre_ventas
FROM cliente cl, empleado e 
	WHERE cl.codigo_empleado_rep_ventas = e.codigo_empleado AND e.puesto = 'Representante Ventas';

-- SQL2
SELECT cl.nombre_cliente, e.nombre AS nombre_repre_ventas, e.apellido1 AS apellido1_repre_ventas
FROM cliente cl INNER JOIN empleado e 
	ON cl.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.puesto = 'Representante Ventas';


-- RESULTADO
nombre_cliente	nombre_repre_ventas	apellido1_repre_ventas	
GoldFish Garden	Walter Santiago	Sanchez	
Gardening Associates	Walter Santiago	Sanchez	
Gerudo Valley	Lorena	Paxton	
Tendo Garden	Lorena	Paxton	
Lasas S.A.	Mariano	López	
Lasas S.A.	Mariano	López	
Camunas Jardines S.L.	Mariano	López	
Dardena S.A.	Mariano	López	
Jardin de Flores	Julian	Bellinelli	
Flores Marivi	Felipe	Rosas	
Flowers, S.A	Felipe	Rosas	
Naturajardin	Julian	Bellinelli	
Golf S.A.	José Manuel	Martinez	
Americh Golf Management SL	José Manuel	Martinez	
Aloha	José Manuel	Martinez	
El Prat	José Manuel	Martinez	
Sotogrande	José Manuel	Martinez	
Vivero Humanes	Julian	Bellinelli	
Fuenla City	Felipe	Rosas	
Jardines y Mansiones Cactus SL	Lucio	Campoamor	
Jardinerías Matías SL	Lucio	Campoamor	
Agrojardin	Julian	Bellinelli	
Top Campo	Felipe	Rosas	
Jardineria Sara	Felipe	Rosas	
Campohermoso	Julian	Bellinelli	
```



2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql 
-- SQL1
SELECT DISTINCT(cl.nombre_cliente), e.nombre AS nombre_repre_ventas
FROM cliente cl, pago p, empleado e
	WHERE cl.codigo_cliente = p.codigo_cliente AND cl.codigo_empleado_rep_ventas = e.codigo_empleado
AND e.puesto = 'Representante Ventas';	

-- SQL2
SELECT DISTINCT(cl.nombre_cliente), e.nombre AS nombre_repre_ventas
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.puesto = 'Representante Ventas';	

-- RESULTADO
nombre_cliente	nombre_repre_ventas	
GoldFish Garden	Walter Santiago	
Gardening Associates	Walter Santiago	
Gerudo Valley	Lorena	
Tendo Garden	Lorena	
Camunas Jardines S.L.	Mariano	
Dardena S.A.	Mariano	
Jardin de Flores	Julian	
Flores Marivi	Felipe	
Golf S.A.	José Manuel	
Sotogrande	José Manuel	
Jardines y Mansiones Cactus SL	Lucio	
Jardinerías Matías SL	Lucio	
Agrojardin	Julian	
Jardineria Sara	Felipe	
Tutifruti S.A	Mariko	
El Jardin Viviente S.L	Mariko	
```



3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql 
SELECT DISTINCT(cl.nombre_cliente), e.nombre AS nombre_repre_ventas
FROM cliente cl LEFT JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.puesto = 'Representante Ventas' AND p.codigo_cliente IS NULL;	

-- RESULTADO
nombre_cliente	nombre_repre_ventas	
Lasas S.A.	Mariano	
Flowers, S.A	Felipe	
Naturajardin	Julian	
Americh Golf Management SL	José Manuel	
Aloha	José Manuel	
El Prat	José Manuel	
Vivero Humanes	Julian	
Fuenla City	Felipe	
Top Campo	Felipe	
Campohermoso	Julian	
france telecom	Lionel	
Musée du Louvre	Lionel	
```



4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql 
-- SQL1
SELECT cl.nombre_cliente, e.nombre, o.ciudad
FROM cliente cl, pago p , empleado e,oficina o 
	WHERE cl.codigo_cliente = p.codigo_cliente 
    AND cl.codigo_empleado_rep_ventas = e.codigo_empleado 
    AND e.codigo_oficina = o.codigo_oficina
AND e.puesto = 'Representante Ventas';

-- SQL2
SELECT cl.nombre_cliente, e.nombre, o.ciudad
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina
WHERE e.puesto = 'Representante Ventas';

-- RESULTADO
nombre_cliente	nombre	ciudad	
Golf S.A.	José Manuel	Barcelona	
Sotogrande	José Manuel	Barcelona	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Tendo Garden	Lorena	Boston	
Camunas Jardines S.L.	Mariano	Madrid	
Dardena S.A.	Mariano	Madrid	
Jardines y Mansiones Cactus SL	Lucio	Madrid	
Jardinerías Matías SL	Lucio	Madrid	
GoldFish Garden	Walter Santiago	San Francisco	
GoldFish Garden	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Jardin de Flores	Julian	Sydney	
Jardin de Flores	Julian	Sydney	
Agrojardin	Julian	Sydney	
Tutifruti S.A	Mariko	Sydney	
El Jardin Viviente S.L	Mariko	Sydney	
Flores Marivi	Felipe	Talavera de la Reina	
Jardineria Sara	Felipe	Talavera de la Reina	
```



5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql 
SELECT cl.nombre_cliente, e.nombre AS nombre_repre, o.ciudad
FROM cliente cl LEFT JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina
WHERE e.puesto = 'Representante Ventas' AND p.codigo_cliente IS NULL;

-- RESULTADO
nombre_cliente	nombre_repre	ciudad	
Americh Golf Management SL	José Manuel	Barcelona	
Aloha	José Manuel	Barcelona	
El Prat	José Manuel	Barcelona	
Lasas S.A.	Mariano	Madrid	
Lasas S.A.	Mariano	Madrid	
france telecom	Lionel	Paris	
Musée du Louvre	Lionel	Paris	
Naturajardin	Julian	Sydney	
Vivero Humanes	Julian	Sydney	
Campohermoso	Julian	Sydney	
Flowers, S.A	Felipe	Talavera de la Reina	
Fuenla City	Felipe	Talavera de la Reina	
Top Campo	Felipe	Talavera de la Reina	
```



6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
```sql 
-- SQL1
SELECT o.linea_direccion1, o.linea_direccion2
FROM cliente cl, empleado e, oficina o 
    WHERE cl.codigo_empleado_rep_ventas = e.codigo_empleado 
    AND e.codigo_oficina = o.codigo_oficina
AND cl.ciudad = 'Fuenlabrada';


-- SQL2
SELECT o.linea_direccion1, o.linea_direccion2
FROM cliente cl INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina
WHERE cl.ciudad = 'Fuenlabrada';

-- RESULTADO
linea_direccion1	linea_direccion2	
Bulevar Indalecio Prieto, 32		
Bulevar Indalecio Prieto, 32		
5-11 Wentworth Avenue	Floor #2	
Francisco Aguirre, 32	5º piso (exterior)	
Francisco Aguirre, 32	5º piso (exterior)	
Francisco Aguirre, 32	5º piso (exterior)	
```



7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql 
-- SQL1
SELECT cl.nombre_cliente, e.nombre AS nombre_repre, o.ciudad
FROM cliente cl, pago p, empleado e, oficina o 
	WHERE cl.codigo_cliente = p.codigo_cliente  
    AND cl.codigo_empleado_rep_ventas = e.codigo_empleado  
    AND e.codigo_oficina = o.codigo_oficina;


-- SQL2
SELECT cl.nombre_cliente, e.nombre AS nombre_repre, o.ciudad
FROM cliente cl INNER JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente INNER JOIN empleado e 
    ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina;

-- RESULTADO
nombre_cliente	nombre_repre	ciudad	
Beragua	Emmanuel	Barcelona	
Naturagua	Emmanuel	Barcelona	
Golf S.A.	José Manuel	Barcelona	
Sotogrande	José Manuel	Barcelona	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Gerudo Valley	Lorena	Boston	
Tendo Garden	Lorena	Boston	
Camunas Jardines S.L.	Mariano	Madrid	
Dardena S.A.	Mariano	Madrid	
Jardines y Mansiones Cactus SL	Lucio	Madrid	
Jardinerías Matías SL	Lucio	Madrid	
GoldFish Garden	Walter Santiago	San Francisco	
GoldFish Garden	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Gardening Associates	Walter Santiago	San Francisco	
Jardin de Flores	Julian	Sydney	
Jardin de Flores	Julian	Sydney	
Agrojardin	Julian	Sydney	
Tutifruti S.A	Mariko	Sydney	
El Jardin Viviente S.L	Mariko	Sydney	
Flores Marivi	Felipe	Talavera de la Reina	
```



8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
```sql 
-- SQL1
SELECT emp.nombre AS nombre_empleados, jef.nombre AS nombre_jefe
FROM empleado emp, empleado jef 	
	WHERE emp.codigo_jefe = jef.codigo_empleado;

-- SQL2
SELECT emp.nombre AS nombre_empleados, jef.nombre AS nombre_jefe
FROM empleado emp INNER JOIN empleado jef 	
	ON emp.codigo_jefe = jef.codigo_empleado;

-- RESULTADO
nombre_empleados	nombre_jefe	
Ruben	Marcos	
Alberto	Ruben	
Maria	Ruben	
Felipe	Alberto	
Juan Carlos	Alberto	
Carlos	Alberto	
Mariano	Carlos	
Lucio	Carlos	
Hilario	Carlos	
Emmanuel	Alberto	
José Manuel	Emmanuel	
David	Emmanuel	
Oscar	Emmanuel	
Francois	Alberto	
Lionel	Francois	
Laurent	Francois	
Michael	Alberto	
Walter Santiago	Michael	
Hilary	Alberto	
Marcus	Hilary	
Lorena	Hilary	
Nei	Alberto	
Narumi	Nei	
Takuma	Nei	
Amy	Alberto	
```



9. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
```sql 
-- SQL1
SELECT 
	cl.nombre_cliente
FROM cliente cl, pedido p 
	WHERE cl.codigo_cliente = p.codigo_cliente
AND p.fecha_entrega = p.fecha_esperada;

-- SQL2
SELECT 
	cl.nombre_cliente
FROM cliente cl INNER JOIN pedido p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE p.fecha_entrega = p.fecha_esperada;

-- RESULTADO
nombre_cliente	
Tendo Garden	
GoldFish Garden	
Naturagua	
Dardena S.A.	
Gerudo Valley	
Golf S.A.	
Sotogrande	
Jardines y Mansiones Cactus SL	
GoldFish Garden	
Jardin de Flores	
Jardin de Flores	
Jardin de Flores	
Agrojardin	
Agrojardin	
Tutifruti S.A	
Tutifruti S.A	
Flores Marivi	
Flores Marivi	
Jardineria Sara	
Jardineria Sara	
Flores Marivi	
El Jardin Viviente S.L	
El Jardin Viviente S.L	
Flores S.L.	
El Jardin Viviente S.L	
```



10. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
```sql 
-- SQL1
SELECT DISTINCT(cl.nombre_cliente), g.gama
FROM gama_producto g, producto pr, detalle_pedido dp, pedido pe, cliente cl
	WHERE g.gama = pr.gama   
    AND pr.codigo_producto = dp.codigo_producto 
    AND dp.codigo_pedido = pe.codigo_pedido  
    AND pe.codigo_cliente = cl.codigo_cliente;

-- SQL2
SELECT DISTINCT(cl.nombre_cliente), g.gama
FROM gama_producto g INNER JOIN producto pr
	ON g.gama = pr.gama INNER JOIN detalle_pedido dp 
    ON pr.codigo_producto = dp.codigo_producto INNER JOIN pedido pe 
    ON dp.codigo_pedido = pe.codigo_pedido INNER JOIN cliente cl 
    ON pe.codigo_cliente = cl.codigo_cliente;
    
-- RESULTADO
nombre_cliente	gama	
GoldFish Garden	Frutales	
GoldFish Garden	Aromáticas	
GoldFish Garden	Ornamentales	
Gardening Associates	Frutales	
Gardening Associates	Ornamentales	
Gerudo Valley	Herramientas	
Gerudo Valley	Ornamentales	
Gerudo Valley	Frutales	
Tendo Garden	Frutales	
Tendo Garden	Ornamentales	
Tendo Garden	Aromáticas	
Beragua	Herramientas	
Beragua	Frutales	
Beragua	Ornamentales	
Naturagua	Herramientas	
Naturagua	Frutales	
Naturagua	Ornamentales	
Camunas Jardines S.L.	Aromáticas	
Camunas Jardines S.L.	Frutales	
Camunas Jardines S.L.	Ornamentales	
Dardena S.A.	Herramientas	
Dardena S.A.	Frutales	
Dardena S.A.	Ornamentales	
Jardin de Flores	Frutales	
Jardin de Flores	Ornamentales	
```





[A4.4.6] 📝Consultas multitabla jardineria (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
SELECT cl.*
FROM cliente cl LEFT JOIN pago p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
6	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	
12	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
17	Flowers, S.A	Beatriz	Fernandez	698754159	978453216	C/Luis Salquillo4	NULL	Montornes del valles	Barcelona	Spain	24586	5	3500.00	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	
20	Americh Golf Management SL	Mario	Suarez	964493072	964493063	C/Letardo	NULL	Barcelona	Cataluña	Spain	12320	12	20000.00	
21	Aloha	Cristian	Rodrigez	916485852	914489898	C/Roman 3	NULL	Canarias	Canarias	Spain	35488	12	50000.00	
22	El Prat	Francisco	Camacho	916882323	916493211	Avenida Tibidabo	NULL	Barcelona	Cataluña	Spain	12320	12	30000.00	
24	Vivero Humanes	Federico	Gomez	654987690	916040875	C/Miguel Echegaray 54	NULL	Humanes	Madrid	Spain	28970	30	7430.00	
25	Fuenla City	Tony	Muñoz Mena	675842139	915483754	C/Callo 52	NULL	Fuenlabrada	Madrid	Spain	28574	5	4500.00	
29	Top Campo	Joseluis	Sanchez	685746512	974315924	C/Ibiza 32	NULL	Humanes	Madrid	Spain	28574	5	5500.00	
31	Campohermoso	Luis	Jimenez	645925376	916159116	C/Peru 78	NULL	Fuenlabrada	Madrid	Spain	28945	30	3250.00	
32	france telecom	FraÃ§ois	Toulou	(33)5120578961	(33)5120578961	6 place d Alleray 15Ã¨me	NULL	Paris	NULL	France	75010	16	10000.00	
33	Musée du Louvre	Pierre	Delacroux	(33)0140205050	(33)0140205442	Quai du Louvre	NULL	Paris	NULL	France	75058	16	30000.00	
36	Flores S.L.	Antonio	Romero	654352981	685249700	Avenida España	NULL	Madrid	Fuenlabrada	Spain	29643	18	6000.00	
37	The Magic Garden	Richard	Mcain	926523468	9364875882	Lihgting Park	NULL	London	London	United Kingdom	65930	18	10000.00	
```



2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```sql
SELECT cl.*
FROM cliente cl LEFT JOIN pedido p 
	ON cl.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	codigo_cliente	
6	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	NULL	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	NULL	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	NULL	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	NULL	
12	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	NULL	
17	Flowers, S.A	Beatriz	Fernandez	698754159	978453216	C/Luis Salquillo4	NULL	Montornes del valles	Barcelona	Spain	24586	5	3500.00	NULL	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	NULL	
20	Americh Golf Management SL	Mario	Suarez	964493072	964493063	C/Letardo	NULL	Barcelona	Cataluña	Spain	12320	12	20000.00	NULL	
21	Aloha	Cristian	Rodrigez	916485852	914489898	C/Roman 3	NULL	Canarias	Canarias	Spain	35488	12	50000.00	NULL	
22	El Prat	Francisco	Camacho	916882323	916493211	Avenida Tibidabo	NULL	Barcelona	Cataluña	Spain	12320	12	30000.00	NULL	
24	Vivero Humanes	Federico	Gomez	654987690	916040875	C/Miguel Echegaray 54	NULL	Humanes	Madrid	Spain	28970	30	7430.00	NULL	
25	Fuenla City	Tony	Muñoz Mena	675842139	915483754	C/Callo 52	NULL	Fuenlabrada	Madrid	Spain	28574	5	4500.00	NULL	
29	Top Campo	Joseluis	Sanchez	685746512	974315924	C/Ibiza 32	NULL	Humanes	Madrid	Spain	28574	5	5500.00	NULL	
31	Campohermoso	Luis	Jimenez	645925376	916159116	C/Peru 78	NULL	Fuenlabrada	Madrid	Spain	28945	30	3250.00	NULL	
32	france telecom	FraÃ§ois	Toulou	(33)5120578961	(33)5120578961	6 place d Alleray 15Ã¨me	NULL	Paris	NULL	France	75010	16	10000.00	NULL	
33	Musée du Louvre	Pierre	Delacroux	(33)0140205050	(33)0140205442	Quai du Louvre	NULL	Paris	NULL	France	75058	16	30000.00	NULL	
37	The Magic Garden	Richard	Mcain	926523468	9364875882	Lihgting Park	NULL	London	London	United Kingdom	65930	18	10000.00	NULL	
```



3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```sql
SELECT cl.*
FROM cliente cl LEFT JOIN pago pa 
	ON cl.codigo_cliente = pa.codigo_cliente LEFT JOIN pedido pe 
    ON cl.codigo_cliente = pe.codigo_cliente
WHERE pa.codigo_cliente IS NULL AND pe.codigo_cliente IS NULL;

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
6	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	
12	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
17	Flowers, S.A	Beatriz	Fernandez	698754159	978453216	C/Luis Salquillo4	NULL	Montornes del valles	Barcelona	Spain	24586	5	3500.00	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	
20	Americh Golf Management SL	Mario	Suarez	964493072	964493063	C/Letardo	NULL	Barcelona	Cataluña	Spain	12320	12	20000.00	
21	Aloha	Cristian	Rodrigez	916485852	914489898	C/Roman 3	NULL	Canarias	Canarias	Spain	35488	12	50000.00	
22	El Prat	Francisco	Camacho	916882323	916493211	Avenida Tibidabo	NULL	Barcelona	Cataluña	Spain	12320	12	30000.00	
24	Vivero Humanes	Federico	Gomez	654987690	916040875	C/Miguel Echegaray 54	NULL	Humanes	Madrid	Spain	28970	30	7430.00	
25	Fuenla City	Tony	Muñoz Mena	675842139	915483754	C/Callo 52	NULL	Fuenlabrada	Madrid	Spain	28574	5	4500.00	
29	Top Campo	Joseluis	Sanchez	685746512	974315924	C/Ibiza 32	NULL	Humanes	Madrid	Spain	28574	5	5500.00	
31	Campohermoso	Luis	Jimenez	645925376	916159116	C/Peru 78	NULL	Fuenlabrada	Madrid	Spain	28945	30	3250.00	
32	france telecom	FraÃ§ois	Toulou	(33)5120578961	(33)5120578961	6 place d Alleray 15Ã¨me	NULL	Paris	NULL	France	75010	16	10000.00	
33	Musée du Louvre	Pierre	Delacroux	(33)0140205050	(33)0140205442	Quai du Louvre	NULL	Paris	NULL	France	75058	16	30000.00	
37	The Magic Garden	Richard	Mcain	926523468	9364875882	Lihgting Park	NULL	London	London	United Kingdom	65930	18	10000.00	
```



4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
```sql
SELECT e.*
FROM empleado e LEFT JOIN oficina o 
	ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;

-- RESULTADO
-- No hay resultado
```



5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
```sql
SELECT e.*
FROM empleado e LEFT JOIN cliente cl
	ON e.codigo_empleado = cl.codigo_empleado_rep_ventas
WHERE cl.codigo_empleado_rep_ventas IS NULL;

-- RESULTADO
codigo_empleado	nombre	apellido1	apellido2	extension	email	codigo_oficina	codigo_jefe	puesto	
1	Marcos	Magaña	Perez	3897	marcos@jardineria.es	TAL-ES	NULL	Director General	
2	Ruben	López	Martinez	2899	rlopez@jardineria.es	TAL-ES	1	Subdirector Marketing	
3	Alberto	Soria	Carrasco	2837	asoria@jardineria.es	TAL-ES	2	Subdirector Ventas	
4	Maria	Solís	Jerez	2847	msolis@jardineria.es	TAL-ES	2	Secretaria	
6	Juan Carlos	Ortiz	Serrano	2845	cortiz@jardineria.es	TAL-ES	3	Representante Ventas	
7	Carlos	Soria	Jimenez	2444	csoria@jardineria.es	MAD-ES	3	Director Oficina	
10	Hilario	Rodriguez	Huertas	2444	hrodriguez@jardineria.es	MAD-ES	7	Representante Ventas	
13	David	Palma	Aceituno	2519	dpalma@jardineria.es	BCN-ES	11	Representante Ventas	
14	Oscar	Palma	Aceituno	2519	opalma@jardineria.es	BCN-ES	11	Representante Ventas	
15	Francois	Fignon		9981	ffignon@gardening.com	PAR-FR	3	Director Oficina	
17	Laurent	Serra		9982	lserra@gardening.com	PAR-FR	15	Representante Ventas	
20	Hilary	Washington		7565	hwashington@gardening.com	BOS-USA	3	Director Oficina	
21	Marcus	Paxton		7565	mpaxton@gardening.com	BOS-USA	20	Representante Ventas	
23	Nei	Nishikori		8734	nnishikori@gardening.com	TOK-JP	3	Director Oficina	
24	Narumi	Riko		8734	nriko@gardening.com	TOK-JP	23	Representante Ventas	
25	Takuma	Nomura		8735	tnomura@gardening.com	TOK-JP	23	Representante Ventas	
26	Amy	Johnson		3321	ajohnson@gardening.com	LON-UK	3	Director Oficina	
27	Larry	Westfalls		3322	lwestfalls@gardening.com	LON-UK	26	Representante Ventas	
28	John	Walton		3322	jwalton@gardening.com	LON-UK	26	Representante Ventas	
29	Kevin	Fallmer		3210	kfalmer@gardening.com	SYD-AU	3	Director Oficina	
```



6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
```sql
SELECT e.*, o.*
FROM empleado e LEFT JOIN cliente cl
	ON e.codigo_empleado = cl.codigo_empleado_rep_ventas INNER JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina
WHERE cl.codigo_empleado_rep_ventas IS NULL;

-- RESULTADO
codigo_empleado	nombre	apellido1	apellido2	extension	email	codigo_oficina	codigo_jefe	puesto	codigo_oficina	ciudad	pais	region	codigo_postal	telefono	linea_direccion1	linea_direccion2	
13	David	Palma	Aceituno	2519	dpalma@jardineria.es	BCN-ES	11	Representante Ventas	BCN-ES	Barcelona	España	Barcelona	08019	+34 93 3561182	Avenida Diagonal, 38	3A escalera Derecha	
14	Oscar	Palma	Aceituno	2519	opalma@jardineria.es	BCN-ES	11	Representante Ventas	BCN-ES	Barcelona	España	Barcelona	08019	+34 93 3561182	Avenida Diagonal, 38	3A escalera Derecha	
20	Hilary	Washington		7565	hwashington@gardening.com	BOS-USA	3	Director Oficina	BOS-USA	Boston	EEUU	MA	02108	+1 215 837 0825	1550 Court Place	Suite 102	
21	Marcus	Paxton		7565	mpaxton@gardening.com	BOS-USA	20	Representante Ventas	BOS-USA	Boston	EEUU	MA	02108	+1 215 837 0825	1550 Court Place	Suite 102	
26	Amy	Johnson		3321	ajohnson@gardening.com	LON-UK	3	Director Oficina	LON-UK	Londres	Inglaterra	EMEA	EC2N 1HN	+44 20 78772041	52 Old Broad Street	Ground Floor	
27	Larry	Westfalls		3322	lwestfalls@gardening.com	LON-UK	26	Representante Ventas	LON-UK	Londres	Inglaterra	EMEA	EC2N 1HN	+44 20 78772041	52 Old Broad Street	Ground Floor	
28	John	Walton		3322	jwalton@gardening.com	LON-UK	26	Representante Ventas	LON-UK	Londres	Inglaterra	EMEA	EC2N 1HN	+44 20 78772041	52 Old Broad Street	Ground Floor	
7	Carlos	Soria	Jimenez	2444	csoria@jardineria.es	MAD-ES	3	Director Oficina	MAD-ES	Madrid	España	Madrid	28032	+34 91 7514487	Bulevar Indalecio Prieto, 32		
10	Hilario	Rodriguez	Huertas	2444	hrodriguez@jardineria.es	MAD-ES	7	Representante Ventas	MAD-ES	Madrid	España	Madrid	28032	+34 91 7514487	Bulevar Indalecio Prieto, 32		
15	Francois	Fignon		9981	ffignon@gardening.com	PAR-FR	3	Director Oficina	PAR-FR	Paris	Francia	EMEA	75017	+33 14 723 4404	29 Rue Jouffroy d'abbans		
17	Laurent	Serra		9982	lserra@gardening.com	PAR-FR	15	Representante Ventas	PAR-FR	Paris	Francia	EMEA	75017	+33 14 723 4404	29 Rue Jouffroy d'abbans		
29	Kevin	Fallmer		3210	kfalmer@gardening.com	SYD-AU	3	Director Oficina	SYD-AU	Sydney	Australia	APAC	NSW 2010	+61 2 9264 2451	5-11 Wentworth Avenue	Floor #2	
1	Marcos	Magaña	Perez	3897	marcos@jardineria.es	TAL-ES	NULL	Director General	TAL-ES	Talavera de la Reina	España	Castilla-LaMancha	45632	+34 925 867231	Francisco Aguirre, 32	5º piso (exterior)	
2	Ruben	López	Martinez	2899	rlopez@jardineria.es	TAL-ES	1	Subdirector Marketing	TAL-ES	Talavera de la Reina	España	Castilla-LaMancha	45632	+34 925 867231	Francisco Aguirre, 32	5º piso (exterior)	
3	Alberto	Soria	Carrasco	2837	asoria@jardineria.es	TAL-ES	2	Subdirector Ventas	TAL-ES	Talavera de la Reina	España	Castilla-LaMancha	45632	+34 925 867231	Francisco Aguirre, 32	5º piso (exterior)	
4	Maria	Solís	Jerez	2847	msolis@jardineria.es	TAL-ES	2	Secretaria	TAL-ES	Talavera de la Reina	España	Castilla-LaMancha	45632	+34 925 867231	Francisco Aguirre, 32	5º piso (exterior)	
6	Juan Carlos	Ortiz	Serrano	2845	cortiz@jardineria.es	TAL-ES	3	Representante Ventas	TAL-ES	Talavera de la Reina	España	Castilla-LaMancha	45632	+34 925 867231	Francisco Aguirre, 32	5º piso (exterior)	
23	Nei	Nishikori		8734	nnishikori@gardening.com	TOK-JP	3	Director Oficina	TOK-JP	Tokyo	Japón	Chiyoda-Ku	102-8578	+81 33 224 5000	4-1 Kioicho		
24	Narumi	Riko		8734	nriko@gardening.com	TOK-JP	23	Representante Ventas	TOK-JP	Tokyo	Japón	Chiyoda-Ku	102-8578	+81 33 224 5000	4-1 Kioicho		
25	Takuma	Nomura		8735	tnomura@gardening.com	TOK-JP	23	Representante Ventas	TOK-JP	Tokyo	Japón	Chiyoda-Ku	102-8578	+81 33 224 5000	4-1 Kioicho		
```



7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
```sql
SELECT e.*
FROM empleado e LEFT JOIN oficina o 
    ON e.codigo_oficina = o.codigo_oficina LEFT JOIN cliente cl 
    ON e.codigo_empleado = cl.codigo_empleado_rep_ventas
WHERE o.codigo_oficina IS NULL AND cl.codigo_empleado_rep_ventas IS NULL;

-- RESULTADO
-- No hay resultado
```



8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
SELECT pr.*
FROM producto pr LEFT JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto LEFT JOIN pedido pe 
    ON dp.codigo_pedido = pe.codigo_pedido
WHERE pe.codigo_pedido IS NULL;

-- RESULTADO
codigo_producto	nombre	gama	dimensiones	proveedor	descripcion	cantidad_en_stock	precio_venta	precio_proveedor	
FR-104	Olea-Olivos	Frutales	12/4	Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	50	49.00	39.00	
FR-14	Calamondin Mini	Frutales		Frutales Talavera S.A	Se trata de un pequeño arbolito de copa densa, con...	15	10.00	8.00	
FR-19	Camelia Blanco, Chrysler Rojo, Soraya Naranja, 	Frutales		NaranjasValencianas.com		350	4.00	3.00	
FR-20	Landora Amarillo, Rose Gaujard bicolor blanco-rojo	Frutales		Frutales Talavera S.A		350	4.00	3.00	
FR-21	Kordes Perfect bicolor rojo-amarillo, Roundelay ro...	Frutales		Frutales Talavera S.A		350	4.00	3.00	
FR-24	Albaricoquero Corbato	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-25	Albaricoquero Moniqui	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-26	Albaricoquero Kurrot	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-27	Cerezo Burlat	Frutales		Jerte Distribuciones S.L.	Las principales especies de cerezo cultivadas en e...	400	8.00	6.00	
FR-28	Cerezo Picota	Frutales		Jerte Distribuciones S.L.	Las principales especies de cerezo cultivadas en e...	400	8.00	6.00	
FR-30	Ciruelo R. Claudia Verde   	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-32	Ciruelo Golden Japan	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-35	Ciruelo Claudia Negra	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-38	Higuera Verdal	Frutales		Frutales Talavera S.A	La higuera (Ficus carica L.) es un árbol típico de...	400	9.00	7.00	
FR-39	Higuera Breva	Frutales		Frutales Talavera S.A	La higuera (Ficus carica L.) es un árbol típico de...	400	9.00	7.00	
FR-44	Melocotonero Spring Crest	Frutales		Melocotones de Cieza S.A.	Árbol caducifolio de porte bajo con corteza lisa, ...	400	8.00	6.00	
FR-46	Melocotonero Federica	Frutales		Melocotones de Cieza S.A.	Árbol caducifolio de porte bajo con corteza lisa, ...	400	8.00	6.00	
FR-49	Parra Uva de Mesa	Frutales		Frutales Talavera S.A		400	8.00	6.00	
FR-5	Mandarino -Plantón joven	Frutales		Frutales Talavera S.A		15	6.00	4.00	
FR-50	Peral Castell	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-51	Peral Williams	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-52	Peral Conference	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-55	Olivo Cipresino	Frutales		Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	400	8.00	6.00	
FR-59	Albaricoquero	Frutales	10/12	Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	200	22.00	17.00	
FR-61	Albaricoquero	Frutales	14/16	Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	200	49.00	39.00	
```



9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, los primeros 50 caracteres de la descripción y la imagen del producto.
```sql
SELECT pr.nombre AS nombre_producto, SUBSTRING(pr.descripcion, 1, 50) AS primeros_50_caracteres, gp.imagen
FROM producto pr LEFT JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto LEFT JOIN pedido pe 
    ON dp.codigo_pedido = pe.codigo_pedido INNER JOIN gama_producto gp 
    ON pr.gama = gp.gama
WHERE pe.codigo_pedido IS NULL;

-- RESULTADO
nombre_producto	primeros_50_caracteres	imagen	
Olea-Olivos	Existen dos hipótesis sobre el origen del olivo, u	NULL	
Calamondin Mini	Se trata de un pequeño arbolito de copa densa, con	NULL	
Camelia Blanco, Chrysler Rojo, Soraya Naranja, 		NULL	
Landora Amarillo, Rose Gaujard bicolor blanco-rojo		NULL	
Kordes Perfect bicolor rojo-amarillo, Roundelay ro...		NULL	
Albaricoquero Corbato	árbol que puede pasar de los 6 m de altura, en la 	NULL	
Albaricoquero Moniqui	árbol que puede pasar de los 6 m de altura, en la 	NULL	
Albaricoquero Kurrot	árbol que puede pasar de los 6 m de altura, en la 	NULL	
Cerezo Burlat	Las principales especies de cerezo cultivadas en e	NULL	
Cerezo Picota	Las principales especies de cerezo cultivadas en e	NULL	
Ciruelo R. Claudia Verde   	árbol de tamaño mediano que alcanza una altura máx	NULL	
Ciruelo Golden Japan	árbol de tamaño mediano que alcanza una altura máx	NULL	
Ciruelo Claudia Negra	árbol de tamaño mediano que alcanza una altura máx	NULL	
Higuera Verdal	La higuera (Ficus carica L.) es un árbol típico de	NULL	
Higuera Breva	La higuera (Ficus carica L.) es un árbol típico de	NULL	
Melocotonero Spring Crest	Árbol caducifolio de porte bajo con corteza lisa, 	NULL	
Melocotonero Federica	Árbol caducifolio de porte bajo con corteza lisa, 	NULL	
Parra Uva de Mesa		NULL	
Mandarino -Plantón joven		NULL	
Peral Castell	Árbol piramidal, redondeado en su juventud, luego 	NULL	
Peral Williams	Árbol piramidal, redondeado en su juventud, luego 	NULL	
Peral Conference	Árbol piramidal, redondeado en su juventud, luego 	NULL	
Olivo Cipresino	Existen dos hipótesis sobre el origen del olivo, u	NULL	
Albaricoquero	árbol que puede pasar de los 6 m de altura, en la 	NULL	
Albaricoquero	árbol que puede pasar de los 6 m de altura, en la 	NULL	
```



10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
SELECT o.*
FROM oficina o LEFT JOIN empleado e 
	ON o.codigo_oficina = e.codigo_oficina INNER JOIN cliente cl 
    ON e.codigo_empleado = cl.codigo_empleado_rep_ventas INNER JOIN pedido pe
    ON cl.codigo_cliente = pe.codigo_cliente INNER JOIN detalle_pedido dp
    ON pe.codigo_pedido = dp.codigo_pedido INNER JOIN producto pr 
    ON dp.codigo_producto = pr.codigo_producto INNER JOIN gama_producto gp
    ON pr.codigo_producto = gp.gama
WHERE e.codigo_oficina IS NULL AND gp.gama = 'Frutales';

-- RESULTADO
-- No hay resultados
```



11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
SELECT DISTINCT(cl.codigo_cliente), cl.nombre_cliente, cl.nombre_contacto, cl.apellido_contacto, cl.telefono, cl.fax, cl.linea_direccion1, cl.linea_direccion2, cl.ciudad, cl.region, cl.pais, cl.codigo_postal, cl.codigo_empleado_rep_ventas, cl.limite_credito
FROM cliente cl INNER JOIN pedido pe
	ON cl.codigo_cliente = pe.codigo_cliente LEFT JOIN pago pa 
    ON pe.codigo_cliente = pa.codigo_cliente
WHERE pa.codigo_cliente IS NULL;

-- RESULTADO
36	Flores S.L.	Antonio	Romero	654352981	685249700	Avenida España	NULL	Madrid	Fuenlabrada	Spain	29643	18	6000.00	
```



12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
```sql
SELECT 
	em.*, jef.nombre AS nombre_jefe
FROM empleado em LEFT JOIN cliente cl 
 	ON em.codigo_empleado = cl.codigo_empleado_rep_ventas INNER JOIN empleado jef
    ON em.codigo_jefe = jef.codigo_empleado
WHERE cl.codigo_empleado_rep_ventas IS NULL;

-- RESULTADO
codigo_empleado	nombre	apellido1	apellido2	extension	email	codigo_oficina	codigo_jefe	puesto	nombre_jefe	
2	Ruben	López	Martinez	2899	rlopez@jardineria.es	TAL-ES	1	Subdirector Marketing	Marcos	
3	Alberto	Soria	Carrasco	2837	asoria@jardineria.es	TAL-ES	2	Subdirector Ventas	Ruben	
4	Maria	Solís	Jerez	2847	msolis@jardineria.es	TAL-ES	2	Secretaria	Ruben	
6	Juan Carlos	Ortiz	Serrano	2845	cortiz@jardineria.es	TAL-ES	3	Representante Ventas	Alberto	
7	Carlos	Soria	Jimenez	2444	csoria@jardineria.es	MAD-ES	3	Director Oficina	Alberto	
10	Hilario	Rodriguez	Huertas	2444	hrodriguez@jardineria.es	MAD-ES	7	Representante Ventas	Carlos	
13	David	Palma	Aceituno	2519	dpalma@jardineria.es	BCN-ES	11	Representante Ventas	Emmanuel	
14	Oscar	Palma	Aceituno	2519	opalma@jardineria.es	BCN-ES	11	Representante Ventas	Emmanuel	
15	Francois	Fignon		9981	ffignon@gardening.com	PAR-FR	3	Director Oficina	Alberto	
17	Laurent	Serra		9982	lserra@gardening.com	PAR-FR	15	Representante Ventas	Francois	
20	Hilary	Washington		7565	hwashington@gardening.com	BOS-USA	3	Director Oficina	Alberto	
21	Marcus	Paxton		7565	mpaxton@gardening.com	BOS-USA	20	Representante Ventas	Hilary	
23	Nei	Nishikori		8734	nnishikori@gardening.com	TOK-JP	3	Director Oficina	Alberto	
24	Narumi	Riko		8734	nriko@gardening.com	TOK-JP	23	Representante Ventas	Nei	
25	Takuma	Nomura		8735	tnomura@gardening.com	TOK-JP	23	Representante Ventas	Nei	
26	Amy	Johnson		3321	ajohnson@gardening.com	LON-UK	3	Director Oficina	Alberto	
27	Larry	Westfalls		3322	lwestfalls@gardening.com	LON-UK	26	Representante Ventas	Amy	
28	John	Walton		3322	jwalton@gardening.com	LON-UK	26	Representante Ventas	Amy	
29	Kevin	Fallmer		3210	kfalmer@gardening.com	SYD-AU	3	Director Oficina	Alberto	
```





[A4.4.7] 📝Consultas resumen jardineria ❓:
1. ¿Cuántos empleados hay en la compañía?
```sql
SELECT COUNT(em.codigo_empleado) AS cantidad_empleados
FROM empleado em;

-- RESULTADO
31	
```



2. ¿Cuántos clientes tiene cada país?
```sql
SELECT cl.pais, COUNT(cl.codigo_cliente) AS cantidad_clientes
FROM cliente cl
GROUP BY cl.pais;

-- RESULTADO
pais	cantidad_clientes	
Australia	2	
France	2	
Spain	27	
United Kingdom	1	
USA	4	
```



3. ¿Cuál fue el pago medio en 2009?
```sql
SELECT ROUND(AVG(pa.total), 2) AS pago_media
FROM pago pa 
WHERE YEAR(pa.fecha_pago) = 2009;

-- RESULTADO
4504.08	
```



4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql
SELECT pe.estado, COUNT(pe.codigo_pedido) AS cantidad_pedidos
FROM pedido pe
GROUP BY pe.estado
ORDER BY cantidad_pedidos DESC;

-- RESULTADO
estado	cantidad_pedidos   	
Entregado	61	
Pendiente	30	
Rechazado	24	
```



5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql
SELECT MAX(pr.precio_venta) AS precio_maximo, MIN(pr.precio_venta) AS precio_minimo
FROM producto pr


-- RESULTADO
462.00	1.00	
```



6. Calcula el número de clientes que tiene la empresa.
```sql
SELECT COUNT(cl.nombre_cliente) AS cantidad_clientes
FROM cliente cl;

-- RESULTADO
36	
```



7. ¿Cuántos clientes tiene la ciudad de Madrid?
```sql
SELECT COUNT(cl.nombre_cliente) AS cantidad_clientes_de_Madrid
FROM cliente cl
WHERE cl.ciudad = 'Madrid';

-- RESULTADO
11	
```



8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
SELECT cl.ciudad, COUNT(cl.nombre_cliente) AS cantidad_clientes
FROM cliente cl
WHERE cl.ciudad LIKE 'M%'
GROUP BY cl.ciudad;

-- RESULTADO
ciudad	cantidad_clientes	
Madrid	11	
Miami	2	
Montornes del valles	1	
```



9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
SELECT e.nombre, COUNT(cl.codigo_cliente) AS cantidad_clientes
FROM cliente cl INNER JOIN empleado e 
	ON cl.codigo_empleado_rep_ventas = e.codigo_empleado
GROUP BY e.nombre;

-- RESULTADO
nombre	cantidad_clientes	
Emmanuel	5	
Felipe	5	
José Manuel	5	
Julian	5	
Lionel	2	
Lorena	2	
Lucio	2	
Mariano	4	
Mariko	2	
Michael	2	
Walter Santiago	2	
```



10. Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
SELECT COUNT(cl.codigo_cliente) AS cantidad_clientes_sin_repre_ventas
FROM cliente cl LEFT JOIN empleado e 
	ON cl.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.codigo_empleado IS NULL;

-- RESULTADO
0
```



11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
SELECT cl.nombre_cliente, MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago
FROM pago p INNER JOIN cliente cl 
	ON p.codigo_cliente = cl.codigo_cliente
GROUP BY cl.nombre_cliente;

-- RESULTADO
nombre_cliente	primer_pago	ultimo_pago	
Agrojardin	2009-01-13	2009-01-13	
Beragua	2009-01-13	2009-01-13	
Camunas Jardines S.L.	2008-08-04	2008-08-04	
Dardena S.A.	2008-07-15	2008-07-15	
El Jardin Viviente S.L	2006-05-26	2006-05-26	
Flores Marivi	2009-02-16	2009-02-16	
Gardening Associates	2009-01-16	2009-02-19	
Gerudo Valley	2007-01-08	2007-01-08	
GoldFish Garden	2008-11-10	2008-12-10	
Golf S.A.	2009-03-06	2009-03-06	
Jardin de Flores	2009-01-15	2009-02-15	
Jardineria Sara	2009-01-16	2009-01-16	
Jardinerías Matías SL	2009-02-08	2009-02-08	
Jardines y Mansiones Cactus SL	2008-03-18	2008-03-18	
Naturagua	2009-01-06	2009-01-06	
Sotogrande	2009-03-26	2009-03-26	
Tendo Garden	2006-01-18	2006-01-18	
Tutifruti S.A	2007-10-06	2007-10-06	
```



12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
SELECT DISTINCT(pe.codigo_pedido), COUNT(pr.codigo_producto) AS cantidad_productos
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto INNER JOIN pedido pe 
    ON dp.codigo_pedido = pe.codigo_pedido
GROUP BY pe.codigo_pedido;

-- RESULTADO
codigo_pedido	cantidad_productos	
1	5	
2	7	
3	6	
4	8	
8	3	
9	4	
10	3	
11	2	
12	1	
13	3	
14	2	
15	4	
16	2	
17	5	
18	3	
19	5	
20	2	
21	3	
22	1	
23	4	
24	4	
25	3	
26	3	
27	3	
28	3	
```



13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
SELECT pe.codigo_pedido, SUM(pr.precio_venta) AS cantidad_productos
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto INNER JOIN pedido pe 
    ON dp.codigo_pedido = pe.codigo_pedido
GROUP BY pe.codigo_pedido;

-- RESULTADO
codigo_pedido	cantidad_productos	
1	114.00	
2	577.00	
3	374.00	
4	143.00	
8	143.00	
9	104.00	
10	214.00	
11	463.00	
12	1.00	
13	128.00	
14	68.00	
15	39.00	
16	21.00	
17	75.00	
18	22.00	
19	69.00	
20	26.00	
21	26.00	
22	6.00	
23	98.00	
24	46.00	
25	131.00	
26	75.00	
27	18.00	
28	828.00
```



14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql
SELECT dp.codigo_pedido, pr.nombre, COUNT(dp.cantidad) AS cantidad_pedidos
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto
GROUP BY pr.codigo_producto
ORDER BY cantidad_pedidos DESC
LIMIT 20;

-- SQL Server 
SELECT TOP 20 dp.codigo_pedido, pr.nombre, COUNT(dp.cantidad) AS cantidad_pedidos
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto
GROUP BY pr.codigo_producto
ORDER BY cantidad_pedidos DESC;

-- RESULTADO
codigo_pedido	nombre	cantidad_pedidos   	
1	Cerezo	28	
16	Azadón	8	
8	Limonero 30/40	7	
2	Chamaerops Humilis	7	
17	Rastrillo de Jardín	7	
13	Sierra de Poda 400MM	7	
13	Pala	6	
19	Tuja orientalis "Aurea nana"	6	
12	Thymus Vulgaris	6	
4	Acer Pseudoplatanus 	6	
2	Trachycarpus Fortunei	6	
23	Kaki	5	
25	Melocotonero	5	
21	Peral Blanq. de Aranjuez	4	
24	Expositor Cítricos Mix	4	
75	Manzano	4	
9	Ajedrea	4	
14	Nectarina	4	
8	Peral	4	
11	Petrosilium Hortense (Peregil)	4	
```



15.  La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos 
```sql
SELECT 
    SUM(dp.precio_unidad * cantidad) AS base,
    SUM(dp.precio_unidad * cantidad * 0.21) AS iva,
    SUM(dp.precio_unidad * cantidad * 1.21) AS total,
    SUM((dp.precio_unidad * cantidad) + (dp.precio_unidad * 0.21)) total2
FROM detalle_pedido dp

SELECT 
	SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
    (SUM((dp.precio_unidad * dp.cantidad)) * 0.21) AS IVA,
    SUM(dp.precio_unidad * dp.cantidad + ((dp.precio_unidad * dp.cantidad) * 0.21)) AS total
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto;

-- RESULTADO
217738.00	45724.9800	263462.9800	
```


anteriores.
16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
```sql
SELECT
	pr.codigo_producto,
	SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
    (SUM((dp.precio_unidad * dp.cantidad)) * 0.21) AS IVA,
    SUM(dp.precio_unidad * dp.cantidad + ((dp.precio_unidad * dp.cantidad) * 0.21)) AS total
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto
GROUP BY pr.codigo_producto;    

-- RESULTADO
codigo_producto	base_imponible	IVA	total	
11679	630.00	132.3000	762.3000	
21636	564.00	118.4400	682.4400	
22225	996.00	209.1600	1205.1600	
30310	2640.00	554.4000	3194.4000	
AR-001	135.00	28.3500	163.3500	
AR-002	128.00	26.8800	154.8800	
AR-003	17.00	3.5700	20.5700	
AR-004	30.00	6.3000	36.3000	
AR-005	21.00	4.4100	25.4100	
AR-006	291.00	61.1100	352.1100	
AR-007	9.00	1.8900	10.8900	
AR-008	455.00	95.5500	550.5500	
AR-009	986.00	207.0600	1193.0600	
AR-010	10.00	2.1000	12.1000	
FR-1	168.00	35.2800	203.2800	
FR-10	119.00	24.9900	143.9900	
FR-100	1209.00	253.8900	1462.8900	
FR-101	247.00	51.8700	298.8700	
FR-102	668.00	140.2800	808.2800	
FR-103	25.00	5.2500	30.2500	
FR-105	280.00	58.8000	338.8000	
FR-106	673.00	141.3300	814.3300	
FR-107	1100.00	231.0000	1331.0000	
FR-108	468.00	98.2800	566.2800	
FR-11	13092.00	2749.3200	15841.3200	
```



17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
```sql
SELECT
	pr.codigo_producto,
	SUM(dp.precio_unidad * dp.cantidad) AS base_imponible,
    (SUM((dp.precio_unidad * dp.cantidad)) * 0.21) AS IVA,
    SUM(dp.precio_unidad * dp.cantidad + ((dp.precio_unidad * dp.cantidad) * 0.21)) AS total
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto
GROUP BY pr.codigo_producto;    
HAVING pr.codigo_producto LIKE 'OR%'    

-- RESULTADO
codigo_producto	base_imponible	IVA	total	
OR-101	144.00	30.2400	174.2400	
OR-102	1302.00	273.4200	1575.4200	
OR-104	200.00	42.0000	242.0000	
OR-115	63.00	13.2300	76.2300	
OR-116	98.00	20.5800	118.5800	
OR-119	50.00	10.5000	60.5000	
OR-120	25.00	5.2500	30.2500	
OR-122	160.00	33.6000	193.6000	
OR-123	70.00	14.7000	84.7000	
OR-125	15.00	3.1500	18.1500	
OR-127	160.00	33.6000	193.6000	
OR-128	2900.00	609.0000	3509.0000	
OR-129	337.00	70.7700	407.7700	
OR-130	216.00	45.3600	261.3600	
OR-136	2286.00	480.0600	2766.0600	
OR-139	320.00	67.2000	387.2000	
OR-140	200.00	42.0000	242.0000	
OR-141	200.00	42.0000	242.0000	
OR-146	68.00	14.2800	82.2800	
OR-147	42.00	8.8200	50.8200	
OR-150	36.00	7.5600	43.5600	
OR-152	18.00	3.7800	21.7800	
OR-155	24.00	5.0400	29.0400	
OR-156	313.00	65.7300	378.7300	
OR-157	2620.00	550.2000	3170.2000	
```



18.  Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
```sql
SELECT 
	pr.nombre, 
    dp.cantidad, 
    (dp.cantidad * dp.precio_unidad) AS total_facturado,
    (dp.cantidad * dp.precio_unidad) + ((dp.cantidad * dp.precio_unidad) * 0.21) AS total
FROM producto pr INNER JOIN detalle_pedido dp 
	ON pr.codigo_producto = dp.codigo_producto 
GROUP BY pr.codigo_producto
HAVING total > 3000;

-- RESULTADO
nombre	cantidad	total_facturado	total	
Camelia japonica ejemplar	29	2900.00	3509.0000	
Beucarnea Recurvata	80	3120.00	3775.2000	
Beucarnea Recurvata	70	4130.00	4997.3000	
Bismarckia Nobilis	30	7980.00	9655.8000	
Chamaerops Humilis	67	4288.00	5188.4800	
```



[A4.4.8] 📝Subconsultas jardineria ❓:
[A4.4.8.1] Con operadores básicos de comparación
1. Devuelve el nombre del cliente con mayor límite de crédito.
```sql 
SELECT cl.nombre_cliente 
FROM cliente cl
WHERE cl.limite_credito = (
    						SELECT MAX(limite_credito)
                          	FROM cliente
							);

-- RESULTADO
Tendo Garden	
```


2. Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql 
SELECT pr.nombre
FROM producto pr
WHERE pr.precio_venta = (
							SELECT MAX(pr1.precio_venta)
							FROM producto pr1
                        );

-- RESULTADO
Trachycarpus Fortunei	
```



3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código del producto, puede obtener su nombre fácilmente.)
```sql 
SELECT pr.nombre
FROM producto pr 
WHERE pr.codigo_producto = (
                                SELECT dp2.codigo_producto
                                FROM detalle_pedido dp2
                                GROUP BY dp2.codigo_producto
                                ORDER BY SUM(dp2.cantidad) DESC
                                LIMIT 1
							);
-- RESULTADO
Thymus Vulgaris	
```



4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
```sql 
SELECT cl.nombre_cliente, cl.limite_credito
FROM cliente cl 
WHERE cl.codigo_cliente = (
                            SELECT pa.codigo_cliente
                            FROM pago pa      
                            WHERE cl.codigo_cliente = pa.codigo_cliente AND cl.limite_credito > pa.total
							LIMIT 1
							);

-- RESULTADO
nombre_cliente	limite_credito	
GoldFish Garden	3000.00	
Gardening Associates	6000.00	
Gerudo Valley	12000.00	
Tendo Garden	600000.00	
Beragua	20000.00	
Naturagua	32000.00	
Camunas Jardines S.L.	16481.00	
Dardena S.A.	321000.00	
Jardin de Flores	40000.00	
Golf S.A.	30000.00	
Sotogrande	60000.00	
Jardines y Mansiones Cactus SL	76000.00	
Jardinerías Matías SL	100500.00	
Tutifruti S.A	10000.00	
El Jardin Viviente S.L	8000.00	
```



5. Devuelve el producto que más unidades tiene en stock.
```sql 
SELECT pr.nombre
FROM producto pr
WHERE pr.cantidad_en_stock = (
								SELECT MAX(pr2.cantidad_en_stock)
    							FROM producto pr2
							);
                            
-- RESULTADO
nombre	
Rosal copa 	
Albaricoquero Corbato	
Albaricoquero Moniqui	
Albaricoquero Kurrot	
Cerezo Burlat	
Cerezo Picota	
Cerezo Napoleón	
Ciruelo R. Claudia Verde   	
Ciruelo Santa Rosa	
Ciruelo Golden Japan	
Ciruelo Friar	
Ciruelo Reina C. De Ollins	
Ciruelo Claudia Negra	
Granado Mollar de Elche	
Higuera Napolitana	
Higuera Verdal	
Higuera Breva	
Manzano Starking Delicious	
Manzano Reineta	
Manzano Golden Delicious	
Membrillero Gigante de Wranja	
Melocotonero Spring Crest	
Melocotonero Amarillo de Agosto	
Melocotonero Federica	
Melocotonero Paraguayo	
```



6. Devuelve el producto que menos unidades tiene en stock.
```sql 
SELECT pr.nombre
FROM producto pr
WHERE pr.cantidad_en_stock = (
								SELECT MIN(pr2.cantidad_en_stock)
    							FROM producto pr2
							);
                            
-- RESULTADO
Brahea Armata	
```



7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de **Alberto Soria**.
```sql 
SELECT em.nombre, em.apellido1, em.apellido2, em.email
FROM empleado em
WHERE em.codigo_empleado = (SELECT em2.codigo_jefe
                           FROM empleado em2
                           WHERE em.codigo_empleado = em2.codigo_jefe
                           AND em2.nombre = 'Alberto' AND em2.apellido1 = 'Soria'
                           );

-- RESULTADO
Ruben	López	Martinez	rlopez@jardineria.es	
```


[A4.4.8.2] Subconsultas con ALL y ANY
8. Devuelve el nombre del cliente con mayor límite de crédito.
```sql 
SELECT cl.nombre_cliente
FROM cliente cl
WHERE cl.limite_credito >= ALL (SELECT MAX(cl1.limite_credito)
                                FROM cliente cl1
                           		);

-- RESULTADO
Tendo Garden
```



9. Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql 
SELECT pr.nombre
FROM producto pr
WHERE pr.precio_venta >= ALL (SELECT MAX(pr1.precio_venta)
                             FROM producto pr1);

-- RESULTADO
Trachycarpus Fortunei	
```



10. Devuelve el producto que menos unidades tiene en stock.
```sql 
SELECT pr.nombre
FROM producto pr
WHERE pr.cantidad_en_stock <= ANY (SELECT MIN(pr1.cantidad_en_stock)
                             FROM producto pr1);

-- RESULTADO
Brahea Armata	
```



[A4.4.8.3] Subconsultas con IN y NOT IN
11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
```sql 
SELECT em.nombre, em.apellido1, em.puesto
FROM empleado em 
WHERE em.codigo_empleado NOT IN (SELECT cl.codigo_empleado_rep_ventas
                           	FROM cliente cl );
                            
-- RESULTADO
nombre	apellido1	puesto	
Marcos	Magaña	Director General	
Ruben	López	Subdirector Marketing	
Alberto	Soria	Subdirector Ventas	
Maria	Solís	Secretaria	
Juan Carlos	Ortiz	Representante Ventas	
Carlos	Soria	Director Oficina	
Hilario	Rodriguez	Representante Ventas	
David	Palma	Representante Ventas	
Oscar	Palma	Representante Ventas	
Francois	Fignon	Director Oficina	
Laurent	Serra	Representante Ventas	
Hilary	Washington	Director Oficina	
Marcus	Paxton	Representante Ventas	
Nei	Nishikori	Director Oficina	
Narumi	Riko	Representante Ventas	
Takuma	Nomura	Representante Ventas	
Amy	Johnson	Director Oficina	
Larry	Westfalls	Representante Ventas	
John	Walton	Representante Ventas	
Kevin	Fallmer	Director Oficina	
```



12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql 
SELECT cl.nombre_cliente, cl.nombre_cliente
FROM cliente cl INNER JOIN pedido p 
    ON cl.codigo_cliente = p.codigo_cliente
WHERE cl.codigo_cliente NOT IN (SELECT pa.codigo_cliente
                                FROM pago pa
                                );

-- RESULTADO
codigo_cliente  nombre_cliente
36  Flores S.L.	
```



13. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.
```sql 
SELECT cl.nombre_cliente
FROM cliente cl
WHERE cl.codigo_cliente IN (SELECT pa.codigo_cliente
                           FROM pago pa
                           );
                            
-- RESULTADO
nombre_cliente	
GoldFish Garden	
Gardening Associates	
Gerudo Valley	
Tendo Garden	
Beragua	
Naturagua	
Camunas Jardines S.L.	
Dardena S.A.	
Jardin de Flores	
Flores Marivi	
Golf S.A.	
Sotogrande	
Jardines y Mansiones Cactus SL	
Jardinerías Matías SL	
Agrojardin	
Jardineria Sara	
Tutifruti S.A	
El Jardin Viviente S.L	
```



14. Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql 
SELECT pr.nombre
FROM producto pr 
WHERE pr.codigo_producto NOT IN (SELECT dp.codigo_producto
                                 FROM detalle_pedido dp
                                 );

-- RESULTADO
nombre	
Olea-Olivos	
Calamondin Mini	
Camelia Blanco, Chrysler Rojo, Soraya Naranja, 	
Landora Amarillo, Rose Gaujard bicolor blanco-rojo	
Kordes Perfect bicolor rojo-amarillo, Roundelay ro...	
Albaricoquero Corbato	
Albaricoquero Moniqui	
Albaricoquero Kurrot	
Cerezo Burlat	
Cerezo Picota	
Ciruelo R. Claudia Verde   	
Ciruelo Golden Japan	
Ciruelo Claudia Negra	
Higuera Verdal	
Higuera Breva	
Melocotonero Spring Crest	
Melocotonero Federica	
Parra Uva de Mesa	
Mandarino -Plantón joven	
Peral Castell	
Peral Williams	
Peral Conference	
Olivo Cipresino	
Albaricoquero	
Albaricoquero	
```



15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql 
SELECT em.nombre, em.apellido1, em.apellido2, o.telefono
FROM empleado em INNER JOIN oficina o 
	ON em.codigo_oficina = o.codigo_oficina
WHERE em.codigo_empleado NOT IN  (SELECT cl.codigo_empleado_rep_ventas
                                 FROM cliente cl);

-- RESULTADO
nombre	apellido1	apellido2	telefono	
David	Palma	Aceituno	+34 93 3561182	
Oscar	Palma	Aceituno	+34 93 3561182	
Hilary	Washington		+1 215 837 0825	
Marcus	Paxton		+1 215 837 0825	
Amy	Johnson		+44 20 78772041	
Larry	Westfalls		+44 20 78772041	
John	Walton		+44 20 78772041	
Carlos	Soria	Jimenez	+34 91 7514487	
Hilario	Rodriguez	Huertas	+34 91 7514487	
Francois	Fignon		+33 14 723 4404	
Laurent	Serra		+33 14 723 4404	
Kevin	Fallmer		+61 2 9264 2451	
Marcos	Magaña	Perez	+34 925 867231	
Ruben	López	Martinez	+34 925 867231	
Alberto	Soria	Carrasco	+34 925 867231	
Maria	Solís	Jerez	+34 925 867231	
Juan Carlos	Ortiz	Serrano	+34 925 867231	
Nei	Nishikori		+81 33 224 5000	
Narumi	Riko		+81 33 224 5000	
Takuma	Nomura		+81 33 224 5000	
```



16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql 
SELECT o.*
FROM oficina o
WHERE o.codigo_oficina NOT IN (SELECT e.codigo_oficina
                               FROM empleado e INNER JOIN cliente cl
                               ON e.codigo_empleado = cl.codigo_empleado_rep_ventas INNER JOIN pago pa 
                               ON cl.codigo_cliente = pa.codigo_cliente INNER JOIN pedido pe 
                               ON cl.codigo_cliente = pe.codigo_cliente INNER JOIN detalle_pedido dp 
                               ON pe.codigo_pedido = dp.codigo_pedido INNER JOIN producto pr 
                               ON dp.codigo_producto = pr.codigo_producto INNER JOIN gama_producto ga
                               ON pr.gama = ga.gama
                               AND ga.gama = 'Frutales');

-- RESULTADO
codigo_oficina	ciudad	pais	region	codigo_postal	telefono	linea_direccion1	linea_direccion2	
LON-UK	Londres	Inglaterra	EMEA	EC2N 1HN	+44 20 78772041	52 Old Broad Street	Ground Floor	
PAR-FR	Paris	Francia	EMEA	75017	+33 14 723 4404	29 Rue Jouffroy d'abbans		
TOK-JP	Tokyo	Japón	Chiyoda-Ku	102-8578	+81 33 224 5000	4-1 Kioicho		
```



17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql 
SELECT cl.*
FROM cliente cl
WHERE cl.codigo_cliente IN (SELECT pe.codigo_pedido
                           FROM pedido pe) 
      AND cl.codigo_cliente NOT IN (SELECT pa.codigo_cliente
                                    FROM pago pa);

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	
12	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
17	Flowers, S.A	Beatriz	Fernandez	698754159	978453216	C/Luis Salquillo4	NULL	Montornes del valles	Barcelona	Spain	24586	5	3500.00	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	
20	Americh Golf Management SL	Mario	Suarez	964493072	964493063	C/Letardo	NULL	Barcelona	Cataluña	Spain	12320	12	20000.00	
21	Aloha	Cristian	Rodrigez	916485852	914489898	C/Roman 3	NULL	Canarias	Canarias	Spain	35488	12	50000.00	
22	El Prat	Francisco	Camacho	916882323	916493211	Avenida Tibidabo	NULL	Barcelona	Cataluña	Spain	12320	12	30000.00	
24	Vivero Humanes	Federico	Gomez	654987690	916040875	C/Miguel Echegaray 54	NULL	Humanes	Madrid	Spain	28970	30	7430.00	
25	Fuenla City	Tony	Muñoz Mena	675842139	915483754	C/Callo 52	NULL	Fuenlabrada	Madrid	Spain	28574	5	4500.00	
29	Top Campo	Joseluis	Sanchez	685746512	974315924	C/Ibiza 32	NULL	Humanes	Madrid	Spain	28574	5	5500.00	
31	Campohermoso	Luis	Jimenez	645925376	916159116	C/Peru 78	NULL	Fuenlabrada	Madrid	Spain	28945	30	3250.00	
32	france telecom	FraÃ§ois	Toulou	(33)5120578961	(33)5120578961	6 place d Alleray 15Ã¨me	NULL	Paris	NULL	France	75010	16	10000.00	
33	Musée du Louvre	Pierre	Delacroux	(33)0140205050	(33)0140205442	Quai du Louvre	NULL	Paris	NULL	France	75058	16	30000.00	
36	Flores S.L.	Antonio	Romero	654352981	685249700	Avenida España	NULL	Madrid	Fuenlabrada	Spain	29643	18	6000.00	
37	The Magic Garden	Richard	Mcain	926523468	9364875882	Lihgting Park	NULL	London	London	United Kingdom	65930	18	10000.00	
```



[A4.4.8.4] Subconsultas con EXISTS y NOT EXISTS
18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql 
SELECT cl.*
FROM cliente cl
WHERE NOT EXISTS (SELECT *
              		FROM pago pa
                 	WHERE cl.codigo_cliente = pa.codigo_cliente);

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
6	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
8	Club Golf Puerta del hierro	Paco	Lopez	62456810	919535678	C/sinesio delgado	Madrid	Madrid	Madrid	Spain	28930	11	40000.00	
10	DaraDistribuciones	David	Serrano	675598001	916421756	C/azores	Fuenlabrada	Madrid	Madrid	Spain	28946	11	50000.00	
11	Madrileña de riegos	Jose	Tacaño	655983045	916689215	C/Lagañas	Fuenlabrada	Madrid	Madrid	Spain	28943	11	20000.00	
12	Lasas S.A.	Antonio	Lasas	34916540145	34914851312	C/Leganes 15	NULL	Fuenlabrada	Madrid	Spain	28945	8	154310.00	
17	Flowers, S.A	Beatriz	Fernandez	698754159	978453216	C/Luis Salquillo4	NULL	Montornes del valles	Barcelona	Spain	24586	5	3500.00	
18	Naturajardin	Victoria	Cruz	612343529	916548735	Plaza Magallón 15	NULL	Madrid	Madrid	Spain	28011	30	5050.00	
20	Americh Golf Management SL	Mario	Suarez	964493072	964493063	C/Letardo	NULL	Barcelona	Cataluña	Spain	12320	12	20000.00	
21	Aloha	Cristian	Rodrigez	916485852	914489898	C/Roman 3	NULL	Canarias	Canarias	Spain	35488	12	50000.00	
22	El Prat	Francisco	Camacho	916882323	916493211	Avenida Tibidabo	NULL	Barcelona	Cataluña	Spain	12320	12	30000.00	
24	Vivero Humanes	Federico	Gomez	654987690	916040875	C/Miguel Echegaray 54	NULL	Humanes	Madrid	Spain	28970	30	7430.00	
25	Fuenla City	Tony	Muñoz Mena	675842139	915483754	C/Callo 52	NULL	Fuenlabrada	Madrid	Spain	28574	5	4500.00	
29	Top Campo	Joseluis	Sanchez	685746512	974315924	C/Ibiza 32	NULL	Humanes	Madrid	Spain	28574	5	5500.00	
31	Campohermoso	Luis	Jimenez	645925376	916159116	C/Peru 78	NULL	Fuenlabrada	Madrid	Spain	28945	30	3250.00	
32	france telecom	FraÃ§ois	Toulou	(33)5120578961	(33)5120578961	6 place d Alleray 15Ã¨me	NULL	Paris	NULL	France	75010	16	10000.00	
33	Musée du Louvre	Pierre	Delacroux	(33)0140205050	(33)0140205442	Quai du Louvre	NULL	Paris	NULL	France	75058	16	30000.00	
36	Flores S.L.	Antonio	Romero	654352981	685249700	Avenida España	NULL	Madrid	Fuenlabrada	Spain	29643	18	6000.00	
37	The Magic Garden	Richard	Mcain	926523468	9364875882	Lihgting Park	NULL	London	London	United Kingdom	65930	18	10000.00	
```



19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql 
SELECT cl.*
FROM cliente cl
WHERE EXISTS (SELECT *
              		FROM pago pa
                 	WHERE cl.codigo_cliente = pa.codigo_cliente);

-- RESULTADO
codigo_cliente	nombre_cliente	nombre_contacto	apellido_contacto	telefono	fax	linea_direccion1	linea_direccion2	ciudad	region	pais	codigo_postal	codigo_empleado_rep_ventas	limite_credito	
1	GoldFish Garden	Daniel G	GoldFish	5556901745	5556901746	False Street 52 2 A	NULL	San Francisco	NULL	USA	24006	19	3000.00	
3	Gardening Associates	Anne	Wright	5557410345	5557410346	Wall-e Avenue	NULL	Miami	Miami	USA	24010	19	6000.00	
4	Gerudo Valley	Link	Flaute	5552323129	5552323128	Oaks Avenue nº22	NULL	New York	NULL	USA	85495	22	12000.00	
5	Tendo Garden	Akane	Tendo	55591233210	55591233211	Null Street nº69	NULL	Miami	NULL	USA	696969	22	600000.00	
7	Beragua	Jose	Bermejo	654987321	916549872	C/pintor segundo	Getafe	Madrid	Madrid	Spain	28942	11	20000.00	
9	Naturagua	Guillermo	Rengifo	689234750	916428956	C/majadahonda	Boadilla	Madrid	Madrid	Spain	28947	11	32000.00	
13	Camunas Jardines S.L.	Pedro	Camunas	34914873241	34914871541	C/Virgenes 45	C/Princesas 2 1ºB	San Lorenzo del Escorial	Madrid	Spain	28145	8	16481.00	
14	Dardena S.A.	Juan	Rodriguez	34912453217	34912484764	C/Nueva York 74	NULL	Madrid	Madrid	Spain	28003	8	321000.00	
15	Jardin de Flores	Javier	Villar	654865643	914538776	C/ Oña 34	NULL	Madrid	Madrid	Spain	28950	30	40000.00	
16	Flores Marivi	Maria	Rodriguez	666555444	912458657	C/Leganes24	NULL	Fuenlabrada	Madrid	Spain	28945	5	1500.00	
19	Golf S.A.	Luis	Martinez	916458762	912354475	C/Estancado	NULL	Santa cruz de Tenerife	Islas Canarias	Spain	38297	12	30000.00	
23	Sotogrande	Maria	Santillana	915576622	914825645	C/Paseo del Parque	NULL	Sotogrande	Cadiz	Spain	11310	12	60000.00	
26	Jardines y Mansiones Cactus SL	Eva María	Sánchez	916877445	914477777	Polígono Industrial Maspalomas, Nº52	Móstoles	Madrid	Madrid	Spain	29874	9	76000.00	
27	Jardinerías Matías SL	Matías	San Martín	916544147	917897474	C/Francisco Arce, Nº44	Bustarviejo	Madrid	Madrid	Spain	37845	9	100500.00	
28	Agrojardin	Benito	Lopez	675432926	916549264	C/Mar Caspio 43	NULL	Getafe	Madrid	Spain	28904	30	8040.00	
30	Jardineria Sara	Sara	Marquez	675124537	912475843	C/Lima 1	NULL	Fuenlabrada	Madrid	Spain	27584	5	7500.00	
35	Tutifruti S.A	Jacob	Jones	2 9261-2433	2 9283-1695	level 24, St. Martins Tower.-31 Market St.	NULL	Sydney	Nueva Gales del Sur	Australia	2000	31	10000.00	
38	El Jardin Viviente S.L	Justin	Smith	2 8005-7161	2 8005-7162	176 Cumberland Street The rocks	NULL	Sydney	Nueva Gales del Sur	Australia	2003	31	8000.00	
```



20. Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql 
SELECT pr.*
FROM producto pr 
WHERE NOT EXISTS (SELECT *
                 FROM detalle_pedido dp
                 WHERE pr.codigo_producto = dp.codigo_producto);

-- RESULTADO
codigo_producto	nombre	gama	dimensiones	proveedor	descripcion	cantidad_en_stock	precio_venta	precio_proveedor	
FR-104	Olea-Olivos	Frutales	12/4	Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	50	49.00	39.00	
FR-14	Calamondin Mini	Frutales		Frutales Talavera S.A	Se trata de un pequeño arbolito de copa densa, con...	15	10.00	8.00	
FR-19	Camelia Blanco, Chrysler Rojo, Soraya Naranja, 	Frutales		NaranjasValencianas.com		350	4.00	3.00	
FR-20	Landora Amarillo, Rose Gaujard bicolor blanco-rojo	Frutales		Frutales Talavera S.A		350	4.00	3.00	
FR-21	Kordes Perfect bicolor rojo-amarillo, Roundelay ro...	Frutales		Frutales Talavera S.A		350	4.00	3.00	
FR-24	Albaricoquero Corbato	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-25	Albaricoquero Moniqui	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-26	Albaricoquero Kurrot	Frutales		Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	400	8.00	6.00	
FR-27	Cerezo Burlat	Frutales		Jerte Distribuciones S.L.	Las principales especies de cerezo cultivadas en e...	400	8.00	6.00	
FR-28	Cerezo Picota	Frutales		Jerte Distribuciones S.L.	Las principales especies de cerezo cultivadas en e...	400	8.00	6.00	
FR-30	Ciruelo R. Claudia Verde   	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-32	Ciruelo Golden Japan	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-35	Ciruelo Claudia Negra	Frutales		Frutales Talavera S.A	árbol de tamaño mediano que alcanza una altura máx...	400	8.00	6.00	
FR-38	Higuera Verdal	Frutales		Frutales Talavera S.A	La higuera (Ficus carica L.) es un árbol típico de...	400	9.00	7.00	
FR-39	Higuera Breva	Frutales		Frutales Talavera S.A	La higuera (Ficus carica L.) es un árbol típico de...	400	9.00	7.00	
FR-44	Melocotonero Spring Crest	Frutales		Melocotones de Cieza S.A.	Árbol caducifolio de porte bajo con corteza lisa, ...	400	8.00	6.00	
FR-46	Melocotonero Federica	Frutales		Melocotones de Cieza S.A.	Árbol caducifolio de porte bajo con corteza lisa, ...	400	8.00	6.00	
FR-49	Parra Uva de Mesa	Frutales		Frutales Talavera S.A		400	8.00	6.00	
FR-5	Mandarino -Plantón joven	Frutales		Frutales Talavera S.A		15	6.00	4.00	
FR-50	Peral Castell	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-51	Peral Williams	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-52	Peral Conference	Frutales		Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	400	8.00	6.00	
FR-55	Olivo Cipresino	Frutales		Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	400	8.00	6.00	
FR-59	Albaricoquero	Frutales	10/12	Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	200	22.00	17.00	
FR-61	Albaricoquero	Frutales	14/16	Melocotones de Cieza S.A.	árbol que puede pasar de los 6 m de altura, en la ...	200	49.00	39.00	
```



21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
```sql 
SELECT pr.*
FROM producto pr 
WHERE EXISTS (SELECT *
                 FROM detalle_pedido dp
                 WHERE pr.codigo_producto = dp.codigo_producto);

-- RESULTADO
codigo_producto	nombre	gama	dimensiones	proveedor	descripcion	cantidad_en_stock	precio_venta	precio_proveedor	
11679	Sierra de Poda 400MM	Herramientas	0,258	HiperGarden Tools	Gracias a la poda se consigue manipular un poco la...	15	14.00	11.00	
21636	Pala	Herramientas	0,156	HiperGarden Tools	Palas de acero con cresta de corte en la punta par...	15	14.00	13.00	
22225	Rastrillo de Jardín	Herramientas	1,064	HiperGarden Tools	Fabuloso rastillo que le ayudará a eliminar piedra...	15	12.00	11.00	
30310	Azadón	Herramientas	0,168	HiperGarden Tools	Longitud:24cm. Herramienta fabricada en acero y pi...	15	12.00	11.00	
AR-001	Ajedrea	Aromáticas	15-20	Murcia Seasons	Planta aromática que fresca se utiliza para condim...	140	1.00	0.00	
AR-002	Lavándula Dentata	Aromáticas	15-20	Murcia Seasons	Espliego de jardín, Alhucema rizada, Alhucema dent...	140	1.00	0.00	
AR-003	Mejorana	Aromáticas	15-20	Murcia Seasons	Origanum majorana. No hay que confundirlo con el o...	140	1.00	0.00	
AR-004	Melissa 	Aromáticas	15-20	Murcia Seasons	Es una planta perenne (dura varios años) conocida ...	140	1.00	0.00	
AR-005	Mentha Sativa	Aromáticas	15-20	Murcia Seasons	¿Quién no conoce la Hierbabuena? Se trata de una p...	140	1.00	0.00	
AR-006	Petrosilium Hortense (Peregil)	Aromáticas	15-20	Murcia Seasons	Nombre científico o latino: Petroselinum hortense,...	140	1.00	0.00	
AR-007	Salvia Mix	Aromáticas	15-20	Murcia Seasons	La Salvia es un pequeño arbusto que llega hasta el...	140	1.00	0.00	
AR-008	Thymus Citriodra (Tomillo limón)	Aromáticas	15-20	Murcia Seasons	Nombre común o vulgar: Tomillo, Tremoncillo Famili...	140	1.00	0.00	
AR-009	Thymus Vulgaris	Aromáticas	15-20	Murcia Seasons	Nombre común o vulgar: Tomillo, Tremoncillo Famili...	140	1.00	0.00	
AR-010	Santolina Chamaecyparys	Aromáticas	15-20	Murcia Seasons		140	1.00	0.00	
FR-1	Expositor Cítricos Mix	Frutales	100-120	Frutales Talavera S.A		15	7.00	5.00	
FR-10	Limonero 2 años injerto	Frutales		NaranjasValencianas.com	El limonero, pertenece al grupo de los cítricos, t...	15	7.00	5.00	
FR-100	Nectarina	Frutales	8/10	Frutales Talavera S.A	Se trata de un árbol derivado por mutación de los ...	50	11.00	8.00	
FR-101	Nogal	Frutales	8/10	Frutales Talavera S.A		50	13.00	10.00	
FR-102	Olea-Olivos	Frutales	8/10	Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	50	18.00	14.00	
FR-103	Olea-Olivos	Frutales	10/12	Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	50	25.00	20.00	
FR-105	Olea-Olivos	Frutales	14/16	Frutales Talavera S.A	Existen dos hipótesis sobre el origen del olivo, u...	50	70.00	56.00	
FR-106	Peral	Frutales	8/10	Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	50	11.00	8.00	
FR-107	Peral	Frutales	10/12	Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	50	22.00	17.00	
FR-108	Peral	Frutales	12/14	Frutales Talavera S.A	Árbol piramidal, redondeado en su juventud, luego ...	50	32.00	25.00	
FR-11	Limonero 30/40	Frutales		NaranjasValencianas.com	El limonero, pertenece al grupo de los cítricos, t...	15	100.00	80.00	
```



[A4.4.8.5] Subconsultas correlacionadas
[A4.4.9] 📝Consultas variadas jardineria❓:
1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
```sql 
SELECT cl.nombre_cliente, COUNT(pe.codigo_pedido) AS cantidad_pedidos
FROM cliente cl LEFT JOIN pedido pe
	ON cl.codigo_cliente = pe.codigo_cliente
GROUP BY CL.nombre_cliente

SELECT 
	cl.nombre_cliente, 
    (
        SELECT COUNT(pe.codigo_pedido)
        FROM pedido pe
        WHERE pe.codigo_cliente = cl.codigo_cliente
    ) AS cantidad_pedidos
FROM cliente cl
GROUP BY cl.nombre_cliente;

-- RESULTADO
nombre_cliente	cantidad_pedidos	
Agrojardin	5	
Aloha	0	
Americh Golf Management SL	0	
Beragua	5	
Campohermoso	0	
Camunas Jardines S.L.	5	
Club Golf Puerta del hierro	0	
DaraDistribuciones	0	
Dardena S.A.	5	
El Jardin Viviente S.L	5	
El Prat	0	
Flores Marivi	10	
Flores S.L.	5	
Flowers, S.A	0	
france telecom	0	
Fuenla City	0	
Gardening Associates	9	
Gerudo Valley	5	
GoldFish Garden	11	
Golf S.A.	5	
Jardin de Flores	5	
Jardineria Sara	10	
Jardinerías Matías SL	5	
Jardines y Mansiones Cactus SL	5	
Lasas S.A.	0	
```



2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
```sql 
SELECT cl.nombre_cliente, ifnull(SUM(pa.total), 0) AS total_pagado
FROM cliente cl LEFT JOIN pago pa 
	ON cl.codigo_cliente = pa.codigo_cliente
GROUP BY cl.nombre_cliente;

SELECT 
    cl.nombre_cliente,
    IFNULL((
        SELECT SUM(pa.total)
        FROM pago pa
        WHERE pa.codigo_cliente = cl.codigo_cliente
    ), 0) AS total_pagado
FROM cliente cl

-- RESULTADO
nombre_cliente	total_pagado	
GoldFish Garden	4000.00	
Gardening Associates	10926.00	
Gerudo Valley	81849.00	
Tendo Garden	23794.00	
Lasas S.A.	0.00	
Beragua	2390.00	
Club Golf Puerta del hierro	0.00	
Naturagua	929.00	
DaraDistribuciones	0.00	
Madrileña de riegos	0.00	
Lasas S.A.	0.00	
Camunas Jardines S.L.	2246.00	
Dardena S.A.	4160.00	
Jardin de Flores	12081.00	
Flores Marivi	4399.00	
Flowers, S.A	0.00	
Naturajardin	0.00	
Golf S.A.	232.00	
Americh Golf Management SL	0.00	
Aloha	0.00	
El Prat	0.00	
Sotogrande	272.00	
Vivero Humanes	0.00	
Fuenla City	0.00	
Jardines y Mansiones Cactus SL	18846.00	
```



3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
```sql 
SELECT 
	DISTINCT(cl.nombre_cliente)
FROM cliente cl INNER JOIN pedido pe
	ON pe.codigo_cliente = cl.codigo_cliente
WHERE YEAR(pe.fecha_pedido) = 2008
ORDER BY YEAR(pe.fecha_pedido) ASC;

SELECT cl.nombre_cliente
FROM cliente cl
WHERE EXISTS (
    SELECT cl.nombre_cliente
    FROM pedido pe
    WHERE pe.codigo_cliente = cl.codigo_cliente
      AND YEAR(pe.fecha_pedido) = 2008
)
ORDER BY cl.nombre_cliente;


-- RESULTADO
nombre_cliente	
Tendo Garden	
GoldFish Garden	
Dardena S.A.	
Camunas Jardines S.L.	
Gerudo Valley	
Jardines y Mansiones Cactus SL	
Jardin de Flores	
Tutifruti S.A	
Flores Marivi	
Flores S.L.	
El Jardin Viviente S.L	
```



4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
```sql 
SELECT cl.nombre_cliente, e.nombre, e.apellido1, o.telefono
FROM cliente cl INNER JOIN empleado e 
	ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o
    ON e.codigo_oficina = o.codigo_oficina
WHERE cl.codigo_cliente NOT IN (SELECT pa.codigo_cliente
                               FROM pago pa);
                           
-- RESULTADO
nombre_cliente	nombre	apellido1	telefono	
Club Golf Puerta del hierro	Emmanuel	Magaña	+34 93 3561182	
DaraDistribuciones	Emmanuel	Magaña	+34 93 3561182	
Madrileña de riegos	Emmanuel	Magaña	+34 93 3561182	
Americh Golf Management SL	José Manuel	Martinez	+34 93 3561182	
Aloha	José Manuel	Martinez	+34 93 3561182	
El Prat	José Manuel	Martinez	+34 93 3561182	
Lasas S.A.	Mariano	López	+34 91 7514487	
Lasas S.A.	Mariano	López	+34 91 7514487	
france telecom	Lionel	Narvaez	+33 14 723 4404	
Musée du Louvre	Lionel	Narvaez	+33 14 723 4404	
Flores S.L.	Michael	Bolton	+1 650 219 4782	
The Magic Garden	Michael	Bolton	+1 650 219 4782	
Naturajardin	Julian	Bellinelli	+61 2 9264 2451	
Vivero Humanes	Julian	Bellinelli	+61 2 9264 2451	
Campohermoso	Julian	Bellinelli	+61 2 9264 2451	
Flowers, S.A	Felipe	Rosas	+34 925 867231	
Fuenla City	Felipe	Rosas	+34 925 867231	
Top Campo	Felipe	Rosas	+34 925 867231	
```



5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
```sql 
SELECT cl.nombre_cliente, e.nombre, e.apellido1, o.ciudad
FROM cliente cl INNER JOIN empleado e 
	ON cl.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o
    ON e.codigo_oficina = o.codigo_oficina;

-- RESULTADO
nombre_cliente	nombre	apellido1	ciudad	
Beragua	Emmanuel	Magaña	Barcelona	
Club Golf Puerta del hierro	Emmanuel	Magaña	Barcelona	
Naturagua	Emmanuel	Magaña	Barcelona	
DaraDistribuciones	Emmanuel	Magaña	Barcelona	
Madrileña de riegos	Emmanuel	Magaña	Barcelona	
Golf S.A.	José Manuel	Martinez	Barcelona	
Americh Golf Management SL	José Manuel	Martinez	Barcelona	
Aloha	José Manuel	Martinez	Barcelona	
El Prat	José Manuel	Martinez	Barcelona	
Sotogrande	José Manuel	Martinez	Barcelona	
Gerudo Valley	Lorena	Paxton	Boston	
Tendo Garden	Lorena	Paxton	Boston	
Lasas S.A.	Mariano	López	Madrid	
Lasas S.A.	Mariano	López	Madrid	
Camunas Jardines S.L.	Mariano	López	Madrid	
Dardena S.A.	Mariano	López	Madrid	
Jardines y Mansiones Cactus SL	Lucio	Campoamor	Madrid	
Jardinerías Matías SL	Lucio	Campoamor	Madrid	
france telecom	Lionel	Narvaez	Paris	
Musée du Louvre	Lionel	Narvaez	Paris	
Flores S.L.	Michael	Bolton	San Francisco	
The Magic Garden	Michael	Bolton	San Francisco	
GoldFish Garden	Walter Santiago	Sanchez	San Francisco	
Gardening Associates	Walter Santiago	Sanchez	San Francisco	
Jardin de Flores	Julian	Bellinelli	Sydney	
```



6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql 
SELECT e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono
FROM empleado e INNER JOIN oficina o
	ON e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (SELECT cl.codigo_empleado_rep_ventas
                               FROM cliente cl);

-- RESULTADO
nombre	apellido1	apellido2	puesto	telefono	
David	Palma	Aceituno	Representante Ventas	+34 93 3561182	
Oscar	Palma	Aceituno	Representante Ventas	+34 93 3561182	
Hilary	Washington		Director Oficina	+1 215 837 0825	
Marcus	Paxton		Representante Ventas	+1 215 837 0825	
Amy	Johnson		Director Oficina	+44 20 78772041	
Larry	Westfalls		Representante Ventas	+44 20 78772041	
John	Walton		Representante Ventas	+44 20 78772041	
Carlos	Soria	Jimenez	Director Oficina	+34 91 7514487	
Hilario	Rodriguez	Huertas	Representante Ventas	+34 91 7514487	
Francois	Fignon		Director Oficina	+33 14 723 4404	
Laurent	Serra		Representante Ventas	+33 14 723 4404	
Kevin	Fallmer		Director Oficina	+61 2 9264 2451	
Marcos	Magaña	Perez	Director General	+34 925 867231	
Ruben	López	Martinez	Subdirector Marketing	+34 925 867231	
Alberto	Soria	Carrasco	Subdirector Ventas	+34 925 867231	
Maria	Solís	Jerez	Secretaria	+34 925 867231	
Juan Carlos	Ortiz	Serrano	Representante Ventas	+34 925 867231	
Nei	Nishikori		Director Oficina	+81 33 224 5000	
Narumi	Riko		Representante Ventas	+81 33 224 5000	
Takuma	Nomura		Representante Ventas	+81 33 224 5000	
```



7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
```sql 
SELECT o.ciudad,
	(SELECT COUNT(e.codigo_empleado)
    FROM empleado e
    WHERE e.codigo_oficina = o.codigo_oficina) AS cantidad_empleados
FROM oficina o;

-- RESULTADO
ciudad	cantidad_empleados	
Barcelona	4	
Boston	3	
Londres	3	
Madrid	4	
Paris	3	
San Francisco	2	
Sydney	3	
Talavera de la Reina	6	
Tokyo	3	
```
