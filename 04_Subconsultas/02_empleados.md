### [A4.2.3] 📝Consultas básicas empleados❓:
1. Lista el primer apellido de todos los empleados.
```sql
SELECT e.apellido1
FROM empleado e;

-- RESULTADO
apellido1	
Rivero	
Salas	
Rubio	
Suárez	
Loyola	
Santana	
Ruiz	
Ruiz	
Gómez	
Flores	
Herrera	
Salas	
Sáez	
```


2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
```sql
SELECT DISTINCT(e.apellido1)
FROM empleado e;

-- RESULTADO
apellido1	
Rivero	
Salas	
Rubio	
Suárez	
Loyola	
Santana	
Ruiz	
Gómez	
Flores	
Herrera	
Sáez	
```


3. Lista todas las columnas de la tabla empleado.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e;

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
1	32481596F	Aarón	Rivero	Gómez	1	
2	Y5575632D	Adela	Salas	Díaz	2	
3	R6970642B	Adolfo	Rubio	Flores	3	
4	77705545E	Adrián	Suárez	NULL	4	
5	17087203C	Marcos	Loyola	Méndez	5	
6	38382980M	María	Santana	Moreno	1	
7	80576669X	Pilar	Ruiz	NULL	2	
8	71651431Z	Pepe	Ruiz	Santana	3	
9	56399183D	Juan	Gómez	López	2	
10	46384486H	Diego	Flores	Salas	5	
11	67389283A	Marta	Herrera	Gil	1	
12	41234836R	Irene	Salas	Flores	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	
```


4. Lista el nombre y los apellidos de todos los empleados.
```sql
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado e;

-- RESULTADO
nombre	apellido1	apellido2	
Aarón	Rivero	Gómez	
Adela	Salas	Díaz	
Adolfo	Rubio	Flores	
Adrián	Suárez	NULL	
Marcos	Loyola	Méndez	
María	Santana	Moreno	
Pilar	Ruiz	NULL	
Pepe	Ruiz	Santana	
Juan	Gómez	López	
Diego	Flores	Salas	
Marta	Herrera	Gil	
Irene	Salas	Flores	
Juan Antonio	Sáez	Guerrero	
```


5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
```sql
SELECT e.codigo_departamento
FROM empleado e;

-- RESULTADO
codigo_departamento	
NULL
NULL
1	
1	
1	
2	
2	
2	
3	
3	
4	
5	
5	
```


6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
```sql
SELECT DISTINCT(e.codigo_departamento)
FROM empleado e;

-- RESULTADO
codigo_departamento	
NULL	
1	
2	
3	
4	
5	
```


7. Lista el nombre y apellidos de los empleados en una única columna.
```sql
SELECT CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) AS nombre_completo
FROM empleado e;

-- RESULTADO
nombre_completo	
Aarón Rivero Gómez	
Adela Salas Díaz	
Adolfo Rubio Flores	
Adrián Suárez	
Marcos Loyola Méndez	
María Santana Moreno	
Pilar Ruiz	
Pepe Ruiz Santana	
Juan Gómez López	
Diego Flores Salas	
Marta Herrera Gil	
Irene Salas Flores	
Juan Antonio Sáez Guerrero	
```


8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
```sql
SELECT UPPER(CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2)) AS nombre_completo_mayusculas
FROM empleado e;

-- RESULTADO
nombre_completo_mayusculas	
AARÓN RIVERO GÓMEZ	
ADELA SALAS DÍAZ	
ADOLFO RUBIO FLORES	
ADRIÁN SUÁREZ	
MARCOS LOYOLA MÉNDEZ	
MARÍA SANTANA MORENO	
PILAR RUIZ	
PEPE RUIZ SANTANA	
JUAN GÓMEZ LÓPEZ	
DIEGO FLORES SALAS	
MARTA HERRERA GIL	
IRENE SALAS FLORES	
JUAN ANTONIO SÁEZ GUERRERO	
```


9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
```sql
SELECT LOWER(CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2)) AS nombre_completo_minusculas
FROM empleado e;

-- RESULTADO
nombre_completo_minusculas	
aarón rivero gómez	
adela salas díaz	
adolfo rubio flores	
adrián suárez	
marcos loyola méndez	
maría santana moreno	
pilar ruiz	
pepe ruiz santana	
juan gómez lópez	
diego flores salas	
marta herrera gil	
irene salas flores	
juan antonio sáez guerrero	
```


10. Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
```sql
SELECT CONCAT_WS(' - ', e.codigo, SUBSTRING(e.nif, 1, 8)) AS codigo_digitos, CONCAT_WS(' - ', e.codigo, SUBSTRING(e.nif, 9, 1)) AS codigo_letra
FROM empleado e;

SELECT CONCAT_WS(' - ', e.codigo, LEFT(e.nif, 8)) AS codigo_digitos, CONCAT_WS(' - ', e.codigo, RIGHT(e.nif, 1)) AS codigo_letra
FROM empleado e;

-- RESULTADO
codigo_digitos	codigo_letra	
5 - 17087203	5 - C	
1 - 32481596	1 - F	
6 - 38382980	6 - M	
12 - 41234836	12 - R	
10 - 46384486	10 - H	
9 - 56399183	9 - D	
11 - 67389283	11 - A	
8 - 71651431	8 - Z	
4 - 77705545	4 - E	
7 - 80576669	7 - X	
13 - 82635162	13 - B	
3 - R6970642	3 - B	
2 - Y5575632	2 - D	
```


11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
```sql
SELECT d.nombre, (d.presupuesto - d.gastos) AS presupuesto_actual
FROM departamento d;

-- RESULTADO
nombre	presupuesto_actual	
Desarrollo	114000	
Sistemas	129000	
Recursos Humanos	255000	
Contabilidad	107000	
I+D	-5000	
Proyectos	0	
Publicidad	-1000	
```


12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
```sql
SELECT d.nombre, (d.presupuesto - d.gastos) AS presupuesto_actual
FROM departamento d
ORDER BY presupuesto_actual ASC;

-- RESULTADO
nombre	presupuesto_actual   	
I+D	-5000	
Publicidad	-1000	
Proyectos	0	
Contabilidad	107000	
Desarrollo	114000	
Sistemas	129000	
Recursos Humanos	255000	
```


13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
```sql
SELECT d.nombre
FROM departamento d
ORDER BY d.nombre ASC;

-- RESULTADO
nombre   	
Contabilidad	
Desarrollo	
I+D	
Proyectos	
Publicidad	
Recursos Humanos	
Sistemas	
```


14. Lista el nombre de todos los departamentos ordenados de forma desscendente.
```sql
SELECT d.nombre
FROM departamento d
ORDER BY d.nombre DESC;

-- RESULTADO
nombre   	
Sistemas	
Recursos Humanos	
Publicidad	
Proyectos	
I+D	
Desarrollo	
Contabilidad	
```


15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
```sql
SELECT e.apellido1, e.apellido2, e.nombre
FROM empleado e
ORDER BY e.apellido1 ASC, e.apellido2 ASC, e.nombre ASC;

-- RESULTADO
apellido1   	apellido2	nombre	
Flores	Salas	Diego	
Gómez	López	Juan	
Herrera	Gil	Marta	
Loyola	Méndez	Marcos	
Rivero	Gómez	Aarón	
Rubio	Flores	Adolfo	
Ruiz	NULL	Pilar	
Ruiz	Santana	Pepe	
Sáez	Guerrero	Juan Antonio	
Salas	Díaz	Adela	
Salas	Flores	Irene	
Santana	Moreno	María	
Suárez	NULL	Adrián	
```


16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
ORDER BY d.presupuesto DESC
LIMIT 3;

-- SQL Server
SELECT TOP 3 d.nombre, d.presupuesto
FROM departamento d
ORDER BY d.presupuesto DESC;

-- RESULTADO
nombre	presupuesto   	
I+D	375000	
Recursos Humanos	280000	
Sistemas	150000	
```


17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
ORDER BY d.presupuesto ASC
LIMIT 3;

-- SQL Server
SELECT TOP 3 d.nombre, d.presupuesto
FROM departamento d
ORDER BY d.presupuesto ASC;

-- RESULTADO
nombre	presupuesto   	
Publicidad	0	
Proyectos	0	
Contabilidad	110000	
```


18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
```sql
SELECT d.nombre, d.gastos
FROM departamento d
ORDER BY d.gastos DESC
LIMIT 2;

-- SQL Server
SELECT TOP 2 d.nombre, d.gastos
FROM departamento d
ORDER BY d.presupuesto DESC;

-- RESULTADO
nombre	gastos   	
I+D	380000	
Recursos Humanos	25000	
```


19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
```sql
SELECT d.nombre, d.gastos
FROM departamento d
ORDER BY d.gastos ASC
LIMIT 2;

-- SQL Server
SELECT TOP 2 d.nombre, d.gastos
FROM departamento d
ORDER BY d.presupuesto ASC;

-- RESULTADO
nombre	gastos   	
Proyectos	0	
Publicidad	1000	
```


20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
LIMIT 2, 5;

-- SQL Server
/* SACA 5 desde el 2º y enseña 5 */
SELECT TOP 5 e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e 
ORDER BY e.codigo ASC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
3	R6970642B	Adolfo	Rubio	Flores	3	
4	77705545E	Adrián	Suárez	NULL	4	
5	17087203C	Marcos	Loyola	Méndez	5	
6	38382980M	María	Santana	Moreno	1	
7	80576669X	Pilar	Ruiz	NULL	2	
```


21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto >= 150000;

-- RESULTADO
nombre	presupuesto	
Sistemas	150000	
Recursos Humanos	280000	
I+D	375000	
```


22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
```sql
SELECT d.nombre, d.gastos
FROM departamento d
WHERE d.gastos < 5000;

-- RESULTADO
nombre	gastos	
Contabilidad	3000	
Proyectos	0	
Publicidad	1000	
```


23. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto >= 100000 AND d.presupuesto <= 200000;

-- RESULTADO
nombre	presupuesto	
Desarrollo	120000	
Sistemas	150000	
Contabilidad	110000	
```


24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto < 100000 OR d.presupuesto > 200000;

-- RESULTADO
nombre	presupuesto	
Recursos Humanos	280000	
I+D	375000	
Proyectos	0	
Publicidad	0	
```


25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto BETWEEN 100000 AND 200000;

-- RESULTADO
nombre	presupuesto	
Desarrollo	120000	
Sistemas	150000	
Contabilidad	110000	
```


26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE NOT  d.presupuesto BETWEEN 100000 AND 200000;

-- RESULTADO
nombre	presupuesto	
Recursos Humanos	280000	
I+D	375000	
Proyectos	0	
Publicidad	0	
```


27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
```sql
SELECT d.nombre, d.gastos, d.presupuesto
FROM departamento d
WHERE d.gastos > d.presupuesto;

-- RESULTADO
nombre	gastos	presupuesto	
I+D	380000	375000	
Publicidad	1000	0	
```


28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
```sql
SELECT d.nombre, d.gastos, d.presupuesto
FROM departamento d
WHERE d.gastos < d.presupuesto;

-- RESULTADO
nombre	gastos	presupuesto	
Desarrollo	6000	120000	
Sistemas	21000	150000	
Recursos Humanos	25000	280000	
Contabilidad	3000	110000	
```


29.  Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
```sql
SELECT d.nombre, d.gastos, d.presupuesto
FROM departamento d
WHERE d.gastos = d.presupuesto;

-- RESULTADO
Proyectos	0	0	
```


30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.apellido2 IS NULL;

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
4	77705545E	Adrián	Suárez	NULL	4	
7	80576669X	Pilar	Ruiz	NULL	2	
```


31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.apellido2 IS NOT NULL;

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
1	32481596F	Aarón	Rivero	Gómez	1	
2	Y5575632D	Adela	Salas	Díaz	2	
3	R6970642B	Adolfo	Rubio	Flores	3	
5	17087203C	Marcos	Loyola	Méndez	5	
6	38382980M	María	Santana	Moreno	1	
8	71651431Z	Pepe	Ruiz	Santana	3	
9	56399183D	Juan	Gómez	López	2	
10	46384486H	Diego	Flores	Salas	5	
11	67389283A	Marta	Herrera	Gil	1	
12	41234836R	Irene	Salas	Flores	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	
```


32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.apellido2 = 'López';

-- RESULTADO
9	56399183D	Juan	Gómez	López	2	
```


33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.apellido2 = 'Díaz' OR e.apellido2 = 'Moreno';

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
2	Y5575632D	Adela	Salas	Díaz	2	
6	38382980M	María	Santana	Moreno	1	
```


34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
```sql
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.apellido2 IN ('Díaz','Moreno');

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
2	Y5575632D	Adela	Salas	Díaz	2	
6	38382980M	María	Santana	Moreno	1	
```


35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
```sql
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado e
WHERE e.codigo_departamento = 3;

-- RESULTADO
nombre	apellido1	apellido2	nif	
Adolfo	Rubio	Flores	R6970642B	
Pepe	Ruiz	Santana	71651431Z	
```


36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
```sql
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado e
WHERE e.codigo_departamento IN (2,4,5);

-- RESULTADO
nombre	apellido1	apellido2	nif	
Adela	Salas	Díaz	Y5575632D	
Adrián	Suárez	NULL	77705545E	
Marcos	Loyola	Méndez	17087203C	
Pilar	Ruiz	NULL	80576669X	
Juan	Gómez	López	56399183D	
Diego	Flores	Salas	46384486H	
```



### [A4.2.4] 📝Consultas multitabla empleados (Composición interna) ❓:
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
```sql
-- SQL1
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    e.codigo_departamento, 
    d.codigo AS codigo_del_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo;

-- SQL2
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    e.codigo_departamento, 
    d.codigo AS codigo_del_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo;

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	codigo_del_departamento	nombre_departamento	presupuesto	gastos	
1	32481596F	Aarón	Rivero	Gómez	1	1	Desarrollo	120000	6000	
6	38382980M	María	Santana	Moreno	1	1	Desarrollo	120000	6000	
11	67389283A	Marta	Herrera	Gil	1	1	Desarrollo	120000	6000	
2	Y5575632D	Adela	Salas	Díaz	2	2	Sistemas	150000	21000	
7	80576669X	Pilar	Ruiz	NULL	2	2	Sistemas	150000	21000	
9	56399183D	Juan	Gómez	López	2	2	Sistemas	150000	21000	
3	R6970642B	Adolfo	Rubio	Flores	3	3	Recursos Humanos	280000	25000	
8	71651431Z	Pepe	Ruiz	Santana	3	3	Recursos Humanos	280000	25000	
4	77705545E	Adrián	Suárez	NULL	4	4	Contabilidad	110000	3000	
5	17087203C	Marcos	Loyola	Méndez	5	5	I+D	375000	380000	
10	46384486H	Diego	Flores	Salas	5	5	I+D	375000	380000	
```


2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
```sql
-- SQL1
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    e.codigo_departamento, 
    d.codigo AS codigo_del_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo
ORDER BY d.nombre ASC, e.apellido1 ASC, e.apellido2 ASC, e.nombre ASC;

-- SQL2
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    e.codigo_departamento, 
    d.codigo AS codigo_del_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
ORDER BY d.nombre ASC, e.apellido1 ASC, e.apellido2 ASC, e.nombre ASC;

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	codigo_del_departamento	nombre_departamento	presupuesto	gastos	
4	77705545E	Adrián	Suárez	NULL	4	4	Contabilidad	110000	3000	
11	67389283A	Marta	Herrera	Gil	1	1	Desarrollo	120000	6000	
1	32481596F	Aarón	Rivero	Gómez	1	1	Desarrollo	120000	6000	
6	38382980M	María	Santana	Moreno	1	1	Desarrollo	120000	6000	
10	46384486H	Diego	Flores	Salas	5	5	I+D	375000	380000	
5	17087203C	Marcos	Loyola	Méndez	5	5	I+D	375000	380000	
3	R6970642B	Adolfo	Rubio	Flores	3	3	Recursos Humanos	280000	25000	
8	71651431Z	Pepe	Ruiz	Santana	3	3	Recursos Humanos	280000	25000	
9	56399183D	Juan	Gómez	López	2	2	Sistemas	150000	21000	
7	80576669X	Pilar	Ruiz	NULL	2	2	Sistemas	150000	21000	
2	Y5575632D	Adela	Salas	Díaz	2	2	Sistemas	150000	21000	
```


3. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
```sql
-- SQL1
SELECT DISTINCT (d.codigo) AS codigo_departamento, d.nombre AS nombre_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo;

-- SQL2
SELECT DISTINCT (d.codigo) AS codigo_departamento, d.nombre AS nombre_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo;

-- RESULTADO
codigo_departamento	nombre_departamento	
1	Desarrollo	
2	Sistemas	
3	Recursos Humanos	
4	Contabilidad	
5	I+D	
```


4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
```sql
-- SQL1
SELECT 
    DISTINCT(d.codigo) AS codigo_departamento, 
    d.nombre AS nombre_departamento, 
    (d.presupuesto-d.gastos) AS presupuesto_actual
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo;

-- SQL2
SELECT 
    DISTINCT(d.codigo) AS codigo_departamento, 
    d.nombre AS nombre_departamento, 
    (d.presupuesto-d.gastos) AS presupuesto_actual
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo;

-- RESULTADO
codigo_departamento	nombre_departamento	presupuesto_actual	
1	Desarrollo	114000	
2	Sistemas	129000	
3	Recursos Humanos	255000	
4	Contabilidad	107000	
5	I+D	-5000	
```


5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
```sql
-- SQL1
SELECT d.nombre AS nombre_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND e.nif = '38382980M';

-- SQL2
SELECT d.nombre AS nombre_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE e.nif = '38382980M';

-- RESULTADO
Desarrollo	
```


6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
```sql
-- SQL1
SELECT d.nombre AS nombre_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND (e.nombre = 'Pepe' AND e.apellido1 = 'Ruiz' AND e.apellido2 = 'Santana');

-- SQL2
SELECT d.nombre AS nombre_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE e.nombre = 'Pepe' AND e.apellido1 = 'Ruiz' AND e.apellido2 = 'Santana';

-- RESULTADO
Recursos Humanos	
```


7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
```sql
-- SQL1
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND d.nombre = 'I+D'
ORDER BY e.nombre ASC;

-- SQL2
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE d.nombre = 'I+D'
ORDER BY e.nombre ASC;

-- RESULTADO
codigo	nif	nombre   	apellido1	apellido2	codigo_departamento	
10	46384486H	Diego	Flores	Salas	5	
5	17087203C	Marcos	Loyola	Méndez	5	
```


8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
```sql
-- SQL1
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
ORDER BY e.apellido1, e.apellido2, e.nombre ASC;


-- SQL2
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
ORDER BY e.apellido1, e.apellido2, e.nombre ASC;

-- RESULTADO
codigo	nif	nombre	apellido1   	apellido2	codigo_departamento	
10	46384486H	Diego	Flores	Salas	5	
9	56399183D	Juan	Gómez	López	2	
5	17087203C	Marcos	Loyola	Méndez	5	
7	80576669X	Pilar	Ruiz	NULL	2	
2	Y5575632D	Adela	Salas	Díaz	2	
4	77705545E	Adrián	Suárez	NULL	4	
```


9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
```sql
-- SQL1
SELECT e.nombre AS nombre_empleado
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND d.presupuesto NOT BETWEEN 100000 AND 200000;

-- SQL2
SELECT e.nombre AS nombre_empleado
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE NOT d.presupuesto BETWEEN 100000 AND 200000;

-- RESULTADO
nombre_empleado	
Adolfo	
Pepe	
Marcos	
Diego	
```


10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
```sql
-- SQL1
SELECT DISTINCT(d.nombre) AS nombre_departamento
FROM empleado e, departamento d 
	WHERE e.codigo_departamento = d.codigo AND e.apellido2 IS NULL;

-- SQL2
SELECT DISTINCT(d.nombre) AS nombre_departamento
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE e.apellido2 IS NULL;

-- RESULTADO
nombre_departamento	
Sistemas	
Contabilidad	
```




### [A4.2.5] 📝Consultas multitabla empleados (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
```sql
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM empleado e LEFT JOIN departamento d 
	ON e.codigo_departamento = d.codigo;

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	nombre_departamento	presupuesto	gastos	
1	32481596F	Aarón	Rivero	Gómez	1	Desarrollo	120000	6000	
2	Y5575632D	Adela	Salas	Díaz	2	Sistemas	150000	21000	
3	R6970642B	Adolfo	Rubio	Flores	3	Recursos Humanos	280000	25000	
4	77705545E	Adrián	Suárez	NULL	4	Contabilidad	110000	3000	
5	17087203C	Marcos	Loyola	Méndez	5	I+D	375000	380000	
6	38382980M	María	Santana	Moreno	1	Desarrollo	120000	6000	
7	80576669X	Pilar	Ruiz	NULL	2	Sistemas	150000	21000	
8	71651431Z	Pepe	Ruiz	Santana	3	Recursos Humanos	280000	25000	
9	56399183D	Juan	Gómez	López	2	Sistemas	150000	21000	
10	46384486H	Diego	Flores	Salas	5	I+D	375000	380000	
11	67389283A	Marta	Herrera	Gil	1	Desarrollo	120000	6000	
12	41234836R	Irene	Salas	Flores	NULL	NULL	NULL	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	NULL	NULL	NULL	
```



2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
```sql
SELECT 
    e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, 
    e.apellido2, 
    e.codigo_departamento
FROM empleado e LEFT JOIN departamento d 
	ON e.codigo_departamento = d.codigo
WHERE d.codigo IS NULL;

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	
12	41234836R	Irene	Salas	Flores	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	
```



3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
```sql
SELECT 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento, 
    d.presupuesto, 
    d.gastos
FROM departamento d LEFT JOIN empleado e
	ON e.codigo_departamento = d.codigo
WHERE e.codigo IS NULL;

-- RESULTADO
codigo_departamento	nombre_departamento	presupuesto	gastos	
6	Proyectos	0	0	
7	Publicidad	0	1000	
```



4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
```sql
(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e LEFT JOIN  departamento d
	ON e.codigo_departamento = d.codigo)
    
UNION

(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e RIGHT JOIN  departamento d
	ON e.codigo_departamento = d.codigo
ORDER BY d.nombre ASC);

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	nombre_departamento	presupuesto	gastos	
1	32481596F	Aarón	Rivero	Gómez	1	Desarrollo	120000	6000	
2	Y5575632D	Adela	Salas	Díaz	2	Sistemas	150000	21000	
3	R6970642B	Adolfo	Rubio	Flores	3	Recursos Humanos	280000	25000	
4	77705545E	Adrián	Suárez	NULL	4	Contabilidad	110000	3000	
5	17087203C	Marcos	Loyola	Méndez	5	I+D	375000	380000	
6	38382980M	María	Santana	Moreno	1	Desarrollo	120000	6000	
7	80576669X	Pilar	Ruiz	NULL	2	Sistemas	150000	21000	
8	71651431Z	Pepe	Ruiz	Santana	3	Recursos Humanos	280000	25000	
9	56399183D	Juan	Gómez	López	2	Sistemas	150000	21000	
10	46384486H	Diego	Flores	Salas	5	I+D	375000	380000	
11	67389283A	Marta	Herrera	Gil	1	Desarrollo	120000	6000	
12	41234836R	Irene	Salas	Flores	NULL	NULL	NULL	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	NULL	NULL	NULL	
NULL	NULL	NULL	NULL	NULL	6	Proyectos	0	0	
NULL	NULL	NULL	NULL	NULL	7	Publicidad	0	1000	
```



5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
```sql
(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e LEFT JOIN  departamento d
	ON e.codigo_departamento = d.codigo
WHERE d.codigo IS NULL)
    
UNION

(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e RIGHT JOIN  departamento d
	ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL
ORDER BY d.nombre ASC);

-- OTRA FORMA:
((SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e LEFT JOIN  departamento d
	ON e.codigo_departamento = d.codigo)
UNION

(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e RIGHT JOIN  departamento d
	ON e.codigo_departamento = d.codigo
ORDER BY d.nombre ASC))

EXCEPT 

(SELECT 
	e.codigo AS codigo_empleado, 
    e.nif, 
    e.nombre AS nombre_empleado, 
    e.apellido1, e.apellido2, 
    d.codigo AS codigo_departamento, 
    d.nombre AS nombre_departamento,
    d.presupuesto, 
    d.gastos
FROM empleado e INNER JOIN  departamento d
	ON e.codigo_departamento = d.codigo);

-- RESULTADO
codigo_empleado	nif	nombre_empleado	apellido1	apellido2	codigo_departamento	nombre_departamento	presupuesto	gastos	
12	41234836R	Irene	Salas	Flores	NULL	NULL	NULL	NULL	
13	82635162B	Juan Antonio	Sáez	Guerrero	NULL	NULL	NULL	NULL	
NULL	NULL	NULL	NULL	NULL	6	Proyectos	0	0	
NULL	NULL	NULL	NULL	NULL	7	Publicidad	0	1000	
```





### [A4.2.6] 📝Consultas resumen empleados ❓:
1. Calcula la suma del presupuesto de todos los departamentos.
```sql
SELECT SUM(d.presupuesto) AS total_presupuestos
FROM departamento d;

-- RESULTADO
1035000	
```



2. Calcula la media del presupuesto de todos los departamentos.
```sql
SELECT ROUND(AVG(d.presupuesto), 2) AS media_presupuestos
FROM departamento d;

-- RESULTADO
147857.14	
```



3. Calcula el valor mínimo del presupuesto de todos los departamentos.
```sql
SELECT MIN(d.presupuesto) AS presupuesto_minimo
FROM departamento d;

-- RESULTADO
0	
```



4. Calcula el nombre del departamento y el presupuesto que tiene asignado, el departamento con menor presupuesto (de entre los que tienen presupuesto asignado).
```sql
SELECT d.nombre, d.presupuesto AS presupuesto_minimo
FROM departamento d
WHERE d.presupuesto = (
    					SELECT MIN(d.presupuesto)
                 		FROM departamento d
						);

-- RESULTADO
nombre	presupuesto_minimo
Proyectos	0	
Publicidad	0	
```



5. Calcula el valor máximo del presupuesto de todos los departamentos.
```sql
SELECT MAX(d.presupuesto) AS presupuesto_maximo
FROM departamento d;

-- RESULTADO
375000	
```



6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (SELECT MAX(d.presupuesto)
                      FROM departamento d);

-- RESULTADO
I+D	375000	
```



7. Calcula el número total de empleados que hay en la tabla empleado.
```sql
SELECT COUNT(e.codigo) AS cantidad_empleados
FROM empleado e;

-- RESULTADO
13	
```



8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
```sql
SELECT COUNT(e.codigo) AS cantidad_empleados
FROM empleado e
WHERE e.apellido2 IS NULL;

-- RESULTADO
2	
```



9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
```sql
SELECT 
	d.nombre AS nombre_departamento, 
    COUNT(e.codigo) AS cantidad_empleados
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
GROUP BY d.nombre;

-- RESULTADO
nombre_departamento	cantidad_empleados	
Contabilidad	1	
Desarrollo	3	
I+D	2	
Recursos Humanos	2	
Sistemas	3	
```



10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
```sql
SELECT 
	d.nombre AS nombre_departamento, 
    COUNT(e.codigo) AS cantidad_empleados
FROM empleado e INNER JOIN departamento d 
	ON e.codigo_departamento = d.codigo
GROUP BY d.nombre
HAVING cantidad_empleados > 2;

-- RESULTADO
nombre_departamento	cantidad_empleados	
Desarrollo	3	
Sistemas	3	
```



11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.
```sql
SELECT 
	d.nombre AS nombre_departamento,
    COUNT(e.codigo) AS cantidad_empleados
FROM empleado e LEFT JOIN departamento d 
	ON e.codigo_departamento = d.codigo
GROUP BY d.nombre;

-- RESULTADO
nombre_departamento	cantidad_empleados	
NULL	2	
Contabilidad	1	
Desarrollo	3	
I+D	2	
Recursos Humanos	2	
Sistemas	3	
```



12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
```sql
SELECT 
	d.nombre AS nombre_departamento,
    COUNT(e.codigo) AS cantidad_empleados,
    d.presupuesto
FROM empleado e RIGHT JOIN departamento d 
	ON e.codigo_departamento = d.codigo
GROUP BY d.nombre
HAVING d.presupuesto > 200000;

-- RESULTADO
nombre_departamento	cantidad_empleados	presupuesto	
I+D	2	375000	
Recursos Humanos	2	280000	
```





### [A4.2.7] 📝Subconsultas empleados ❓:
#### [A4.2.7.1] Con operadores básicos de comparación
1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
```sql 
SELECT e.codigo, e.nif, e.nombre, e.apellido1, e.apellido2, e.codigo_departamento
FROM empleado e
WHERE e.codigo_departamento = (
                                SELECT d.codigo
                                FROM departamento d
                                WHERE d.codigo = (
                                                    SELECT codigo
                                                    FROM departamento
                                                    WHERE nombre = 'Sistemas'
                                                    )
                                );

-- RESULTADO
codigo	nif	nombre	apellido1	apellido2	codigo_departamento	
2	Y5575632D	Adela	Salas	Díaz	2	
7	80576669X	Pilar	Ruiz	NULL	2	
9	56399183D	Juan	Gómez	López	2	
```



2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
```sql 
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (
                        SELECT MAX(d1. presupuesto)
                        FROM departamento d1
                  		)
LIMIT 1;

-- SQL Server
SELECT TOP 1 d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (
                        SELECT MAX(d1. presupuesto)
                        FROM departamento d1
                  		);

-- RESULTADO
I+D	375000	
```



3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
```sql 
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (
                        SELECT MIN(d1. presupuesto)
                        FROM departamento d1
                  		)
LIMIT 1;

-- SQL Server
SELECT TOP 1 d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (
                        SELECT MIN(d1. presupuesto)
                        FROM departamento d1
                  		);

-- RESULTADO
Proyectos	0	
```





#### [A4.2.7.2] Subconsultas con ALL y ANY
4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto >= ALL (SELECT d1.presupuesto
                           FROM departamento d1);

-- RESULTADO
I+D	375000	
```



5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
```sql
SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto < ALL (SELECT d1.presupuesto
                           FROM departamento d1);

-- RESULTADO
nombre	presupuesto	
Proyectos	0	
Publicidad	0	
```



6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
```sql
SELECT d.nombre
FROM departamento d
WHERE d.codigo = ANY (
                    SELECT e.codigo_departamento
                    FROM empleado e
				);

-- RESULTADO
nombre	
Desarrollo	
Sistemas	
Recursos Humanos	
Contabilidad	
I+D	
```



7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
```sql
SELECT d.nombre
FROM departamento d
WHERE d.codigo != ALL (
                    SELECT e.codigo_departamento
                    FROM empleado e
    				WHERE e.codigo_departamento IS NOT NULL
    				);

-- RESULTADO
nombre	
Proyectos	
Publicidad	
```





#### [A4.2.7.3] Subconsultas con IN y NOT IN
8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
```sql
SELECT d.nombre
FROM departamento d
WHERE d.codigo IN (
                    SELECT e.codigo_departamento
                    FROM empleado e
    				);

-- RESULTADO
nombre	
Desarrollo	
Sistemas	
Recursos Humanos	
Contabilidad	
I+D	
```



9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
```sql
SELECT d.nombre
FROM departamento d
WHERE d.codigo NOT IN (
                    SELECT e.codigo_departamento
                    FROM empleado e
    				WHERE e.codigo_departamento IS NOT NULL
    				);

-- RESULTADO
nombre	
Proyectos	
Publicidad	
```





#### [A4.2.7.4] Subconsultas con EXISTS y NOT EXISTS
10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
```sql 
SELECT d.nombre
FROM departamento d
WHERE EXISTS (
                SELECT e.codigo_departamento
                FROM empleado e
                WHERE e.codigo_departamento = d.codigo
            );

-- RESULTADO
nombre	
Desarrollo	
Sistemas	
Recursos Humanos	
Contabilidad	
I+D	
```



11. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
```sql 
SELECT d.nombre
FROM departamento d
WHERE NOT EXISTS (
                SELECT e.codigo_departamento
                FROM empleado e
                WHERE e.codigo_departamento = d.codigo
            );

-- RESULTADO
nombre	
Proyectos	
Publicidad	
```
