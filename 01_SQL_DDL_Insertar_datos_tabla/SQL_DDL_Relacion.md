# A3.04. Diseño físico DDL Relación R04
## Modelo Entidad Relación y Relacional
Realizado el siguiente modelo Entidad Relación sobre los productos de una **tienda de informática**

![Fabricante fabrican producto](./imagenes/fabricante.png)


y su correspondiente paso al **Modelo Relacional**:
```sql
FABRICANTE (codigo PK, nombre)
PRODUCTO (codigo PK, nombre, precio, codigo_fabricante FK FABRICANTE.codigo)
```


### SOLUCIÓN (corregido):
``` sql
DROP DATABASE IF EXISTS _01_tienda_informatica;

CREATE DATABASE _01_tienda_informatica CHARACTER SET utf8mb4;
USE _01_tienda_informatica;

/* FABRICANTE (codigo PK, nombre) */
CREATE TABLE FABRICANTE(
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- UNSIGNED: sin signo
    nombre VARCHAR(255) NOT NULL
);

/* PRODUCTO (codigo PK, nombre, precio, codigo_fabricante FK FABRICANTE.codigo) */
CREATE TABLE PRODUCTO(
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(16,2),   -- (cantidad digitos, parte decimal)
    codigo_fabricante INT UNSIGNED NOT NULL, 
    FOREIGN KEY (codigo_fabricante) REFERENCES FABRICANTE(codigo)
);
```

## Modelo Físico
1. Genera la base de datos tienda en MySQL o MariaDB.
2. Para indicar la clave primaria emplea en la columna correspondiente:
```xml 
UNSIGNED AUTO_INCREMENT PRIMARY KEY
```
3. Inserta posteriormente los siguientes valores donde corresponda:
Atención: los valores de un PK auto-incremental NO se insertar en la tabla, pues su valor lo actualiza automáticamente el SGBD.
**Fabricante:**
(1, 'Asus')
(2, 'Lenovo')
(3, 'Hewlett-Packard')
(4, 'Samsung')
(5, 'Seagate')
(6, 'Crucial')
(7, 'Gigabyte')
(8, 'Huawei')
(9, 'Xiaomi')

### SOLUCIÓN (corregido):
```sql
-- Al ser un autoincrement, no hace falta darle el id. Pero es mejor mantener el orden:
INSERT INTO fabricante (nombre, producto) VALUES (1, 'Asus');
INSERT INTO fabricante (nombre, producto) VALUES (2, 'Lenovo');
INSERT INTO fabricante (nombre, producto) VALUES (3, 'Hewlett-Packard');
INSERT INTO fabricante (nombre, producto) VALUES (4, 'Samsung');
INSERT INTO fabricante (nombre, producto) VALUES (5, 'Seagate');
INSERT INTO fabricante (nombre, producto) VALUES (6, 'Crucial');
INSERT INTO fabricante (nombre, producto) VALUES (7, 'Gigabyte');
INSERT INTO fabricante (nombre, producto) VALUES (8, 'Huawei');
INSERT INTO fabricante (nombre, producto) VALUES (9, 'Xiaomi');

-- En caso de equivocación, se pueden borrar todos los datos de la tabla con:
DELETE 
FROM fabricante 
WHERE fabricante.codigo >= 10;
```

**Producto:**
(1, 'Disco duro SATA3 1TB', 86.99, 5)
(2, 'Memoria RAM DDR4 8GB', 120, 6)
(3, 'Disco SSD 1 TB', 150.99, 4)
(4, 'GeForce GTX 1050Ti', 185, 7)
(5, 'GeForce GTX 1080 Xtreme', 755, 6)
(6, 'Monitor 24 LED Full HD', 202, 1)
(7, 'Monitor 27 LED Full HD', 245.99, 1)
(8, 'Portátil Yoga 520', 559, 2)
(9, 'Portátil Ideapd 320', 444, 2)
(10, 'Impresora HP Deskjet 3720', 59.99, 3)
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3)

### SOLUCIÓN (corregido):
```sql
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
```

**Sin el AUTO-INCREMENT da error en la Base de datos al insertar los datos de la tabla, porque?**
Porque al ser un autoincrementado los valores de los id de ambas tablas aumentan, sin que sepamos el id que le corresponde.

