# 📝Ejercicios sobre parámetros de entrada/salida❓:
1. Crea un procedimiento de nombre producto_addPrecio al que se le envíe como parámetros el código del producto y una cantidad que representa el dinero que se le va a aumentar el precio a dicho producto. Si se desea decrementar se indicará una cantidad negativa. El procedimiento debe devolver en el mismo parámetro el nuevo precio del producto. Debes realizar la implementación del procedimiento y un bloque de codigo con una llamada de ejemplo.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_addPrecio;

DELIMITER $$
CREATE PROCEDURE producto_addPrecio(IN p_id_producto int, INOUT p_extra decimal(16,2))
	COMMENT 'Devuelve el precio final'
BEGIN
	
    DECLARE v_precio decimal(16,2);
    DECLARE v_precio_final decimal(16,2);
    
    SELECT p.precio
    INTO v_precio
    FROM producto p
    WHERE p.id = p_id_producto;

    IF v_precio IS NOT NULL THEN
        SET v_precio_final = v_precio + p_extra;
    ELSE
        SET v_precio_final = 100;
    END IF;

    SET p_extra = v_precio_final;

/*
START TRANSACTION;
SET @dato = 4;
CALL producto_addPrecio(1, @dato); -- EXISTE 86.00
SELECT @dato; -- 90.00

SET @dato = 10;
CALL producto_addPrecio(100, @dato); -- NO EXISTE 100
SELECT @dato; -- 100.00
ROLLBACK;
*/

END $$
``` 



2. Una vez realizado el ejercicio anterior, crea un nuevo procedimiento producto_addPrecioByNombre que haga lo mismo, pero al cual se le envía el nombre del producto en lugar del código. Deberás guardar en una variable local el codigo del producto para después modificar su precio invocando al procedimiento anterior. Debe devolver o retornar el mismo dato que en el ejercicio anterior.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_addPrecioByNombre;

DELIMITER $$
CREATE PROCEDURE producto_addPrecioByNombre (IN p_nombre_producto varchar(50), INOUT p_extra decimal(16,2))
	COMMENT 'Devuelve el precio final'
BEGIN

    DECLARE v_precio decimal(16,2);
    DECLARE v_id int;
    DECLARE v_precio_final decimal(16,2);
    
    SELECT p.id
    INTO v_id
    FROM producto p
    WHERE p.nombre = p_nombre_producto
    LIMIT 1;
    
    IF v_id IS NULL THEN 
    	SET v_id = 0;
    ELSE 
    	CALL producto_addPrecio(v_id, p_extra);
    END IF;
    
/*
START TRANSACTION;
SET @dato = 10;
CALL producto_addPrecioByNombre('Ati 7000Ti', @dato); -- EXISTE 170.00
SELECT @dato; -- 180.00

SET @dato = 15;
CALL producto_addPrecioByNombre('Hola', @15); -- NO EXISTE: saldra 15
SELECT @dato;
ROLLBACK;
*/

END $$
``` 



3. Crea un procedimiento de nombre producto_getDescripcion al que se le pase como parámetro el código de un producto id y devuelve en el mismo parámetro el nombre del fabricante, seguido de : y el nombre completo de dicho producto.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_getDescripcion;

DELIMITER $$
CREATE PROCEDURE producto_getDescripcion(INOUT p_id VARCHAR(50))
	COMMENT 'Devuelve el nombre del fabricante : nombre_completo_producto'
BEGIN

    DECLARE v_id int;
    DECLARE v_nombre_fabricante varchar(100);
    DECLARE v_nombre_producto varchar(50);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    	SET v_id = NULL;
    
    SELECT p.id, f.nombre, p.nombre
    INTO v_id, v_nombre_fabricante, v_nombre_producto
    FROM fabricante f INNER JOIN producto p 
    	ON f.código = p.código_fabricante
    WHERE p.id = p_id
    ORDER BY p.id ASC
    LIMIT 1;
    
    IF v_id IS NULL THEN
    	SET v_nombre_fabricante = 'DESCONOCIDO';
        SET v_nombre_producto = 'DESCONOCIDO';
    END IF;
        
    SET p_id = concat_ws(':', v_nombre_fabricante, v_nombre_producto);
    
/*
START TRANSACTION;
SET @dato = 5;
CALL producto_getDescripcion(@dato); -- EXISTE 
SELECT @dato; -- 

SET @dato = 15;
CALL producto_getDescripcion(@15); -- NO EXISTE
SELECT @dato;
ROLLBACK;
*/
END $$
``` 
En este procedimiento se pide que el mismo parámetro sirva para enviar el código del producto (que es integer en la base de datos) y que devuelva el nombre del fabricante ('DESCONOCIDO' si es nulo), seguido de : y el nombre completo del producto (que será varchar del tamaño de la columna Producto.nombre sumado el tamaño de la columna nombre en la tabla producto con el tamaño la suma de fabricante.nombre más tres unidades.