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
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] DROP CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Modification de Table [dbo].[def_model]...';


GO
ALTER TABLE [dbo].[def_model] ALTER COLUMN [matricule_voiture] VARCHAR (50) NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] WITH NOCHECK
    ADD CONSTRAINT [FK_def_voiture_To_def_model] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
PRINT N'Création de Procédure [dbo].[sp_marque_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_all]
AS
BEGIN

	SELECT 
		ma.Id_marque,
	   ISNULL(marque_name, '') AS marque_name,
	  ma.matricule_voiture
	   
	   
	FROM
		dbo.[def_marque] ma
		INNER JOIN dbo.[def_voiture] dr ON dr.matricule_voiture = m.matricule_voiture
	ORDER BY
		ma.Id_marque ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_model_get_all]
AS
BEGIN

	SELECT 
		m.id_model,
	   ISNULL(name_model, '') AS name_model,
	  m.matricule_voiture
	   
	   
	FROM
		dbo.[def_model] m
		INNER JOIN dbo.[def_voiture] dr ON dr.matricule_voiture = m.matricule_voiture
	ORDER BY
		m.Id_model ASC

END
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
ALTER TABLE [dbo].[def_model] WITH CHECK CHECK CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Mise à jour terminée.';


GO
