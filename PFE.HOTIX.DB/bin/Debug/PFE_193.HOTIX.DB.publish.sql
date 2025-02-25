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
PRINT N'Création de Table [dbo].[def_user_role]...';


GO
CREATE TABLE [dbo].[def_user_role] (
    [role_id]   INT        NOT NULL,
    [role_code] NCHAR (10) NULL,
    [role_name] NCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([role_id] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_AppUser_To_DefUserRole]...';


GO
ALTER TABLE [dbo].[app_user] WITH NOCHECK
    ADD CONSTRAINT [FK_AppUser_To_DefUserRole] FOREIGN KEY ([role_id]) REFERENCES [dbo].[def_user_role] ([role_id]);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[app_user] WITH CHECK CHECK CONSTRAINT [FK_AppUser_To_DefUserRole];


GO
PRINT N'Mise à jour terminée.';


GO
