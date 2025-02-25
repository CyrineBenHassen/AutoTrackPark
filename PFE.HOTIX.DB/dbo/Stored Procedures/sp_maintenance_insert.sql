CREATE PROCEDURE [dbo].[sp_maintenance_insert] 
	@Description_Maintenance VARCHAR(100),
	@Date_Maintenance date,
	@Lieu_Maintenance VARCHAR(100) , 
	@matricule_voiture VARCHAR(100) ,
	@id_type_maintenance int 
	 
AS
BEGIN

	INSERT INTO
		dbo.[maintenance] (id_maintenance,Description_Maintenance, Date_Maintenance,Lieu_Maintenance, matricule_voiture,id_type_maintenance )
					
	VALUES 
		((SELECT ISNULL(MAX(id_maintenance),0) FROM maintenance ) + 1,@Description_Maintenance,  GETDATE(), @Lieu_Maintenance, @matricule_voiture, @id_type_maintenance )
		 

END