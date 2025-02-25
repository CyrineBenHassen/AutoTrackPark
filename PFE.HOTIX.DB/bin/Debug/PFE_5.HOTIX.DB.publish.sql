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
PRINT N'L''opération de refactorisation de changement de nom avec la clé fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2 est ignorée, l''élément [dbo].[def_model].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_model';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé be5d8209-592b-4d0c-bb2e-bd436c36d91a est ignorée, l''élément [dbo].[def_etat].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_etat';


GO
PRINT N'Création de Table [dbo].[def_etat]...';


GO
CREATE TABLE [dbo].[def_etat] (
    [Id_etat]           INT          NOT NULL,
    [etat_code]         NCHAR (10)   NULL,
    [etat_name]         NCHAR (10)   NULL,
    [matricule_voiture] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id_etat] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_model]...';


GO
CREATE TABLE [dbo].[def_model] (
    [Id_model]          INT          NOT NULL,
    [name_model]        NCHAR (10)   NULL,
    [matricule_voiture] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_model] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_etat_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_etat] WITH NOCHECK
    ADD CONSTRAINT [FK_def_etat_To_def_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] WITH NOCHECK
    ADD CONSTRAINT [FK_def_voiture_To_def_model] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[def_voiture] ([matricule_voiture]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'be5d8209-592b-4d0c-bb2e-bd436c36d91a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('be5d8209-592b-4d0c-bb2e-bd436c36d91a')

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
ALTER TABLE [dbo].[def_etat] WITH CHECK CHECK CONSTRAINT [FK_def_etat_To_def_voiture];

ALTER TABLE [dbo].[def_model] WITH CHECK CHECK CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Mise à jour terminée.';


GO
