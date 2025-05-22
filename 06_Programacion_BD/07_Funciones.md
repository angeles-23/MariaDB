📝Ejercicios sobre Funciones❓:
1. Crea una función de nombre fabricante_getNombre(codigo varchar(100)) que en base a un codigo de fabricante devuelva su nombre o la cadena ‘DESCONOCIDO’ en caso que no exista. Pon algún ejemplo de uso.
```sql

```


2. Crea una función de nombre fabricante_getIdProductoMasBarato(codigo int) que en base a un código de fabricante devuelva su id de producto más barato. Si el fabricante no existe debe devolver -1 y en caso de no tener productos 0. Pon algún ejemplo de uso.
```sql

```


3. Crea una función llamada cuentaLetra() que dado una cadena de caracteres recibida como primer parámetro, llamada pCadena, y un segundo parámetro llamado pLetra que contendrá un único carácter. Devuelva como resultado el número de apariciones de dicho carácter en la cadena, utilizando un bucle para su elaboración.
```sql


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
---------------------------------------------
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

Funcion, procedimiento, sentencia manipulacion de datos, 5 ejercicios, cursores, consultas de tipo complicada y sencilla, dentro de un procedimiento un cursor.