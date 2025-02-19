# T3.02. SQL DDL Relación R01a (MySQL o MariaDB)

## 📝Ejercicio R01_04❓:
Realiza la transformación del Modelo Relacional realizado en la actividad A2.04 al modelo físico, utilizando el Sistema Gestor de Bases de Datos (SGBD) Maria DB o MySQL.

![Venta_automoviles](./imagenes/vehiculo.png)

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
    nif VARCHAR(15),
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    ciudad VARCHAR(255),
    telefono VARCHAR(255)
);

-- COCHE (bastidor PK, matricula, marca, modelo, color, precio, codPropietario FK(CLIENTE.codigo))
CREATE TABLE COCHE(
    bastidor INT PRIMARY KEY,
    matricula VARCHAR(8),
    marca VARCHAR(255),
    modelo VARCHAR(255),
    color VARCHAR(255),
    precio DECIMAL(10,2),
    codPropietario INT NOT NULL,
    FOREIGN KEY (codPropietario) REFERENCES CLIENTE(codigo)
);

-- REVISION (codigo PK, filtro, aceite, frenos, bastidor FK(COCHE.bastidor), fecha)
CREATE TABLE REVISION(
    codigo INT PRIMARY KEY,
    filtro VARCHAR(255),
    aceite VARCHAR(255),
    frenos VARCHAR(255),
    bastidor INT,
    fecha VARCHAR(255),
    FOREIGN KEY (bastidor) REFERENCES COCHE(bastidor)
);
```


## 📝Ejercicio R01_05❓:
Realiza la transformación del Modelo Relacional realizado en la actividad A2.05 al modelo físico, utilizando el Sistema Gestor de Bases de Datos (SGBD) MySQL o MariaDB.

![Clinica](./imagenes/clinica.png)

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