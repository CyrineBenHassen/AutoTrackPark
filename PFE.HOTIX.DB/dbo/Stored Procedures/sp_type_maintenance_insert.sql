CREATE PROCEDURE [dbo].[sp_type_maintenance_insert]

	@name_type VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_type_maintenance] (id_type_maintenance,name_type )
					
	VALUES 
		((SELECT ISNULL(MAX(id_type_maintenance),0) FROM def_type_maintenance) + 1, @name_type)
		 

END