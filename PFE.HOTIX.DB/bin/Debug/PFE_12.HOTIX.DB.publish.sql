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
La colonne matricule_voiture de la table [dbo].[def_etat] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne id_reservation de la table [dbo].[def_etat_demande] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat_demande])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne matricule_voiture de la table [dbo].[def_marque] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[def_marque])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne matricule_voiture de la table [dbo].[def_model] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[def_model])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne tel_parc dans la table [dbo].[def_parc] est actuellement  NCHAR (10) NULL, mais est remplacé par  INT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  INT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_parc])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
Le type de la colonne annee_voiture dans la table [dbo].[def_voiture] est actuellement  NCHAR (100) NULL, mais est remplacé par  INT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  INT NULL.

Le type de la colonne nbre_place dans la table [dbo].[def_voiture] est actuellement  NCHAR (100) NULL, mais est remplacé par  INT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  INT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_voiture])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_etat_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_etat] DROP CONSTRAINT [FK_def_etat_To_def_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_etat_To_def_reservation]...';


GO
ALTER TABLE [dbo].[def_etat_demande] DROP CONSTRAINT [FK_def_etat_To_def_reservation];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_marque_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_marque] DROP CONSTRAINT [FK_def_marque_To_def_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] DROP CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Modification de Table [dbo].[def_etat]...';


GO
ALTER TABLE [dbo].[def_etat] ALTER COLUMN [etat_code] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_etat] ALTER COLUMN [etat_name] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_etat] ALTER COLUMN [matricule_voiture] NCHAR (100) NOT NULL;


GO
PRINT N'Modification de Table [dbo].[def_etat_demande]...';


GO
ALTER TABLE [dbo].[def_etat_demande] ALTER COLUMN [etat_code] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_etat_demande] ALTER COLUMN [etat_name] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_etat_demande] ALTER COLUMN [id_reservation] INT NOT NULL;


GO
PRINT N'Modification de Table [dbo].[def_localisation]...';


GO
ALTER TABLE [dbo].[def_localisation] ALTER COLUMN [Temps_Localisation] NCHAR (100) NULL;


GO
PRINT N'Modification de Table [dbo].[def_maintenance]...';


GO
ALTER TABLE [dbo].[def_maintenance] ALTER COLUMN [Date_Maintenance] DATE NULL;

ALTER TABLE [dbo].[def_maintenance] ALTER COLUMN [Description_Maintenance] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_maintenance] ALTER COLUMN [Lieu_Maintenance] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_maintenance] ALTER COLUMN [Type_Maintenance] NCHAR (100) NULL;


GO
PRINT N'Modification de Table [dbo].[def_marque]...';


GO
ALTER TABLE [dbo].[def_marque] ALTER COLUMN [matricule_voiture] NCHAR (100) NOT NULL;


GO
PRINT N'Modification de Table [dbo].[def_model]...';


GO
ALTER TABLE [dbo].[def_model] ALTER COLUMN [matricule_voiture] NCHAR (100) NOT NULL;

ALTER TABLE [dbo].[def_model] ALTER COLUMN [name_model] NCHAR (100) NULL;


GO
PRINT N'Modification de Table [dbo].[def_parc]...';


GO
ALTER TABLE [dbo].[def_parc] ALTER COLUMN [adresse_parc] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [email_parc] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [Nom_parc] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [tel_parc] INT NULL;


GO
PRINT N'Modification de Table [dbo].[def_reservation]...';


GO
ALTER TABLE [dbo].[def_reservation] ALTER COLUMN [datedebutreservation] DATE NULL;

ALTER TABLE [dbo].[def_reservation] ALTER COLUMN [datefinresevation] DATE NULL;


GO
PRINT N'Début de la régénération de la table [dbo].[def_voiture]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_def_voiture] (
    [matricule_voiture]    NCHAR (100) NOT NULL,
    [couleur_voiture]      NCHAR (100) NULL,
    [Kilommetrage_Voiture] NCHAR (100) NULL,
    [annee_voiture]        INT         NULL,
    [nbre_place]           INT         NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[def_voiture])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_def_voiture] ([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place])
        SELECT   [matricule_voiture],
                 [couleur_voiture],
                 [Kilommetrage_Voiture],
                 [annee_voiture],
                 [nbre_place]
        FROM     [dbo].[def_voiture]
        ORDER BY [matricule_voiture] ASC;
    END

DROP TABLE [dbo].[def_voiture];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_def_voiture]', N'def_voiture';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Modification de Table [dbo].[mission]...';


GO
ALTER TABLE [dbo].[mission] ALTER COLUMN [description] NCHAR (100) NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_etat_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_etat] WITH NOCHECK
    ADD CONSTRAINT [FK_def_etat_To_def_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_etat_To_def_reservation]...';


GO
ALTER TABLE [dbo].[def_etat_demande] WITH NOCHECK
    ADD CONSTRAINT [FK_def_etat_To_def_reservation] FOREIGN KEY ([id_reservation]) REFERENCES [dbo].[def_reservation] ([Id_reservation]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_marque_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_marque] WITH NOCHECK
    ADD CONSTRAINT [FK_def_marque_To_def_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] WITH NOCHECK
    ADD CONSTRAINT [FK_def_voiture_To_def_model] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
PRINT N'Actualisation de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_etatvoiture_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_model_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_model_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_get_all_by_id]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_get_all_by_id]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_update]';


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
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_get_one_by_matricule]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_update]';


GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id], [role_code], [role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur'),
		(2, N'USER', N'Utilisateur')
END

IF NOT EXISTS (SELECT 1 FROM dbo.[app_user])
BEGIN
	INSERT INTO dbo.[app_user]([role_id], [user_first_name], [user_last_name], [user_login], [user_password], 
						   [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
	VALUES 
		(1, N'ADMIN', N'ADMIN', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
END
GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[def_etat] WITH CHECK CHECK CONSTRAINT [FK_def_etat_To_def_voiture];

ALTER TABLE [dbo].[def_etat_demande] WITH CHECK CHECK CONSTRAINT [FK_def_etat_To_def_reservation];

ALTER TABLE [dbo].[def_marque] WITH CHECK CHECK CONSTRAINT [FK_def_marque_To_def_voiture];

ALTER TABLE [dbo].[def_model] WITH CHECK CHECK CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Mise à jour terminée.';


GO
