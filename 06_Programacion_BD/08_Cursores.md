# 📝Ejercicios sobre cursores❓:
1. Crea un procedimiento de nombre cuentaFabricantes que cuente el numero de fabricantes que hay en la tabla fabricante realizando dicho calculo con un cursor que recorra la tabla.
```sql 
USE bd_teoria_productos;

DELIMITER $$
DROP PROCEDURE IF EXISTS cuentaFabricantes $$
CREATE PROCEDURE cuentaFabricantes()
	COMMENT 'Cuenta el numero de fabricantes en la tabla fabricante, usando un cursor'
BEGIN
	-- Variables para el cursor
    DECLARE v_hecho BOOL DEFAULT FALSE;       -- Llega al final del bucle
    DECLARE v_contador int DEFAULT 0;
    DECLARE v_id int;
    
    -- Cursor para recorrer
    DECLARE cur CURSOR FOR                  -- Consulta que quiero hacer
        SELECT v_id FROM fabricante;

    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        BEGIN
            SET v_hecho = TRUE;
        END 

    -- Abrir el cursor
    OPEN cur;
    
    -- Bucle para recorrer cada fila
    WHILE v_hecho = FALSE                   -- v_hecho NO ha acabado de recorrer las filas
    DO
    	FETCH cur INTO v_id;
        
        IF v_hecho = FALSE THEN
        	SET v_contador = v_contador + 1; 
    	END IF;

    END WHILE;
    
    -- Cerrar el cursor
    CLOSE cur;
    
    SELECT v_contador AS numero_de_Fabricantes;
/*
CALL cuentaFabricantes();
SELECT * 
FROM fabricante;
*/
END $$
```


2. Crea un procedimiento llamado precios_iniciales para asignar los precios iniciales a los productos de la tabla producto, que recibirá un parametro pincremento_precio que será de tipo decimal(16,2). Debe asignar los precios iniciales a productos ordenados por su nombre empezando por 1€ y a continuación el precio de los productos será la (posición que ocupa - 1) * pincremento_precio. Antes de finalizar el procedimiento se mostraran todos los datos de los productos del producto del último fabricante no nulo (no de todos).
```sql 
DELIMITER $$
DROP PROCEDURE IF EXISTS precios_iniciales$$
CREATE PROCEDURE precios_iniciales(
    pincremento_precio decimal(16,2)
)
BEGIN
    DECLARE vpos int DEFAULT 0;
    DECLARE vprecio_nuevo decimal(16,2);
    DECLARE vult_fab int;

    DECLARE vid int;
    DECLARE vprecio decimal(16,2);
    DECLARE vcod_fabricante int;
    DECLARE vfin boolean DEFAULT false;

    DECLARE cur CURSOR FOR
        SELECT id, precio, código_fabricante
            FROM producto
            ORDER BY nombre;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        BEGIN
            SET vfin=TRUE;
        END;

    OPEN cur;

    inicio_bucle: LOOP
        FETCH cur INTO vid, vprecio, vcod_fabricante;
        IF vfin THEN
            LEAVE inicio_bucle;
        END IF;

        -- actualizo la posicion
        SET vpos = vpos + 1 ;

        -- calculamos el precio nuevo
        IF vpos = 1 THEN
            SET vprecio_nuevo = 1;
        ELSE
            SET vprecio_nuevo = (vpos - 1) * pincremento_precio;
        END IF;

        -- actualizamos el precio
        UPDATE producto
            SET precio = vprecio_nuevo
            WHERE id = vid;

        -- compruebo si el fabricante es no nulo
        IF vcod_fabricante is not null THEN
            SET vult_fab = vcod_fabricante;
        END IF;
    END LOOP;
   
    CLOSE cur;

    SELECT * FROM producto
        WHERE código_fabricante = vult_fab;
/*
START TRANSACTION;
call precios_iniciales(10);
select * from producto
    ORDER BY nombre;
ROLLBACK;
*/

END $$
```


📝 Nota: Para la ejecución de las pruebas de este procedimiento debes iniciar una transacción antes de la ejecución del mismo, llamar al procedimiento, imprimir los datos de la tabla producto para observar el resultado de la ejecución, y finalizar la transacción con ROLLBACK para deshacer los cambios y que la base de datos no se vea afectada.