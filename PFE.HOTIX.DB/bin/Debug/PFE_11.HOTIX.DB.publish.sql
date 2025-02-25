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
PRINT N'Modification de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_etatvoiture_get_all]
	AS
BEGIN

	SELECT 
		e.Id_etat,
	   ISNULL(etat_code, '') AS etat_code,
	   ISNULL(etat_name, '') AS etat_name,
	  e.matricule_voiture
	   
	   
	FROM
		dbo.[def_etat] e
		INNER JOIN dbo.[def_voiture] dr ON dr.matricule_voiture = e.matricule_voiture
	ORDER BY
		e.Id_etat ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_parc_get_all_by_id]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_get_all_by_id]
	@id_parc int
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
PRINT N'Création de Procédure [dbo].[sp_parc_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_delete]
	@id_parc int
AS
BEGIN

	DELETE FROM
		dbo.[def_parc] 
	WHERE 
		Id_parc = @id_parc

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_insert]
	@id_parc int,
	@nom_parc nchar(10),
	@tel_parc nchar(10),
	@adresse_parc nchar(10),
	@email_parc nchar(10)
	
AS
BEGIN

	INSERT INTO
		dbo.[def_parc] (Id_parc, Nom_parc, tel_parc, adresse_parc, email_parc)
					
	VALUES 
		(@id_parc, @nom_parc,@tel_parc, @adresse_parc, @email_parc)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_update]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_update]
	@id_parc int,
	@Nom_parc nchar(10),
	@tel_parc nchar(10),
	@adresse_parc nchar(10),
	@email_parc nchar(10)
	
AS
BEGIN

	UPDATE
		dbo.[def_parc] 
	SET
		Id_parc = @id_parc,
		Nom_parc = @Nom_parc,
		tel_parc = @tel_parc,
		adresse_parc = @adresse_parc,
		email_parc = @email_parc
		
	WHERE
		Id_parc = @id_parc

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_delete]
		@id_reservation int
AS
BEGIN

	DELETE FROM
		dbo.[def_reservation] 
	WHERE 
		Id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all]
	AS
BEGIN

	SELECT 
		r.Id_reservation,
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinreservation
	  
	   
	FROM
		dbo.[def_reservation] r
		
	ORDER BY
		r.Id_reservation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all_by_id]
	@id_reservation int
AS
BEGIN

	SELECT 
		r.Id_reservation,
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinresevation
	  
	FROM
		dbo.[def_reservation] r
		
	WHERE
		r.Id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@Id_reservation int,
	@datedebutreservation date,
	@datefinresevation date
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_reservation] (Id_reservation, datedebutreservation, datefinresevation)
					
	VALUES 
		(@Id_reservation, @datedebutreservation, @datefinresevation)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@datedebutreservation date,
	@datefinresevation date
	
AS
BEGIN

	UPDATE
		dbo.[def_reservation] 
	SET
		Id_reservation = @id_reservation,
		datedebutreservation = @datedebutreservation,
		datefinresevation = @datefinresevation
		
	WHERE
		Id_reservation = @id_reservation

END
GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '987ff6a2-8fec-49ff-b518-22f9511d17fc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('987ff6a2-8fec-49ff-b518-22f9511d17fc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3a1052a7-9624-4713-bae1-67f3e4616d1e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3a1052a7-9624-4713-bae1-67f3e4616d1e')

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
