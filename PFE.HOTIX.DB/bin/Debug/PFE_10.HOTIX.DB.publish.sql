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
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation 2f81cc51-e98c-445e-8326-8c44a110d98a';

PRINT N'Renommer [dbo].[def_voiture].[tel_voiture] en Kilommetrage_Voiture';


GO
EXECUTE sp_rename @objname = N'[dbo].[def_voiture].[tel_voiture]', @newname = N'Kilommetrage_Voiture', @objtype = N'COLUMN';


GO
PRINT N'Modification de Table [dbo].[def_parc]...';


GO
ALTER TABLE [dbo].[def_parc] ALTER COLUMN [adresse_parc] NCHAR (10) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [email_parc] NCHAR (10) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [Nom_parc] NCHAR (10) NULL;

ALTER TABLE [dbo].[def_parc] ALTER COLUMN [tel_parc] NCHAR (10) NULL;


GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_get_all] 
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture
	   
	FROM
		dbo.[def_voiture] v
		
	ORDER BY
		v.matricule_voiture ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
	@matricule_voiture varchar
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL(nbre_place, '') AS nbre_voiture
	FROM
		dbo.[def_voiture] v
		
	WHERE
		v.matricule_voiture = @matricule_voiture

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture varchar(50),
	@couleur_voiture nchar(100),
	@Kilommetrage_Voiture nchar(100),
	@annee_voiture nchar(100),
	@nbre_palce nchar(100)
	
AS
BEGIN

	INSERT INTO
		dbo.[def_voiture] (matricule_voiture, couleur_voiture, Kilommetrage_Voiture, annee_voiture, nbre_place)
					
	VALUES 
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_palce)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_update]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_update]
	@matricule_voiture varchar(50),
	@couleur_voiture nchar(100),
	@Kilommetrage_Voiture nchar(100),
	@annee_voiture nchar(100),
	@nbre_place nchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[def_voiture] 
	SET
		matricule_voiture = @matricule_voiture,
		couleur_voiture = @couleur_voiture,
		Kilommetrage_Voiture = @Kilommetrage_Voiture,
		annee_voiture = @annee_voiture,
		nbre_place = @nbre_place
		
	WHERE
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_get_all]
	AS
BEGIN

	SELECT 
		e.Id_etat,
	   ISNULL(etat_code, '') AS etat_code,
	   ISNULL(etat_name, '') AS etat_name,
	  e.Id_etat
	   
	   
	FROM
		dbo.[def_etat] e
		INNER JOIN dbo.[def_voiture] dr ON dr.matricule_voiture = e.matricule_voiture
	ORDER BY
		e.Id_etat ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_all]
	AS
BEGIN

	SELECT 
		p.id_parc,
	   ISNULL(Nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc
	   
	FROM
		dbo.[def_parc] p
		
	ORDER BY
		p.Id_parc ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_get_all_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_all_by_id]
	@id_parc varchar
AS
BEGIN

	SELECT 
		p.Id_parc,
	   ISNULL(Nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc
	FROM
		dbo.[def_parc] P
		
	WHERE
		p.Id_parc = @id_parc

END
GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2f81cc51-e98c-445e-8326-8c44a110d98a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2f81cc51-e98c-445e-8326-8c44a110d98a')

GO

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
