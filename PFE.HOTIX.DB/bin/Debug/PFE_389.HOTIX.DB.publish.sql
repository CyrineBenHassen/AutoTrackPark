﻿/*
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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 95076e49-3dd2-42a3-b60c-0e2c87aee75d est ignorée, l''élément [dbo].[maintenance].[IdMaintenance] (SqlSimpleColumn) ne sera pas renommé en Idmaintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé a5af0e88-7626-4413-b239-7e25821fd5ad, 90d4c59c-0356-43a2-9791-59acf9d50e70, 797aa362-f11e-4ad4-b1a3-a242e9493dbc est ignorée, l''élément [dbo].[def_parc].[Id] (SqlSimpleColumn) ne sera pas renommé en id_parc';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 900e995e-a073-4cec-82c4-4f889b9c75bb est ignorée, l''élément [dbo].[def_parc].[adersse] (SqlSimpleColumn) ne sera pas renommé en adresse_parc';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9541c1ce-0d2e-496f-b36c-5a56e10061fe est ignorée, l''élément [dbo].[def_voiture].[Id] (SqlSimpleColumn) ne sera pas renommé en matriculr_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 28107904-f77b-44a6-9fdd-4184267cf55a est ignorée, l''élément [dbo].[def_voiture].[couleur_viuture] (SqlSimpleColumn) ne sera pas renommé en couleur_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 69a624f0-a9de-49d5-94ba-1626cb99f68a est ignorée, l''élément [dbo].[Table].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_marque';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé bd55873a-7e26-4a9d-a01e-d0374b0d1a99, e704dab3-2daf-4fe1-8066-70a6f27959b6 est ignorée, l''élément [dbo].[def_marque].[Id] (SqlSimpleColumn) ne sera pas renommé en id_marque';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé fb9bebf1-c7da-4b55-b63f-0413fbbeb2a2, 61722d8f-3c10-4907-847a-0647b7c7fd31 est ignorée, l''élément [dbo].[def_model].[Id] (SqlSimpleColumn) ne sera pas renommé en id_model';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé be5d8209-592b-4d0c-bb2e-bd436c36d91a, 6184ff46-4e43-4194-bcc2-ecbf58ce815d est ignorée, l''élément [dbo].[def_etat].[Id] (SqlSimpleColumn) ne sera pas renommé en id_etat';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 0ff54bda-a919-41c7-ad92-2dd7bf89d22d, 05988346-2d8a-4348-aaac-ee46a313d965, 2d0ac155-e7dd-4fa4-b0af-d1adc76d29b4, 987ff6a2-8fec-49ff-b518-22f9511d17fc, 3a1052a7-9624-4713-bae1-67f3e4616d1e est ignorée, l''élément [dbo].[def_reservation].[Id] (SqlSimpleColumn) ne sera pas renommé en Id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé d70e3cb4-a910-4713-9000-4507f60d1b8a, b5a55810-5386-46f0-ad38-70bea6874186, ef314ff8-e76c-4532-a99a-dd7b6e72a7f4 est ignorée, l''élément [dbo].[def_etat_demande].[Id] (SqlSimpleColumn) ne sera pas renommé en id_etat_demande';


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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 2f81cc51-e98c-445e-8326-8c44a110d98a est ignorée, l''élément [dbo].[def_voiture].[tel_voiture] (SqlSimpleColumn) ne sera pas renommé en Kilommetrage_Voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé b6af89c2-88ab-4101-917f-b51117e6c5bb est ignorée, l''élément [dbo].[def_localisation].[Date_Localisation:] (SqlSimpleColumn) ne sera pas renommé en Date_Localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9a815614-d743-4319-892b-6074683e93dc, 0d942368-b12e-4729-9f0f-f4fa20601f37 est ignorée, l''élément [dbo].[reservation].[id] (SqlSimpleColumn) ne sera pas renommé en id_etat_demande';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé bdc47441-930f-4165-8292-d17a8e0b0844 est ignorée, l''élément [dbo].[voiture].[id_] (SqlSimpleColumn) ne sera pas renommé en id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 456b91e0-b137-4609-9a43-00ffc8da0798, c151db3a-e16e-45b2-bc1d-fd82ce9be3f6 est ignorée, l''élément [dbo].[maintenance].[Idmaintenance] (SqlSimpleColumn) ne sera pas renommé en id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 614b911c-0124-470e-b256-35c545ee94e8 est ignorée, l''élément [dbo].[def_parc].[ma] (SqlSimpleColumn) ne sera pas renommé en matricule_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f6cd1de9-5846-4ff3-9ca3-9a8ec076411e est ignorée, l''élément [dbo].[reservation].[Id_reservation] (SqlSimpleColumn) ne sera pas renommé en id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 938c8627-ec01-4781-b60e-50a8cbcadaab est ignorée, l''élément [dbo].[localisation].[Id_localisation] (SqlSimpleColumn) ne sera pas renommé en id_localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 6d5fada4-57d1-4438-b394-4b6f9f68be89 est ignorée, l''élément [dbo].[def_parc].[Nom_parc] (SqlSimpleColumn) ne sera pas renommé en nom_parc';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 91667a3d-cba2-47fd-9b04-559237750aca, 90337b80-5bb9-4531-aa63-7ec18feaf421 est ignorée, l''élément [dbo].[def_type_maintenance].[Id] (SqlSimpleColumn) ne sera pas renommé en id_type_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé c868ad96-993b-4d1e-8500-c6c34e6e2cc8 est ignorée, l''élément [dbo].[def_type_maintenance].[Name] (SqlSimpleColumn) ne sera pas renommé en name_type';


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
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '91667a3d-cba2-47fd-9b04-559237750aca')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('91667a3d-cba2-47fd-9b04-559237750aca')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '90337b80-5bb9-4531-aa63-7ec18feaf421')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('90337b80-5bb9-4531-aa63-7ec18feaf421')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c868ad96-993b-4d1e-8500-c6c34e6e2cc8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c868ad96-993b-4d1e-8500-c6c34e6e2cc8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c151db3a-e16e-45b2-bc1d-fd82ce9be3f6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c151db3a-e16e-45b2-bc1d-fd82ce9be3f6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '659d0f82-e960-44a3-b110-1ffde0b2d1e1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('659d0f82-e960-44a3-b110-1ffde0b2d1e1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '13a52c7e-d6c8-453f-b385-810d284bc23a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('13a52c7e-d6c8-453f-b385-810d284bc23a')

GO

GO
PRINT N'Mise à jour terminée.';


GO
