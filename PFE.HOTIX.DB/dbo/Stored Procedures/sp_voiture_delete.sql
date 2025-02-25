CREATE PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture VARCHAR(100)
AS
BEGIN

	DELETE FROM
		dbo.[voiture] 
	WHERE 
		matricule_voiture = @matricule_voiture

END
