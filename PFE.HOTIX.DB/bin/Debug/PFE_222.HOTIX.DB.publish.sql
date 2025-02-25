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
Le type de la colonne Laititude_Localisation dans la table [dbo].[localisation] est actuellement  INT NULL, mais est remplacé par  DECIMAL (20, 15) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  DECIMAL (20, 15) NULL.

Le type de la colonne Longitude_Localisation dans la table [dbo].[localisation] est actuellement  INT NULL, mais est remplacé par  DECIMAL (20, 15) NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  DECIMAL (20, 15) NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[localisation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation] DROP CONSTRAINT [FK_localisation_To_voiture];


GO
PRINT N'Début de la régénération de la table [dbo].[localisation]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_localisation] (
    [id_localisation]        INT              IDENTITY (1, 1) NOT NULL,
    [Laititude_Localisation] DECIMAL (20, 15) NULL,
    [Longitude_Localisation] DECIMAL (20, 15) NULL,
    [Date_Localisation]      DATETIME         NULL,
    [Temps_Localisation]     NCHAR (100)      NULL,
    [matricule_voiture]      NCHAR (100)      NOT NULL,
    PRIMARY KEY CLUSTERED ([id_localisation] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[localisation])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_localisation] ON;
        INSERT INTO [dbo].[tmp_ms_xx_localisation] ([id_localisation], [Laititude_Localisation], [Longitude_Localisation], [Date_Localisation], [Temps_Localisation], [matricule_voiture])
        SELECT   [id_localisation],
                 [Laititude_Localisation],
                 [Longitude_Localisation],
                 [Date_Localisation],
                 [Temps_Localisation],
                 [matricule_voiture]
        FROM     [dbo].[localisation]
        ORDER BY [id_localisation] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_localisation] OFF;
    END

DROP TABLE [dbo].[localisation];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_localisation]', N'localisation';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation] WITH NOCHECK
    ADD CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Modification de Procédure [dbo].[sp_localisation_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_localisation_insert]
	@id_localisation int,
	@Laititude_Localisation int,
	@Longitude_Localisation int,
	@Date_Localisation datetime,
	@Temps_Localisation nchar(100),
	@matricule_voiture int 
	
	
AS
BEGIN

	INSERT INTO
		dbo.[localisation] (Laititude_Localisation, Longitude_Localisation, Date_Localisation,Temps_Localisation,matricule_voiture )
					
	VALUES 
		(@Laititude_Localisation,@Longitude_Localisation,@Date_Localisation,@Temps_Localisation,@matricule_voiture )
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_localisation_update]...';


GO
ALTER PROCEDURE [dbo].[sp_localisation_update]
	@id_localisation int,
	@Laititude_Localisation int,
	@Longitude_Localisation int,
	@Date_Localisation datetime,
	@Temps_Localisation nchar(100),
	@matricule_voiture int
	
AS
BEGIN

	UPDATE
		dbo.[localisation] 
	SET
	id_localisation =	@id_localisation ,
	Laititude_Localisation = @Laititude_Localisation, 
	Longitude_Localisation=@Longitude_Localisation ,
	Date_Localisation=@Date_Localisation ,
	Temps_Localisation=@Temps_Localisation ,
	matricule_voiture= @matricule_voiture 
	
	WHERE
		id_localisation = @id_localisation

END
GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_get_all]';


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
		(36.851599, 10.203624, '11/1/2023','11:20','122TN1424')		
END



GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[localisation] WITH CHECK CHECK CONSTRAINT [FK_localisation_To_voiture];


GO
PRINT N'Mise à jour terminée.';


GO
