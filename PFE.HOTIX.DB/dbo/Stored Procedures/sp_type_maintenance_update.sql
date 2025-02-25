CREATE PROCEDURE [dbo].[sp_type_maintenance_update]
	@id_type_maintenance int,
	@name_type VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_type_maintenance] 
	SET
		id_type_maintenance = @id_type_maintenance,
		name_type = @name_type
		
		
	WHERE
		id_type_maintenance = @id_type_maintenance

END
