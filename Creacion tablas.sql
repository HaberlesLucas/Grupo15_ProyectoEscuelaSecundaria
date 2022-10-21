-- Creación de la BDD
CREATE DATABASE proyectoEscuelaSecundaria;
go
-- Se seecciona la base de datos
USE proyectoEscuelaSecundaria;
--USE Agencia
go

-- CREAR las tablas dentro del esquema estructura
CREATE TABLE Provincia (
	Cod_provincia int PRIMARY KEY,
	Nombre varchar(50) NOT NULL,
);
CREATE TABLE Localidad (
	Cod_provincia int,
	Cod_localidad int,
	Nombre varchar(50) NOT NULL,
	CONSTRAINT PK_localidad PRIMARY KEY (cod_provincia, cod_localidad),
	CONSTRAINT FK_cod_provincia FOREIGN KEY (cod_provincia) REFERENCES provincia(cod_provincia),
);
CREATE TABLE Tutor (
	Dni int PRIMARY KEY,
	Cod_provincia int NOT NULL,
	Cod_localidad int NOT NULL,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	FechaNacimiento date NOT NULL,
	Direccion varchar(255) NOT NULL,
	Sexo char(1) NOT NULL,
	CONSTRAINT CK_Sexo_Tutor CHECK(sexo IN ('M', 'F')),
	CONSTRAINT FK_tutor_localidad_provincia FOREIGN KEY (cod_provincia, cod_localidad) REFERENCES localidad(cod_provincia, cod_localidad),
);
CREATE TABLE Profesor (
	Dni int PRIMARY KEY,
	Cod_provincia int NOT NULL,
	Cod_localidad int NOT NULL,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	FechaNacimiento date NOT NULL,
	Direccion varchar(255) NOT NULL,
	Sexo char(1) NOT NULL,
	CONSTRAINT CK_Sexo_Profesor CHECK(sexo IN ('M', 'F')),
	CONSTRAINT FK_profesor_localidad_provincia FOREIGN KEY (cod_provincia, cod_localidad) REFERENCES localidad(cod_provincia, cod_localidad),
);
CREATE TABLE Materia (
	Cod_materia int PRIMARY KEY,
	Nombre varchar(130) NOT NULL,
);
CREATE TABLE Profesor_Materia (
	Dni int,
	Cod_materia int,
	CONSTRAINT PK_profesor_materia PRIMARY KEY (dni, cod_materia),
	CONSTRAINT FK_profesor_materia_dni FOREIGN KEY (dni) REFERENCES profesor(dni),
	CONSTRAINT FK_profesor_materia_cod_materia FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia),
);
CREATE TABLE Curso (
	Anio int,
	Division char,
	CONSTRAINT PK_curso PRIMARY KEY (Anio, division),
);
CREATE TABLE Curso_Materia (
	Anio int, 
	Division char,
	DniProfesor int,
	Cod_materia int,
	CONSTRAINT PK_curso_materia PRIMARY KEY (Anio, division, dniProfesor, cod_materia),
	CONSTRAINT FK_curso_materia_curso FOREIGN KEY (Anio, division) REFERENCES curso(Anio, division),
	CONSTRAINT FK_curso_materia_profesor_materia FOREIGN KEY (dniProfesor, cod_materia) REFERENCES profesor_materia(dni, cod_materia),
);
CREATE TABLE Alumno (
	Dni int PRIMARY KEY,
	Cod_provincia int NOT NULL,
	Cod_localidad int NOT NULL,
	Anio int,
	Division char,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	FechaNacimiento date NOT NULL,
	Direccion varchar(255) NOT NULL,
	Sexo char(1) NOT NULL,
	CONSTRAINT CK_Sexo_Alumno CHECK(Sexo IN ('M', 'F')),
	CONSTRAINT FK_alumno_localidad_provincia FOREIGN KEY (Cod_provincia, Cod_localidad) REFERENCES localidad(Cod_provincia, Cod_localidad),
	CONSTRAINT FK_alumno_curso FOREIGN KEY (Anio, Division) REFERENCES curso(Anio, Division),
);
CREATE TABLE Tutor_Alumno (
	Dni_tutor int,
	Dni_alumno int,
	CONSTRAINT PK_tutor_alumno PRIMARY KEY (dni_tutor, dni_alumno),
	CONSTRAINT FK_tutor_alumno_tutor FOREIGN KEY (dni_tutor) REFERENCES tutor(dni),
	CONSTRAINT FK_tutor_alumno_alumno FOREIGN KEY (dni_alumno) REFERENCES alumno(dni),
);

CREATE TABLE Alumno_Nota (
	Dni int,
	Cod_materia int,
	Nota1 decimal(4,2),
	Nota2 decimal(4,2),
	Nota3 decimal(4,2),
	CONSTRAINT PK_alumno_nota PRIMARY KEY (dni, cod_materia),
	CONSTRAINT FK_alumno_nota_alumno FOREIGN KEY (dni) REFERENCES alumno(dni),
	CONSTRAINT FK_alumno_nota_materia FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia),
);