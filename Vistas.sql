-- =============================================
-- Author:		<Vittorio Mulas>
-- Create date: <01-11-2022>
-- =============================================
-- Vistas creación alumnos por curso
CREATE VIEW Alumnos_curso with encryption
as
/*Utiliza la función edad para calcular la edad del alumno*/
SELECT  alumno.dni AS 'DNI', apellido AS 'Apellido', Alumno.nombre AS 'Nombre', anio AS 'Año', division AS 'División', dbo.Edad(FechaNacimiento) AS 'Edad' ,provincia.Nombre AS 'Provincia', localidad.Nombre AS 'Localidad' from Alumno
	JOIN Localidad ON Localidad.Cod_provincia = Alumno.Cod_provincia AND Localidad.Cod_localidad = Alumno.Cod_localidad
	JOIN Provincia ON Provincia.Cod_provincia = Alumno.Cod_provincia

-- Vistas creación promedios por materia
CREATE VIEW Promedios_alumnos with encryption
as
SELECT alumno.dni, Alumno.apellido, Alumno.nombre, anio, division, Materia.Nombre AS 'Materia', Alumno_Nota.Nota1, Alumno_Nota.Nota2, Alumno_Nota.Nota3, round((nota1+nota2+nota3)/3, 2) as "Promedio"
FROM alumno
 JOIN Alumno_Nota ON alumno.Dni=Alumno_Nota.Dni
 JOIN Materia ON Materia.Cod_materia = Alumno_Nota.Cod_materia


--Manipulación de la tabla vista
Declare @anio int,
		@division char;
--SE ASIGNA UN VALOR AL AÑO Y DIVISION PARA OBTENER LOS ALUMNOS DE UN DETERMINADO CURSO.
set @anio = 1
set @division = 1
--se obtienen los alumnos del curso
select apellido, Nombre, dni
from Alumnos_curso
where anio= @anio and division = @division
order by Apellido;

/*Trae todos los alumnos cuyo promedio es mayor que 6 haciendo uso de la función aprueba*/
SELECT * FROM Promedios_alumnos WHERE dbo.Aprueba(Promedio) = 1

/*Trae los 10 alumnos con mejor promedio*/
SELECT TOP 10 * FROM Promedios_alumnos ORDER BY Promedio DESC


CREATE VIEW AlumnosPorProvincia
AS
SELECT Provincia.Nombre AS 'Provincia', COUNT(Alumno.Dni) AS 'Cantidad de Alumnos' FROM Alumno
	JOIN Provincia ON Provincia.Cod_provincia = Alumno.Cod_provincia
	GROUP BY Provincia.Nombre

