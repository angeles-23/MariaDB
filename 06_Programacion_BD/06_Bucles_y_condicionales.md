# 📝Ejercicios sobre Condicionales y Bucles❓:
1. Crea un procedimiento de nombre producto_buscaPrecio(pvp decimal(16,2)). Dicho procedimiento deberá buscar un producto que tenga un precio igual al indicado y mostrar su nombre. En caso de que no se encuentre ninguno, deberá mostrar 'NO EXISTE' (utiliza if-else). En caso de existir varios productos con el mismo precio debes mostrar aquel cuyo codigo de producto id sea menor.
```sql


```



2. Crea un procedimiento de nombre productos_Add al que se le pase un número que indicará el número de productos a crear.
```sql


```

El procedimiento debe de añadir a la tabla 'producto' el número de productos indicados en el parámetro. Teniendo en cuenta lo siguiente: * El nombre del producto será 'Producto creado automaticamente YYYY' siendo YYYY un número contador que empezará con el número de productos creados en la tabla. Así, si hay 30 productos y envío el número 5 al procedimiento, empezará en 31 hasta 35. * El id será asignado automáticamente. * El tipo será auto * El fabricante será una cadena pasada como parámetro y se tendrá que buscar su código en la tabla fabricante. Caso de no existir se dejará a null * El procedimiento devolverá en el mismo parámetro el número de productos que hay en la tabla. * Si con los que se van a crear (antes de hacerlo) hay más de 99 produtos creados no hará nada y devolverá el valor -1 en el parámetro. Para hacer esta parte debes emplear una etiqueta para salir del procedimiento.

3. Modifica el procedimiento anterior para que si el número de productos es mayor que 50 avise con un select indicando ese número. Puedes llamar a esta nueva versión del procedimiento productos_Add2
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