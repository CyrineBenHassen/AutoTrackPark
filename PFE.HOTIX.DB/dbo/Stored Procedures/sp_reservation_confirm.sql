CREATE PROCEDURE [dbo].[sp_reservation_confirm]
	@id_reservation int, 
	@id_etat_demande int, 
	@matricule_voiture varchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		
		date_update = GETDATE(),  
		id_etat_demande = @id_etat_demande, 
		matricule_voiture = @matricule_voiture
		
	WHERE
		id_reservation = @id_reservation

END
