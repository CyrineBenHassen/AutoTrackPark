CREATE PROCEDURE [dbo].[sp_reservation_get_all]

	@parc_id int,
	@user_id int

	AS
BEGIN

	SELECT 
      r.id_reservation,
	  datedebutreservation  AS datedebutreservation,
	  datefinresevation AS datefinreservation ,
	  ISNULL( description_reservation,'')AS description_reservation,
	  RA.user_id,
	  RA.user_full_name,                                  
      RA.user_url_image,
      RA.user_login,
      RA.user_password,
      RA.user_email,
      RA.user_phone,
      RA.user_is_active,
      RA.user_birth_date,
      RA.user_creation_date,
	  RV.matricule_voiture,
      RV.couleur_voiture,
      RV.Kilommetrage_Voiture,
      RV.annee_voiture,
      RV.nbre_place,
	  Rv.id_marque,
	  ISNULL(dev.marque_name, '') AS 'marque_name',
	  RV.id_model ,
	  ISNULL(dvm.name_model, '') AS 'name_model',
	  RE.id_etat_demande,
      RE.etat_code,
      RE.etat_name,
      r.id_parc,
      dp.nom_parc

	FROM
		dbo.[reservation] r
		LEFT JOIN dbo.[voiture] RV ON RV.matricule_voiture = r.matricule_voiture
		INNER JOIN dbo.[app_user] RA ON RA.user_id = r.user_id
		INNER JOIN dbo.[def_etat_demande] RE ON RE.id_etat_demande = r.id_etat_demande
		INNER JOIN dbo.[def_parc] dp ON dp.id_parc = r.id_parc
		LEFT JOIN dbo.[def_marque] dev ON dev.id_marque = RV.id_marque
		LEFT JOIN dbo.[def_model] dvm ON dvm.id_model = RV.id_model
		
	WHERE
		((@parc_id = -1) OR (@parc_id = r.id_parc))
	AND
		((@user_id = -1) OR (@user_id = r.user_id))
		
	ORDER BY
		r.id_reservation ASC

END