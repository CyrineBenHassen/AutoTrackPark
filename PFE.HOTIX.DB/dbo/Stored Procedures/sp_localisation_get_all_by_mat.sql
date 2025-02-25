
CREATE PROCEDURE [dbo].[sp_localisation_get_all_by_mat]
@carMat VARCHAR(100),
@dateRef DATE,
@byDate INT

AS
BEGIN

	SELECT 
		l.id_localisation,
		ISNULL(Laititude_Localisation, 0) AS Laititude_Localisation,
		ISNULL(Longitude_Localisation, 0) AS Longitude_Localisation ,
		Date_Localisation AS Date_Localisation ,
		Temps_Localisation AS Temps_Localisation ,
		l.matricule_voiture,
		vp.couleur_voiture,
		vp.Kilommetrage_Voiture,
		vp.annee_voiture,
		vp.nbre_place
	FROM
		dbo.[localisation] l    
		INNER JOIN dbo.[voiture] vp ON vp.matricule_voiture = l.matricule_voiture
		
	WHERE
		(@byDate = -1) OR (l.Date_Localisation = @dateRef)	 
		  
	   AND 
			l.matricule_voiture = @carMat
		

	  ORDER BY
			l.id_localisation DESC
END