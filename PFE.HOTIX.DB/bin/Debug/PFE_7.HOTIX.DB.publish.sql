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
PRINT N'Modification de Table [dbo].[def_voiture]...';


GO
ALTER TABLE [dbo].[def_voiture] ALTER COLUMN [annee_voiture] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_voiture] ALTER COLUMN [couleur_voiture] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_voiture] ALTER COLUMN [nbre_place] NCHAR (100) NULL;

ALTER TABLE [dbo].[def_voiture] ALTER COLUMN [tel_voiture] NCHAR (100) NULL;


GO
PRINT N'Création de Procédure [dbo].[sp_voiture_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture int
AS
BEGIN

	DELETE FROM
		dbo.[def_voiture] 
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
	   ISNULL(tel_voiture, '') AS tel_voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture
	   
	FROM
		dbo.[def_voiture] v
		
	ORDER BY
		v.matricule_voiture ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
	@matricule_voiture varchar
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(tel_voiture, '') AS tel_voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture
	FROM
		dbo.[def_voiture] v
		
	WHERE
		v.matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture varchar(50),
	@couleur_voiture nchar(100),
	@tel_voiture nchar(100),
	@annee_voiture nchar(100),
	@nbre_palce nchar(100)
	
AS
BEGIN

	INSERT INTO
		dbo.[def_voiture] (matricule_voiture, couleur_voiture, tel_voiture, annee_voiture, nbre_place)
					
	VALUES 
		(@matricule_voiture, @couleur_voiture, @tel_voiture, @annee_voiture, @nbre_palce)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_update]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_update]
	@matricule_voiture varchar(50),
	@couleur_voiture nchar(100),
	@tel_voiture nchar(100),
	@annee_voiture nchar(100),
	@nbre_place nchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[def_voiture] 
	SET
		matricule_voiture = @matricule_voiture,
		couleur_voiture = @couleur_voiture,
		tel_voiture = @tel_voiture,
		annee_voiture = @annee_voiture,
		nbre_place = @nbre_place
		
	WHERE
		matricule_voiture = @matricule_voiture

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
PRINT N'Mise à jour terminée.';


GO
