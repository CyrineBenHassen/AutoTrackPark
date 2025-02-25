CREATE PROCEDURE [dbo].[sp_model_get_one_by_id]
	@id_model int

	AS
	BEGIN
	SELECT
		mo.id_model,
		mo.name_model

	From 
		dbo.[def_model] mo

	where 
 		mo.id_model= @id_model
END
