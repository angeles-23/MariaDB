-- Crea una base datos llamada ejercicio_1 (previa eliminación de la misma en caso de existir) e indica el comando para poder utilizarla
-- Realiza sobre esa base de datos la transformación al Modelo Físico con el SGBD MariaDB de las siguientes tablas obtenidas a partir de un Modelo Relacional
-- VENDEDOR(dni PK, nombre, direccion, fecha_nacimiento)
-- PEDIDO(numero PK, fecha, vendedor FK (VENDEDOR.dni))
-- LINEA_PEDIDO(num_pedido PK FK(PEDIDO.numero), ref_articulo PK FK(ARTICULO.referencia), cantidad)
-- ARTICULO(referencia PK, descripcion, precio)
-- Con las siguiente consideraciones:

-- Los campos de tipo moneda deben almacenar 8 digitos numericos no decimales + 2 posiciones decimales, en total 10 digitos.
-- Los campos clave de las tablas ARTICULO y PEDIDO serán enteros que se incrementarán automáticamente
-- Todo vendedor debe tener obligatoriamente un nombre, todo pedido debe ser obligatoriamente de algún vendedor y todo articulo deberá tener obligatoriamente un precio.
-- Toda linea de pedido debe tener obligatoriamente alguna cantidad, que deseamos que siempre sea distinta de cero (aunque este SGBD no fuese capaz de realizar aún ese tipo de comprobaciones).
-- Los artículos tendrán un precio por defecto de 2,5€
-- Las cadenas de caracteres que no sean clave primaria deben ser de tamaño de 255


DROP DATABASE IF EXISTS ejercicio_1;
CREATE DATABASE ejercicio_1;
USE ejercicio_1;

-- VENDEDOR(dni PK, nombre, direccion, fecha_nacimiento)        nombre obligatorio
CREATE TABLE VENDEDOR(
    dni varchar(15) PRIMARY KEY,
    nombre varchar(255) NOT NULL,
    direccion varchar(255),
    fecha_nacimiento date
);

-- PEDIDO(numero PK, fecha, vendedor FK (VENDEDOR.dni))         PK entero AUTOINCREMENT
CREATE TABLE PEDIDO(
    numero int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha date,
    vendedor varchar(15) NOT NULL,
    FOREIGN KEY (vendedor) REFERENCES VENDEDOR (dni)
);

-- ARTICULO(referencia PK, descripcion, precio)        obligatorio 10 dígitos con 2 decimales, precio por defecto 2.50, PK entero AUTOINCREMENT
CREATE TABLE ARTICULO(
    referencia int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion varchar(255),
    precio decimal(10,2) NOT NULL DEFAULT 2.50
);

-- LINEA_PEDIDO(num_pedido PK FK(PEDIDO.numero), ref_articulo PK FK(ARTICULO.referencia), cantidad)             cantidad obligatorio y que sea distinta de 0
CREATE TABLE LINEA_PEDIDO(
    num_pedido int UNSIGNED,
    ref_articulo int UNSIGNED,
    cantidad int NOT NULL ,
    PRIMARY KEY (num_pedido, ref_articulo),
    FOREIGN KEY (num_pedido) REFERENCES PEDIDO (numero),
    FOREIGN KEY (ref_articulo) REFERENCES ARTICULO (referencia),
    CHECK(cantidad != 0)
);




SELECT p.id, p.nombre as 'nombre de producto', if(p.precio<100, 'económico', 'caro') as calificacion, if(f.nombre IS NULL, 'FABRICACION PROPIA', UPPER(f.nombre)) as fabricante
FROM producto p LEFT JOIN fabricante f 
	ON p.código_fabricante = f.código