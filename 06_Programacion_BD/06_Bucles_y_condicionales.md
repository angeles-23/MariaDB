# 📝Ejercicios sobre Condicionales y Bucles❓:
1. Crea un procedimiento de nombre producto_buscaPrecio(pvp decimal(16,2)). Dicho procedimiento deberá buscar un producto que tenga un precio igual al indicado y mostrar su nombre. En caso de que no se encuentre ninguno, deberá mostrar 'NO EXISTE' (utiliza if-else). En caso de existir varios productos con el mismo precio debes mostrar aquel cuyo codigo de producto id sea menor.
```sql
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_buscaPrecio;

DELIMITER $$
CREATE PROCEDURE producto_buscaPrecio(IN pvp decimal(16,2))
	COMMENT 'Bucsa un producto por su precio, si no se encuentra "NO EXISTE" y si existe mostrar el de menor ID'
BEGIN
	
    DECLARE v_precio decimal(16,2) DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre varchar(50) DEFAULT '';
    
   	SELECT p.precio, p.nombre
    INTO v_precio, v_nombre
    FROM producto p
    WHERE p.precio = pvp
    ORDER BY p.id ASC
    LIMIT 1;

	IF v_nombre = '' THEN 
    	SET v_nombre = 'NO EXISTE';
    END IF;
    
    SELECT v_nombre AS nombre_producto;
/*
CALL producto_buscaPrecio(1); -- EXISTE: Guantes
CALL producto_buscaPrecio(2); -- NO EXISTE: 2
*/
END $$
```



2. Crea un procedimiento de nombre productos_Add al que se le pase un número que indicará el número de productos a crear.

El procedimiento debe de añadir a la tabla 'producto' el número de productos indicados en el parámetro. Teniendo en cuenta lo siguiente: * El nombre del producto será 'Producto creado automaticamente YYYY' siendo YYYY un número contador que empezará con el número de productos creados en la tabla. Así, si hay 30 productos y envío el número 5 al procedimiento, empezará en 31 hasta 35. * El id será asignado automáticamente. * El tipo será auto * El fabricante será una cadena pasada como parámetro y se tendrá que buscar su código en la tabla fabricante. Caso de no existir se dejará a null * El procedimiento devolverá en el mismo parámetro el número de productos que hay en la tabla. * Si con los que se van a crear (antes de hacerlo) hay más de 99 produtos creados no hará nada y devolverá el valor -1 en el parámetro. Para hacer esta parte debes emplear una etiqueta para salir del procedimiento.
```sql
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS productos_Add;

DELIMITER $$
CREATE PROCEDURE productos_Add(INOUT p_numero_productos int, IN p_nombre_fabricante varchar(100))
	COMMENT 'Dado un numero crea una cienta cantidad de productos, '
BEGIN
	DECLARE i int;
    DECLARE v_nombre varchar(50);
    DECLARE v_tipo varchar(25) DEFAULT 'auto';
    DECLARE v_precio decimal(16,2) DEFAULT 100.00;
    DECLARE v_cod_fabricante int(11) DEFAULT NULL;
    DECLARE v_id int DEFAULT NULL;
    DECLARE v_ultimo_ID int; -- 30
    DECLARE v_cantidad_productos_maximos INT DEFAULT 99;
    
    -- Buscar el ultimo ID del la tabla producto
    SELECT p.id
    INTO v_ultimo_ID
    FROM producto p 
    ORDER BY p.id DESC
    LIMIT 1;
    
    -- Valor del ultimo id es el valor de i
    SET i = v_ultimo_ID-1; -- 30
    
    -- Buscar el código del parametro p_nombre_fabricante
    SELECT f.código
    INTO v_cod_fabricante
    FROM fabricante f
    WHERE f.nombre = p_nombre_fabricante
    LIMIT 1;
	
    IF v_cod_fabricante IS NULL THEN 
    	SET p_numero_productos = -2;
    ELSEIF v_ultimo_ID + p_numero_productos > v_cantidad_productos_maximos THEN 
    	SET p_numero_productos = -1;
   	ELSE
    	REPEAT
            SET v_nombre = concat('Producto creado automaticamente ', i);
            INSERT INTO producto (nombre, tipo, precio, código_fabricante) VALUES (v_nombre, v_tipo, v_precio, v_cod_fabricante);
            SET i = i+1;
        UNTIL i > p_numero_productos + v_ultimo_ID -- Hasta que i sea > p_numero_productos + v_ultimo_ID
        END REPEAT;
    END IF;
    
/*
START TRANSACTION;
SET @cantidad_productos_a_añadir = 4;
CALL productos_Add(@cantidad_productos_a_añadir, 'El hijo de Ep');  -- Añadir 4
SELECT @nombre;
SELECT *
FROM producto;
ROLLBACK;
*/
END $$
```

3. Modifica el procedimiento anterior para que si el número de productos es mayor que 50 avise con un select indicando ese número. Puedes llamar a esta nueva versión del procedimiento productos_Add2
```sql
-- hacerlo en clase

```
DELIMITER $$
DROP FUNCTION IF EXISTS diego$$
CREATE FUNCTION diego() 
RETURNS VARCHAR(20)
BEGIN
    RETURN 'buenos dias';
/*
SELECT diego();
*/    
END
$$
--------------------------------------------
DELIMITER $$
DROP FUNCTION IF EXISTS diego$$
CREATE FUNCTION diego()
RETURNS VARCHAR(20)
BEGIN
	DECLARE v_id int;
    
    SELECT id 
        INTO v_id
        FROM producto
        WHERE nombre LIKE '%a%'
        ORDER BY nombre ASC
        LIMIT 1;
    
    RETURN concat('buenos dias ', v_id);
/*
SELECT diego();
*/    
END
$$
---------------------------------------------
DELIMITER $$
DROP FUNCTION IF EXISTS diego$$
CREATE FUNCTION diego()
**RETURNS** VARCHAR(20)
BEGIN
	DECLARE v_id int;
    /*
    SELECT id 
        INTO v_id
        FROM producto
        WHERE nombre LIKE '%a%'
        ORDER BY nombre ASC
        LIMIT 1;
    */
   	CALL producto_getCodigo('%ati%', v_id);
    
    **RETURN** concat('buenos dias', v_id);
/*
SELECT diego();
*/    
END
$$
---------------------------------------------