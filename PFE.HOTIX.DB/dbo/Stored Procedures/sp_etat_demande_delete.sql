CREATE PROCEDURE [dbo].[sp_etat_demande_delete]
	@id_etat_demande int
AS
BEGIN

	DELETE FROM
		dbo.[def_etat_demande] 
	WHERE 
		id_etat_demande = @id_etat_demande

END
