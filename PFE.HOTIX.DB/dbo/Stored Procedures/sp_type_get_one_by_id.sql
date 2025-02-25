CREATE PROCEDURE [dbo].[sp_type_get_one_by_id]
	@id_type_maintenance int

	AS
	BEGIN
	SELECT
	t.id_type_maintenance,
	ISNULL(name_type,'')AS name_type

	FROM
	dbo.[def_type_maintenance] t

	WHERE
		t.id_type_maintenance = @id_type_maintenance

END


