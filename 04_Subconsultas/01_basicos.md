### Ejemplos clase:
```sql

SELECT *
FROM (SELECT p.* 
        FROM producto p
        WHERE p.código_fabricante = 5) as p5



-- SE EJECUTAN TANTAS VECES COMO FILAS TIENE
SELECT p.id, 
        p.nombre, 
        p.tipo, 
        p.precio, 
        p.código_fabricante,
        (SELECT nombre 
         FROM fabricante 
         WHERE código=5) as subconsulta
FROM producto p


-- BB.DD.: Tienda
-- Ejemplo: Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Asus.
SELECT *
FROM producto p 
WHERE p.precio >= 
                (SELECT MAX(p.precio)
                 FROM producto p INNER JOIN fabricante f 
                 	ON p.codigo_fabricante = f.codigo
                 WHERE f.nombre = 'Asus');




-- Ejemplo: Devuelve un listado de los clientes que no han realizado ningún pedido.

SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT id_cliente FROM pedido WHERE cliente.id = pedido.id_cliente);
-- =
SELECT *
FROM cliente
WHERE (SELECT count(*) FROM pedido WHERE cliente.id = pedido.id_cliente) = 0;


```



### Subconsultas en la cláusula HAVING
Ejemplo: Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Asus.
```sql
SELECT 
    fabricante.nombre, 
    COUNT(*)
FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(*) =
    (
    SELECT COUNT(producto.codigo)
    FROM fabricante INNER JOIN producto
        ON fabricante.codigo = producto.codigo_fabricante
    WHERE fabricante.nombre = 'Asus'
    );
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
