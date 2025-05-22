# 📝Ejercicios sobre parámetros de salida❓:
1. Crea un procedimiento de nombre producto_getCodigo que dada una parte del nombre de un producto devuelva en forma de parámetro de salida el código del primero que cumpla la condición de los ordenados alfabéticamente.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_getCodigo;

DELIMITER $
CREATE PROCEDURE producto_getCodigo(IN p_parte_nombre varchar(50), OUT p_codigo int)
    COMMENT 'Devuelva el primer código que cumpla la condición'
BEGIN
    
 	DECLARE v_id int DEFAULT 0;

   	SELECT p.id
   	INTO v_id
   	FROM producto p
   	WHERE p.nombre LIKE concat("%", p_parte_nombre, "%")
   	ORDER BY p.nombre ASC
   	LIMIT 1;
    	
  	SET p_codigo = v_id;
    
/*
CALL producto_getCodigo('G', @salida);
SELECT @salida;
CALL producto_getCodigo('pelota', @salida);
SELECT @salida;
*/ 
END $$ 
```


2. Crea un procedimiento de nombre proc_fabricante_getNombre que dado un código de fabricante devuelva en forma de parámetro de salida su nombre. Debe devolver el nombre vacio en caso de no existir el código de fabricante recibido.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS proc_fabricante_getNombre;

DELIMITER $
CREATE PROCEDURE proc_fabricante_getNombre(IN p_codigo_fabricante int, OUT p_nombre varchar(50))
    COMMENT 'Devuleve el nombre del producto dado su código de fabricante, Si no existe el código de fabricante devolver una cadena vacía'
BEGIN
    
    DECLARE v_nombre varchar(50) DEFAULT '';
    
    SELECT f.nombre
    INTO v_nombre
    FROM fabricante f
    WHERE f.código = p_codigo_fabricante
    ORDER BY f.nombre ASC
    LIMIT 1;
 	
    SET p_nombre = v_nombre;
    
/*
CALL proc_fabricante_getNombre(1, @resultado); -- existe nombre del codigo 1
SELECT @resultado;  -- El hiijo de Ep
CALL proc_fabricante_getNombre(6, @resultado); -- no existe nombre del código 6
SELECT @resultado;  -- ''
*/ 
END $$ 
```


3. Crea un procedimiento de nombre fabricante_add() que añada un nuevo fabricante dado su nombre, debe devolver el código asignado a dicho fabricante como parámetro de salida. Deberás enviar los datos del fabricante utilizando parámetros. Además de realizar el procedimiento debes ejecutarlo con el fabricante 'Dodot'. 
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS fabricante_add;

DELIMITER $
CREATE PROCEDURE fabricante_add(IN p_nombre varchar(50), OUT p_codigo int)
    COMMENT 'Añadir un nuevo fabricante pasandole su nombre'
BEGIN
    
    DECLARE v_id int DEFAULT 0;
    
    INSERT INTO fabricante (nombre) VALUES (p_nombre);
    
    SELECT f.código
    INTO v_id
    FROM fabricante f
    WHERE f.nombre = p_nombre
    ORDER BY f.nombre ASC
    LIMIT 1;
    
    SET p_codigo = v_id;
    
/*
CALL fabricante_add('Dodot', @resultado);
SELECT @resultado;
*/ 
END $$ 


```