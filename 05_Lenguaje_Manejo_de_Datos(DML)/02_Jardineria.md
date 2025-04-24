# Jardinería
Realice las siguientes operaciones sobre la base de datos jardineria.

1. Inserta una nueva oficina en Almería.
```sql

```



2. Inserta un empleado para la oficina de Almería que sea representante de ventas.
```sql

```



3. Inserta un cliente que tenga como representante de ventas el empleado que hemos creado en el paso anterior.
```sql

```



4. Inserte un pedido para el cliente que acabamos de crear, que contenga al menos dos productos.
```sql

```



5. Actualiza el código del cliente que hemos creado en el paso anterior y averigua si hubo cambios en las tablas relacionadas.
```sql

```



6. Borra el cliente y averigua si hubo cambios en las tablas relacionadas.
```sql

```



7. Elimina los clientes que no hayan realizado ningún pedido.
```sql

```



8. Incrementa en un 20% el precio de los productos que no tengan pedidos.
```sql

```



9. Borra los pagos del cliente con menor límite de crédito.
```sql

```



10. Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto OR-179.
```sql

```



11. Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva. Mediante una transacción, establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga fecha a partir de Enero de 2009. A continuación actualiza el resto de pedidos estableciendo el iva al 21.
```sql

```



12. Modifica la tabla detalle_pedido para incorporar un campo numérico llamado total_linea y actualiza todos sus registros para calcular su valor con la fórmula:
```txt
total_linea = precio_unidad*cantidad * (1 + (iva/100));
```
```sql

```



13. Borra el cliente que menor límite de crédito tenga. ¿Es posible borrarlo solo con una consulta? ¿Por qué?
```sql

```




14. Inserta una oficina con sede en Granada y tres empleados que sean representantes de ventas.
```sql

```



15. Inserta tres clientes que tengan como representantes de ventas los empleados que hemos creado en el paso anterior.
```sql

```



16. Realiza una transacción que inserte un pedido para cada uno de los clientes. Cada pedido debe incluir dos productos.
```sql

```



17. Borra uno de los clientes y comprueba si hubo cambios en las tablas relacionadas. Si no hubo cambios, modifica las tablas necesarias estableciendo la clave foránea con la cláusula ON DELETE CASCADE.
```sql

```



18. Realiza una transacción que realice los pagos de los pedidos que han realizado los clientes del ejercicio anterior.
```sql

```
