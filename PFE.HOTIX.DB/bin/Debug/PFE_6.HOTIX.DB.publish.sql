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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 0ff54bda-a919-41c7-ad92-2dd7bf89d22d, 05988346-2d8a-4348-aaac-ee46a313d965, 2d0ac155-e7dd-4fa4-b0af-d1adc76d29b4 est ignorée, l''élément [dbo].[def_reservation].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé d70e3cb4-a910-4713-9000-4507f60d1b8a est ignorée, l''élément [dbo].[def_etat_demande].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_etat';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f2d33a02-765a-4eb7-a113-f14760ecc2da est ignorée, l''élément [dbo].[def_etat_demande].[matricule_voiture] (SqlSimpleColumn) ne sera pas renommé en id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 4d12be96-804e-4970-8f02-896e585794c4 est ignorée, l''élément [dbo].[mission].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_mission';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f207be00-4c5b-48e3-b6fb-4feadc8bb975 est ignorée, l''élément [dbo].[mission].[date] (SqlSimpleColumn) ne sera pas renommé en datedepartmission';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f9d7d641-f8b6-43d0-9c5c-93042425f37f est ignorée, l''élément [dbo].[def_localisation].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 7f3e1a00-6b5d-4b63-808c-ad97d5c7f82b est ignorée, l''élément [dbo].[def_localisation].[latitutude_] (SqlSimpleColumn) ne sera pas renommé en Laititude_Localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé c7661475-ad51-4d04-a76e-d3acd8ff9fd3, 3a9dcfea-bbc6-4449-8ed7-3292e94857d4 est ignorée, l''élément [dbo].[def_maintenance].[Id] (SqlSimpleColumn) ne sera pas renommé en IdMaintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé fa1a4f6d-dd5a-4ace-ba5c-460d11c3e9ce est ignorée, l''élément [dbo].[def_maintenance].[Description_Maintenance:] (SqlSimpleColumn) ne sera pas renommé en Description_Maintenance';


GO
PRINT N'Création de Table [dbo].[def_etat_demande]...';


GO
CREATE TABLE [dbo].[def_etat_demande] (
    [Id_etat]        INT        NOT NULL,
    [etat_code]      NCHAR (10) NULL,
    [etat_name]      NCHAR (10) NULL,
    [id_reservation] INT        NULL,
    PRIMARY KEY CLUSTERED ([Id_etat] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_localisation]...';


GO
CREATE TABLE [dbo].[def_localisation] (
    [Id_localisation]        INT        NOT NULL,
    [Laititude_Localisation] INT        NULL,
    [Longitude_Localisation] INT        NULL,
    [Date_Localisation:]     DATE       NULL,
    [Temps_Localisation]     NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id_localisation] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_maintenance]...';


GO
CREATE TABLE [dbo].[def_maintenance] (
    [IdMaintenance]           INT        NOT NULL,
    [Type_Maintenance]        NCHAR (10) NULL,
    [Description_Maintenance] NCHAR (10) NULL,
    [Lieu_Maintenance]        NCHAR (10) NULL,
    [Date_Maintenance]        NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([IdMaintenance] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_reservation]...';


GO
CREATE TABLE [dbo].[def_reservation] (
    [Id_reservation]       INT  NOT NULL,
    [datedebutreservation] DATE NOT NULL,
    [datefinresevation]    DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_reservation] ASC)
);


GO
PRINT N'Création de Table [dbo].[mission]...';


GO
CREATE TABLE [dbo].[mission] (
    [Id_mission]        INT        NOT NULL,
    [datedepartmission] DATE       NULL,
    [datefinmission ]   DATE       NULL,
    [description]       NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id_mission] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_etat_To_def_reservation]...';


GO
ALTER TABLE [dbo].[def_etat_demande] WITH NOCHECK
    ADD CONSTRAINT [FK_def_etat_To_def_reservation] FOREIGN KEY ([id_reservation]) REFERENCES [dbo].[def_reservation] ([Id_reservation]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0ff54bda-a919-41c7-ad92-2dd7bf89d22d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0ff54bda-a919-41c7-ad92-2dd7bf89d22d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd70e3cb4-a910-4713-9000-4507f60d1b8a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d70e3cb4-a910-4713-9000-4507f60d1b8a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '05988346-2d8a-4348-aaac-ee46a313d965')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('05988346-2d8a-4348-aaac-ee46a313d965')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f2d33a02-765a-4eb7-a113-f14760ecc2da')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f2d33a02-765a-4eb7-a113-f14760ecc2da')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2d0ac155-e7dd-4fa4-b0af-d1adc76d29b4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2d0ac155-e7dd-4fa4-b0af-d1adc76d29b4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4d12be96-804e-4970-8f02-896e585794c4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4d12be96-804e-4970-8f02-896e585794c4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f207be00-4c5b-48e3-b6fb-4feadc8bb975')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f207be00-4c5b-48e3-b6fb-4feadc8bb975')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f9d7d641-f8b6-43d0-9c5c-93042425f37f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f9d7d641-f8b6-43d0-9c5c-93042425f37f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7f3e1a00-6b5d-4b63-808c-ad97d5c7f82b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7f3e1a00-6b5d-4b63-808c-ad97d5c7f82b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c7661475-ad51-4d04-a76e-d3acd8ff9fd3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c7661475-ad51-4d04-a76e-d3acd8ff9fd3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3a9dcfea-bbc6-4449-8ed7-3292e94857d4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3a9dcfea-bbc6-4449-8ed7-3292e94857d4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fa1a4f6d-dd5a-4ace-ba5c-460d11c3e9ce')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fa1a4f6d-dd5a-4ace-ba5c-460d11c3e9ce')

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
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[def_etat_demande] WITH CHECK CHECK CONSTRAINT [FK_def_etat_To_def_reservation];


GO
PRINT N'Mise à jour terminée.';


GO
