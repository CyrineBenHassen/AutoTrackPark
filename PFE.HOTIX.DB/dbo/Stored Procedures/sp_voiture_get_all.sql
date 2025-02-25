CREATE PROCEDURE [dbo].[sp_voiture_get_all] 
@parc_id int
AS
BEGIN


	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture,
	   v.id_marque,
	   dev.marque_name,
	   v.id_model ,
	   dvm.name_model ,
	   v.id_etat ,
	   der.etat_code ,
	   der.etat_name , 
	   v.id_parc, 
	   dp.nom_parc, 
	   dp.tel_parc, 
	   dp.adresse_parc, 
	   dp.email_parc
	  
	   
	FROM
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] dev ON dev.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvm ON dvm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] der ON der.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dp ON dp.id_parc = v.id_parc AND ((@parc_id = -1) OR (@parc_id = dp.id_parc))
		
		
		
	ORDER BY
		v.matricule_voiture ASC

END
