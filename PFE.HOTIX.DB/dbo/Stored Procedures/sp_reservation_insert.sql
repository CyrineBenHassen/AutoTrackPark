CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@date_start DATETIME,
	@date_end DATETIME,
	@description_reservation VARCHAR(100),
	@etat_id INT,
	@user_id INT,
	@parc_id INT
	 
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (date_create, datedebutreservation, datefinresevation, description_reservation, id_etat_demande,user_id, id_parc )
					
	VALUES 
		(GETDATE(), @date_start,@date_end, @description_reservation, @etat_id, @user_id, @parc_id)
		 

END