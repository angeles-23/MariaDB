### 📝Ejercicios COMPOSICIONES SQL-2❓:
#### Dada la base de datos bd_teoria_productos que te puedes descargar desde el apartado Referencias se pide, utilizando sintáxis SQL-2:

1. Realiza la composición cruzada entre la tabla fabricante y la tabla producto descartando aquellas uniones en las que el código del fabricante sea impar

``` sql
SELECT f.*, p.*
FROM fabricante f, producto p    /* , -> CROSS JOIN */
WHERE f.codigo = p.codigo_fabricante AND  f.codigo % 2 != 0;

```



2. Realiza la composición interna (interseccion) entre la tabla fabricante y la tabla producto, en la que se muestren solo aquellos productos cuyo precio sea mayor o igual que 120€ ordenados por precio ascendentemente.

``` sql


```



3. Deseamos obtener de todos los producto un listado de todos sus campos, junto al nombre del fabricante de los mismos. En la consulta deben aparecer los datos de los productos incluso si no tienen un fabricante asignado. Realiza la consulta usando la sintaxis SQL-2 de más de una forma.

``` sql

```



4. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también aquellos fabricantes que no tienen productos asociados.

``` sql

```



5. Deseamos obtener de todos los producto un listado de todos sus campos, junto a los nombres de los fabricante de los mismos. En la consulta deben aparecer también tanto los producto que no tienen un fabricante asignado, como aquellos fabricantes que no tienen productos asociados. Indica las instrucciones para realizarlo tanto en SQL Server como en MySQL/MariaDB.

``` sql

```