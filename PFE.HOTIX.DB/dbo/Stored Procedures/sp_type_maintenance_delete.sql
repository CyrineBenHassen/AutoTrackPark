CREATE PROCEDURE [dbo].[sp_type_maintenance_delete]
	@id_type_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[def_type_maintenance] 
	WHERE 
		id_type_maintenance = @id_type_maintenance

END
