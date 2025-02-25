CREATE PROCEDURE [dbo].[sp_reservation_update]
    @id_reservation INT,
	@date_start DATETIME,
	@date_end DATETIME,
	@description_reservation VARCHAR(100),
	@etat_id INT,
	@user_id INT,
	@parc_id INT
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		
		datedebutreservation = @date_start,
		datefinresevation = @date_end,
		description_reservation=@description_reservation,
		id_etat_demande = @etat_id ,
		user_id = @user_id,
		id_parc=@parc_id
		
	WHERE
		id_reservation = @id_reservation

END