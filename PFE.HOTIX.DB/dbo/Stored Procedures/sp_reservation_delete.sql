CREATE PROCEDURE [dbo].[sp_reservation_delete]
		@id_reservation int
AS
BEGIN

	DELETE FROM
		dbo.[reservation] 
	WHERE 
		id_reservation = @id_reservation

END
