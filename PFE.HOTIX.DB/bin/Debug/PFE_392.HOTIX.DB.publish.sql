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
PRINT N'Création de Procédure [dbo].[sp_type_get_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_type_get_by_id]
	@id_type_maintenance int

	AS
	BEGIN
	SELECT
	t.id_type_maintenance,
	ISNULL(name_type,'')AS name_type

	FROM
	dbo.[def_type_maintenance] t

	WHERE
		t.id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_delete]
	@id_type_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[def_type_maintenance] 
	WHERE 
		id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_get_all]
AS
BEGIN

	SELECT 
		tm.id_type_maintenance,
	   ISNULL(name_type, '') AS name_type
	  
	   
	   
	FROM
		dbo.[def_type_maintenance] tm
		
	ORDER BY
		tm.id_type_maintenance ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_insert]

	@name_type VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_type_maintenance] (id_type_maintenance,name_type )
					
	VALUES 
		((SELECT ISNULL(MAX(id_type_maintenance),0) FROM def_type_maintenance) + 1, @name_type)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_update]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_update]
	@id_type_maintenance int,
	@name_type VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_type_maintenance] 
	SET
		id_type_maintenance = @id_type_maintenance,
		name_type = @name_type
		
		
	WHERE
		id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Mise à jour terminée.';


GO
