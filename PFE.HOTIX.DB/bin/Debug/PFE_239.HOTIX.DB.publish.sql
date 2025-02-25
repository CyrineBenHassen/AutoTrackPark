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
PRINT N'Création de Procédure [dbo].[sp_model_update]...';


GO
CREATE PROCEDURE [dbo].[sp_model_update]
	@id_model int,
	@name_model VARCHAR
	
	
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
            ap.user_first_name,
           ap. user_last_name,
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
PRINT N'Création de Procédure [dbo].[sp_parc_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_insert]
	@id_parc int,
	@nom_parc VARCHAR,
	@tel_parc int,
	@adresse_parc VARCHAR,
	@email_parc VARCHAR ,
	   @user_id int 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_parc] (id_parc, Nom_parc, tel_parc, adresse_parc, email_parc  , user_id)
					
	VALUES 
		(@id_parc, @nom_parc,@tel_parc, @adresse_parc, @email_parc  , @user_id)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_update]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_update]
	@id_parc int,
	@Nom_parc VARCHAR,
	@tel_parc int,
	@adresse_parc VARCHAR,
	@email_parc VARCHAR,
	
	   @user_id int 
AS
BEGIN

	UPDATE
		dbo.[def_parc] 
	SET
		id_parc = @id_parc,
		Nom_parc = @Nom_parc,
		tel_parc = @tel_parc,
		adresse_parc = @adresse_parc,
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
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinreservation,
	  r.id_etat_demande ,
	  r.user_id
	   
	FROM
		dbo.[reservation] r
		
	ORDER BY
		r.id_reservation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all_by_id]
	@id_reservation int
AS
BEGIN

	SELECT 
		r.id_reservation,
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinresevation ,
	   r.id_etat_demande ,
	   r.user_id
	  
	FROM
		dbo.[reservation] r
		
	WHERE
		r.id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@id_reservation int,
	@datedebutreservation date,
	@datefinresevation date ,
	@id_etat_demande int ,
	@user_id int
	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (id_reservation, datedebutreservation, datefinresevation , id_etat_demande , user_id)
					
	VALUES 
		(@id_reservation, @datedebutreservation, @datefinresevation , @id_etat_demande ,@user_id)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@datedebutreservation date,
	@datefinresevation date,
	@id_etat_demande int ,
	@user_id int
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		id_reservation = @id_reservation,
		datedebutreservation = @datedebutreservation,
		datefinresevation = @datefinresevation,
		id_etat_demande = @id_etat_demande ,
		user_id =@user_id
		
	WHERE
		id_reservation = @id_reservation

END
GO
PRINT N'Mise à jour terminée.';


GO
