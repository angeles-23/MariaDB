### [A4.5.4] 📝Consultas básicas universidad❓:
1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql 

-- RESULTADO


```



2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql 

-- RESULTADO

```



3. Devuelve el listado de los alumnos que nacieron en 1999.
```sql 

-- RESULTADO

```



4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql 

-- RESULTADO

```



5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql 

-- RESULTADO

```





### [A4.5.5] 📝Consultas multitabla universidad (Composición interna) ❓:
1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
``` sql 

-- RESULTADO

```



2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
``` sql 

-- RESULTADO

```



3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
``` sql 

-- RESULTADO

```



4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
``` sql 

-- RESULTADO

```



5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
``` sql 

-- RESULTADO

```



6. Devuelve un listado con todos los alumnos (id, nombre, apellido1 y apellido2) que se han matriculado en alguna asignatura durante el curso escolar 2014/2015.
``` sql 

-- RESULTADO

```





### [A4.5.6] 📝Consultas multitabla universidad (Composición externa) ❓:
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql 

-- RESULTADO

```



2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql 

-- RESULTADO

```



3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql 

-- RESULTADO

```



4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql 

-- RESULTADO

```



5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql 

-- RESULTADO

```



6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql 

-- RESULTADO

```





### [A4.5.7] 📝Consultas resumen universidad ❓:
1. Devuelve el número total de alumnas que hay.
```sql 

-- RESULTADO

```



2. Calcula cuántos alumnos nacieron en 1999.
```sql 

-- RESULTADO

```



3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql 

-- RESULTADO

```



4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql 

-- RESULTADO

```



5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql 

-- RESULTADO

```



6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql 

-- RESULTADO

```



7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
```sql 

-- RESULTADO

```



8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql 

-- RESULTADO

```



9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql 

-- RESULTADO

```




### [A4.5.8] 📝Subconsultas universidad ❓:
1. Devuelve todos los datos del alumno más joven.
```sql 

-- RESULTADO

```



2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql 

-- RESULTADO

```



3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql 

-- RESULTADO

```



4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql 

-- RESULTADO

```



5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql 

-- RESULTADO

```



6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql 

-- RESULTADO

```
