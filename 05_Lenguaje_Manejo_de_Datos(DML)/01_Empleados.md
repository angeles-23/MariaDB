# Empleados
Realice las siguientes operaciones sobre la base de datos empleados.

1. Inserta un nuevo departamento indicando su código, nombre y presupuesto.
```sql
INSERT INTO departamento (codigo, nombre, presupuesto) VALUES (8, 'Ventas', 15000);
```



2. Inserta un nuevo departamento indicando su nombre y presupuesto.
```sql
INSERT INTO departamento (nombre, presupuesto) VALUES ('Finanzas', 15000);
```



3. Inserta un nuevo departamento indicando su código, nombre, presupuesto y gastos.
```sql
INSERT INTO departamento (codigo, nombre, presupuesto, gastos) VALUES (10, 'Administración', 160000, 20000);
```



4. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: código, nif, nombre, apellido1, apellido2 y id_departamento.
```sql
INSERT INTO empleado (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES (14, '12345678A', 'Pedro', 'Pérez', 'Ruiz', 10);
```



5. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: nif, nombre, apellido1, apellido2 y id_departamento.
```sql
INSERT INTO empleado (nif, nombre, apellido1, apellido2, codigo_departamento) VALUES ('87654321B', 'Oscar', 'Martinez', 'Miñarro', 8);
```



6. Crea una nueva tabla con el nombre departamento_backup que tenga las mismas columnas que la tabla departamento. Una vez creada copia todos las filas de tabla departamento en departamento_backup.
```sql

```



7. Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
```sql

```



8. Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
```sql

```



9. Actualiza el código del departamento Recursos Humanos y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
```sql

```



10. Actualiza el código del departamento Publicidad y asígnale el valor 40. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
```sql

```



11. Actualiza el presupuesto de los departamentos sumándole 50000 € al valor del presupuesto actual, solamente a aquellos departamentos que tienen un presupuesto menor que 20000 €.
```sql

```



12. Realiza una transacción que elimine todas los empleados que no tienen un departamento asociado.
```sql

```