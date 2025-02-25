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
--IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
--BEGIN
--	INSERT INTO dbo.[def_user_role]([role_id], [role_code], [role_name]) 
--	VALUES 
--		(1, N'ADMIN', N'Administrateur'),
--		(2, N'USER', N'Utilisateur')	,
--       	(3, N'RESPONSIBLE', N'responsable de parc')


--END

--IF NOT EXISTS (SELECT 1 FROM dbo.[app_user])
--BEGIN
--	INSERT INTO dbo.[app_user]([role_id], [user_first_name], [user_last_name], [user_login], [user_password], 
--						   [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
--	VALUES 
--		(1, N'ADMIN', N'ADMIN', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
--END

IF NOT EXISTS (SELECT 1 FROM dbo.[def_marque])
BEGIN
	INSERT INTO dbo.[def_marque]([id_marque], [marque_name]) 
	VALUES 
		(1, 'kia'),
		(2, 'bmw')
		

END
IF NOT EXISTS (SELECT 1 FROM dbo.[def_model])
BEGIN
	INSERT INTO dbo.[def_model]([id_model], [name_model]) 
	VALUES 
		(1, 'truck'),
		(2, 'van')
END


-----------------------(Add parcs)---------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] WHERE id_parc=1)
--BEGIN
--	INSERT INTO dbo.[def_parc]([id_parc], [Nom_parc],[tel_parc] ,[adresse_parc] , [email_parc] ,[user_id] ) 
--	VALUES 
--		(1, 'parcBizerte',22145789 , 'Bizerte' , 'parcBizerte@gmail.com' , 1)
		
	
--END

--IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] WHERE id_parc =2)
--BEGIN
--	INSERT INTO dbo.[def_parc]([id_parc], [Nom_parc],[tel_parc] ,[adresse_parc] , [email_parc] ,[user_id] ) 
--	VALUES 
		
--		(2, 'parcTunis',22145789 , 'Tunis' , 'parcTunis@gmail.com' , 1)
	
--END

IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'd1','disponible '),
		(2, 'd2',' non disponible ' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R1','refuser'),
		(2, 'A1','accepter' )
END

IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
BEGIN
	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation] ,[id_etat_demande],[user_id]) 
	VALUES 
		(1, '1/02/2023','1/02/2023',1,1)
		
END

-----------------------(Add Cars)---------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--IF NOT EXISTS (SELECT 1 FROM dbo.[voiture] WHERE matricule_voiture = '123TN412')
--BEGIN
--	INSERT INTO dbo.[voiture]([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], 
--						      [id_marque], [id_model], [id_etat], [id_reservation], [id_parc]) 
--	VALUES 
--		('123TN412', 'noire', '400KM', '2012', 4, 1, 1, 1, 1, 1)
--END

--IF NOT EXISTS (SELECT 1 FROM dbo.[voiture] WHERE matricule_voiture = '124TN5555')
--BEGIN
--	INSERT INTO dbo.[voiture]([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], 
--						      [id_marque], [id_model], [id_etat], [id_reservation], [id_parc]) 
--	VALUES 
--		('124TN5555', 'noire', '400KM', '2012', 4, 1, 1, 1, 1, 1)
--END

--IF NOT EXISTS (SELECT 1 FROM dbo.[voiture] WHERE matricule_voiture = '235TN999')
--BEGIN
--	INSERT INTO dbo.[voiture]([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], 
--						      [id_marque], [id_model], [id_etat], [id_reservation], [id_parc]) 
--	VALUES 
--		('235TN999', 'noire', '400KM', '2012', 4, 1, 1, 1, 1, 1)
--END

--IF NOT EXISTS (SELECT 1 FROM dbo.[voiture] WHERE matricule_voiture = '123TN412')
--BEGIN
--	INSERT INTO dbo.[voiture]([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], 
--						      [id_marque], [id_model], [id_etat], [id_reservation], [id_parc]) 
--	VALUES 
--		('123TN412', 'noire', '400KM', '2012', 4, 1, 1, 1, 1, 1)
--END
GO

GO
PRINT N'Mise à jour terminée.';


GO
