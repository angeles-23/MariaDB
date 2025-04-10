## 📘 Subconsultas en SQL - Guía Completa con Ejemplos
Una subconsulta es una consulta SQL anidada dentro de otra consulta. Es útil cuando necesitas un valor intermedio para completar una operación. Existen varios tipos, y en esta guía los verás paso a paso con ejemplos detallados.

### 🔹 ¿Qué es una subconsulta?
Es una consulta dentro de otra consulta. Puede ir en:
- `SELECT`
- `FROM`
- `WHERE`
- `HAVING`

### 🔸 Tipos de Subconsultas
#### ✅ 1. Subconsulta Escalar
**Devuelve un único valor (una sola celda: 1 fila, 1 columna)**

🧪 Ejemplo:
```sql
SELECT nombre
FROM empleado
WHERE salario > (
    SELECT AVG(salario)
    FROM empleado
);
```
📌 **Explicación paso a paso:**

**1. Subconsulta interna:**
```sql
SELECT AVG(salario) FROM empleado;
```
- Devuelve el salario promedio, por ejemplo: 3000.

**2. Consulta principal:**
- Muestra los empleados con salario mayor a 3000.

#### ✅ 2. Subconsulta de Una Columna con Múltiples Filas
**Devuelve una columna pero varias filas**

🧪 Ejemplo:
```sql
SELECT nombre
FROM empleado
WHERE departamento_id IN (
    SELECT id
    FROM departamento
    WHERE ubicacion = 'Madrid'
);
```
📌 **Explicación**:

**1. Subconsulta:** obtiene todos los `id` de departamentos en Madrid. 

**2. Consulta externa:** muestra los empleados que trabajan en esos departamentos.

#### ✅ 3. Subconsulta de Varias Columnas (tupla)
**Devuelve varias columnas, usada con `IN`, `EXISTS`, o comparaciones múltiples**.

🧪 Ejemplo:
```sql
SELECT nombre
FROM empleado
WHERE (departamento_id, puesto) IN (
    SELECT departamento_id, puesto
    FROM vacantes
);
```
📌 **Explicación**:

1. La subconsulta devuelve combinaciones de departamento y puesto disponibles.
2. Se buscan empleados que coincidan con esas combinaciones.

#### ✅ 4. Subconsulta Correlacionada
**La subconsulta depende de la fila actual de la consulta externa.
Se ejecuta una vez por cada fila de la consulta principal.**

🧪 Ejemplo:
```sql
SELECT nombre
FROM empleado e
WHERE salario > (
    SELECT AVG(salario)
    FROM empleado
    WHERE departamento_id = e.departamento_id
);
```
📌 **Explicación**:

- Por cada empleado, calcula el salario promedio de su propio departamento.
- Muestra solo los que ganan más que el promedio de su equipo.

#### ✅ 5. Subconsulta en la Cláusula FROM (Tabla Derivada)
**Se usa una subconsulta como si fuera una tabla temporal.**
🧪 Ejemplo:
```sql
SELECT d.nombre, e.promedio_salario
FROM (
    SELECT departamento_id, AVG(salario) AS promedio_salario
    FROM empleado
    GROUP BY departamento_id
    ) e
JOIN departamento d ON e.departamento_id = d.id;
```
📌 **Explicación**:

1. La subconsulta calcula el promedio de salario por departamento.
2. Luego se hace un `JOIN` con `departamento` para mostrar el nombre del departamento junto al promedio.

#### ✅ 6. Subconsulta con EXISTS / NOT EXISTS
**Se utiliza para verificar si existen filas que cumplan cierta condición.**

🧪 Ejemplo con `EXISTS`:
```sql
SELECT nombre
FROM departamento d
WHERE EXISTS (
    SELECT 1
    FROM empleado e
    WHERE e.departamento_id = d.id
);
```
🧪 Ejemplo con `NOT EXISTS`:
```sql
SELECT nombre
FROM departamento d
WHERE NOT EXISTS (
    SELECT 1
    FROM empleado e
    WHERE e.departamento_id = d.id
);
```
📌 **Explicación**:

- `EXISTS`: muestra los departamentos que tienen empleados.
- `NOT EXISTS`: muestra los departamentos que no tienen empleados.


### 🧾 Comparativa de Tipos de Subconsultas
|Tipo|Devuelve|Usado en	Característica|Principal|
|----|--------|-----------------------|---------|
|Escalar|Un solo valor|SELECT, WHERE|Ideal para comparar con un valor único|
|Una columna, muchas filas|	Lista de valores|	IN, = ANY|	Muy útil para búsquedas tipo lista|
|Varias columnas (tuplas)|	Varias columnas|	IN (tuplas)|	Compara múltiples valores al mismo tiempo|
|Correlacionada|	Depende de cada fila|	WHERE|	Se ejecuta repetidamente, una vez por cada fila|
|En FROM|	Tabla temporal|	FROM	|Se puede usar con alias y unir a otras tablas|
|EXISTS / NOT EXISTS|	true / false|	WHERE|	Verifica existencia de filas según una condición|
