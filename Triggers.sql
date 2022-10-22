-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <22-10-2022>
-- Description:	<Cambia el curso de un alumno, actualizando también sus notas. Se dan tres situaciones:
--				1-El nuevo curso sea válido y el alumno ya haya pertenecido a un curso, por lo que se borran sus notas anteriores y se cargan las notas correspondientes al nuevo curso
--				2-El nuevo curso sea válido y el alumno no haya pertenecido a un curso, por lo que se cargan las notas correspondientes al nuevo curso
--				3-El curso sea NULL y el alumno ya haya pertenecido a un curso, por lo que se borran las notas correspondientes al curso antiguo
-->
-- =============================================

CREATE TRIGGER UpdateAlumnoCurso ON Alumno
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @anioViejo int = (SELECT Anio FROM deleted)
	DECLARE @anioNuevo int = (SELECT Anio FROM inserted)
	DECLARE @divisionVieja char = (SELECT Division FROM deleted)
	DECLARE @divisionNueva char = (SELECT Division FROM inserted)
	DECLARE @dniAlumno int = (SELECT dni FROM inserted)
	
	BEGIN TRAN
	IF @anioNuevo IS NOT NULL AND @divisionNueva IS NOT NULL
		BEGIN
			UPDATE Alumno SET Anio=@anioNuevo, Division=@divisionNueva WHERE Dni=@dniAlumno
			IF @@ERROR <> 0
			ROLLBACK TRAN

			DECLARE materias CURSOR FOR SELECT Cod_materia FROM Curso_Materia WHERE Anio=@anioNuevo AND Division=@divisionNueva
			DECLARE @codMateria int 
			OPEN materias
			FETCH NEXT FROM materias INTO @codMateria
			/*Si el alumno ya pertenecia a un curso debemos borrar sus notas y asignarle nuevas*/
			IF @anioViejo IS NOT NULL AND @divisionVieja IS NOT NULL
			BEGIN
				DELETE FROM Alumno_Nota WHERE Dni=@dniAlumno
				IF @@ERROR <> 0
				ROLLBACK TRAN
			END
			/*Si el alumno no pertenecía a un curso, solo se deben agregar las notas del curso al que se agregó*/
			WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT INTO Alumno_Nota (Dni,Cod_materia) VALUES(@dniAlumno, @codMateria)
				IF @@ERROR <> 0
				ROLLBACK TRAN

				FETCH NEXT FROM materias INTO @codMateria
			END
			CLOSE materias
			DEALLOCATE materias
		END
	ELSE
	/*Si llega hasta aquí quiere decir que anio y/o division son NULL, por lo que si el alumno ya pertenecía a un curso debemos borrar sus notas*/
	BEGIN
	UPDATE Alumno SET Anio=NULL, Division=NULL WHERE Dni=@dniAlumno
	IF @@ERROR <> 0
	ROLLBACK TRAN

		IF @anioViejo IS NOT NULL AND @divisionVieja IS NOT NULL
			BEGIN
				DELETE FROM Alumno_Nota WHERE Dni=@dniAlumno	
				IF @@ERROR <> 0
				ROLLBACK TRAN
			END
	END
	COMMIT TRAN
END

SELECT * FROM Alumno  JOIN Alumno_Nota ON Alumno_Nota.Dni=Alumno.Dni WHERE Alumno.Dni=50350858
UPDATE Alumno SET Anio=1, Division='1' WHERE Dni=50350858
--DROP TRIGGER UpdateAlumnoCurso
