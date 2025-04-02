### Subconsultas en la cláusula HAVING
Ejemplo: Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Asus.
```sql
SELECT fabricante.nombre, COUNT(*)
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(*) = (
    SELECT COUNT(producto.codigo)
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Asus');
```



### Subconsultas en la cláusula FROM
Ejemplo: Devuelve un listado de todos los productos que tienen un precio mayor o igual al precio medio de todos los productos de su mismo fabricante.

```sql
SELECT *
FROM producto INNER JOIN (
    SELECT codigo_fabricante, AVG(precio) AS media
    FROM producto
    GROUP BY codigo_fabricante) AS t
ON producto.codigo_fabricante = t.codigo_fabricante
WHERE producto.precio >= t.media;
```



```sql

```
