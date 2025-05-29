/*
1. EJERCICIO (2 puntos)
Se desea realizar una consulta que imprima los códigos y nombres de todos los fabricantes junto a la cantidad de productos que tienen 'num productos', el precio mínimo 'min pre', el precio máximo 'max pre' y el precio medio 'pre medio' de sus productos. No se deben imprimir valores nulos en los valores numéricos, en esos casos se imprimirá 0. Debes utilizar subconsultas para obtener los precios.
*/
SELECT f.código, 
		f.nombre, 
        (SELECT COUNT(p.id)
        FROM producto p
        WHERE p.código_fabricante = f.código)  AS 'num productos',
        
        IFNULL(
            (SELECT MIN(p.precio)
            FROM producto p 
            WHERE p.código_fabricante = f.código),
            0
        )AS 'min pre',
        
        IFNULL(
            (SELECT MAX(p.precio)
            FROM producto p 
            WHERE p.código_fabricante = f.código),
            0
        ) AS 'max pre',
        
        IF ( 
            (SELECT AVG(p.precio)
            FROM producto p 
            WHERE p.código_fabricante = f.código) IS NULL , 
            0,
        	ROUND( 
                (SELECT AVG(p.precio)
                FROM producto p 
                WHERE p.código_fabricante = f.código) , 2)
        ) AS 'pre medio'
        
FROM fabricante f;




/*
2. EJERCICIO (2,5 puntos)
Crea un procedimiento llamado fabricantes_sin_productos que reciba un parametro llamado pmaximo, que imprima los códigos y nombres de los fabricantes que no tienen productos en la tabla producto. El procedimiento nunca debe mostrar más fabricantes de los indicados en pmaximo caso de que existan. Si pmaximo es menor que uno mostrará un mensaje de error: 'ERROR pmaximo < 1'
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS fabricantes_sin_productos$$
CREATE PROCEDURE fabricantes_sin_productos(pmaximo int)
BEGIN

    DECLARE v_codigo int;
    DECLARE v_nombre varchar(100);

    DECLARE v_fin boolean DEFAULT FALSE;
    DECLARE v_contador_filas int DEFAULT 0;

    DECLARE c CURSOR FOR 
        SELECT f.código, f.nombre
        FROM fabricante f LEFT JOIN producto p 
            ON f.código = p.código_fabricante
        WHERE p.código_fabricante IS NULL;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        BEGIN 
            SET v_fin = TRUE;
        END;

    
    IF pmaximo < 1 THEN 
        SELECT 'ERROR pmaximo < 1' AS mensaje;

    ELSE 
        DROP TEMPORARY TABLE IF EXISTS tabla_temporal;
        CREATE TEMPORARY TABLE tabla_temporal(
            codigo int,
            nombre varchar(100)
        );
        
        OPEN c;
            bucle:LOOP
                FETCH c INTO v_codigo, v_nombre;
                
                IF v_fin THEN 
                    LEAVE bucle;
                END IF;

                INSERT INTO tabla_temporal(codigo, nombre) VALUES (v_codigo, v_nombre);

                SET v_contador_filas = v_contador_filas + 1;

                IF v_contador_filas >= pmaximo THEN 
                    LEAVE bucle;
                END IF;

            END LOOP;
        CLOSE c;

        SELECT CONCAT_WS('-', codigo, nombre) AS mensaje
        FROM tabla_temporal;
        
    END IF;
END $$

CALL fabricantes_sin_productos(0);
CALL fabricantes_sin_productos(1);
CALL fabricantes_sin_productos(2);



/*
3. EJERCICIO (3 puntos)
Crea un procedimiento almacenado llamado productos_baratos_ordenados con los productos ordenados por nombre que muestre en una sola columna y separados por ',' los id del primer producto y los de aquellos productos que sean del mismo precio o más baratos que los inmediatamente anteriores.

Nota: Puedes ir construyendo una cadena vresultado de tamaño 1000 que al finalizar el procedimiento imprimirás con un comando 

SELECT vresultado as productos_baratos_ordenados

Debe producir el siguiente resultado:

productos_baratos_ordenados
5,1,6
*/
DELIMITER $$

DROP PROCEDURE IF EXISTS productos_baratos_ordenados $$

CREATE PROCEDURE productos_baratos_ordenados()
BEGIN
    DECLARE v_id INT;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_precio DECIMAL(16,2);
    DECLARE v_anterior_precio DECIMAL(16,2);
    DECLARE vresultado VARCHAR(1000) DEFAULT '';
    DECLARE fin_cursor BOOLEAN DEFAULT FALSE;
    DECLARE primero BOOLEAN DEFAULT TRUE;

    -- Cursor para recorrer los productos ordenados por nombre
    DECLARE cur CURSOR FOR
        SELECT id, nombre, precio FROM producto ORDER BY nombre;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = TRUE;

    OPEN cur;

    bucle: LOOP
        FETCH cur INTO v_id, v_nombre, v_precio;
        IF fin_cursor THEN
            LEAVE bucle;
        END IF;

        IF primero THEN
            SET vresultado = CONCAT(v_id);
            SET v_anterior_precio = v_precio;
            SET primero = FALSE;
        ELSE
            IF v_precio <= v_anterior_precio THEN
                SET vresultado = CONCAT(vresultado, ',', v_id);
                SET v_anterior_precio = v_precio;
            END IF;
        END IF;
    END LOOP;

    CLOSE cur;

    SELECT vresultado AS productos_baratos_ordenados;
END $$








/*
4. EJERCICIO (2,5 puntos)
Crea una función de nombre fabricante_sumaPrecioProductos(pcodigo int) que en base a un código de fabricante devuelva la suma de los precios de los productos de ese fabricante. Si el fabricante no existe debe devolver -1 y en caso de no tener productos 0. Pon algún ejemplo de uso.

Para su desarrollo debes modificar el código que se te proporciona a continuación, que devolverá el id del producto más barato del fabricante que se le pida.

DELIMITER $$
DROP FUNCTION IF EXISTS fabricante_getIdProductoMasBarato$$
CREATE FUNCTION fabricante_getIdProductoMasBarato(pcodigo int) 
RETURNS INT COMMENT 'Obtiene el id del producto más barato del fabricante. Devuelve -9 si no existe el fabricante y 0 si no hay productos para ese fabricante'
BEGIN
    DECLARE vid int;
    DECLARE vexiste_fabricante boolean; 

    SELECT id
        INTO vid
        FROM producto
        WHERE código_fabricante = pcodigo
        ORDER BY precio
        LIMIT 1;

    IF vid is null THEN
        -- si no hemos encontrado productos puede que sea porque no existe el fabricante
        SELECT count(*)
            INTO vexiste_fabricante -- 1 es verdad y 0 es falso
            FROM fabricante
            WHERE código = pcodigo;

        IF vexiste_fabricante THEN
            SET vid = 0;
        ELSE
            SET vid = -9;
        END IF;
    END IF;

    RETURN vid;
/*
DELIMITER ;
-- PRUEBAS
SELECT fabricante_getIdProductoMasBarato(5);
SELECT fabricante_getIdProductoMasBarato(999);
SELECT fabricante_getIdProductoMasBarato(1);
END$$
*/
DELIMITER $$

DROP FUNCTION IF EXISTS fabricante_sumaPrecioProductos $$

CREATE FUNCTION fabricante_sumaPrecioProductos(pcodigo INT)
RETURNS DECIMAL(16,2)
COMMENT 'Suma el precio de los productos de un fabricante. Devuelve -1 si no existe el fabricante y 0 si no tiene productos.'
BEGIN
    DECLARE vsuma DECIMAL(16,2);
    DECLARE vexiste_fabricante BOOLEAN;

    -- Intentamos obtener la suma de precios
    SELECT SUM(precio)
    INTO vsuma
    FROM producto
    WHERE código_fabricante = pcodigo;

    -- Si la suma es NULL puede que no haya productos o que no exista el fabricante
    IF vsuma IS NULL THEN
        -- Comprobamos si existe el fabricante
        SELECT COUNT(*) > 0
        INTO vexiste_fabricante
        FROM fabricante
        WHERE código = pcodigo;

        IF vexiste_fabricante THEN
            SET vsuma = 0;
        ELSE
            SET vsuma = -1;
        END IF;
    END IF;

    RETURN vsuma;
/*
-- Fabricante con productos
SELECT fabricante_sumaPrecioProductos(5); -- Debería devolver: 86 + 150 + 170 = 406.00

-- Fabricante que no existe
SELECT fabricante_sumaPrecioProductos(999); -- Debería devolver: -1

-- Fabricante que existe pero no tiene productos
SELECT fabricante_sumaPrecioProductos(1); -- Debería devolver: 0
*/

END $$


