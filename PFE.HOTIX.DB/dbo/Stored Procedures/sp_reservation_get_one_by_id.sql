CREATE PROCEDURE [dbo].[sp_reservation_get_one_by_id]

	@id_reservation int 

     AS
     BEGIN
     SELECT
	  r.id_reservation,
	  r.datedebutreservation AS datedebutreservation,
	  r.datefinresevation AS datefinresevation,
      ISNULL(description_reservation,'')AS description_reservation,
      u.user_id,
	  u.user_full_name,                                  
      u.user_url_image,
      u.user_login,
      u.user_password,
      u. user_email,
      u. user_phone,
      u. user_is_active,
      u. user_birth_date,
      u. user_creation_date,
	  v.matricule_voiture,
      v.couleur_voiture,
      v. Kilommetrage_Voiture,
      v. annee_voiture,
      v.nbre_place,
      v.id_marque,
	  ISNULL(dev.marque_name, '') AS 'marque_name',
	  V.id_model ,
	  ISNULL(dvm.name_model, '') AS 'name_model',
	  Re.id_etat_demande,
      Re.etat_code,
      Re.etat_name,
      dp.id_parc,
      dp.nom_parc



       From 
       dbo.[reservation] r
       LEFT JOIN dbo.[voiture] v ON v.matricule_voiture = r.matricule_voiture
	   INNER JOIN dbo.[app_user] u ON u.user_id = r.user_id
	   INNER JOIN dbo.[def_etat_demande] Re ON Re.id_etat_demande = r.id_etat_demande
	   INNER JOIN dbo.[def_parc] dp ON dp.id_parc = r.id_parc
       LEFT JOIN dbo.[def_marque] dev ON dev.id_marque = V.id_marque
	   LEFT JOIN dbo.[def_model] dvm ON dvm.id_model = V.id_model
		

       	
	WHERE
		r.id_reservation= @id_reservation

END
		




