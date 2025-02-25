CREATE PROCEDURE [dbo].[sp_type_maintenance_get_all]
AS
BEGIN

	SELECT 
		tm.id_type_maintenance,
	   ISNULL(name_type, '') AS name_type
	  
	   
	   
	FROM
		dbo.[def_type_maintenance] tm
		
	ORDER BY
		tm.id_type_maintenance ASC

END
