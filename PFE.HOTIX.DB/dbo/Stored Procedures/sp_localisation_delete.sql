CREATE PROCEDURE [dbo].[sp_localisation_delete]
	@id_localisation int
AS
BEGIN

	DELETE FROM
		dbo.[localisation] 
	WHERE 
		id_localisation = @id_localisation

END

