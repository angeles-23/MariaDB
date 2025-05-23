# 📝Ejercicios sobre parámetros de entrada❓:
Sobre la base de datos bd_teoria_productos

1. Crea un procedimiento de nombre producto_posicion() que guarde en variables locales los datos del producto que ocupa la posición indicada, una vez ordenados alfabeticamente. Después debe mostrar en una única columna de nombre ‘datos_producto’ todos los datos del producto encontrado separados por guiones (utiliza la función concat_ws) o el mensaje 'no existe' cuando no exista ningún producto que ocupe esa posición.
```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_posicion;

DELIMITER $$
CREATE PROCEDURE producto_posicion(p_posicion_indicada int);
	COMMENT 'Devuelve el producto que ocupa la posición p_posicion_indicada en una cadena separada por guiones'
BEGIN
    -- Declarar variables
    DECLARE v_id int(11);
    DECLARE v_nombre varchar(50);
    DECLARE v_tipo varchar(25);
    DECLARE v_precio decimal(16,2);
    DECLARE v_código_fabricante int(11);
    DECLARE v_desplazamiento int;

    SET v_desplazamiento = p_posicion_indicada-1;

    -- Buscar el producto que ocupa la posición
	SELECT p.id, p.nombre, p.tipo, p.precio, p.código_fabricante
    INTO v_id, v_nombre, v_tipo, v_precio, v_código_fabricante
    FROM producto p
    ORDER BY p.nombre ASC
    LIMIT v_desplazamiento, 1; -- Salto p_posicion_indicada-1 y quiero 1 posición, pero no admite ciertos caracteres, solo valores numéricos

    -- Devolver la cadena esperada
    SELECT ifnull(concat_ws('-', ), 'no existe') AS datos_producto;

END $$

/*
 USE bd_teoria_productos;
 DROP PROCEDURE IF EXISTS producto_posicion_2;
 
 DELIMITER $$
 CREATE PROCEDURE producto_posicion_2(IN p_posicion int)
 
 BEGIN
 	-- Variables locales
    DECLARE v_id int (11); -- Por defacto es NULL
    DECLARE v_nombre varchar(25) DEFAULT '';
    DECLARE v_tipo varchar(25) DEFAULT '';
    DECLARE v_precio decimal(16,2) DEFAULT 0.0;
    DECLARE v_codigo_fabricante int(11) DEFAULT 0;
    -- Variables como parametros
    DECLARE v_posicion int DEFAULT 0;
    SET v_posicion = p_posicion - 1;
   
    SELECT p.id, p.nombre, p.tipo, p.precio, p.código_fabricante
    INTO v_id, v_nombre, v_tipo, v_precio, v_codigo_fabricante
    FROM producto p
    ORDER BY p.nombre ASC
    LIMIT v_posicion, 1;
    
    SELECT if(v_id IS NULL, 
              'no existe', 
              concat_ws('-', v_id, v_nombre, v_tipo, v_precio, v_codigo_fabricante)
             ) AS datos_producto;
 
 /*
CALL producto_posicion_2(1);  -- Existe
CALL producto_posicion_2(7);  -- No existe
CALL producto_posicion_2(6);  -- Maximo
*/

END $$
*/
```


2. Crea un procedimiento de nombre produto_getMaxPrecioFabricante() que reciba un parametro denominado pfabricante que recibirá el codigo del fabricante del que deseamos calcular el producto más caro. Debe guardar en variables locales los datos (código, nombre y precio) del producto con mayor precio de ese fabricante. Después debe mostrar en una única columna de nombre ‘datos_producto’ los datos del producto encontrado con este formato (código) nombre : precio . Tenemos que asegurarnos que solamente se devuelve un producto en la consulta, para que no se produzcan errores.

```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS produto_getMaxPrecioFabricante;

DELIMITER $$
CREATE PROCEDURE produto_getMaxPrecioFabricante(pfabricante int)
    COMMENT 'Devuelve el producto mas caro dado como parametro el codigo_fabricante'
BEGIN
    DECLARE v_codigo int(11);
    DECLARE v_nombre varchar(50);
    DECLARE v_precio decimal(16,2);

    SELECT p.id, p.nombre, p.precio
    INTO v_codigo, v_nombre, v_precio
    FROM producto p 
    WHERE p.código_fabricante = pfabricante
    ORDER BY p.precio DESC
    LIMIT 1;

    SELECT concat('(', v_codigo , ') ', v_nombre, ' : ', v_precio) AS datos_producto;
/*
CALL produto_getMaxPrecioFabricante(5);
*/
END $$

/*
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS produto_getMaxPrecioFabricante_2;

DELIMITER $$
CREATE PROCEDURE produto_getMaxPrecioFabricante_2(IN pfabricante int(11))
	COMMENT 'Devuelve el producto con mayor precio de ese fabricante'
BEGIN 
	
    DECLARE v_id int(11);
    DECLARE v_nombre varchar(50) DEFAULT '';
    DECLARE v_precio decimal(16,2) DEFAULT 0.0;
    
    SELECT p.id, p.nombre, p.precio
    INTO v_id, v_nombre, v_precio
    FROM producto p
    WHERE p.código_fabricante = pfabricante 
    ORDER BY p.precio DESC
    LIMIT 1;

	SELECT if(v_id IS NULL,
        concat('No existe el fabricante ', pfabricante), 
        concat('(', v_id, ') ', v_nombre, ' : ', v_precio)
        ) AS datos_producto;
/*
CALL produto_getMaxPrecioFabricante_2(5); -- Existen varios
CALL produto_getMaxPrecioFabricante_2(3); -- Existe 
CALL produto_getMaxPrecioFabricante_2(1); -- No existe
*/
END $$
```


3. Crea un procedimiento de nombre producto_add() que añada un nuevo producto dado su nombre, tipo, precio y código_fabricante. Deberás enviar los datos del producto utilizando parámetros. Después debe mostrar en una única columna de nombre ‘datos_producto’ todos los datos del producto insertado separados por guiones.

```sql 
USE bd_teoria_productos;
DROP PROCEDURE IF EXISTS producto_add;

DELIMITER $$
CREATE PROCEDURE producto_add(IN p_nombre varchar(50), IN p_tipo varchar(25), IN p_precio decimal(16,2), IN p_codigo_fabricante int)
	COMMENT 'Añade un producto dado sus datos'
BEGIN 
    DECLARE v_id int;
    DECLARE v_nombre varchar(50) DEFAULT '';
    DECLARE v_tipo varchar(25) DEFAULT '';
    DECLARE v_codigo_fabricante int DEFAULT 0;
    
    IF p_tipo IS NULL THEN 
    	-- Busca el tipo del último producto del mismo fabricante, guardamos en v_tipo
        SELECT p.tipo, p.código_fabricante
        INTO v_tipo, v_codigo_fabricante
        FROM producto p
        WHERE p.código_fabricante = p_codigo_fabricante
        ORDER BY p.id ASC
        LIMIT 1;
       	
        IF v_tipo = '' THEN
        	SET p_tipo = 'desconocido'; 
        END IF;
        
        INSERT INTO producto (nombre, tipo, precio, código_fabricante) VALUES (p_nombre, v_tipo, p_precio, v_codigo_fabricante);
    ELSE
		INSERT INTO producto (nombre, tipo, precio, código_fabricante) VALUES (p_nombre, p_tipo, p_precio, p_codigo_fabricante);
	END IF;
    
    SELECT concat_ws(' - ', p_nombre, p_tipo, p_precio, p_codigo_fabricante) AS datos_producto;
    
/*
CALL producto_add('Teclado', 'Informática', 23.23, 5); -- Si existe
CALL producto_add('Ratón', 'Informática', 15.99, 10);  -- código_fabricante no existe
CALL producto_add('Ratón', '', 15.99, 1);  -- tipo no existe
*/    
END $$
```

📝 Nota: Cuando el tipo sea null o '' (cadena vacia), antes de insertar el producto, se buscará el tipo del último producto insertado del mismo fabricante, que será el que asignaremos a este nuevo producto. Caso de no existir productos de ese fabricante, el tipo será 'desconocido'.
