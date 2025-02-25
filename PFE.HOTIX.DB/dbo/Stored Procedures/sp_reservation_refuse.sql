CREATE PROCEDURE [dbo].[sp_reservation_refuse]
	@id_reservation int, 
	@id_etat_demande int 

	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		
		date_update = GETDATE(),  
		id_etat_demande = @id_etat_demande
		
	WHERE
		id_reservation = @id_reservation

END