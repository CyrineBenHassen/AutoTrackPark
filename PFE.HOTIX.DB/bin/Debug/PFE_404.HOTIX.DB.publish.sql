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
PRINT N'Création de Table [dbo].[reservation]...';


GO
CREATE TABLE [dbo].[reservation] (
    [id_reservation]          INT           IDENTITY (1, 1) NOT NULL,
    [datedebutreservation]    DATETIME      NULL,
    [datefinresevation]       DATETIME      NULL,
    [id_etat_demande]         INT           NOT NULL,
    [user_id]                 INT           NOT NULL,
    [matricule_voiture]       VARCHAR (100) NOT NULL,
    [description_reservation] VARCHAR (100) NULL,
    [id_parc]                 INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id_reservation] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_To_def_etat_demande]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_To_def_etat_demande] FOREIGN KEY ([id_etat_demande]) REFERENCES [dbo].[def_etat_demande] ([id_etat_demande]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_app_user]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_app_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_voiture]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_parc]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_To_def_etat_demande];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_app_user];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_voiture];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_parc];


GO
PRINT N'Mise à jour terminée.';


GO
