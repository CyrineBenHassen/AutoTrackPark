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
PRINT N'L''opération de refactorisation de changement de nom avec la clé a5af0e88-7626-4413-b239-7e25821fd5ad, 90d4c59c-0356-43a2-9791-59acf9d50e70 est ignorée, l''élément [dbo].[def_parc].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_parc';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 900e995e-a073-4cec-82c4-4f889b9c75bb est ignorée, l''élément [dbo].[def_parc].[adersse] (SqlSimpleColumn) ne sera pas renommé en adresse_parc';


GO
PRINT N'Création de Table [dbo].[def_parc]...';


GO
CREATE TABLE [dbo].[def_parc] (
    [Id_parc]      INT        NOT NULL,
    [Nom_parc]     NCHAR (10) NOT NULL,
    [tel_parc]     NCHAR (10) NOT NULL,
    [adresse_parc] NCHAR (10) NOT NULL,
    [email_parc]   NCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_parc] ASC)
);


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
PRINT N'Mise à jour terminée.';


GO
