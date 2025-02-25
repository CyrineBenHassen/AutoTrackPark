CREATE PROCEDURE [dbo].[sp_model_update]
	@id_model int,
	@name_model VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_model] 
	SET
		id_model = @id_model,
		name_model = @name_model
		
		
	WHERE
		id_model= @id_model

END