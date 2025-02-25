CREATE PROCEDURE [dbo].[sp_etat_demande_update]
	@id_etat_demande int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
AS
BEGIN

	UPDATE
		dbo.[def_etat_demande] 
	SET
		id_etat_demande = @id_etat_demande,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat_demande= @id_etat_demande

END
