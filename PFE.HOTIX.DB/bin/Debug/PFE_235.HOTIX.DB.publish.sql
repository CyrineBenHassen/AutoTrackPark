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
/*
Le type de la colonne user_email dans la table [dbo].[app_user] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne user_first_name dans la table [dbo].[app_user] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.

Le type de la colonne user_last_name dans la table [dbo].[app_user] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne user_login dans la table [dbo].[app_user] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[app_user])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne etat_code dans la table [dbo].[def_etat] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne etat_name dans la table [dbo].[def_etat] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne etat_code dans la table [dbo].[def_etat_demande] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne etat_name dans la table [dbo].[def_etat_demande] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat_demande])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne marque_name dans la table [dbo].[def_marque] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_marque])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne name_model dans la table [dbo].[def_model] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_model])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne adresse_parc dans la table [dbo].[def_parc] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne email_parc dans la table [dbo].[def_parc] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne nom_parc dans la table [dbo].[def_parc] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_parc])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne matricule_voiture dans la table [dbo].[localisation] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.

Le type de la colonne Temps_Localisation dans la table [dbo].[localisation] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[localisation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne Description_Maintenance dans la table [dbo].[maintenance] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne Lieu_Maintenance dans la table [dbo].[maintenance] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne matricule_voiture dans la table [dbo].[maintenance] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.

Le type de la colonne Type_Maintenance dans la table [dbo].[maintenance] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[maintenance])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne matricule_voiture dans la table [dbo].[reservation] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[reservation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne couleur_voiture dans la table [dbo].[voiture] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne Kilommetrage_Voiture dans la table [dbo].[voiture] est actuellement  NCHAR (100) NULL, mais est remplacé par  VARCHAR (1) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NULL.

Le type de la colonne matricule_voiture dans la table [dbo].[voiture] est actuellement  NCHAR (100) NOT NULL, mais est remplacé par  VARCHAR (1) NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  VARCHAR (1) NOT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[voiture])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation] DROP CONSTRAINT [FK_localisation_To_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_maintenance_To_voiture]...';


GO
ALTER TABLE [dbo].[maintenance] DROP CONSTRAINT [FK_maintenance_To_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_reservation_to_voiture]...';


GO
ALTER TABLE [dbo].[reservation] DROP CONSTRAINT [FK_reservation_to_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_defmarquee]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_defmarquee];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_def_model];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_def_etat]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_def_etat];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Modification de Table [dbo].[app_user]...';


GO
ALTER TABLE [dbo].[app_user] ALTER COLUMN [user_email] VARCHAR (1) NULL;

ALTER TABLE [dbo].[app_user] ALTER COLUMN [user_first_name] VARCHAR (1) NOT NULL;

ALTER TABLE [dbo].[app_user] ALTER COLUMN [user_last_name] VARCHAR (1) NULL;

ALTER TABLE [dbo].[app_user] ALTER COLUMN [user_login] VARCHAR (1) NOT NULL;


GO
PRINT N'Modification de Table [dbo].[def_etat]...';


GO
ALTER TABLE [dbo].[def_etat] ALTER COLUMN [etat_code] VARCHAR (1) NULL;

ALTER TABLE [dbo].[def_etat] ALTER COLUMN [etat_name] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[def_etat_demande]...';


GO
ALTER TABLE [dbo].[def_etat_demande] ALTER COLUMN [etat_code] VARCHAR (1) NULL;

ALTER TABLE [dbo].[def_etat_demande] ALTER COLUMN [etat_name] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[def_marque]...';


GO
ALTER TABLE [dbo].[def_marque] ALTER COLUMN [marque_name] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[def_model]...';


GO
ALTER TABLE [dbo].[def_model] ALTER COLUMN [name_model] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[def_parc]...';


GO
ALTER TABLE [dbo].[def_parc] ALTER COLUMN [adresse_parc] VARCHAR (1) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [email_parc] VARCHAR (1) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [nom_parc] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[localisation]...';


GO
ALTER TABLE [dbo].[localisation] ALTER COLUMN [matricule_voiture] VARCHAR (1) NOT NULL;

ALTER TABLE [dbo].[localisation] ALTER COLUMN [Temps_Localisation] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[maintenance]...';


GO
ALTER TABLE [dbo].[maintenance] ALTER COLUMN [Description_Maintenance] VARCHAR (1) NULL;

ALTER TABLE [dbo].[maintenance] ALTER COLUMN [Lieu_Maintenance] VARCHAR (1) NULL;

ALTER TABLE [dbo].[maintenance] ALTER COLUMN [matricule_voiture] VARCHAR (1) NOT NULL;

ALTER TABLE [dbo].[maintenance] ALTER COLUMN [Type_Maintenance] VARCHAR (1) NULL;


GO
PRINT N'Modification de Table [dbo].[reservation]...';


GO
ALTER TABLE [dbo].[reservation] ALTER COLUMN [matricule_voiture] VARCHAR (1) NOT NULL;


GO
PRINT N'Début de la régénération de la table [dbo].[voiture]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_voiture] (
    [matricule_voiture]    VARCHAR (1) NOT NULL,
    [couleur_voiture]      VARCHAR (1) NULL,
    [Kilommetrage_Voiture] VARCHAR (1) NULL,
    [annee_voiture]        INT         NULL,
    [nbre_place]           INT         NULL,
    [id_marque]            INT         NOT NULL,
    [id_model]             INT         NOT NULL,
    [id_etat]              INT         NOT NULL,
    [id_parc]              INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[voiture])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_voiture] ([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], [id_marque], [id_model], [id_etat], [id_parc])
        SELECT   [matricule_voiture],
                 [couleur_voiture],
                 [Kilommetrage_Voiture],
                 [annee_voiture],
                 [nbre_place],
                 [id_marque],
                 [id_model],
                 [id_etat],
                 [id_parc]
        FROM     [dbo].[voiture]
        ORDER BY [matricule_voiture] ASC;
    END

DROP TABLE [dbo].[voiture];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_voiture]', N'voiture';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation] WITH NOCHECK
    ADD CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_maintenance_To_voiture]...';


GO
ALTER TABLE [dbo].[maintenance] WITH NOCHECK
    ADD CONSTRAINT [FK_maintenance_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_voiture]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_defmarquee]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_defmarquee] FOREIGN KEY ([id_marque]) REFERENCES [dbo].[def_marque] ([id_marque]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_def_model] FOREIGN KEY ([id_model]) REFERENCES [dbo].[def_model] ([id_model]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_etat]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_def_etat] FOREIGN KEY ([id_etat]) REFERENCES [dbo].[def_etat] ([id_etat]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
PRINT N'Modification de Procédure [dbo].[sp_user_get_one_by_login]...';


GO
ALTER PROCEDURE [dbo].[sp_user_get_one_by_login]
	@userLogin VARCHAR
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_first_name, '') AS user_first_name,
		ISNULL(u.user_last_name, '') AS user_last_name,
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
PRINT N'Modification de Procédure [dbo].[sp_user_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_user_insert]
	@roleId int,
	@firstName VARCHAR,
	@lastName VARCHAR,
	@login VARCHAR,
	@password VARCHAR,
	@email VARCHAR,
	@phone VARCHAR, 
	@birthDate DATE 
	
AS
BEGIN

	INSERT INTO
		dbo.[app_user] (role_id, user_first_name, user_last_name, user_login, user_password,
					user_email, user_phone, user_is_active, user_birth_date, user_creation_date ) 
	VALUES 
		(@roleId, @firstName, @lastName, @login, @password,
		 @email, @phone, 1, @birthDate, GETDATE())

END
GO
PRINT N'Modification de Procédure [dbo].[sp_user_update]...';


GO
ALTER PROCEDURE [dbo].[sp_user_update]
	@userId int,
	@roleId int,
	@firstName VARCHAR,
	@lastName VARCHAR,
	@login VARCHAR,
	@password VARCHAR,
	@email VARCHAR,
	@phone VARCHAR, 
	@isActive BIT, 
	@birthDate DATE

AS
BEGIN

	UPDATE
		dbo.[app_user] 
	SET
		role_id = @roleId,
		user_first_name = @firstName,
		user_last_name = @lastName,
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
PRINT N'Modification de Procédure [dbo].[sp_etatvoiture_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_etatvoiture_insert]
	@id_etat int,
	@etat_code VARCHAR ,
	@etat_name VARCHAR
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat] (id_etat, etat_code,etat_name )
					
	VALUES 
		(@id_etat, @etat_code, @etat_name)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_etatvoiture_update]...';


GO
ALTER PROCEDURE [dbo].[sp_etatvoiture_update]
	@id_etat int,
	@etat_code VARCHAR,
	@etat_name VARCHAR

	
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
PRINT N'Modification de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
	@matricule_voiture VARCHAR
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
	   dppp.Nom_parc, 
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
PRINT N'Modification de Procédure [dbo].[sp_etat_demande_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_etat_demande_get_all]
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
PRINT N'Modification de Procédure [dbo].[sp_etat_demande_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_etat_demande_insert]
	@id_etat_demande int,
	@etat_code VARCHAR ,
	@etat_name VARCHAR
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat_demande] (id_etat_demande, etat_code,etat_name )
					
	VALUES 
		(@id_etat_demande, @etat_code, @etat_name)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_etat_demande_update]...';


GO
ALTER PROCEDURE [dbo].[sp_etat_demande_update]
	@id_etat_demande int,
	@etat_code VARCHAR ,
	@etat_name VARCHAR
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
PRINT N'Modification de Procédure [dbo].[sp_marque_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_marque_insert]
	@id_marque int,
	@marque_name VARCHAR
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_marque] (id_marque, marque_name )
					
	VALUES 
		(@id_marque, @marque_name)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_marque_update]...';


GO
ALTER PROCEDURE [dbo].[sp_marque_update]
	@id_marque int,
	@marque_name VARCHAR
	
	
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
PRINT N'Modification de Procédure [dbo].[sp_model_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_model_insert]
	@id_model int,
	@name_model VARCHAR
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_model] (id_model, name_model )
					
	VALUES 
		(@id_model, @name_model)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_model_update]...';


GO
ALTER PROCEDURE [dbo].[sp_model_update]
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
PRINT N'Modification de Procédure [dbo].[sp_parc_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_insert]
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
PRINT N'Modification de Procédure [dbo].[sp_parc_update]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_update]
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
PRINT N'Modification de Procédure [dbo].[sp_voiture_delete]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture VARCHAR
AS
BEGIN

	DELETE FROM
		dbo.[voiture] 
	WHERE 
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture VARCHAR,
	@couleur_voiture VARCHAR,
	@Kilommetrage_Voiture VARCHAR,
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
PRINT N'Modification de Procédure [dbo].[sp_voiture_update]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_update]
	@matricule_voiture VARCHAR,
	@couleur_voiture VARCHAR,
	@Kilommetrage_Voiture VARCHAR,
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
PRINT N'Actualisation de Procédure [dbo].[sp_parc_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_user_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_user_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_user_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_user_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_user_get_one_by_id]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_user_get_one_by_id]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_etatvoiture_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_etatvoiture_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_etatvoiture_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_etat_demande_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_etat_demande_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_model_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_model_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_model_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_model_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_update]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_get_all_by_id]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_get_all_by_id]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_update]';


GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id],[role_code],[role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur'),
		(2, N'USER', N'Utilisateur'),
		(3, N'MANAGER', N'Responsable De Parc')

END

IF NOT EXISTS (SELECT 1 FROM dbo.[app_user])
BEGIN
	INSERT INTO dbo.[app_user]([role_id], [user_first_name], [user_last_name], [user_login], [user_password], 
						   [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
	VALUES 
		(1, N'ADMIN', N'ADMIN', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
END

IF NOT EXISTS (SELECT 1 FROM dbo.[def_marque])
BEGIN
	INSERT INTO dbo.[def_marque]([id_marque], [marque_name]) 
	VALUES 
		(1, 'KIA'),
		(2, 'BMW'),
		(3, 'BUGATTI'),
		(4, 'OPEL'),
		(5, 'TESLA')

END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_model])
BEGIN
	INSERT INTO dbo.[def_model]([id_model], [name_model]) 
	VALUES 
		(1, 'COUPE'),
		(2, 'VAN'),
		(3, 'TRUCK'),
		(4, 'MICRO'),
		(5, 'LIMOUSINE')
END



IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'D','Disponible '),
		(2, 'ND',' Non Disponible ' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] )
BEGIN
	INSERT INTO dbo.[def_parc]([id_parc],[Nom_parc],[tel_parc] ,[adresse_parc] ,[email_parc],[user_id] ) 
	VALUES 
		(1, 'ParcTunis',22145789 , 'Tunis' , 'parcTunis@gmail.com' , 1),
		(2, 'ParcGafsa',55145787 , 'Gafsa' , 'parcGafsa@gmail.com' , 1),
		(3, 'ParcBizerte',99145389 , 'Bizerte' , 'parcBizerte@gmail.com' , 1),
		(4, 'ParcKef',22145789 , 'Kef' , 'ParcKef@gmail.com' , 1)
		
	
END





IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R','Refuser'),
		(2, 'A','Accepter' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
BEGIN
	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation],[id_etat_demande],[user_id],[matricule_voiture] )
	VALUES 
		(1, '1/02/2023','1/02/2023',1,1,'123TN4124')
		
END


IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture],[couleur_voiture],[Kilommetrage_Voiture],[annee_voiture],[nbre_place], 
						      [id_marque],[id_model],[id_etat],[id_parc]) 
	VALUES 
		('123TN4124','BLACK','4000KM','2019',4,1,1,1,1),
		('789TN9724','RED','2000KM','2018',4,1,1,1,2),
		('159TN6524','BLUE','9854KM','2016',4,1,1,2,3),
		('321TN7424','GRAY','14780KM','2020',4,1,1,1,4),
		('122TN1424','GREEN','14789KM','2017',4,1,1,1,4)

END



IF NOT EXISTS (SELECT 1 FROM dbo.[localisation])
BEGIN
	INSERT INTO dbo.[localisation]([Laititude_Localisation],[Longitude_Localisation],[Date_Localisation],[Temps_Localisation],[matricule_voiture]) 
	VALUES 
		('36.851599', '10.203624', GETDATE(), GETDATE(),'122TN1424')		
END



GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[localisation] WITH CHECK CHECK CONSTRAINT [FK_localisation_To_voiture];

ALTER TABLE [dbo].[maintenance] WITH CHECK CHECK CONSTRAINT [FK_maintenance_To_voiture];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_voiture];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_defmarquee];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_model];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_etat];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Mise à jour terminée.';


GO
