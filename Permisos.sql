-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <01-11-2022>
-- =============================================

USE [proyectoEscuelaSecundaria]
GO
USE [master]
GO
/*Crea el usuario rector*/
CREATE LOGIN [Rector] WITH PASSWORD=N'rector123' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
use [master];
GO
USE [proyectoEscuelaSecundaria]
GO
CREATE USER [Rector] FOR LOGIN [rector]
GO

GO
/*Se le asignan sus permisos, el rector puede modificar todos los datos de las tablas, con excepción de las tablas provincia y localidad*/
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Curso] TO [Rector]
GO
use [proyectoEscuelaSecundaria]

GO
GRANT DELETE ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Curso_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Alumno_Nota] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Alumno_Nota] TO [Rector]
GO

--Localidad
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Localidad] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Localidad] TO [Rector]
GO

--Materia
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]

--Profesor
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Profesor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]

--Profesor_Materia
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Profesor_Materia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]

--Provincia
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Provincia] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Provincia] TO [Rector]
GO

--Tutor
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Tutor] TO [Rector]
GO
use [proyectoEscuelaSecundaria]

--Tutor_Alumno
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Tutor_Alumno] TO [Rector]
GO
use [proyectoEscuelaSecundaria]


/*Se crea el usuario preceptor*/
USE [master]
GO
CREATE LOGIN [preceptor] WITH PASSWORD=N'1234' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [proyectoEscuelaSecundaria]
GO
CREATE USER [preceptor] FOR LOGIN [preceptor]
GO

/*Se le asignan sus permisos, el preceptor solo puede modificar los datos de las tablas alumno, alumno_nota, tutor y tutor_alumno*/

--Curso
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Curso] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

--Alumno
GO
GRANT DELETE ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO

--Curso_Materia
DENY DELETE ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Curso_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Curso_Materia] TO [Preceptor]
GO

--Alumno_Nota
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Alumno_Nota] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Alumno_Nota] TO [Preceptor]
GO

--Localidad
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Localidad] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Localidad] TO [Preceptor]
GO

--Materia
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

--Profesor
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY SELECT ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Profesor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

--Profesor_Materia
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Profesor_Materia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

--Provincia
GO
use [proyectoEscuelaSecundaria]
GO
DENY DELETE ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY INSERT ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY UPDATE ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Provincia] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Provincia] TO [Preceptor]
GO

--Tutor
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Tutor] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

--Tutor_Alumno
GO
use [proyectoEscuelaSecundaria]
GO
GRANT DELETE ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT INSERT ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT SELECT ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
GRANT UPDATE ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY ALTER ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY CONTROL ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY REFERENCES ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY TAKE OWNERSHIP ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW CHANGE TRACKING ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]
GO
DENY VIEW DEFINITION ON [Tutor_Alumno] TO [Preceptor]
GO
use [proyectoEscuelaSecundaria]

