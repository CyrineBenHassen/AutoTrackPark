/*
Script de déploiement pour PFE

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PFE"
:setvar DefaultFilePrefix "PFE"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_delete]
	@id_etat_demande int
AS
BEGIN

	DELETE FROM
		dbo.[def_etat_demande] 
	WHERE 
		id_etat_demande = @id_etat_demande

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_get_all]
	AS
BEGIN
	SELECT 
		ed.id_etat_demande,
	   ISNULL(LTRIM(RTRIM(etat_code)), '') AS etat_code,
	   ISNULL(LTRIM(RTRIM(etat_name)), '') AS etat_name
	    
	FROM
		dbo.[def_etat_demande] ed                                                                                                                                                                                      
		
	ORDER BY
		ed.id_etat_demande ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_insert]
	@id_etat_demande int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat_demande] (id_etat_demande, etat_code,etat_name )
					
	VALUES 
		(@id_etat_demande, @etat_code, @etat_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_update]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_update]
	@id_etat_demande int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
AS
BEGIN

	UPDATE
		dbo.[def_etat_demande] 
	SET
		id_etat_demande = @id_etat_demande,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat_demande= @id_etat_demande

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_delete]
	@id_etat int
AS
BEGIN

	DELETE FROM
		dbo.[def_etat] 
	WHERE 
		id_etat = @id_etat

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_get_all]
	AS
BEGIN

	SELECT 
		e.id_etat,
	   ISNULL(etat_code, '') AS etat_code,
	   ISNULL(etat_name, '') AS etat_name
	  
	   
	   
	FROM
		dbo.[def_etat] e                                                                                                                                                                                      
		
	ORDER BY
		e.id_etat ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_insert]
	@id_etat int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat] (id_etat, etat_code,etat_name )
					
	VALUES 
		(@id_etat, @etat_code, @etat_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_update]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_update]
	@id_etat int,
	@etat_code VARCHAR(50),
	@etat_name VARCHAR(100)

	
AS
BEGIN

	UPDATE
		dbo.[def_etat] 
	SET
		id_etat = @id_etat,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat= @id_etat

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_delete]
	@id_localisation int
AS
BEGIN

	DELETE FROM
		dbo.[localisation] 
	WHERE 
		id_localisation = @id_localisation

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_get_all]
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
		
	ORDER BY
		l.id_localisation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_insert] 
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture VARCHAR(100)  
	 
AS
BEGIN

	INSERT INTO
		dbo.[localisation] (Laititude_Localisation, Longitude_Localisation, Date_Localisation,Temps_Localisation,matricule_voiture )
					
	VALUES 
		(@Laititude_Localisation, @Longitude_Localisation, GETDATE(), GETDATE(), @matricule_voiture )
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_update]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_delete]
	@id_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[maintenance] 
	WHERE 
		id_maintenance = @id_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_get_all]
	AS
BEGIN

	SELECT 
		m.id_maintenance,
		ISNULL(Description_Maintenance,'') AS Description_Maintenance,
		ISNULL(Lieu_Maintenance ,'') AS Lieu_maintenance ,
		Date_Maintenance AS Date_Maintenance ,
		m.matricule_voiture,
		vm.couleur_voiture,
		vm.Kilommetrage_Voiture,
		vm.annee_voiture,
		vm.nbre_place,
		m.id_type_maintenance,
		tm.id_type_maintenance

	FROM
		dbo.[maintenance] m       
		INNER JOIN dbo.[voiture] vm ON vm.matricule_voiture = m.matricule_voiture
		INNER JOIN dbo.[def_type_maintenance] tm ON tm.id_type_maintenance = m.id_type_maintenance
		
	ORDER BY
		m.id_maintenance ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_get_one_by_id]
	@id_maintenance int 
AS
BEGIN
SELECT 
	
	     m.id_maintenance,
		ISNULL(Description_Maintenance,'') AS Description_Maintenance,
		ISNULL(Lieu_Maintenance ,'') AS Lieu_maintenance ,
		Date_Maintenance AS Date_Maintenance ,
		m.matricule_voiture,
		vm.couleur_voiture,
		vm.Kilommetrage_Voiture,
		vm.annee_voiture,
		vm.nbre_place,
		m.id_type_maintenance,
		tm.id_type_maintenance


		  From 
      	dbo.[maintenance] m       
		INNER JOIN dbo.[voiture] vm ON vm.matricule_voiture = m.matricule_voiture
		INNER JOIN dbo.[def_type_maintenance] tm ON tm.id_type_maintenance = m.id_type_maintenance

     	
	WHERE
		m.id_maintenance= @id_maintenance

		END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_insert]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_update]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[sp_marque_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_delete]
	@id_marque int
AS
BEGIN

	DELETE FROM
		dbo.[def_marque] 
	WHERE 
		id_marque = @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_all]
AS
BEGIN

	SELECT 
		ma.id_marque,
	   ISNULL(marque_name, '') AS marque_name
	  
	   
	   
	FROM
		dbo.[def_marque] ma
		
	ORDER BY
		ma.id_marque ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_get_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_by_id]
	@id_marque int

	AS
	BEGIN
	SELECT
	m.id_marque,
	ISNULL(marque_name,'')AS marque_name

	FROM
	dbo.[def_marque] m

	WHERE
		m.id_marque = @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_one_by_id]
	@id_marque int

	AS
	BEGIN
	SELECT
	m.id_marque,
	m.marque_name

	From 
			dbo.[def_marque] m


			where 
			m.id_marque= id_marque
END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_insert]
	
	@marque_name VARCHAR(100) 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_marque] (id_marque, marque_name )
					
	VALUES 
		((SELECT ISNULL(MAX(id_marque),0) FROM def_marque ) + 1, @marque_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_update]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_update]
	@id_marque int,
	@marque_name VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_marque] 
	SET
		id_marque = @id_marque,
		marque_name = @marque_name
		
		
	WHERE
		id_marque= @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_model_delete]
	@id_model int
AS
BEGIN

	DELETE FROM
		dbo.[def_model] 
	WHERE 
		id_model = @id_model

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_model_get_all]
AS
BEGIN

	SELECT 
		m.id_model,
	   ISNULL(name_model, '') AS name_model
	 
	   
	   
	FROM
		dbo.[def_model] m
		
	ORDER BY
		m.id_model ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_model_get_one_by_id]
	@id_model int

	AS
	BEGIN
	SELECT
		mo.id_model,
		mo.name_model

	From 
		dbo.[def_model] mo

	where 
 		mo.id_model= @id_model
END
GO
PRINT N'Création de Procédure [dbo].[sp_model_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_model_insert] 
	@name_model VARCHAR(100) 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_model] (id_model, name_model )
					
	VALUES 
		((SELECT ISNULL(MAX(id_model),0) FROM def_model ) + 1, @name_model)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_update]...';


GO
CREATE PROCEDURE [dbo].[sp_model_update]
	@id_model int,
	@name_model VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_model] 
	SET
		id_model = @id_model,
		name_model = @name_model
		
		
	WHERE
		id_model= @id_model

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_delete]
	@id_parc int
AS
BEGIN

	DELETE FROM
		dbo.[def_parc] 
	WHERE 
		id_parc = @id_parc

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_all]
	AS
BEGIN

	SELECT 
		p.id_parc,
	   ISNULL(nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc , 
	          p.user_id ,
            ap.user_full_name,
          ap.  user_login,
          ap. user_password,
          ap. user_email,
           ap.user_phone,
           ap. user_is_active,
           ap. user_birth_date,
          ap.user_creation_date

	FROM
		dbo.[def_parc] p
		INNER JOIN dbo.[app_user] ap ON ap.user_id = p.user_id
		
	ORDER BY
		p.id_parc ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_one_by_id]
	@id_parc int 

	AS
	BEGIN
	SELECT

	p.id_parc,
	ISNULL(p.nom_parc, '') AS nom_parc,
	ISNULL(p.tel_parc,'')AS tel_parc,
	ISNull(p.adresse_parc,'')AS adresse_parc,
	ISNULL(p.email_parc,'')AS email_parc,
	u.user_id,
	u.user_full_name,

	u.user_login,
	u.user_password,
	u.user_email,
	u.user_phone,
	u.user_is_active,
	u.user_birth_date,
	u.user_creation_date

	FROM 
	dbo.[def_parc] p
		INNER JOIN dbo.[app_user] u ON u.user_id = p.user_id
    Where 
    p.id_parc=@id_parc

     END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_insert]
	@nom_parc VARCHAR(100),
	@tel_parc varchar(50),
	@adresse_parc VARCHAR(MAX),
	@email_parc VARCHAR(100) ,
	@user_id int 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_parc] (id_parc, nom_parc, tel_parc, adresse_parc, email_parc  , user_id)
					
	VALUES 
		((SELECT ISNULL(MAX(id_parc), 0) From def_parc) + 1 ,@nom_parc ,@tel_parc ,@adresse_parc ,@email_parc  ,@user_id)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_update]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_update]
	@id_parc int,
	@nom_parc VARCHAR(100),
	@tel_parc varchar(50),
	@adresse_parc VARCHAR(MAX),
	@email_parc VARCHAR(100),
	@user_id int 
AS
BEGIN

	UPDATE
		dbo.[def_parc] 
	SET
		id_parc = @id_parc,
		nom_parc = @nom_parc,
		tel_parc = @tel_parc,
		adresse_parc =@adresse_parc,
		email_parc = @email_parc,
		user_id =@user_id
		
	WHERE
		id_parc = @id_parc

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_delete]
		@id_reservation int
AS
BEGIN

	DELETE FROM
		dbo.[reservation] 
	WHERE 
		id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all]
	AS
BEGIN

	SELECT 
		r.id_reservation,
	   datedebutreservation  AS datedebutreservation,
	   datefinresevation AS datefinreservation ,
	  RA.user_id,
	  RA.user_full_name,                                  
     RA.user_url_image,
      RA.user_login,
      RA.user_password,
      RA. user_email,
      RA. user_phone,
      RA. user_is_active,
      RA. user_birth_date,
      RA. user_creation_date,
	   RV.matricule_voiture,
       RV.couleur_voiture,
       RV. Kilommetrage_Voiture,
       RV. annee_voiture,
       RV.nbre_place,
	    RE.id_etat_demande,
        RE.etat_code,
        RE.etat_name
	FROM
		dbo.[reservation] r
		INNER JOIN dbo.[voiture] RV ON RV.matricule_voiture = r.matricule_voiture
		INNER JOIN dbo.[app_user] RA ON RA.user_id = r.user_id
		INNER JOIN dbo.[def_etat_demande] RE ON RE.id_etat_demande = r.id_etat_demande
		
	ORDER BY
		r.id_reservation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_one_by_id]

	@id_reservation int 

     AS
     BEGIN
     SELECT
	  r.id_reservation,
	  r.datedebutreservation AS datedebutreservation,
	  r.datefinresevation AS datefinresevation,
      u.user_id,
	  u.user_full_name,                                  

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
	  Re.id_etat_demande,
      Re.etat_code,
      Re.etat_name



       From 
       dbo.[reservation] r
       INNER JOIN dbo.[voiture] v ON v.matricule_voiture = r.matricule_voiture
	   INNER JOIN dbo.[app_user] u ON u.user_id = r.user_id
	   INNER JOIN dbo.[def_etat_demande] Re ON Re.id_etat_demande = r.id_etat_demande

       	
	WHERE
		r.id_reservation= @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@id_etat_demande int ,
	@user_id int,
	@matricule_voiture varchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (datedebutreservation,datefinresevation,id_etat_demande , user_id ,matricule_voiture)
					
	VALUES 
		(GETDATE(),GETDATE(), @id_etat_demande ,@user_id ,@matricule_voiture)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@id_etat_demande int ,
	@user_id int ,
	@matricule_voiture varchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		
		datedebutreservation = GETDATE(),
		datefinresevation = GETDATE(),
		id_etat_demande = @id_etat_demande ,
		user_id = @user_id,
		matricule_voiture = @matricule_voiture
		
	WHERE
		id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_get_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_type_get_by_id]
	@id_type_maintenance int

	AS
	BEGIN
	SELECT
	t.id_type_maintenance,
	ISNULL(name_type,'')AS name_type

	FROM
	dbo.[def_type_maintenance] t

	WHERE
		t.id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_delete]
	@id_type_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[def_type_maintenance] 
	WHERE 
		id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_get_all]
AS
BEGIN

	SELECT 
		tm.id_type_maintenance,
	   ISNULL(name_type, '') AS name_type
	  
	   
	   
	FROM
		dbo.[def_type_maintenance] tm
		
	ORDER BY
		tm.id_type_maintenance ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_insert]

	@name_type VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_type_maintenance] (id_type_maintenance,name_type )
					
	VALUES 
		((SELECT ISNULL(MAX(id_type_maintenance),0) FROM def_type_maintenance) + 1, @name_type)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_update]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_update]
	@id_type_maintenance int,
	@name_type VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_type_maintenance] 
	SET
		id_type_maintenance = @id_type_maintenance,
		name_type = @name_type
		
		
	WHERE
		id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_user_delete]
	@userId int
AS
BEGIN

	DELETE FROM
		dbo.[app_user] 
	WHERE 
		user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_all] 
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
	ORDER BY
		u.user_id ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_one_by_id]
	@userId int
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
	WHERE
		u.user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_one_by_login]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_one_by_login]
	@userLogin VARCHAR(100)
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
	WHERE
		u.user_login = @userLogin

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_user_insert]
	
	@fullName VARCHAR(300),
	@urlImage VARCHAR(MAX),
	@login VARCHAR(100),
	@password VARCHAR(250),
	@email VARCHAR(100),
	@isActive BIT, 
	@phone VARCHAR(30), 
	@birthDate DATE,
	@roleId int
AS
BEGIN

	INSERT INTO
		dbo.[app_user] (user_full_name, user_url_image, user_login, user_password,
					user_email, user_phone, user_is_active, user_birth_date, user_creation_date, role_id) 
	VALUES 
		(@fullName, @urlImage, @login, @password,
		 @email, @phone, @isActive, @birthDate, GETDATE(),@roleId)

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_role_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_user_role_get_all]
AS
BEGIN

	SELECT 
		role_id,
		ISNULL(role_code, '') AS role_code,
		ISNULL(role_name, '') AS role_name
	FROM
		dbo.[def_user_role] 
	ORDER BY
		role_id ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_role_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_user_role_get_one_by_id]
@userRoleId int
AS
BEGIN
SELECT 
		role_id,
		ISNULL(role_code, '') AS role_code,
		ISNULL(role_name, '') AS role_name
	FROM
		dbo.[def_user_role] 
	WHERE
		role_id = @userRoleId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_update]...';


GO
CREATE PROCEDURE [dbo].[sp_user_update]
	@userId int,
	@roleId int,
	@fullName VARCHAR(300),
	@urlImage VARCHAR(Max),
	@login VARCHAR(100),
	@password VARCHAR(250),
	@email VARCHAR(100),
	@phone VARCHAR(30), 
	@isActive BIT, 
	@birthDate DATE
AS
BEGIN

	UPDATE
		dbo.[app_user] 
	SET
		role_id = @roleId,
		user_full_name = @fullName,
		user_url_image= @urlImage,
		user_login = @login,
		user_password = @password,
		user_email = @email,
		user_phone = @phone,
		user_is_active = @isActive,
		user_birth_date = @birthDate
	WHERE
		user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture VARCHAR(100)
AS
BEGIN

	DELETE FROM
		dbo.[voiture] 
	WHERE 
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_get_all] 
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
		INNER JOIN dbo.[def_parc] dp ON dp.id_parc = v.id_parc
		
		
		
	ORDER BY
		v.matricule_voiture ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
	@matricule_voiture VARCHAR(100)
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture,
	   v.id_marque,
	   devvv.marque_name,
	   v.id_model ,
	   dvmmm.name_model ,
	   v.id_etat ,
	   derrr.etat_code ,
	   derrr.etat_name , 
	   v.id_parc, 
	   dppp.nom_parc, 
	   dppp.tel_parc, 
	   dppp.adresse_parc, 
	   dppp.email_parc
	 
	FROM
		
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] devvv ON devvv.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvmmm ON dvmmm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] derrr ON derrr.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dppp ON dppp.id_parc = v.id_parc
		
	WHERE
		v.matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_insert]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_update]...';


GO
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
GO
PRINT N'Mise à jour terminée.';


GO
