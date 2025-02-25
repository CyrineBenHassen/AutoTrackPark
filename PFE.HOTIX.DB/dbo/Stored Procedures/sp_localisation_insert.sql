CREATE PROCEDURE [dbo].[sp_localisation_insert] 
	@Laititude_Localisation decimal(20,15),
	@Longitude_Localisation decimal(20,15), 
	@matricule_voiture VARCHAR(100)  
	 
AS
BEGIN

	INSERT INTO
		dbo.[localisation] (Laititude_Localisation, Longitude_Localisation, Date_Localisation,Temps_Localisation,matricule_voiture )
					
	VALUES 
		(@Laititude_Localisation, @Longitude_Localisation, GETDATE(), GETDATE(), @matricule_voiture )
		 

END