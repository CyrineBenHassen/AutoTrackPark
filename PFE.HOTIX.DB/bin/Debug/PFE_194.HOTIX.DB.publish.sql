﻿/*
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[app_user]...';


GO
CREATE TABLE [dbo].[app_user] (
    [user_id]            INT         IDENTITY (1, 1) NOT NULL,
    [role_id]            INT         NOT NULL,
    [user_first_name]    NCHAR (100) NOT NULL,
    [user_last_name]     NCHAR (100) NULL,
    [user_login]         NCHAR (100) NOT NULL,
    [user_password]      NCHAR (250) NOT NULL,
    [user_email]         NCHAR (100) NULL,
    [user_phone]         NCHAR (30)  NULL,
    [user_is_active]     BIT         NULL,
    [user_birth_date]    DATETIME    NULL,
    [user_creation_date] DATETIME    NOT NULL,
    PRIMARY KEY CLUSTERED ([user_id] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_etat]...';


GO
CREATE TABLE [dbo].[def_etat] (
    [id_etat]   INT         NOT NULL,
    [etat_code] NCHAR (100) NULL,
    [etat_name] NCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_etat] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_etat_demande]...';


GO
CREATE TABLE [dbo].[def_etat_demande] (
    [id_etat_demande] INT         NOT NULL,
    [etat_code]       NCHAR (100) NULL,
    [etat_name]       NCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_etat_demande] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_marque]...';


GO
CREATE TABLE [dbo].[def_marque] (
    [id_marque]   INT         NOT NULL,
    [marque_name] NCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_marque] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_model]...';


GO
CREATE TABLE [dbo].[def_model] (
    [id_model]   INT         NOT NULL,
    [name_model] NCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_model] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_parc]...';


GO
CREATE TABLE [dbo].[def_parc] (
    [id_parc]      INT         NOT NULL,
    [nom_parc]     NCHAR (100) NULL,
    [tel_parc]     INT         NULL,
    [adresse_parc] NCHAR (100) NULL,
    [email_parc]   NCHAR (100) NULL,
    [user_id]      INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([id_parc] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_user_role]...';


GO
CREATE TABLE [dbo].[def_user_role] (
    [role_id]   INT        NOT NULL,
    [role_code] NCHAR (10) NULL,
    [role_name] NCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([role_id] ASC)
);


GO
PRINT N'Création de Table [dbo].[localisation]...';


GO
CREATE TABLE [dbo].[localisation] (
    [id_localisation]        INT         NOT NULL,
    [Laititude_Localisation] INT         NULL,
    [Longitude_Localisation] INT         NULL,
    [Date_Localisation]      DATE        NULL,
    [Temps_Localisation]     NCHAR (100) NULL,
    [matricule_voiture]      NCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_localisation] ASC)
);


GO
PRINT N'Création de Table [dbo].[maintenance]...';


GO
CREATE TABLE [dbo].[maintenance] (
    [Id_maintenance]          INT         NOT NULL,
    [Type_Maintenance]        NCHAR (100) NULL,
    [Description_Maintenance] NCHAR (100) NULL,
    [Lieu_Maintenance]        NCHAR (100) NULL,
    [Date_Maintenance]        DATE        NULL,
    [matricule_voiture]       NCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_maintenance] ASC)
);


GO
PRINT N'Création de Table [dbo].[reservation]...';


GO
CREATE TABLE [dbo].[reservation] (
    [id_reservation]       INT         NOT NULL,
    [datedebutreservation] DATE        NULL,
    [datefinresevation]    DATE        NULL,
    [id_etat_demande]      INT         NOT NULL,
    [user_id]              INT         NOT NULL,
    [matricule_voiture]    NCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_reservation] ASC)
);


GO
PRINT N'Création de Table [dbo].[voiture]...';


GO
CREATE TABLE [dbo].[voiture] (
    [matricule_voiture]    NCHAR (100) NOT NULL,
    [couleur_voiture]      NCHAR (100) NULL,
    [Kilommetrage_Voiture] NCHAR (100) NULL,
    [annee_voiture]        INT         NULL,
    [nbre_place]           INT         NULL,
    [id_marque]            INT         NOT NULL,
    [id_model]             INT         NOT NULL,
    [id_etat]              INT         NOT NULL,
    [id_parc]              INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_AppUser_To_DefUserRole]...';


GO
ALTER TABLE [dbo].[app_user]
    ADD CONSTRAINT [FK_AppUser_To_DefUserRole] FOREIGN KEY ([role_id]) REFERENCES [dbo].[def_user_role] ([role_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_parc_To_user_]...';


GO
ALTER TABLE [dbo].[def_parc]
    ADD CONSTRAINT [FK_parc_To_user_] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation]
    ADD CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_maintenance_To_voiture]...';


GO
ALTER TABLE [dbo].[maintenance]
    ADD CONSTRAINT [FK_maintenance_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_To_def_etat_demande]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_To_def_etat_demande] FOREIGN KEY ([id_etat_demande]) REFERENCES [dbo].[def_etat_demande] ([id_etat_demande]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_app_user]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_to_app_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_voiture]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_to_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_defmarquee]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_defmarquee] FOREIGN KEY ([id_marque]) REFERENCES [dbo].[def_marque] ([id_marque]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_def_model] FOREIGN KEY ([id_model]) REFERENCES [dbo].[def_model] ([id_model]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_etat]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_def_etat] FOREIGN KEY ([id_etat]) REFERENCES [dbo].[def_etat] ([id_etat]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a5af0e88-7626-4413-b239-7e25821fd5ad')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a5af0e88-7626-4413-b239-7e25821fd5ad')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '90d4c59c-0356-43a2-9791-59acf9d50e70')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('90d4c59c-0356-43a2-9791-59acf9d50e70')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '900e995e-a073-4cec-82c4-4f889b9c75bb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('900e995e-a073-4cec-82c4-4f889b9c75bb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9541c1ce-0d2e-496f-b36c-5a56e10061fe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9541c1ce-0d2e-496f-b36c-5a56e10061fe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '28107904-f77b-44a6-9fdd-4184267cf55a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('28107904-f77b-44a6-9fdd-4184267cf55a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '69a624f0-a9de-49d5-94ba-1626cb99f68a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('69a624f0-a9de-49d5-94ba-1626cb99f68a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bd55873a-7e26-4a9d-a01e-d0374b0d1a99')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bd55873a-7e26-4a9d-a01e-d0374b0d1a99')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'be5d8209-592b-4d0c-bb2e-bd436c36d91a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('be5d8209-592b-4d0c-bb2e-bd436c36d91a')
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
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2f81cc51-e98c-445e-8326-8c44a110d98a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2f81cc51-e98c-445e-8326-8c44a110d98a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '987ff6a2-8fec-49ff-b518-22f9511d17fc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('987ff6a2-8fec-49ff-b518-22f9511d17fc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3a1052a7-9624-4713-bae1-67f3e4616d1e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3a1052a7-9624-4713-bae1-67f3e4616d1e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cf01975c-e956-4490-a867-b328ab3b74a0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cf01975c-e956-4490-a867-b328ab3b74a0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e2aaeca5-2a6c-4f1e-bd12-22dec843290f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e2aaeca5-2a6c-4f1e-bd12-22dec843290f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b6af89c2-88ab-4101-917f-b51117e6c5bb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b6af89c2-88ab-4101-917f-b51117e6c5bb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9a815614-d743-4319-892b-6074683e93dc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9a815614-d743-4319-892b-6074683e93dc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bdc47441-930f-4165-8292-d17a8e0b0844')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bdc47441-930f-4165-8292-d17a8e0b0844')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '95076e49-3dd2-42a3-b60c-0e2c87aee75d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('95076e49-3dd2-42a3-b60c-0e2c87aee75d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '456b91e0-b137-4609-9a43-00ffc8da0798')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('456b91e0-b137-4609-9a43-00ffc8da0798')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '614b911c-0124-470e-b256-35c545ee94e8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('614b911c-0124-470e-b256-35c545ee94e8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b5a55810-5386-46f0-ad38-70bea6874186')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b5a55810-5386-46f0-ad38-70bea6874186')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0d942368-b12e-4729-9f0f-f4fa20601f37')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0d942368-b12e-4729-9f0f-f4fa20601f37')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f6cd1de9-5846-4ff3-9ca3-9a8ec076411e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f6cd1de9-5846-4ff3-9ca3-9a8ec076411e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6184ff46-4e43-4194-bcc2-ecbf58ce815d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6184ff46-4e43-4194-bcc2-ecbf58ce815d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '61722d8f-3c10-4907-847a-0647b7c7fd31')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('61722d8f-3c10-4907-847a-0647b7c7fd31')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e704dab3-2daf-4fe1-8066-70a6f27959b6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e704dab3-2daf-4fe1-8066-70a6f27959b6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '797aa362-f11e-4ad4-b1a3-a242e9493dbc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('797aa362-f11e-4ad4-b1a3-a242e9493dbc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bc0fa36e-542b-40af-809a-1891d74fe5f9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bc0fa36e-542b-40af-809a-1891d74fe5f9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4cf477cc-cbc6-424d-b105-b27f548bae3e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4cf477cc-cbc6-424d-b105-b27f548bae3e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '459db35c-0b28-4691-8564-826e8df15141')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('459db35c-0b28-4691-8564-826e8df15141')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '50454421-e7ae-4518-82d8-73e8c6ea8760')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('50454421-e7ae-4518-82d8-73e8c6ea8760')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ef314ff8-e76c-4532-a99a-dd7b6e72a7f4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ef314ff8-e76c-4532-a99a-dd7b6e72a7f4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '938c8627-ec01-4781-b60e-50a8cbcadaab')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('938c8627-ec01-4781-b60e-50a8cbcadaab')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5702356e-a936-4db5-ae46-f6ea16f467c7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5702356e-a936-4db5-ae46-f6ea16f467c7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6d5fada4-57d1-4438-b394-4b6f9f68be89')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6d5fada4-57d1-4438-b394-4b6f9f68be89')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '329b0707-e77d-474f-963d-32f8c7a43600')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('329b0707-e77d-474f-963d-32f8c7a43600')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
