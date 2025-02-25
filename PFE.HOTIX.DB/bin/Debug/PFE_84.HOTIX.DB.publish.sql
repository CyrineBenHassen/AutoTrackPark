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
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bc0fa36e-542b-40af-809a-1891d74fe5f9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bc0fa36e-542b-40af-809a-1891d74fe5f9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4cf477cc-cbc6-424d-b105-b27f548bae3e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4cf477cc-cbc6-424d-b105-b27f548bae3e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '459db35c-0b28-4691-8564-826e8df15141')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('459db35c-0b28-4691-8564-826e8df15141')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '50454421-e7ae-4518-82d8-73e8c6ea8760')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('50454421-e7ae-4518-82d8-73e8c6ea8760')

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

IF NOT EXISTS (SELECT 1 FROM dbo.[def_marque])
BEGIN
	INSERT INTO dbo.[def_marque]([id_marque], [marque_name]) 
	VALUES 
		(1, 'kia'),
		(2, 'bmw')
END
IF NOT EXISTS (SELECT 1 FROM dbo.[def_model])
BEGIN
	INSERT INTO dbo.[def_model]([id_model], [name_model]) 
	VALUES 
		(1, 'truck'),
		(2, 'van')
END
IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, '123','bonetat'),
		(2, '852','bonetat' )
END

IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture], [couleur_voiture], [Kilommetrage_Voiture], [annee_voiture], [nbre_place], 
						   [id_marque], [id_model], [id_etat], [id_reservation], [id_parc]) 
	VALUES 
		('123TN412', 'rouge', '40KM', '2001', 4, 1, 1, 1, 1, 1)
END
GO

GO
PRINT N'Mise à jour terminée.';


GO
