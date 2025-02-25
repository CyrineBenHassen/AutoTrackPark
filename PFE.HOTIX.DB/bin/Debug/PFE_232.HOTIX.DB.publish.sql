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
PRINT N'Création de Procédure [dbo].[sp_localisation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_insert] 

	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture varchar  
	 
AS
BEGIN

	INSERT INTO
		dbo.[localisation] (Laititude_Localisation, Longitude_Localisation, Date_Localisation,Temps_Localisation,matricule_voiture )
					
	VALUES 
		(@Laititude_Localisation, @Longitude_Localisation, GETDATE(), GETDATE(), @matricule_voiture )
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_update]

	@id_localisation int,
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture varchar
	
AS
BEGIN

	UPDATE
		dbo.[localisation] 
	SET
		Laititude_Localisation = @Laititude_Localisation, 
		Longitude_Localisation = @Longitude_Localisation ,
		Date_Localisation = GETDATE(),
		Temps_Localisation = GETDATE(),
		matricule_voiture = @matricule_voiture 
	
	WHERE
		id_localisation = @id_localisation

END
GO
PRINT N'Mise à jour terminée.';


GO
