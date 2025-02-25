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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9541c1ce-0d2e-496f-b36c-5a56e10061fe est ignorée, l''élément [dbo].[def_voiture].[Id] (SqlSimpleColumn) ne sera pas renommé en matriculr_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 28107904-f77b-44a6-9fdd-4184267cf55a est ignorée, l''élément [dbo].[def_voiture].[couleur_viuture] (SqlSimpleColumn) ne sera pas renommé en couleur_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 69a624f0-a9de-49d5-94ba-1626cb99f68a est ignorée, l''élément [dbo].[Table].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_marque';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé bd55873a-7e26-4a9d-a01e-d0374b0d1a99 est ignorée, l''élément [dbo].[def_marque].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_marque';


GO
PRINT N'Création de Table [dbo].[def_marque]...';


GO
CREATE TABLE [dbo].[def_marque] (
    [Id_marque]         INT          NOT NULL,
    [marque_name]       NCHAR (10)   NULL,
    [matricule_voiture] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id_marque] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_voiture]...';


GO
CREATE TABLE [dbo].[def_voiture] (
    [matricule_voiture] VARCHAR (50) NOT NULL,
    [couleur_voiture]   NCHAR (10)   NOT NULL,
    [tel_voiture]       NCHAR (10)   NOT NULL,
    [annee_voiture]     NCHAR (10)   NOT NULL,
    [nbre_place]        NCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_marque_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_marque] WITH NOCHECK
    ADD CONSTRAINT [FK_def_marque_To_def_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9541c1ce-0d2e-496f-b36c-5a56e10061fe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9541c1ce-0d2e-496f-b36c-5a56e10061fe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '28107904-f77b-44a6-9fdd-4184267cf55a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('28107904-f77b-44a6-9fdd-4184267cf55a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '69a624f0-a9de-49d5-94ba-1626cb99f68a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('69a624f0-a9de-49d5-94ba-1626cb99f68a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bd55873a-7e26-4a9d-a01e-d0374b0d1a99')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bd55873a-7e26-4a9d-a01e-d0374b0d1a99')

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
ALTER TABLE [dbo].[def_marque] WITH CHECK CHECK CONSTRAINT [FK_def_marque_To_def_voiture];


GO
PRINT N'Mise à jour terminée.';


GO
