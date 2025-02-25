CREATE PROCEDURE [dbo].[sp_marque_update]
	@id_marque int,
	@marque_name VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_marque] 
	SET
		id_marque = @id_marque,
		marque_name = @marque_name
		
		
	WHERE
		id_marque= @id_marque

END
