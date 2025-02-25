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
/*
La colonne [dbo].[voiture].[id_reservation] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[voiture])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_reservation]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_reservation];


GO
PRINT N'Modification de Table [dbo].[voiture]...';


GO
ALTER TABLE [dbo].[voiture] DROP COLUMN [id_reservation];


GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_get_all] 
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL([ nbre_place], '') AS nbre_voiture,
	   v.id_marque,
	   dev.marque_name,
	   v.id_model ,
	   dvm.name_model ,
	   v.id_etat ,
	   der.etat_code ,
	   der.etat_name , 
	   v.id_parc, 
	   dp.Nom_parc, 
	   dp.tel_parc, 
	   dp.adresse_parc, 
	   dp.email_parc
	  
	   
	FROM
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] dev ON dev.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvm ON dvm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] der ON der.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dp ON dp.id_parc = v.id_parc
		
		
		
	ORDER BY
		v.matricule_voiture ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
	@matricule_voiture nchar(100)
AS
BEGIN

	SELECT 
		v.matricule_voiture,
	   ISNULL(couleur_voiture, '') AS couleur_voiture,
	   ISNULL(Kilommetrage_Voiture, '') AS Kilommetrage_Voiture,
	   ISNULL(annee_voiture, '') AS annee_voiture,
	   ISNULL([ nbre_place], '') AS nbre_voiture,
	   v.id_marque,
	   devvv.marque_name,
	   v.id_model ,
	   dvmmm.name_model ,
	   v.id_etat ,
	   derrr.etat_code ,
	   derrr.etat_name , 
	   v.id_parc, 
	   dppp.Nom_parc, 
	   dppp.tel_parc, 
	   dppp.adresse_parc, 
	   dppp.email_parc
	 
	FROM
		
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] devvv ON devvv.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvmmm ON dvmmm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] derrr ON derrr.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dppp ON dppp.id_parc = v.id_parc
		
	WHERE
		v.matricule_voiture = @matricule_voiture

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture nchar(100),
	@couleur_voiture nchar(100),
	@Kilommetrage_Voiture nchar(100),
	@annee_voiture int,
	@nbre_palce int,
	@id_marque int ,
	@id_model int ,
	@id_etat int ,
	@id_parc int 
AS
BEGIN

	INSERT INTO
		dbo.[voiture] (matricule_voiture, couleur_voiture, Kilommetrage_Voiture, annee_voiture,[ nbre_place],id_marque,id_model,id_etat,id_parc )
				
	VALUES 
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_palce,@id_marque ,@id_model ,@id_etat  ,@id_parc )
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_update]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_update]
	@matricule_voiture nchar(100),
	@couleur_voiture nchar(100),
	@Kilommetrage_Voiture nchar(100),
	@annee_voiture int,
	@nbre_place int,
	@Id_marque int,
	@id_model int,
	@id_etat int,
	
	@id_parc int
	
AS
BEGIN

	UPDATE
		dbo.[voiture] 
	SET
		matricule_voiture = @matricule_voiture,
		couleur_voiture = @couleur_voiture,
		Kilommetrage_Voiture = @Kilommetrage_Voiture,
		annee_voiture = @annee_voiture,
	     [ nbre_place]= @nbre_place,
		id_marque=@Id_marque,
		id_model=@id_model,
		id_etat=@id_etat,
		id_parc=@id_parc
		
	WHERE
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Actualisation de Procédure [dbo].[sp_localisation_get_all]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_localisation_get_all]';


GO
PRINT N'Actualisation de Procédure [dbo].[sp_voiture_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_voiture_delete]';


GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id], [role_code], [role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur')
		


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


---------------(Add parcs)---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] )
BEGIN
	INSERT INTO dbo.[def_parc]([id_parc],[Nom_parc],[tel_parc] ,[adresse_parc] ,[email_parc],[user_id] ) 
	VALUES 
		(1, 'parcBizerte',22145789 , 'Bizerte' , 'parcBizerte@gmail.com' , 1)
		
	
END



IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'd1','disponible '),
		(2, 'd2',' non disponible ' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R1','refuser'),
		(2, 'A1','accepter' )
END

IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
BEGIN
	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation],[id_etat_demande],[user_id]) 
	VALUES 
		(1, '1/02/2023','1/02/2023',1,1)
		
END

-----------------(Add Cars)---------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture],[couleur_voiture],[Kilommetrage_Voiture],[annee_voiture],[ nbre_place], 
						      [id_marque],[id_model],[id_etat],[id_reservation],[id_parc]) 
	VALUES 
		('123TN412','noire','400KM','2012',4,1,1,1,1,1)
END



IF NOT EXISTS (SELECT 1 FROM dbo.[localisation])
BEGIN
	INSERT INTO dbo.[localisation]([id_localisation],[Laititude_Localisation],[Longitude_Localisation],[Date_Localisation],[Temps_Localisation],[matricule_voiture]) 
	VALUES 
		(1, 40,15.12,'11/1/2023','11:20','123TN412')
		
END



GO

GO
PRINT N'Mise à jour terminée.';


GO
