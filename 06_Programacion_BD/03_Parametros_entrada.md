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
```


2. Crea un procedimiento de nombre produto_getMaxPrecioFabricante() que reciba un parametro denominado pfabricante que recibirá el codigo del fabricante del que deseamos calcular el producto más caro. Debe guardar en variables locales los datos (código, nombre y precio) del producto con mayor precio de ese fabricante. Después debe mostrar en una única columna de nombre ‘datos_producto’ los datos del producto encontrado con este formato (código) nombre : precio . Tenemos que asegurarnos que solamente se devuelve un producto en la consulta, para que no se produzcan errores.

```sql 

```


3. Crea un procedimiento de nombre producto_add() que añada un nuevo producto dado su nombre, tipo, precio y código_fabricante. Deberás enviar los datos del producto utilizando parámetros. Después debe mostrar en una única columna de nombre ‘datos_producto’ todos los datos del producto insertado separados por guiones.
   
```sql 

```


📝 Nota: Cuando el tipo sea null o '' (cadena vacia), antes de insertar el producto, se buscará el tipo del último producto insertado del mismo fabricante, que será el que asignaremos a este nuevo producto. Caso de no existir productos de ese fabricante, el tipo será 'desconocido'.