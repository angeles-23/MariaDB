# T3.02. SQL DDL Relación R01a (MySQL o MariaDB)

## 📝Ejercicio R01_04❓:
Realiza la transformación del Modelo Relacional realizado en la actividad A2.04 al modelo físico, utilizando el Sistema Gestor de Bases de Datos (SGBD) Maria DB o MySQL.


```sql
CLIENTE (codigo PK, nif, nombre, direccion, ciudad, telefono)
COCHE (bastidor PK, matricula, marca, modelo, color, precio, codPropietario FK(CLIENTE.codigo))
REVISION (codigo PK, filtro, aceite, frenos, bastidor FK(COCHE.bastidor), fecha)
Debes indicar todas las sentencias SQL que has usado para crear tanto la Base de Datos, como las tablas, restricciones e incluso inserción de datos de prueba, si así lo has hecho.


-- DROP DATABASE IF EXISTS _02_venta_automoviles;
CREATE DATABASE _02_venta_automoviles;
USE _02_venta_automoviles;


-- CLIENTE (codigo PK, nif, nombre, direccion, ciudad, telefono)
CREATE TABLE CLIENTE(
    codigo INT PRIMARY KEY,
    nif VARCHAR(10),
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    ciudad VARCHAR(255),
    telefono VARCHAR(20)

    -- , PRIMARY KEY(codigo, NIF)   -> es obligatorio cuando la clave es compuesta
);




-- EL ORDEN INFLUYE EN LA BASE DE DATOS, por ello va primero coche.

-- COCHE (bastidor PK, matricula, marca, modelo, color, precio, codPropietario FK(CLIENTE.codigo))
CREATE TABLE COCHE(
    bastidor varchar(50),
    matricula VARCHAR(20) NOT NULL, -- usar cunado no es opcional o sea imprescindible
    marca VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    precio DECIMAL(10,2), -- Quiero 10 caracteres, de ellos 2 son decimales
    -- CONSTRAINT uq_coche_matricula UNIQUE (matricula); -- Nombre de la restriccion
    codPropietario INT, -- FOREIGN KEY (codPropietario) REFERENCES CLIENTE(codigo)      Debe coincidir con el tipo de la tabla a la que se refiere, en este caso con bastidor varchar(50)
    CONSTRAINT pk_coche PRIMARY KEY(bastidor), -- Damos un nombre a la clave
    CONSTRAINT fk_coche_cliente FOREIGN KEY (codPropietario) REFERENCES CLIENTE(codigo)
);


-- RESTRICCIONES DESPUÉS DE CREAR LA BASE TABLA
ALTER TABLE COCHE(
    ADD CONSTRAINT pk_coche PRIMARY KEY(bastidor),
);


-- REVISION (codigo PK, filtro, aceite, frenos, bastidor FK(COCHE.bastidor), fecha)
CREATE TABLE REVISION(
    codigo INT PRIMARY KEY,
    filtro BOOLEAN DEFAULT true, -- por defecto es True
    aceite BOOLEAN DEFAULT true,
    frenos BOOLEAN DEFAULT false,
    bastidor VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (bastidor) REFERENCES COCHE(bastidor)
);
```


``` sql
-- MYSQL SERVER



-- DROP DATABASE IF EXISTS _02_venta_automoviles;
GO
CREATE DATABASE _02_venta_automoviles;
GO
USE _02_venta_automoviles;
GO


-- CLIENTE (codigo PK, nif, nombre, direccion, ciudad, telefono)
CREATE TABLE CLIENTE(
    codigo INT PRIMARY KEY,
    nif NVARCHAR(10),
    nombre NVARCHAR(255),
    direccion NVARCHAR(255),
    ciudad NVARCHAR(255),
    telefono NVARCHAR(20)

    -- , PRIMARY KEY(codigo, NIF)   -> es obligatorio cuando la clave es compuesta
);




-- EL ORDEN INFLUYE EN LA BASE DE DATOS, por ello va primero coche.

-- COCHE (bastidor PK, matricula, marca, modelo, color, precio, codPropietario FK(CLIENTE.codigo))
CREATE TABLE COCHE(
    bastidor NVARCHAR(50),
    matricula NVARCHAR(20) NOT NULL, -- usar cunado no es opcional o sea imprescindible
    marca NVARCHAR(255) NOT NULL,
    modelo NVARCHAR(255) NOT NULL,
    color NVARCHAR(255),
    precio MONEY(10,2), -- Quiero 10 caracteres, de ellos 2 son decimales
    -- CONSTRAINT uq_coche_matricula UNIQUE (matricula); -- Nombre de la restriccion
    codPropietario INT, -- FOREIGN KEY (codPropietario) REFERENCES CLIENTE(codigo)      Debe coincidir con el tipo de la tabla a la que se refiere, en este caso con bastidor varchar(50)
    CONSTRAINT pk_coche PRIMARY KEY(bastidor), -- Damos un nombre a la clave
    CONSTRAINT fk_coche_cliente FOREIGN KEY (codPropietario) REFERENCES CLIENTE(codigo)
);


-- RESTRICCIONES DESPUÉS DE CREAR LA BASE TABLA
ALTER TABLE COCHE(
    ADD CONSTRAINT pk_coche PRIMARY KEY(bastidor),
);


-- REVISION (codigo PK, filtro, aceite, frenos, bastidor FK(COCHE.bastidor), fecha)
CREATE TABLE REVISION(
    codigo INT PRIMARY KEY,
    filtro BIT DEFAULT 1, -- por defecto es True
    aceite BIT DEFAULT 1,
    frenos BIT DEFAULT 0,
    bastidor NVARCHAR(50),
    fecha DATE,
    FOREIGN KEY (bastidor) REFERENCES COCHE(bastidor)
);

```








## 📝Ejercicio R01_05❓:
Realiza la transformación del Modelo Relacional realizado en la actividad A2.05 al modelo físico, utilizando el Sistema Gestor de Bases de Datos (SGBD) MySQL o MariaDB.


```sql
MEDICO (codigo PK, nombre, apellidos, telefono, especialidad)
INGRESO (codigo PK, habitacion, cama, fecha, codPaciente FK(PACIENTE.codigo), codMedico FK(MEDICO.codigo))
PACIENTE (codigo PK, nombre, apellidos, fechaNac, telefono, direccion, poblacion, provincia, codPostal)
Debes indicar todas las sentencias SQL que has usado para crear tanto la Base de Datos, como las tablas, restricciones e incluso inserción de datos de prueba, si así lo has hecho.



DROP DATABASE IF EXISTS _03_Clinica;


CREATE DATABASE _03_Clinica;
USE _03_Clinica;


-- MEDICO (codigo PK, nombre, apellidos, telefono, especialidad)
CREATE TABLE MEDICO(
    codigo INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    telefono VARCHAR(50),
    especialidad VARCHAR(255)
);


-- PACIENTE (codigo PK, nombre, apellidos, fechaNac, telefono, direccion, poblacion, provincia, codPostal)
CREATE TABLE PACIENTE(
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    fechaNac VARCHAR(10),
    telefono VARCHAR(20),
    direccion VARCHAR(50),
    poblacion INT,
    provincia VARCHAR(255),
    codPostal VARCHAR(10)
);


-- INGRESO (codigo PK, habitacion, cama, fecha, codPaciente FK(PACIENTE.codigo), codMedico FK(MEDICO.codigo))
CREATE TABLE INGRESO(
    codigo INT PRIMARY KEY,
    habitacion VARCHAR(50),
    cama VARCHAR(50),
    fecha VARCHAR(50),
    codPaciente INT NOT NULL,
    FOREIGN KEY (codPaciente) REFERENCES PACIENTE(codigo),
    codMedico INT NOT NULL,
    FOREIGN KEY (codMedico) REFERENCES MEDICO(codigo)
);

-- EL ORDEN IMPORTA A LA HORA DE CREAR TABLAS

```

---