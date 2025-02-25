CREATE PROCEDURE [dbo].[sp_marque_insert]
	
	@marque_name VARCHAR(100) 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_marque] (id_marque, marque_name )
					
	VALUES 
		((SELECT ISNULL(MAX(id_marque),0) FROM def_marque ) + 1, @marque_name)
		 

END