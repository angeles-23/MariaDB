USE bd_teoria_instituto
GO

SELECT *
FROM bd_teoria_instituto;


/*
GO
IF EXISTS (
  SELECT name
   FROM sys.databases
   WHERE name = 'bd_teoria_instituto'
) DROP DATABASE bd_teoria_instituto
GO
CREATE DATABASE bd_teoria_instituto;
GO
USE bd_teoria_instituto
GO
CREATE TABLE alumno (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  apellido1 NVARCHAR(100) NOT NULL,
  apellido2 NVARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  es_repetidor NVARCHAR(2)  NOT NULL
        CHECK (es_repetidor IN ('sí', 'no') ),
  teléfono NVARCHAR(9)
);

INSERT INTO alumno VALUES('María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES('Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES('Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES('Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES('Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES('Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES('Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES('Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES('Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES('Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);

*/