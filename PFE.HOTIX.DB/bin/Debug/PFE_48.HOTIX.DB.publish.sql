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
La colonne [dbo].[app_user].[id_reservation] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[app_user])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[def_parc].[matricule_voiture] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[def_parc])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[reservation].[user_id] de la table [dbo].[reservation] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[reservation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_user_To_reservation]...';


GO
ALTER TABLE [dbo].[app_user] DROP CONSTRAINT [FK_user_To_reservation];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_parc_To_voiture_]...';


GO
ALTER TABLE [dbo].[def_parc] DROP CONSTRAINT [FK_parc_To_voiture_];


GO
PRINT N'Modification de Table [dbo].[app_user]...';


GO
ALTER TABLE [dbo].[app_user] DROP COLUMN [id_reservation];


GO
PRINT N'Modification de Table [dbo].[def_parc]...';


GO
ALTER TABLE [dbo].[def_parc] DROP COLUMN [matricule_voiture];


GO
PRINT N'Modification de Table [dbo].[reservation]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD [user_id] INT NOT NULL;


GO
PRINT N'Modification de Table [dbo].[voiture]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD [id_parc] INT NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_app_user]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_app_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_app_user];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Mise à jour terminée.';


GO
