CREATE PROCEDURE [dbo].[sp_localisation_update]
	@id_localisation int,
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture VARCHAR(100)
	
AS
BEGIN

	UPDATE
		dbo.[localisation] 
	SET
		Laititude_Localisation = @Laititude_Localisation, 
		Longitude_Localisation = @Longitude_Localisation ,
		Date_Localisation = GETDATE(),
		Temps_Localisation = GETDATE(),
		matricule_voiture = @matricule_voiture 
	
	WHERE
		id_localisation = @id_localisation

END

