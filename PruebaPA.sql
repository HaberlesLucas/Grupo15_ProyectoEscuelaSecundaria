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
@A�o int,
@Division char,
@Sexo char,
@FechaNac date,
@Direccion varchar(255)
      AS
BEGIN
	IF @A�o IS NULL OR @Division IS NULL
		INSERT INTO estructura.Alumno (Nombre,Apellido,Dni,Cod_provincia,cod_localidad,A�o,Division,Sexo,FechaNacimiento,Direccion) 
		VALUES (@Nombre,@Apellido,@DNI,@Provincia,@Localidad,NULL,NULL,@Sexo,@FechaNac,@Direccion)
	ELSE
		INSERT INTO estructura.Alumno (Nombre,Apellido,Dni,Cod_provincia,cod_localidad,A�o,Division,Sexo,FechaNacimiento,Direccion) 
		VALUES (@Nombre,@Apellido,@DNI,@Provincia,@Localidad,@A�o,@Division,@Sexo,@FechaNac,@Direccion)

		DECLARE @codMateria int
		DECLARE materias CURSOR FOR 
			SELECT estructura.Materia.Cod_Materia FROM estructura.Curso_Materia 
			JOIN estructura.Materia ON estructura.Materia.Cod_Materia = estructura.Curso_Materia.Cod_Materia
			WHERE estructura.Curso_Materia.A�o = @A�o AND estructura.Curso_Materia.Division = @Division 
		
		OPEN materias
		FETCH NEXT FROM materias INTO @codMateria
		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO estructura.Alumno_Nota (Dni, Cod_materia, Nota1, Nota2, Nota3) VALUES(@DNI, @codMateria, NULL,NULL,NULL)
			FETCH NEXT FROM materias INTO @codMateria
		END
		CLOSE materias
		DEALLOCATE materias
END  

EXECUTE AgregarAlumno @Nombre='Pepe',@Apellido='Gorreado',@DNI=440007744,@Provincia=1,@Localidad=1,@A�o=1,@Division=2,@Sexo='M',@FechaNac='20020331',@Direccion='Concordia 122'
