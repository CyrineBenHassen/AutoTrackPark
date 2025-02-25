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
PRINT N'Création de Procédure [dbo].[sp_reservation_get_one _by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_one _by_id]
	@id_rservation int 

     AS
     BEGIN
     SELECT
	  r.id_reservation,
	  datedebutreservation(r.datedebutreservation,'')  AS datedebutreservation,
	  datefinresevation(r.datefinresevation,'') AS datefinreservation ,
      u.user_id,
	  u.user_first_name,                                  
      u.user_last_name,
      u.user_login,
      u.user_password,
      u. user_email,
      u. user_phone,
      u. user_is_active,
      u. user_birth_date,
      u. user_creation_date,
	  v.matricule_voiture,
      v.couleur_voiture,
      v. Kilommetrage_Voiture,
      v. annee_voiture,
      v.nbre_place,
	  Re.id_etat_demande,
      Re.etat_code,
      Re.etat_name



       From 
       dbo.[reservation] r
       INNER JOIN dbo.[voiture] v ON v.matricule_voiture = r.matricule_voiture
	   INNER JOIN dbo.[app_user] u ON u.user_id = r.user_id
	   INNER JOIN dbo.[def_etat_demande] Re ON Re.id_etat_demande = r.id_etat_demande

       	
	WHERE
		r.id_reservation= @id_rservation

END
GO
PRINT N'Mise à jour terminée.';


GO
