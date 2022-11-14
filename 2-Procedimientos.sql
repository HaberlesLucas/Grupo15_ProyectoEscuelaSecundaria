
-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <19-10-2022>
-- Description:	<Agrega un alumno en la BD y en caso de tener un curso asignado, se crean las tablas de las notas relacionadas a ese curso>
-- =============================================


USE proyectoEscuelaSecundaria
GO

CREATE PROCEDURE AgregarAlumno
@Nombre varchar(50),
@Apellido varchar(50),
@DNI int,
@Provincia int,
@Localidad int,
@Anio int,
@Division char,
@Sexo char,
@FechaNac date,
@Direccion varchar(255)
      AS
BEGIN

	IF @Anio IS NULL OR @Division IS NULL
		INSERT INTO Alumno (Nombre,Apellido,Dni,Cod_provincia,cod_localidad,Anio,Division,Sexo,FechaNacimiento,Direccion) 
		VALUES (@Nombre,@Apellido,@DNI,@Provincia,@Localidad,NULL,NULL,@Sexo,@FechaNac,@Direccion)
	ELSE
	BEGIN TRAN
		INSERT INTO Alumno (Nombre,Apellido,Dni,Cod_provincia,cod_localidad,Anio,Division,Sexo,FechaNacimiento,Direccion) 
		VALUES (@Nombre,@Apellido,@DNI,@Provincia,@Localidad,@Anio,@Division,@Sexo,@FechaNac,@Direccion)
		IF @@ERROR <> 0 
		ROLLBACK TRAN
		

		DECLARE @codMateria int
		DECLARE materias CURSOR FOR 
			SELECT Materia.Cod_Materia FROM Curso_Materia 
			JOIN Materia ON Materia.Cod_Materia = Curso_Materia.Cod_Materia
			WHERE Curso_Materia.Anio = @Anio AND Curso_Materia.Division = @Division 
		
		OPEN materias
		FETCH NEXT FROM materias INTO @codMateria
		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO Alumno_Nota (Dni, Cod_materia, Nota1, Nota2, Nota3) VALUES(@DNI, @codMateria, NULL,NULL,NULL)
			IF @@ERROR <> 0  
			ROLLBACK TRAN
			FETCH NEXT FROM materias INTO @codMateria
				
		END
		CLOSE materias
		DEALLOCATE materias
	COMMIT TRAN
END  
--DROP PROCEDURE AgregarAlumno
--Para probar
/*EXECUTE AgregarAlumno @Nombre='HÉCTOR',@Sexo='M',@Apellido='GORDILLO',@DNI=111,@Provincia=11,@Localidad=26,@Direccion='General Viamonte 1658',@FechaNac='2008-4-2',@Anio=1,@Division='1'
SELECT * FROM Alumno WHERE Dni=111 
DELETE FROM Alumno WHERE Dni=111*/

GO
-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <21-10-2022>
-- Description:	<Relaciona una materia con un curso y crea las notas correspondientes a todos los alumnos de ese curso>
-- =============================================
CREATE PROCEDURE AgregarMateriaCurso
@Anio int,
@Division char,
@DNI int,
@Materia int
AS
BEGIN
	BEGIN TRAN
	INSERT INTO Curso_Materia (Anio, Division, DniProfesor, Cod_materia) VALUES(@Anio, @Division, @DNI, @Materia)
	IF @@ERROR <> 0 
		ROLLBACK TRAN

	DECLARE Alumnos CURSOR FOR SELECT Dni FROM Alumno WHERE Anio=@Anio AND Division=@Division
	DECLARE @DniAlumno int

	OPEN Alumnos
	FETCH NEXT FROM Alumnos INTO @DniAlumno
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO Alumno_Nota (Dni, Cod_materia) VALUES(@DniAlumno, @Materia)
		IF @@ERROR <> 0 
		ROLLBACK TRAN
		FETCH NEXT FROM Alumnos INTO @DniAlumno
	END
	CLOSE Alumnos
	DEALLOCATE Alumnos
	COMMIT TRAN
END

--DROP PROCEDURE AgregarMateriaCurso
--Para probar
/*
EXECUTE AgregarMateriaCurso @Anio=1,@Division=1,@DNI=34576049,@Materia=401
SELECT * FROM Curso_Materia WHERE DniProfesor=34576049 AND Cod_Materia=401 AND Anio=1 AND Division='1'
SELECT * FROM Alumno JOIN Alumno_nota ON Alumno_nota.Dni=Alumno.Dni WHERE Anio=1 AND Division='1' AND Cod_materia=401*/

-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <21-10-2022>
-- Description:	<Elimina una materia de un curso y elimina las notas relacionadas a esa materia correspondientes a todos los alumnos de ese curso>
-- =============================================
GO
CREATE PROCEDURE EliminarMateriaCurso
@Anio int,
@Division char,
@DNI int,
@Materia int
AS
BEGIN
	
	DECLARE Alumnos CURSOR FOR SELECT Dni FROM Alumno WHERE Anio=@Anio AND Division=@Division
	DECLARE @DniAlumno int

	OPEN Alumnos
	FETCH NEXT FROM Alumnos INTO @DniAlumno
	WHILE @@FETCH_STATUS = 0
	BEGIN
		/*Primero borramos los registros de la tabla Alumno_Nota para evitar el error por restricción de FK*/
		DELETE FROM Alumno_Nota WHERE Dni=@DniAlumno AND Cod_materia=@Materia
		FETCH NEXT FROM Alumnos INTO @DniAlumno
	END
	DELETE FROM Curso_Materia WHERE Anio=@Anio AND Division=@Division AND DniProfesor=@DNI AND Cod_materia=@Materia
	CLOSE Alumnos
	DEALLOCATE Alumnos
END

--Para probar
/*EXECUTE EliminarMateriaCurso @Anio=1,@Division=1,@DNI=34576049,@Materia=401
SELECT * FROM Alumno JOIN Alumno_nota ON Alumno_nota.Dni=Alumno.Dni WHERE Anio=1 AND Division='1' AND Cod_materia=401*/
