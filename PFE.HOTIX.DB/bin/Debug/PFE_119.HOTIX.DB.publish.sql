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
    [id_reservation]       INT  NOT NULL,
    [datedebutreservation] DATE NULL,
    [datefinresevation]    DATE NULL,
    [id_etat_demande]      INT  NOT NULL,
    [user_id]              INT  NOT NULL,
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
    [ nbre_place]          INT         NULL,
    [id_marque]            INT         NOT NULL,
    [id_model]             INT         NOT NULL,
    [id_etat]              INT         NOT NULL,
    [id_reservation]       INT         NOT NULL,
    [id_parc]              INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_parc_To_user_]...';


GO
ALTER TABLE [dbo].[def_parc] WITH NOCHECK
    ADD CONSTRAINT [FK_parc_To_user_] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation] WITH NOCHECK
    ADD CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_maintenance_To_voiture]...';


GO
ALTER TABLE [dbo].[maintenance] WITH NOCHECK
    ADD CONSTRAINT [FK_maintenance_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


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
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_defmarquee]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_defmarquee] FOREIGN KEY ([id_marque]) REFERENCES [dbo].[def_marque] ([id_marque]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_def_model] FOREIGN KEY ([id_model]) REFERENCES [dbo].[def_model] ([id_model]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_etat]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_def_etat] FOREIGN KEY ([id_etat]) REFERENCES [dbo].[def_etat] ([id_etat]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_reservation]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_reservation] FOREIGN KEY ([id_reservation]) REFERENCES [dbo].[reservation] ([id_reservation]);


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
ALTER TABLE [dbo].[def_parc] WITH CHECK CHECK CONSTRAINT [FK_parc_To_user_];

ALTER TABLE [dbo].[localisation] WITH CHECK CHECK CONSTRAINT [FK_localisation_To_voiture];

ALTER TABLE [dbo].[maintenance] WITH CHECK CHECK CONSTRAINT [FK_maintenance_To_voiture];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_To_def_etat_demande];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_app_user];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_defmarquee];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_model];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_etat];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_reservation];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Mise à jour terminée.';


GO
