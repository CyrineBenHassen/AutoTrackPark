CREATE PROCEDURE [dbo].[sp_maintenance_delete]
	@id_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[maintenance] 
	WHERE 
		id_maintenance = @id_maintenance

END
