### [A4.5.4] 📝Consultas básicas universidad❓:
1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql 
SELECT *
FROM departamento
WHERE dp.id NOT IN (
	SELECT DISTINCT d.id
    FROM departamento d INNER JOIN profesor pr 
     	ON dp.id = pr.id_departamento
    INNER JOIN asignatura asg 
    	ON asg.id_departamento = pr.id_profesor
    INNER JOIN alumno_se_matricula_asignatura asm
    	ON asm_id_asignatura = asg.id
    INNER JOIN curso_escolar ce
    	ON ce.id = asm.id_curso_escolar);

-- RESULTADO
apellido1   	apellido2	nombre	
Domínguez	Guerrero	Antonio	
Gea	Ruiz	Sonia	
Gutiérrez	López	Juan	
Heller	Pagac	Pedro	
Herman	Pacocha	Daniel	
Hernández	Martínez	Irene	
Herzog	Tremblay	Ramón	
Koss	Bayer	José	
Lakin	Yundt	Inma	
Saez	Vega	Juan	
Sánchez	Pérez	Salvador	
Strosin	Turcotte	Ismael	
```



2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql 
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
WHERE p.tipo = 'alumno' AND p.telefono IS NULL;

-- RESULTADO
nombre	apellido1	apellido2	
Pedro	Heller	Pagac	
Ismael	Strosin	Turcotte	
```



3. Devuelve el listado de los alumnos que nacieron en 1999.
```sql 
SELECT p.*
FROM persona p
WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999;

-- RESULTADO
id	nif	nombre	apellido1	apellido2	ciudad	direccion	telefono	fecha_nacimiento	sexo	tipo	
7	97258166K	Ismael	Strosin	Turcotte	Almería	C/ Neptuno	NULL	1999-05-24	H	alumno	
22	41491230N	Antonio	Domínguez	Guerrero	Almería	C/ Cabo de Gata	626652498	1999-02-11	H	alumno	
```



4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql 
SELECT p.*
FROM persona p
WHERE p.tipo = 'profesor' AND p.telefono IS NULL AND p.nif LIKE '%K';

-- RESULTADO
id	nif	nombre	apellido1	apellido2	ciudad	direccion	telefono	fecha_nacimiento	sexo	tipo	
16	10485008K	Antonio	Fahey	Considine	Almería	C/ Sierra de los Filabres	NULL	1982-03-18	H	profesor	
17	85869555K	Guillermo	Ruecker	Upton	Almería	C/ Sierra de Gádor	NULL	1973-05-05	H	profesor	
```



5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql 
SELECT a.*
FROM asignatura a
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

-- RESULTADO
id	nombre	creditos	tipo	curso	cuatrimestre	id_profesor	id_grado	
72	Bases moleculares del desarrollo vegetal	4.5	obligatoria	3	1	NULL	7	
73	Fisiología animal	4.5	obligatoria	3	1	NULL	7	
74	Metabolismo y biosíntesis de biomoléculas	6	obligatoria	3	1	NULL	7	
75	Operaciones de separación	6	obligatoria	3	1	NULL	7	
76	Patología molecular de plantas	4.5	obligatoria	3	1	NULL	7	
77	Técnicas instrumentales básicas	4.5	obligatoria	3	1	NULL	7	
```





### [A4.5.5] 📝Consultas multitabla universidad (Composición interna) ❓:
1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
``` sql 
SELECT DISTINCT(p.id), p.nif, p.nombre, p.apellido1, p.apellido2, p.ciudad, p.direccion, p.telefono, p.fecha_nacimiento, p.sexo, p.tipo
FROM persona p INNER JOIN alumno_se_matricula_asignatura al
	ON p.id = al.id_alumno INNER JOIN asignatura asi 
	ON al.id_asignatura = asi.id INNER JOIN grado g 
    ON asi.id_grado = g.id
WHERE p.tipo = 'alumno' AND p.sexo = 'M'AND g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- RESULTADO
id	nif	nombre	apellido1	apellido2	ciudad	direccion	telefono	fecha_nacimiento	sexo	tipo	
19	11578526G	Inma	Lakin	Yundt	Almería	C/ Picos de Europa	678652431	1998-09-01	M	alumno	
23	64753215G	Irene	Hernández	Martínez	Almería	C/ Zapillo	628452384	1996-03-12	M	alumno	
24	85135690V	Sonia	Gea	Ruiz	Almería	C/ Mercurio	678812017	1995-04-13	M	alumno	
```



2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
``` sql 
SELECT asi.*
FROM asignatura asi INNER JOIN grado g 
    ON asi.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- RESULTADO
id	nombre	creditos	tipo	curso	cuatrimestre	id_profesor	id_grado	
1	Álgegra lineal y matemática discreta	6	básica	1	1	3	4	
2	Cálculo	6	básica	1	1	14	4	
3	Física para informática	6	básica	1	1	3	4	
4	Introducción a la programación	6	básica	1	1	14	4	
5	Organización y gestión de empresas	6	básica	1	1	3	4	
6	Estadística	6	básica	1	2	14	4	
7	Estructura y tecnología de computadores	6	básica	1	2	3	4	
8	Fundamentos de electrónica	6	básica	1	2	14	4	
9	Lógica y algorítmica	6	básica	1	2	3	4	
10	Metodología de la programación	6	básica	1	2	14	4	
11	Arquitectura de Computadores	6	básica	2	1	3	4	
12	Estructura de Datos y Algoritmos I	6	obligatoria	2	1	3	4	
13	Ingeniería del Software	6	obligatoria	2	1	14	4	
14	Sistemas Inteligentes	6	obligatoria	2	1	3	4	
15	Sistemas Operativos	6	obligatoria	2	1	14	4	
16	Bases de Datos	6	básica	2	2	14	4	
17	Estructura de Datos y Algoritmos II	6	obligatoria	2	2	14	4	
18	Fundamentos de Redes de Computadores	6	obligatoria	2	2	3	4	
19	Planificación y Gestión de Proyectos Informáticos	6	obligatoria	2	2	3	4	
20	Programación de Servicios Software	6	obligatoria	2	2	14	4	
21	Desarrollo de interfaces de usuario	6	obligatoria	3	1	14	4	
22	Ingeniería de Requisitos	6	optativa	3	1	NULL	4	
23	Integración de las Tecnologías de la Información e...	6	optativa	3	1	NULL	4	
24	Modelado y Diseño del Software 1	6	optativa	3	1	NULL	4	
25	Multiprocesadores	6	optativa	3	1	NULL	4	
```



3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
``` sql 
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre
FROM persona p INNER JOIN profesor pr
	ON p.id = pr.id_profesor INNER JOIN departamento d 
    ON pr.id_departamento = d.id
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- RESULTADO
apellido1   	apellido2	nombre	nombre	
Fahey	Considine	Antonio	Economía y Empresa	
Hamill	Kozey	Manolo	Informática	
Kohler	Schoen	Alejandro	Matemáticas	
Lemke	Rutherford	Cristina	Economía y Empresa	
Monahan	Murray	Micaela	Agronomía	
Ramirez	Gea	Zoe	Informática	
Ruecker	Upton	Guillermo	Educación	
Schmidt	Fisher	David	Matemáticas	
Schowalter	Muller	Francesca	Química y Física	
Spencer	Lakin	Esther	Educación	
Stiedemann	Morissette	Alfredo	Química y Física	
Streich	Hirthe	Carmen	Educación	
```



4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
``` sql 
SELECT asi.nombre, cu.anyo_inicio, cu.anyo_fin
FROM asignatura asi INNER JOIN alumno_se_matricula_asignatura al 
	ON asi.id = al.id_asignatura INNER JOIN curso_escolar cu 
    ON al.id_curso_escolar = cu.id INNER JOIN persona p
    ON al.id_alumno = p.id
WHERE p.nif = '26902806M';

-- RESULTADO
nombre	anyo_inicio	anyo_fin	
Álgegra lineal y matemática discreta	2014	2015	
Cálculo	2014	2015	
Física para informática	2014	2015	
```



5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
``` sql 
SELECT DISTINCT(de.nombre)
FROM departamento de INNER JOIN profesor pr 
	ON de.id = pr.id_departamento INNER JOIN asignatura asi 
    ON pr.id_profesor = asi.id_profesor INNER JOIN grado g 
    ON asi.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- RESULTADO
Informática	
```



6. Devuelve un listado con todos los alumnos (id, nombre, apellido1 y apellido2) que se han matriculado en alguna asignatura durante el curso escolar 2014/2015.
``` sql 
SELECT DISTINCT(p.id), p.nombre, p.apellido1, p.apellido2
FROM persona p INNER JOIN alumno_se_matricula_asignatura al 
	ON p.id = al.id_alumno INNER JOIN curso_escolar cu 
    ON al.id_curso_escolar = cu.id
WHERE cu.anyo_inicio = 2014 OR cu.anyo_inicio = 2015;

-- RESULTADO
id	nombre	apellido1	apellido2	
1	Salvador	Sánchez	Pérez	
2	Juan	Saez	Vega	
4	Pedro	Heller	Pagac	
```





### [A4.5.6] 📝Consultas multitabla universidad (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql 
SELECT de.nombre, pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe INNER JOIN profesor pr 
	ON pe.id = pr.id_profesor LEFT JOIN departamento de 
    ON pr.id_departamento = de.id
ORDER BY de.nombre ASC, pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre ASC;

    
-- RESULTADO
nombre   	apellido1	apellido2	nombre	
Agronomía	Monahan	Murray	Micaela	
Economía y Empresa	Fahey	Considine	Antonio	
Economía y Empresa	Lemke	Rutherford	Cristina	
Educación	Ruecker	Upton	Guillermo	
Educación	Spencer	Lakin	Esther	
Educación	Streich	Hirthe	Carmen	
Informática	Hamill	Kozey	Manolo	
Informática	Ramirez	Gea	Zoe	
Matemáticas	Kohler	Schoen	Alejandro	
Matemáticas	Schmidt	Fisher	David	
Química y Física	Schowalter	Muller	Francesca	
Química y Física	Stiedemann	Morissette	Alfredo	
```



2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql 
SELECT pe.*
FROM persona pe INNER JOIN profesor pr 
	ON pe.id = pr.id_profesor LEFT JOIN departamento de 
    ON pr.id_departamento = de.id
WHERE de.id IS NULL;    

-- RESULTADO
-- No hay resultados
```



3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql 
SELECT de.*
FROM departamento de LEFT JOIN profesor pr
    ON de.id = pr.id_departamento
WHERE pr.id_profesor IS NULL;

-- RESULTADO
id	nombre	
7	Filología	
8	Derecho	
9	Biología y Geología	
```



4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql 
SELECT pe.*
FROM persona pe INNER JOIN profesor pr 
	ON pe.id = pr.id_profesor LEFT JOIN asignatura asi
    ON pr.id_profesor = asi.id_profesor
WHERE asi.id_profesor IS NULL;

-- RESULTADO
id	nif	nombre	apellido1	apellido2	ciudad	direccion	telefono	fecha_nacimiento	sexo	tipo	
5	38223286T	David	Schmidt	Fisher	Almería	C/ Venus	678516294	1978-01-19	H	profesor	
15	80502866Z	Alejandro	Kohler	Schoen	Almería	C/ Tajo	668726354	1980-03-14	H	profesor	
8	79503962T	Cristina	Lemke	Rutherford	Almería	C/ Saturno	669162534	1977-08-21	M	profesor	
16	10485008K	Antonio	Fahey	Considine	Almería	C/ Sierra de los Filabres	NULL	1982-03-18	H	profesor	
10	61142000L	Esther	Spencer	Lakin	Almería	C/ Plutón	NULL	1977-05-19	M	profesor	
12	85366986W	Carmen	Streich	Hirthe	Almería	C/ Almanzora	NULL	1971-04-29	M	profesor	
17	85869555K	Guillermo	Ruecker	Upton	Almería	C/ Sierra de Gádor	NULL	1973-05-05	H	profesor	
18	04326833G	Micaela	Monahan	Murray	Almería	C/ Veleta	662765413	1976-02-25	H	profesor	
13	73571384L	Alfredo	Stiedemann	Morissette	Almería	C/ Guadalquivir	950896725	1980-02-01	H	profesor	
20	79221403L	Francesca	Schowalter	Muller	Almería	C/ Quinto pino	NULL	1980-10-31	H	profesor	
```



5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql 
SELECT asi.*
FROM asignatura asi LEFT JOIN profesor pr 
	ON asi.id_profesor = pr.id_profesor
WHERE pr.id_profesor IS NULL;    

-- RESULTADO
id	nombre	creditos	tipo	curso	cuatrimestre	id_profesor	id_grado	
22	Ingeniería de Requisitos	6	optativa	3	1	NULL	4	
23	Integración de las Tecnologías de la Información e...	6	optativa	3	1	NULL	4	
24	Modelado y Diseño del Software 1	6	optativa	3	1	NULL	4	
25	Multiprocesadores	6	optativa	3	1	NULL	4	
26	Seguridad y cumplimiento normativo	6	optativa	3	1	NULL	4	
27	Sistema de Información para las Organizaciones	6	optativa	3	1	NULL	4	
28	Tecnologías web	6	optativa	3	1	NULL	4	
29	Teoría de códigos y criptografía	6	optativa	3	1	NULL	4	
30	Administración de bases de datos	6	optativa	3	2	NULL	4	
31	Herramientas y Métodos de Ingeniería del Software	6	optativa	3	2	NULL	4	
32	Informática industrial y robótica	6	optativa	3	2	NULL	4	
33	Ingeniería de Sistemas de Información	6	optativa	3	2	NULL	4	
34	Modelado y Diseño del Software 2	6	optativa	3	2	NULL	4	
35	Negocio Electrónico	6	optativa	3	2	NULL	4	
36	Periféricos e interfaces	6	optativa	3	2	NULL	4	
37	Sistemas de tiempo real	6	optativa	3	2	NULL	4	
38	Tecnologías de acceso a red	6	optativa	3	2	NULL	4	
39	Tratamiento digital de imágenes	6	optativa	3	2	NULL	4	
40	Administración de redes y sistemas operativos	6	optativa	4	1	NULL	4	
41	Almacenes de Datos	6	optativa	4	1	NULL	4	
42	Fiabilidad y Gestión de Riesgos	6	optativa	4	1	NULL	4	
43	Líneas de Productos Software	6	optativa	4	1	NULL	4	
44	Procesos de Ingeniería del Software 1	6	optativa	4	1	NULL	4	
45	Tecnologías multimedia	6	optativa	4	1	NULL	4	
46	Análisis y planificación de las TI	6	optativa	4	2	NULL	4	
```



6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql 
SELECT DISTINCT de.nombre
FROM departamento de LEFT JOIN profesor pr 
    ON de.id = pr.id_departamento LEFT JOIN asignatura a 
    ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura al 
    ON a.id = al.id_curso_escolar LEFT JOIN curso_escolar c 
    ON al.id_curso_escolar = c.id
WHERE a.id_profesor IS NULL AND c.id IS NULL AND al.id_asignatura IS NULL;


-- RESULTADO
nombre
Matemáticas
Economía y Empresa
Educación
Agronomía
Química y Física
Filología
Derecho
Biología y Geología
```





### [A4.5.7] 📝Consultas resumen universidad ❓:
1. Devuelve el número total de alumnas que hay.
```sql 
SELECT COUNT(pe.id) AS cantidad_alumnas
FROM persona pe
WHERE pe.tipo = 'alumno' AND pe.sexo = 'M';

-- RESULTADO
3	
```



2. Calcula cuántos alumnos nacieron en 1999.
```sql 
SELECT COUNT(pe.id) AS cantidad_alumnos_1999
FROM persona pe
WHERE pe.tipo = 'alumno' AND YEAR(pe.fecha_nacimiento) = 1999;

-- RESULTADO
2
```



3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql 
SELECT de.nombre, COUNT(pr.id_profesor) AS cantidad_profesores
FROM profesor pr INNER JOIN departamento de 
	ON pr.id_departamento = de.id
GROUP BY de.nombre
ORDER BY COUNT(pr.id_profesor) DESC;

-- RESULTADO
nombre	cantidad_profesores	
Educación	3	
Economía y Empresa	2	
Matemáticas	2	
Informática	2	
Química y Física	2	
Agronomía	1	
```



4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql 
SELECT de.nombre, COUNT(pr.id_profesor) AS cantidad_profesores
FROM departamento de LEFT JOIN profesor pr 
	ON pr.id_departamento = de.id
GROUP BY de.nombre
ORDER BY COUNT(pr.id_profesor) DESC;

-- RESULTADO
nombre	cantidad_profesores	
Educación	3	
Economía y Empresa	2	
Matemáticas	2	
Informática	2	
Química y Física	2	
Agronomía	1	
Biología y Geología	0	
Derecho	0	
Filología	0	
```



5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql 
SELECT g.nombre, COUNT(asi.id) AS cantidad_asignaturas
FROM grado g LEFT JOIN asignatura asi 
	ON g.id = asi.id_grado
GROUP BY g.nombre
ORDER BY COUNT(asi.id) DESC;

-- RESULTADO
nombre	cantidad_asignaturas	
Grado en Ingeniería Informática (Plan 2015)	51	
Grado en Biotecnología (Plan 2015)	32	
Grado en Ciencias Ambientales (Plan 2009)	0	
Grado en Ingeniería Mecánica (Plan 2010)	0	
Grado en Ingeniería Eléctrica (Plan 2014)	0	
Grado en Química (Plan 2009)	0	
Grado en Ingeniería Agrícola (Plan 2015)	0	
Grado en Matemáticas (Plan 2010)	0	
Grado en Ingeniería Química Industrial (Plan 2010)	0	
Grado en Ingeniería Electrónica Industrial (Plan 2...	0	
```



6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql 
SELECT g.nombre, COUNT(asi.id) AS cantidad_asignaturas
FROM grado g INNER JOIN asignatura asi 
	ON g.id = asi.id_grado
GROUP BY g.nombre
HAVING COUNT(asi.id) > 40;

-- RESULTADO
Grado en Ingeniería Informática (Plan 2015)	51	
```



7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
```sql 
SELECT g.nombre, asi.tipo, SUM(asi.creditos) AS total_creditos
FROM grado g INNER JOIN asignatura asi 
	ON g.id = asi.id_grado
GROUP BY asi.tipo, g.nombre;

-- RESULTADO
nombre	tipo	total_creditos	
Grado en Biotecnología (Plan 2015)	básica	60	
Grado en Ingeniería Informática (Plan 2015)	básica	72	
Grado en Biotecnología (Plan 2015)	obligatoria	120	
Grado en Ingeniería Informática (Plan 2015)	obligatoria	54	
Grado en Ingeniería Informática (Plan 2015)	optativa	180	
```



8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql 
SELECT cu.anyo_inicio, COUNT(al.id_alumno) AS cantidad_alumnos
FROM alumno_se_matricula_asignatura al INNER JOIN curso_escolar cu 
	ON al.id_curso_escolar = cu.id 
GROUP BY cu.anyo_inicio;

-- RESULTADO
anyo_inicio	cantidad_alumnos	
2014	9	
2018	30	
```



9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql 
SELECT pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(asi.id) AS cantidad_asignaturas
FROM persona pe INNER JOIN profesor pr
	ON pe.id = pr.id_profesor LEFT JOIN asignatura asi
	ON asi.id_profesor = pr.id_profesor
GROUP BY pr.id_profesor
ORDER BY COUNT(asi.id) DESC;

-- RESULTADO
id_profesor	nombre	apellido1	apellido2	cantidad_asignaturas	
14	Manolo	Hamill	Kozey	11	
3	Zoe	Ramirez	Gea	10	
16	Antonio	Fahey	Considine	0	
17	Guillermo	Ruecker	Upton	0	
18	Micaela	Monahan	Murray	0	
20	Francesca	Schowalter	Muller	0	
5	David	Schmidt	Fisher	0	
8	Cristina	Lemke	Rutherford	0	
10	Esther	Spencer	Lakin	0	
12	Carmen	Streich	Hirthe	0	
13	Alfredo	Stiedemann	Morissette	0	
15	Alejandro	Kohler	Schoen	0	
```




### [A4.5.8] 📝Subconsultas universidad ❓:
1. Devuelve todos los datos del alumno más joven.
```sql 
SELECT pe.*
FROM persona pe
WHERE pe.fecha_nacimiento = (SELECT MAX(p.fecha_nacimiento) 
                            FROM persona p
                            WHERE p.tipo = 'alumno');
-- RESULTADO
4	17105885A	Pedro	Heller	Pagac	Almería	C/ Estrella fugaz	NULL	2000-10-05	H	alumno	
```



2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql 
SELECT pr.*
FROM profesor pr 
WHERE pr.id_departamento NOT IN (SELECT d.id
                                FROM departamento d
                                WHERE d.id IS NOT NULL);

-- RESULTADO
-- No devuelve resultados
```



3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql 
SELECT de.*
FROM departamento de 
WHERE de.id NOT IN (SELECT pr.id_departamento
                   FROM profesor pr
                   WHERE pr.id_profesor IS NOT NULL);

-- RESULTADO
id	nombre	
7	Filología	
8	Derecho	
9	Biología y Geología	
```



4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql 
SELECT pr.*
FROM profesor pr 
WHERE pr.id_departamento IN (SELECT d.id
                            	FROM departamento d
                                WHERE d.id IS NOT NULL) AND NOT EXISTS (SELECT asi.id_profesor
                                                                           FROM asignatura asi
                                                                           WHERE pr.id_profesor = asi.id_profesor);

-- RESULTADO
SELECT pr.*
FROM profesor pr 
WHERE pr.id_departamento IN (SELECT d.id
                            	FROM departamento d
                                WHERE d.id IS NOT NULL) AND NOT EXISTS (SELECT asi.id_profesor
                                                                           FROM asignatura asi
                                                                           WHERE pr.id_profesor = asi.id_profesor);

id_profesor	id_departamento	
5	2	
15	2	
8	3	
16	3	
10	4	
12	4	
17	4	
18	5	
13	6	
20	6	
```



5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql 
SELECT asi.*
FROM asignatura asi 
WHERE NOT EXISTS (SELECT pr.id_profesor
                  FROM profesor pr
                  WHERE pr.id_profesor = asi.id_profesor)

-- RESULTADO
id	nombre	creditos	tipo	curso	cuatrimestre	id_profesor	id_grado	
22	Ingeniería de Requisitos	6	optativa	3	1	NULL	4	
23	Integración de las Tecnologías de la Información e...	6	optativa	3	1	NULL	4	
24	Modelado y Diseño del Software 1	6	optativa	3	1	NULL	4	
25	Multiprocesadores	6	optativa	3	1	NULL	4	
26	Seguridad y cumplimiento normativo	6	optativa	3	1	NULL	4	
27	Sistema de Información para las Organizaciones	6	optativa	3	1	NULL	4	
28	Tecnologías web	6	optativa	3	1	NULL	4	
29	Teoría de códigos y criptografía	6	optativa	3	1	NULL	4	
30	Administración de bases de datos	6	optativa	3	2	NULL	4	
31	Herramientas y Métodos de Ingeniería del Software	6	optativa	3	2	NULL	4	
32	Informática industrial y robótica	6	optativa	3	2	NULL	4	
33	Ingeniería de Sistemas de Información	6	optativa	3	2	NULL	4	
34	Modelado y Diseño del Software 2	6	optativa	3	2	NULL	4	
35	Negocio Electrónico	6	optativa	3	2	NULL	4	
36	Periféricos e interfaces	6	optativa	3	2	NULL	4	
37	Sistemas de tiempo real	6	optativa	3	2	NULL	4	
38	Tecnologías de acceso a red	6	optativa	3	2	NULL	4	
39	Tratamiento digital de imágenes	6	optativa	3	2	NULL	4	
40	Administración de redes y sistemas operativos	6	optativa	4	1	NULL	4	
41	Almacenes de Datos	6	optativa	4	1	NULL	4	
42	Fiabilidad y Gestión de Riesgos	6	optativa	4	1	NULL	4	
43	Líneas de Productos Software	6	optativa	4	1	NULL	4	
44	Procesos de Ingeniería del Software 1	6	optativa	4	1	NULL	4	
45	Tecnologías multimedia	6	optativa	4	1	NULL	4	
46	Análisis y planificación de las TI	6	optativa	4	2	NULL	4	
```



6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql 

/*
SELECT *
FROM departamento de LEFT JOIN profesor pr 
	ON de.id = pr.id_departamento LEFT JOIN asignatura asi 
    ON pr.id_profesor = asi.id_profesor 
    WHERE NOT EXISTS (SELECT al.id_curso_escolar
                      FROM alumno_se_matricula_asignatura al
                      WHERE al.id_curso_escolar IS NULL) 
AND pr.id_departamento IS NULL;
*/

-- RESULTADO
id	nombre	
2	Matemáticas	
3	Economía y Empresa	
4	Educación	
5	Agronomía	
6	Química y Física	
7	Filología	
8	Derecho	
9	Biología y Geología	
```
