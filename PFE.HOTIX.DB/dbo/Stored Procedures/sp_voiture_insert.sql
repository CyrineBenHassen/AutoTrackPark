CREATE PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture VARCHAR(100),
	@couleur_voiture VARCHAR(100),
	@Kilommetrage_Voiture VARCHAR(100),
	@annee_voiture int,
	@nbre_place int,
	@id_marque int ,
	@id_model int ,
	@id_etat int ,
	@id_parc int 
AS
BEGIN

	INSERT INTO
		dbo.[voiture] (matricule_voiture, couleur_voiture, Kilommetrage_Voiture, annee_voiture,nbre_place,id_marque,id_model,id_etat,id_parc )
				
	VALUES 
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_place,@id_marque ,@id_model ,@id_etat  ,@id_parc )
		 

END