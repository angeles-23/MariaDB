# SUBCONSULTTAS  
Las subconsultas son consultas SQL dentro de otra consulta. Se utilizan para obtener datos que luego se utilizan en la consulta principal. En otras palabras, una subconsulta es una consulta anidada dentro de otra, que puede ser utilizada en la cláusula SELECT, FROM, WHERE, entre otras.

## Tipos de subconsultas:
Existen varios tipos de subconsultas, y se pueden clasificar de la siguiente manera:
- **Subconsultas de fila**. Devuelven más de una columna pero una única fila.
- **Subconsultas de tabla**. Devuelve una o varias columnas y cero o varias filas.
- **Subconsultas escalares**. Devuelven una columna y una fila (un valor).

### Subconsulta en la cláusula WHERE: 
Es la más común y se usa cuando necesitas obtener un valor para compararlo con otros valores en la consulta principal.

Ejemplo:
```sql
SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);
```

En este caso, la subconsulta devuelve el salario promedio de todos los empleados, y la consulta principal selecciona a los empleados cuyo salario es mayor que ese promedio.

### Subconsulta en la cláusula FROM: 
En este caso, la subconsulta se usa para crear una tabla temporal que luego es utilizada por la consulta principal.

Ejemplo:
```sql
SELECT emp_id, nombre
FROM (SELECT emp_id, nombre FROM empleados WHERE salario > 50000) AS empleados_buenos;

```


Aquí, la subconsulta crea una lista de empleados con salario mayor a 50,000, y luego la consulta principal la utiliza para seleccionar sus emp_id y nombre.

### Subconsulta en la cláusula SELECT: 
Se usa para calcular valores adicionales o realizar agregaciones dentro de la consulta principal.

Ejemplo:
```sql
SELECT nombre, (SELECT COUNT(*) FROM proyectos WHERE proyectos.emp_id = empleados.emp_id) AS num_proyectos
FROM empleados;
```

En este caso, la subconsulta cuenta el número de proyectos de cada empleado y lo incluye como una columna en el resultado de la consulta principal.


Las subconsultas son muy útiles porque permiten simplificar consultas complejas al dividirlas en partes más pequeñas y manejables. Sin embargo, es importante usarlas con cuidado, ya que en algunos casos pueden afectar el rendimiento de la consulta, especialmente si la subconsulta devuelve muchos datos o se ejecuta muchas veces.

