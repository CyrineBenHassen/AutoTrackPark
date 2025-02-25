CREATE PROCEDURE [dbo].[sp_voiture_update]
	@matricule_voiture VARCHAR(100),
	@couleur_voiture VARCHAR(100),
	@Kilommetrage_Voiture VARCHAR(100),
	@annee_voiture int,
	@nbre_place int,
	@Id_marque int,
	@id_model int,
	@id_etat int,
	@id_parc int
	
AS
BEGIN

	UPDATE
		dbo.[voiture] 
	SET
		matricule_voiture = @matricule_voiture,
		couleur_voiture = @couleur_voiture,
		Kilommetrage_Voiture = @Kilommetrage_Voiture,
		annee_voiture = @annee_voiture,
	     nbre_place= @nbre_place,
		id_marque=@Id_marque,
		id_model=@id_model,
		id_etat=@id_etat,
		id_parc=@id_parc
		
	WHERE
		matricule_voiture = @matricule_voiture

END

