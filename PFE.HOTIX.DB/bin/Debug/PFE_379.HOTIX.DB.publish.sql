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
PRINT N'Création de Procédure [dbo].[sp_demande_reservation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_demande_reservation_delete]
	@demande_reservation_id  int
AS
BEGIN

	DELETE FROM
		dbo.[app_demande_reservation] 
	WHERE 
		demande_reservation_id = @demande_reservation_id

END
GO
PRINT N'Création de Procédure [dbo].[sp_demande_reservation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_demande_reservation_get_all]
AS
BEGIN

	SELECT 
		d.demande_reservation_id,
		d.demande_reservation_datedebut,
		d.demande_reservation_datefin,
		ISNULL(d.description_demande, '') AS raison_demande,
		d.user_id,
		ISNULL(u.user_full_name, '') AS user_full_name,
		r.id_reservation,
		r.datedebutreservation,
		r.datefinresevation
	
	FROM
		dbo.[app_demande_reservation] d
		INNER JOIN dbo.[app_user] u  ON d.user_id = u.user_id
		INNER JOIN dbo.[reservation] r ON r.id_reservation = r.id_reservation

	ORDER BY
	     d.demande_reservation_id DESC

END
GO
PRINT N'Création de Procédure [dbo].[sp_demande_reservation_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_demande_reservation_get_one_by_id]
    @demande_reservation_id  int
AS
BEGIN
	SELECT 
		d.demande_reservation_id,
		d.demande_reservation_datedebut,
		d.demande_reservation_datefin,
		ISNULL(d.description_demande, '') AS raison_demande,
		d.user_id,
		ISNULL(u.user_full_name, '') AS user_full_name,
		r.id_reservation,
		r.datedebutreservation,
		r.datefinresevation
	
	FROM
		dbo.[app_demande_reservation] d
		INNER JOIN dbo.[app_user] u  ON d.user_id = u.user_id
		INNER JOIN dbo.[reservation] r ON r.id_reservation = r.id_reservation

	WHERE
	     d.demande_reservation_id = @demande_reservation_id

END
GO
PRINT N'Création de Procédure [dbo].[sp_demande_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_demande_reservation_insert]
@userId int,
@id_reservation int,
@demande_reservation_datedebut DATE,
@demande_reservation_date_fin DATE,
@description_demande VARCHAR(MAX)

AS
BEGIN

	INSERT INTO
		dbo.[app_demande_reservation] 
		(user_id, id_reservation, demande_reservation_datedebut, demande_reservation_datefin, description_demande) 
	VALUES 
		(@userId, @id_reservation, @demande_reservation_datedebut, @demande_reservation_date_fin, @description_demande)

END
GO
PRINT N'Création de Procédure [dbo].[sp_demande_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_demande_reservation_update]
@demande_reservation_id int,
@demande_reservation_datedebut DATE,
@demande_reservation_datefin DATE,
@description_demande VARCHAR(MAX)

AS
BEGIN

	UPDATE
		dbo.[app_demande_reservation] 
	SET
		
	
		
		demande_reservation_datedebut = @demande_reservation_datedebut,
		demande_reservation_datefin=@demande_reservation_datefin
	
	WHERE
		demande_reservation_id =  @demande_reservation_id

END
GO
PRINT N'Mise à jour terminée.';


GO
