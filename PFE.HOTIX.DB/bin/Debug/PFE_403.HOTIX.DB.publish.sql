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
/*
La colonne [dbo].[reservation].[id_parc] de la table [dbo].[reservation] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[reservation])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Modification de Table [dbo].[reservation]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD [id_parc] INT NOT NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_parc]...';


GO
ALTER TABLE [dbo].[reservation] WITH NOCHECK
    ADD CONSTRAINT [FK_reservation_to_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_get_one_by_id]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_get_one_by_id]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_reservation_update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_reservation_update]';


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_parc];


GO
PRINT N'Mise à jour terminée.';


GO
