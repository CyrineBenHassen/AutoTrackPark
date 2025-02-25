CREATE PROCEDURE [dbo].[sp_etatvoiture_update]
	@id_etat int,
	@etat_code VARCHAR(50),
	@etat_name VARCHAR(100)

	
AS
BEGIN

	UPDATE
		dbo.[def_etat] 
	SET
		id_etat = @id_etat,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat= @id_etat

END
