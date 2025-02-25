CREATE PROCEDURE [dbo].[sp_marque_get_one_by_id]
	@id_marque int

	AS
	BEGIN
	SELECT
	m.id_marque,
	m.marque_name

	From 
			dbo.[def_marque] m


			where 
			m.id_marque= @id_marque
END
