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
/*
La colonne datedebutreservation de la table [dbo].[reservation] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.

La colonne datefinresevation de la table [dbo].[reservation] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[reservation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Modification de Table [dbo].[reservation]...';


GO
ALTER TABLE [dbo].[reservation] ALTER COLUMN [datedebutreservation] DATETIME NOT NULL;

ALTER TABLE [dbo].[reservation] ALTER COLUMN [datefinresevation] DATETIME NOT NULL;


GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_get_all]
	AS
BEGIN

	SELECT 
		r.id_reservation,
	   datedebutreservation  AS datedebutreservation,
	   datefinresevation AS datefinreservation ,
	  RA.user_id,
	  RA.user_first_name,                                  
      RA.user_last_name,
      RA.user_login,
      RA.user_password,
      RA. user_email,
      RA. user_phone,
      RA. user_is_active,
      RA. user_birth_date,
      RA. user_creation_date,
	   RV.matricule_voiture,
       RV.couleur_voiture,
       RV. Kilommetrage_Voiture,
       RV. annee_voiture,
       RV.nbre_place,
	    RE.id_etat_demande,
        RE.etat_code,
        RE.etat_name
	FROM
		dbo.[reservation] r
		INNER JOIN dbo.[voiture] RV ON RV.matricule_voiture = r.matricule_voiture
		INNER JOIN dbo.[app_user] RA ON RA.user_id = r.user_id
		INNER JOIN dbo.[def_etat_demande] RE ON RE.id_etat_demande = r.id_etat_demande
		
	ORDER BY
		r.id_reservation ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_insert]
	@id_reservation int,
	@datedebutreservation datetime,
	@datefinresevation datetime ,
	@id_etat_demande int ,
	@user_id int,
	@matricule_voiture varchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (id_reservation, datedebutreservation, datefinresevation , id_etat_demande , user_id ,matricule_voiture)
					
	VALUES 
		(@id_reservation, @datedebutreservation, @datefinresevation , @id_etat_demande ,@user_id ,@matricule_voiture)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_update]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@datedebutreservation datetime,
	@datefinresevation datetime,
	@id_etat_demande int ,
	@user_id int ,
	@matricule_voiture varchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		id_reservation = @id_reservation,
		datedebutreservation = @datedebutreservation,
		datefinresevation = @datefinresevation,
		id_etat_demande = @id_etat_demande ,
		user_id =@user_id,
		matricule_voiture =@matricule_voiture
		
	WHERE
		id_reservation = @id_reservation

END
GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_delete]';


GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id],[role_code],[role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur'),
		(2, N'USER', N'Utilisateur'),
		(3, N'MANAGER', N'Responsable De Parc')

END

IF NOT EXISTS (SELECT 1 FROM dbo.[app_user])
BEGIN
	INSERT INTO dbo.[app_user]([role_id], [user_first_name], [user_last_name], [user_login], [user_password], 
						       [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
	VALUES 
		(1, N'ADMIN', N'ADMIN', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
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
		(1, 'COUPE'),
		(2, 'VAN'),
		(3, 'TRUCK'),
		(4, 'MICRO'),
		(5, 'LIMOUSINE')
END



IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'D','Disponible '),
		(2, 'ND',' Non Disponible ' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] )
BEGIN
	INSERT INTO dbo.[def_parc]([id_parc],[Nom_parc],[tel_parc] ,[adresse_parc] ,[email_parc],[user_id] ) 
	VALUES 
		(1, 'ParcTunis',22145789 , 'Tunis' , 'parcTunis@gmail.com' , 1),
		(2, 'ParcGafsa',55145787 , 'Gafsa' , 'parcGafsa@gmail.com' , 1),
		(3, 'ParcBizerte',99145389 , 'Bizerte' , 'parcBizerte@gmail.com' , 1),
		(4, 'ParcKef',22145789 , 'Kef' , 'ParcKef@gmail.com' , 1)
		
	
END





IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R','Refuser'),
		(2, 'A','Accepter' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
BEGIN
	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation],[id_etat_demande],[user_id],[matricule_voiture] )
	VALUES 
		(1, '1/02/2023','1/02/2023',1,1,'123TN4124')
		
END


IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture],[couleur_voiture],[Kilommetrage_Voiture],[annee_voiture],[nbre_place], 
						      [id_marque],[id_model],[id_etat],[id_parc]) 
	VALUES 
		('123TN4124','BLACK','4000KM','2019',4,1,1,1,1),
		('789TN9724','RED','2000KM','2018',4,1,1,1,2),
		('159TN6524','BLUE','9854KM','2016',4,1,1,2,3),
		('321TN7424','GRAY','14780KM','2020',4,1,1,1,4),
		('122TN1424','GREEN','14789KM','2017',4,1,1,1,4)

END



IF NOT EXISTS (SELECT 1 FROM dbo.[localisation])
BEGIN
	INSERT INTO dbo.[localisation]([Laititude_Localisation],[Longitude_Localisation],[Date_Localisation],[Temps_Localisation],[matricule_voiture]) 
	VALUES 
		('36,851599', '10,203624', GETDATE(), GETDATE(),'122TN1424')		
END



GO

GO
PRINT N'Mise à jour terminée.';


GO
