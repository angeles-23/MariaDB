# 📝Ejercicios sobre Procedimientos❓:
Sobre la base de datos bd_teoria_productos:

1. Crea un procedimiento que muestre cuantos productos hay sin fabricante.
```sql 
USE bd_teoria_productos;

DELIMITER $$
DROP PROCEDURE IF EXISTS productos_sin_fabricante;

CREATE PROCEDURE productos_sin_fabricante()
BEGIN 
    SELECT COUNT(*) AS cantidad_productos_sin_fabricantes
    FROM producto p LEFT JOIN fabricante f 
        ON p.código_fabricante = f.código
    WHERE f.código IS NULL;
END $$

DELIMITER ;


CALL bd_teoria_productos.productos_sin_fabricante();
```


2. Modifica el procedimiento anterior y añádele un comentario que describa lo que devuelve el procedimiento.
```sql 
ALTER PROCEDURE productos_sin_fabricante
COMMENT 'Obtiene la cantidad de todos los productos que no tienen fabricantes';
```


3. Muestra con una orden SQL, el contenido del procedimiento.
```sql 
SHOW PROCEDURE STATUS
WHERE Db = 'bd_teoria_productos';
```


4. Crea un procedimiento que muestre el numero de productos del fabricante ‘Hijo de Ep’. Se puede indicar la cláusula COMMENT en la creación del procedimiento, descubre como hacerlo y utilizala en este ejercicio.
```sql 
USE bd_teoria_productos;

DELIMITER $$
DROP PROCEDURE IF EXISTS cantidad_productos_Hijo_de_Ep;

CREATE PROCEDURE cantidad_productos_Hijo_de_Ep()
	COMMENT 'Muestra la cantidad de productos de Hijo de Ep'
BEGIN 
	SELECT COUNT(*) AS cantidad_productos_Hijo_de_Ep
    FROM fabricante f INNER JOIN producto p 
        ON f.código = p.código_fabricante
    WHERE f.nombre = 'Hijo de Ep';
END $$

DELIMITER ;
```


5. Muestra con una orden SQL el nombre de todos los procedimientos de la base de datos
```sql 
SHOW PROCEDURE STATUS
WHERE Db = 'bd_teoria_productos';
```
