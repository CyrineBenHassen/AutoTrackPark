CREATE PROCEDURE [dbo].[sp_maintenance_update]
    @id_maintenance int,
	@Description_Maintenance VARCHAR(100),
	@Date_Maintenance date ,
	@Lieu_Maintenance VARCHAR(100) , 
	@matricule_voiture VARCHAR(100) ,
	@id_type_maintenance int 
	
AS
BEGIN

	UPDATE
		dbo.[maintenance] 
	SET
		id_maintenance = @id_maintenance, 
		Description_Maintenance = @Description_Maintenance ,
		Lieu_Maintenance = @Lieu_Maintenance,
		Date_Maintenance = @Date_Maintenance,
		matricule_voiture = @matricule_voiture ,
		id_type_maintenance = @id_type_maintenance
	
	WHERE
	id_maintenance = @id_maintenance

END

