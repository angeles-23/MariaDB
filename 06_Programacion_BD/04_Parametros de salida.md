# 📝Ejercicios sobre parámetros de salida❓:
1. Crea un procedimiento de nombre producto_getCodigo que dada una parte del nombre de un producto devuelva en forma de parámetro de salida el código del primero que cumpla la condición de los ordenados alfabéticamente.
```sql 
USE bd_teoria_productos;

DELIMITER $$
DROP PROCEDURE IF EXISTS producto_getCodigo $$
CREATE PROCEDURE producto_getCodigo(pcadena varchar(50), OUT pcodigo int)
BEGIN
    DECLARE vid int;

    SELECT id
    INTO vid
    FROM producto
    WHERE nombre like concat('%',pcadena,'%')
    ORDER BY nombre
    LIMIT 1;

    IF vid is not null THEN
        SET pcodigo = vid;
    ELSE
        SET pcodigo = 0;
    END IF;
/*
call producto_getCodigo('ati', @resultado);
SELECT @resultado; -- Ati es el id 5
call producto_getCodigo('murcielago', @resultado);
SELECT @resultado; -- id 0  por no existir
*/
END $$
```


2. Crea un procedimiento de nombre proc_fabricante_getNombre que dado un código de fabricante devuelva en forma de parámetro de salida su nombre. Debe devolver el nombre vacio en caso de no existir el código de fabricante recibido.
```sql 



```


3. Crea un procedimiento de nombre fabricante_add() que añada un nuevo fabricante dado su nombre, debe devolver el código asignado a dicho fabricante como parámetro de salida. Deberás enviar los datos del fabricante utilizando parámetros. Además de realizar el procedimiento debes ejecutarlo con el fabricante 'Dodot'. 
```sql 



```