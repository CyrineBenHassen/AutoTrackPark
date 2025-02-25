/*
Script de déploiement pour PFE_2023

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PFE_2023"
:setvar DefaultFilePrefix "PFE_2023"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

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
PRINT N'Mise à jour terminée.';


GO
