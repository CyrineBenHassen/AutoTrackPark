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
Le type de la colonne marque_name dans la table [dbo].[def_marque] est actuellement  NCHAR (100) NULL, mais est remplacé par  NCHAR (10) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  NCHAR (10) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[def_marque])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Modification de Table [dbo].[def_marque]...';


GO
ALTER TABLE [dbo].[def_marque] ALTER COLUMN [marque_name] NCHAR (10) NULL;


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_marque_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_marque_update]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_get_one_by_matricule]';


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

IF NOT EXISTS (SELECT 1 FROM dbo.[def_marque])
BEGIN
	INSERT INTO dbo.[def_marque]([id_marque], [marque_name]) 
	VALUES 
		(1, 'kia'),
		(2, 'bmw')
END
GO

GO
PRINT N'Mise à jour terminée.';


GO
