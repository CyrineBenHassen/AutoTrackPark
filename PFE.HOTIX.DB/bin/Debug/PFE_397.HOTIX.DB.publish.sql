﻿/*
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
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@id_etat_demande int ,
	@description_reservation varchar(100),
	@user_id int,
	@matricule_voiture varchar(100)

	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (id_reservation,datedebutreservation,datefinresevation,id_etat_demande,description_reservation, user_id ,matricule_voiture)
					
	VALUES 
		((SELECT ISNULL(MAX(id_etat_demande),0) FROM reservation) + 1,GETDATE(),GETDATE(),@id_etat_demande ,@description_reservation ,@user_id ,@matricule_voiture)
		 

END
GO
PRINT N'Mise à jour terminée.';


GO
