# Tienda de informática
Realice las siguientes operaciones sobre la base de datos tienda.

1. Inserta un nuevo fabricante indicando su código y su nombre.
```sql
INSERT INTO fabricante (codigo, nombre) VALUES (10,'LG');
```


2. Inserta un nuevo fabricante indicando solamente su nombre.
```sql
INSERT INTO fabricante (nombre) VALUES ('Apple');
```


3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.
```sql
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (12, 'Monitor 30 LED 4K', 280, 10);
```


4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: nombre, precio y código_fabricante.
```sql
INSERT INTO producto (nombre, precio, codigo_fabricante) VALUES ('iPhone 15', 950, 11); 
```


5. Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros de la base de datos tienda en esta tabla haciendo uso de única operación de inserción.
```sql
USE tienda;

CREATE TABLE fabricante_productos(
	nombre_fabricante varchar(100) NOT NULL,
    nombre_producto varchar(100) NOT NULL,
    precio double NOT NULL
);

INSERT INTO fabricante_productos(nombre_fabricante, nombre_producto, precio)
SELECT f.nombre, p.nombre, p.precio
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo_fabricante;
```


6. Crea una vista con el nombre vista_fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio.
```sql
CREATE VIEW vista_fabricante_productos AS 
SELECT fp.nombre_fabricante, fp.nombre_producto, fp.precio
FROM fabricante_productos fp;

CREATE VIEW vista_fabricante_productos_2 AS
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio
FROM fabricante f INNER JOIN producto p 
	ON f.codigo = p.codigo;
```


7. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
```sql
-- No se puede eliminar ya que está relacionado con una clave foránea a otra tabla;

/* Habría que modificar la tabla después de haberla creado, así: */
-- 1º Tabla a la que apunta y buscar el nombre:
SHOW CREATE TABLE producto;

-- 2ª Eliminar la clave foránea acutual
ALTER TABLE producto DROP FOREIGN KEY producto_ibfk_1;

-- 3º Volver a crear la clave foránea con ON DELETE CASCADE:
ALTER TABLE producto 
ADD CONSTRAINT fk_producto_fabricante
FOREIGN KEY(codigo_fabricante) REFERENCES fabricante(codigo) ON DELETE CASCADE;

-- 4º Borrar al fabricante Asus;
DELETE FROM fabricante WHERE nombre = 'Asus';
```


8. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
```sql
START TRANSACTION;

SELECT *
FROM fabricante;

DELETE FROM fabricante WHERE nombre = 'Xiaomi';

SELECT *
FROM fabricante;

ROLLBACK;

SELECT *
FROM fabricante;
```


9. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
```sql
-- No es posible hay que modificar la tabla producto
ALTER TABLE producto DROP FOREIGN KEY fk_producto_fabricante;

ALTER TABLE producto
ADD CONSTRAINT fk_producto_fabricante
FOREIGN KEY(codigo_fabricante) REFERENCES fabricante(codigo)
ON DELETE CASCADE
ON UPDATE CASCADE;

UPDATE fabricante SET codigo = 20 WHERE nombre = 'Lenovo';
```


10. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
```sql
UPDATE fabricante SET codigo = 30 WHERE nombre = 'Huawei';

```


11. Actualiza el precio de todos los productos sumándole 5 € al precio actual.
```sql
UPDATE producto SET producto.precio = producto.precio + 5;
```


12. Elimina todas las impresoras que tienen un precio menor de 200 €.
```sql
DELETE FROM producto WHERE producto.nombre LIKE '%Impresora%' AND producto.precio < 200;
```
