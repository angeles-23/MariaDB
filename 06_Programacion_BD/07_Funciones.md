📝Ejercicios sobre Funciones❓:
1. Crea una función de nombre fabricante_getNombre(codigo varchar(100)) que en base a un codigo de fabricante devuelva su nombre o la cadena ‘DESCONOCIDO’ en caso que no exista. Pon algún ejemplo de uso.
```sql
USE bd_teoria_productos;
DROP FUNCTION IF EXISTS fabricante_getNombre;

DELIMITER $$ 
CREATE FUNCTION fabricante_getNombre(p_codigo varchar(100)) RETURNS varchar(100) 
	COMMENT 'Devuelve su nombre o "DESCONOCIDO" en caso de que no exista'
BEGIN
	DECLARE v_nombre VARCHAR(100) DEFAULT NULL;
    
    -- Buscar el nombre de dicho codigo de la tabla fabricante
    SELECT f.nombre
    INTO v_nombre
    FROM fabricante f
	WHERE f.código = p_codigo
    LIMIT 1;    
    
    IF v_nombre IS NOT NULL THEN 
    	RETURN v_nombre;
    ELSE
    	RETURN 'DESCONOCIDO';
	END IF;
/*
SELECT fabricante_getNombre(1);
*/
END $$
```


2. Crea una función de nombre fabricante_getIdProductoMasBarato(codigo int) que en base a un código de fabricante devuelva su id de producto más barato. Si el fabricante no existe debe devolver -1 y en caso de no tener productos 0. Pon algún ejemplo de uso.
```sql
USE bd_teoria_productos;
DROP FUNCTION IF EXISTS fabricante_getIdProductoMasBarato;

DELIMITER $$ 
CREATE FUNCTION fabricante_getIdProductoMasBarato(p_codigo int) RETURNS int(11) 
	COMMENT 'Devuelve su id del producto mas barato. Si fabricante no existe devolver -1 y si no tiene productos 0'
BEGIN
    DECLARE v_codigo_fabricante int DEFAULT NULL;
    DECLARE v_id int DEFAULT NULL;
    
    -- Busca el codigo de fabricante 
    SELECT p.código_fabricante, p.id
    INTO v_codigo_fabricante, v_id
    FROM producto p
    WHERE p.código_fabricante = p_codigo
    ORDER BY p.precio ASC
    LIMIT 1;
    -- Devolver resultado 
    IF v_codigo_fabricante IS NULL THEN 
    	RETURN -1;
    ELSEIF v_id IS NULL AND v_código_fabricante IS NOT NULL THEN
    	RETURN 0;
    ELSE
    	RETURN v_id;
    END IF;
/*
SELECT fabricante_getIdProductoMasBarato(5); -- EXISTE: resultado 1
SELECT fabricante_getIdProductoMasBarato(6); -- NO EXISTE codigo_fabricante: resultado -1
SELECT fabricante_getIdProductoMasBarato(7); -- NO EXISTE id: resultado 0
*/
END $$
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