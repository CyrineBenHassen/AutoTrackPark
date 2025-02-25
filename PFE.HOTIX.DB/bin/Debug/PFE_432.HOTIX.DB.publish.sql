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
PRINT N'Modification de Procédure [dbo].[sp_localisation_get_all_by_mat]...';


GO
ALTER PROCEDURE [dbo].[sp_localisation_get_all_by_mat]
	@carMat VARCHAR(100),
	@dateRef DATE,
	@byDate INT
	AS

    BEGIN
	SELECT 
		l.id_localisation,
		ISNULL(Laititude_Localisation, 0) AS Laititude_Localisation,
		ISNULL(Longitude_Localisation, 0) AS Longitude_Localisation,
		Date_Localisation AS Date_Localisation,
		Temps_Localisation AS Temps_Localisation,
		l.matricule_voiture,
		vp.couleur_voiture,
		vp.Kilommetrage_Voiture,
		vp.annee_voiture,
		vp.nbre_place

		FROM
		dbo.[localisation] l  
	   INNER JOIN dbo.[voiture] vp ON vp.matricule_voiture = l.matricule_voiture

	   WHERE 
	   (@byDate = 1 AND l.Date_Localisation = @dateRef) OR
	   (@byDate = -1)

	   AND l.matricule_voiture = @carMat

	   ORDER BY
		l.id_localisation ASC
END
GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id],[role_code],[role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur'),
		(2, N'USER', N'Employé'),
		(3, N'MANAGER', N'Responsable De Parc')

END

IF NOT EXISTS (SELECT 1 FROM dbo.[app_user])
BEGIN
	INSERT INTO dbo.[app_user]([role_id], [user_full_name], [user_login], [user_password], 
						       [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
	VALUES 
		                       (1, N'Adminstrateur', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
END

IF NOT EXISTS (SELECT 1 FROM dbo.[def_marque])
BEGIN
	INSERT INTO dbo.[def_marque]([id_marque], [marque_name]) 
	VALUES 
		(1, 'KIA'),
		(2, 'BMW'),
		(3, 'BUGATTI'),
		(4, 'OPEL'),
		(5, 'TESLA')

END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_model])
BEGIN
	INSERT INTO dbo.[def_model]([id_model], [name_model]) 
	VALUES 
		(1, 'CITADINE'),
		(2, 'COMPACTE'),
		(3, 'BERLINE'),
		(4, 'COUPE'),
		(5, 'CABRIOLET'),
		(6, 'SUV'),
		(7, 'MONOSPACE'),
		(8, 'UTILITAIRE'),
		(9, 'UTILITAIRE')
END

IF NOT EXISTS (SELECT 1 FROM dbo.[def_type_maintenance])
BEGIN
	INSERT INTO dbo.[def_type_maintenance]([id_type_maintenance], [name_type]) 
	VALUES 
		(1, 'MOUTEUR'),
		(2, 'VIDANDE'),
		(3, 'CONTROLE ')
		
END



IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'D','Disponible '),
		(2, 'ND',' Non Disponible ' ),
		(3, 'R',' Réserver' ),
		(4 ,'M','En Maintenance ' )

END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] )
BEGIN
	INSERT INTO dbo.[def_parc]([id_parc],[Nom_parc],[tel_parc] ,[adresse_parc] ,[email_parc],[user_id] ) 
	VALUES 
		(1, 'ParcTunis','+21622145789' , 'Tunis' , 'parcTunis@gmail.com' , 1),
		(2, 'ParcGafsa','+21655145787' , 'Gafsa' , 'parcGafsa@gmail.com' , 1),
		(3, 'ParcBizerte','+21699145389' , 'Bizerte' , 'parcBizerte@gmail.com' , 1),
		(4, 'ParcKef','+21622145789' , 'Kef' , 'ParcKef@gmail.com' , 1)
		
	
END





IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'E', 'ENCOURS'),
		(2, 'C', 'CONFIRMEE'),
		(3, 'A', 'ANNULEE'),
		(4, 'R', 'REFUSER')
END





IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture],[couleur_voiture],[Kilommetrage_Voiture],[annee_voiture],[nbre_place], 
						      [id_marque],[id_model],[id_etat],[id_parc]) 
	VALUES 
		('123TN4124','BLACK','4000KM','2019',4,1,1,1,1),
		('789TN9724','RED','2000KM','2018',4,2,3,1,2),
		('159TN6524','BLUE','9854KM','2016',4,3,5,2,3),
		('321TN7424','GRAY','14780KM','2020',4,4,7,2,4),
		('122TN1424','GREEN','14789KM','2017',4,2,2,4,4)

END







GO

GO
PRINT N'Mise à jour terminée.';


GO
