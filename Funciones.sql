-- =============================================
-- Author:		<Ignacio Luque>
-- Create date: <01-11-2022>
-- =============================================
USE proyectoEscuelaSecundaria
GO
IF OBJECT_ID (N'Edad', N'FN') IS NOT NULL
    DROP FUNCTION Edad;
GO
/*Devuelve la edad del alumno*/
CREATE FUNCTION Edad(@FechaNac date)
RETURNS int
AS
-- Returns the stock level for the product.
BEGIN
	RETURN DATEDIFF(YEAR, @FechaNac, GETDATE());
END;

IF OBJECT_ID (N'Aprueba', N'FN') IS NOT NULL
    DROP FUNCTION Aprueba;
GO

/*Si la nota es mayor o igual a 6 el alumno aprueba*/
CREATE FUNCTION Aprueba(@Nota decimal)
RETURNS BIT
AS
-- Returns the stock level for the product.
BEGIN
	IF @Nota >= 6
	BEGIN
		RETURN 1
	END
	
	RETURN 0
END;
