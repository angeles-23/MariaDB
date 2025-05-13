
# 📝Ejercicios sobre variables locales❓:
Sobre la base de datos bd_teoria_productos

1. Crea un procedimiento de nombre producto_getUltimo() que guarde en variables locales los datos del último producto ordenado alfabeticamente. Después debe mostrar en una única columna de nombre ‘datos_producto’ todos los datos del producto encontrado separados por guiones (utiliza la función concat_ws).
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_getUltimo;

DELIMITER $$
CREATE PROCEDURE producto_getUltimo()
	COMMENT 'Muestra los datos del último producto ordenado alfabeticamente'
BEGIN
    DECLARE v_id int(11);
    DECLARE v_nombre varchar(50);
    DECLARE v_tipo varchar(25);
    DECLARE v_precio decimal(16,2);
    DECLARE v_codigo_fabricante int(11);
	
	SELECT p.id, p.nombre, p.tipo, p.precio, p.código_fabricante -- siempre que exista un producto, sino saldrán nulos
    INTO v_id, v_nombre, v_tipo, v_precio, v_código_fabricante
    FROM producto p 
    ORDER BY p.nombre DESC
    LIMIT 1;

	SELECT concat_ws('-', ifnull(v_id, ''), ifnull(v_nombre, ''), ifnull(v_tipo, ''), ifnull(v_precio, ''), ifnull(v_codigo_fabricante, '')) AS datos_producto;
/*
-- En caso de que la tabla producto este vacía (PRUEBA)
START TRANSACTION;
CALL producto_getUltimo();
DELETE FROM producto; -- Elimina la tabla producto
CALL producto_getUltimo();
ROLLBACK;
*/
END $$



/*********** USANDO UNA ÚNICA VARIABLE LOCAL ***********/
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_getUltimo;

DELIMITER $$
CREATE PROCEDURE producto_getUltimo()
	COMMENT 'Muestra los datos del último producto ordenado alfabeticamente'
BEGIN
    DECLARE v_resultado varchar(255);
    SET v_resultado = '----'; 		-- En caso de que no exista ningún producto sería -> ----, si se deja vacío se queda vacío v_resultado
	
	SELECT concat_ws('-', ifnull(p.id, ''), ifnull(p.nombre, ''), ifnull(p.tipo, ''), ifnull(p.precio, ''), ifnull(p.código_fabricante, '')) AS datos_producto
    INTO v_resultado
    FROM producto p
    ORDER BY p.nombre DESC
    LIMIT 1;
    
    SELECT v_resultado AS datos_producto;
/*
-- En caso de que la tabla producto este vacía (PRUEBA)
START TRANSACTION;
CALL producto_getUltimo();
DELETE FROM producto; -- Elimina la tabla producto
CALL producto_getUltimo();
ROLLBACK;
*/
END $$
```


2. Crea un procedimiento de nombre produto_getMaxPrecio() que guarde en variables locales los datos (código, nombre y precio) del producto con mayor precio. Después debe mostrar en una única columna de nombre ‘datos_producto’ los datos del producto encontrado con este formato (código) nombre : precio . Tenemos que asegurarnos que solamente se devuelve un producto en la consulta, para que no se produzcan errores.
```sql 

```
