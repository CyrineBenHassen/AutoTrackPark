CREATE PROCEDURE [dbo].[sp_model_insert] 
	@name_model VARCHAR(100) 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_model] (id_model, name_model )
					
	VALUES 
		((SELECT ISNULL(MAX(id_model),0) FROM def_model ) + 1, @name_model)
		 

END