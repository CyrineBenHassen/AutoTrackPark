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
USE [$(DatabaseName)];


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 95076e49-3dd2-42a3-b60c-0e2c87aee75d est ignorée, l''élément [dbo].[maintenance].[IdMaintenance] (SqlSimpleColumn) ne sera pas renommé en Idmaintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé b6af89c2-88ab-4101-917f-b51117e6c5bb est ignorée, l''élément [dbo].[def_localisation].[Date_Localisation:] (SqlSimpleColumn) ne sera pas renommé en Date_Localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9a815614-d743-4319-892b-6074683e93dc, 0d942368-b12e-4729-9f0f-f4fa20601f37 est ignorée, l''élément [dbo].[reservation].[id] (SqlSimpleColumn) ne sera pas renommé en id_etat_demande';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé bdc47441-930f-4165-8292-d17a8e0b0844 est ignorée, l''élément [dbo].[voiture].[id_] (SqlSimpleColumn) ne sera pas renommé en id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 456b91e0-b137-4609-9a43-00ffc8da0798 est ignorée, l''élément [dbo].[maintenance].[Idmaintenance] (SqlSimpleColumn) ne sera pas renommé en Id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 614b911c-0124-470e-b256-35c545ee94e8 est ignorée, l''élément [dbo].[def_parc].[ma] (SqlSimpleColumn) ne sera pas renommé en matricule_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé b5a55810-5386-46f0-ad38-70bea6874186 est ignorée, l''élément [dbo].[def_etat_demande].[Id_etat] (SqlSimpleColumn) ne sera pas renommé en Id_etat_demande';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f6cd1de9-5846-4ff3-9ca3-9a8ec076411e est ignorée, l''élément [dbo].[reservation].[Id_reservation] (SqlSimpleColumn) ne sera pas renommé en id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 6184ff46-4e43-4194-bcc2-ecbf58ce815d est ignorée, l''élément [dbo].[def_etat].[Id_etat] (SqlSimpleColumn) ne sera pas renommé en id_etat';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 61722d8f-3c10-4907-847a-0647b7c7fd31 est ignorée, l''élément [dbo].[def_model].[Id_model] (SqlSimpleColumn) ne sera pas renommé en id_model';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé e704dab3-2daf-4fe1-8066-70a6f27959b6 est ignorée, l''élément [dbo].[def_marque].[Id_marque] (SqlSimpleColumn) ne sera pas renommé en id_marque';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 797aa362-f11e-4ad4-b1a3-a242e9493dbc est ignorée, l''élément [dbo].[def_parc].[Id_parc] (SqlSimpleColumn) ne sera pas renommé en id_parc';


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
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
