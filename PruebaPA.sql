
-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <19-10-2020>
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
		INSERT INTO Alumno (Nombre,Apellido,Dni,Cod_provincia,cod_localidad,Anio,Division,Sexo,FechaNacimiento,Direccion) 
		VALUES (@Nombre,@Apellido,@DNI,@Provincia,@Localidad,@Anio,@Division,@Sexo,@FechaNac,@Direccion)

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
			FETCH NEXT FROM materias INTO @codMateria
		END
		CLOSE materias
		DEALLOCATE materias
END  

