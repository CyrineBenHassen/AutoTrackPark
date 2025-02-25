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
La colonne [dbo].[def_etat].[matricule_voiture] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[def_etat_demande].[id_reservation] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[def_etat_demande])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[def_marque].[matricule_voiture] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[def_marque])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[def_model].[matricule_voiture] est en cours de suppression, des données risquent d'être perdues.
*/

IF EXISTS (select top 1 1 from [dbo].[def_model])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
/*
La colonne [dbo].[def_parc].[user_id] de la table [dbo].[def_parc] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[def_parc])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 95076e49-3dd2-42a3-b60c-0e2c87aee75d est ignorée, l''élément [dbo].[maintenance].[IdMaintenance] (SqlSimpleColumn) ne sera pas renommé en Idmaintenance';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation b6af89c2-88ab-4101-917f-b51117e6c5bb';

PRINT N'Renommer [dbo].[def_localisation].[Date_Localisation:] en Date_Localisation';


GO
EXECUTE sp_rename @objname = N'[dbo].[def_localisation].[Date_Localisation:]', @newname = N'Date_Localisation', @objtype = N'COLUMN';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 9a815614-d743-4319-892b-6074683e93dc, 0d942368-b12e-4729-9f0f-f4fa20601f37 est ignorée, l''élément [dbo].[reservation].[id] (SqlSimpleColumn) ne sera pas renommé en id_etat_demande';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé bdc47441-930f-4165-8292-d17a8e0b0844 est ignorée, l''élément [dbo].[voiture].[id_] (SqlSimpleColumn) ne sera pas renommé en id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 456b91e0-b137-4609-9a43-00ffc8da0798 est ignorée, l''élément [dbo].[maintenance].[Idmaintenance] (SqlSimpleColumn) ne sera pas renommé en Id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 614b911c-0124-470e-b256-35c545ee94e8 est ignorée, l''élément [dbo].[def_parc].[ma] (SqlSimpleColumn) ne sera pas renommé en matricule_voiture';


GO
PRINT N'L''opération suivante a été générée à partir d''un fichier journal de refactorisation b5a55810-5386-46f0-ad38-70bea6874186';

PRINT N'Renommer [dbo].[def_etat_demande].[Id_etat] en Id_etat_demande';


GO
EXECUTE sp_rename @objname = N'[dbo].[def_etat_demande].[Id_etat]', @newname = N'Id_etat_demande', @objtype = N'COLUMN';


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
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_etat_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_etat] DROP CONSTRAINT [FK_def_etat_To_def_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_etat_To_def_reservation]...';


GO
ALTER TABLE [dbo].[def_etat_demande] DROP CONSTRAINT [FK_def_etat_To_def_reservation];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_marque_To_def_voiture]...';


GO
ALTER TABLE [dbo].[def_marque] DROP CONSTRAINT [FK_def_marque_To_def_voiture];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_def_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[def_model] DROP CONSTRAINT [FK_def_voiture_To_def_model];


GO
PRINT N'Modification de Table [dbo].[def_etat]...';


GO
ALTER TABLE [dbo].[def_etat] DROP COLUMN [matricule_voiture];


GO
PRINT N'Modification de Table [dbo].[def_etat_demande]...';


GO
ALTER TABLE [dbo].[def_etat_demande] DROP COLUMN [id_reservation];


GO
PRINT N'Modification de Table [dbo].[def_marque]...';


GO
ALTER TABLE [dbo].[def_marque] DROP COLUMN [matricule_voiture];


GO
ALTER TABLE [dbo].[def_marque] ALTER COLUMN [marque_name] NCHAR (100) NULL;


GO
PRINT N'Modification de Table [dbo].[def_model]...';


GO
ALTER TABLE [dbo].[def_model] DROP COLUMN [matricule_voiture];


GO
PRINT N'Modification de Table [dbo].[def_parc]...';


GO
ALTER TABLE [dbo].[def_parc]
    ADD [user_id] INT NOT NULL;


GO
PRINT N'Création de Table [dbo].[localisation]...';


GO
CREATE TABLE [dbo].[localisation] (
    [Id_localisation]        INT         NOT NULL,
    [Laititude_Localisation] INT         NULL,
    [Longitude_Localisation] INT         NULL,
    [Date_Localisation]      DATE        NULL,
    [Temps_Localisation]     NCHAR (100) NULL,
    [matricule_voiture]      NCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_localisation] ASC)
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
    [nbre_place]           INT         NULL,
    [id_marque]            INT         NOT NULL,
    [id_model]             INT         NOT NULL,
    [id_etat]              INT         NOT NULL,
    [id_reservation]       INT         NOT NULL,
    [id_parc]              INT         NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);


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
    ADD CONSTRAINT [FK_reservation_To_def_etat_demande] FOREIGN KEY ([id_etat_demande]) REFERENCES [dbo].[def_etat_demande] ([Id_etat_demande]);


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
PRINT N'Création de Clé étrangère [dbo].[FK_parc_To_user_]...';


GO
ALTER TABLE [dbo].[def_parc] WITH NOCHECK
    ADD CONSTRAINT [FK_parc_To_user_] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Modification de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_etatvoiture_get_all]
	AS
BEGIN

	SELECT 
		e.id_etat,
	   ISNULL(etat_code, '') AS etat_code,
	   ISNULL(etat_name, '') AS etat_name
	  
	   
	   
	FROM
		dbo.[def_etat] e                                                                                                                                                                                      
		
	ORDER BY
		e.id_etat ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_marque_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_marque_get_all]
AS
BEGIN

	SELECT 
		ma.id_marque,
	   ISNULL(marque_name, '') AS marque_name
	  
	   
	   
	FROM
		dbo.[def_marque] ma
		
	ORDER BY
		ma.id_marque ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_model_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_model_get_all]
AS
BEGIN

	SELECT 
		m.id_model,
	   ISNULL(name_model, '') AS name_model
	 
	   
	   
	FROM
		dbo.[def_model] m
		
	ORDER BY
		m.id_model ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_parc_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_get_all]
	AS
BEGIN

	SELECT 
		p.id_parc,
	   ISNULL(Nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc , 
	   p.user_id 
	   
	FROM
		dbo.[def_parc] p
		
	ORDER BY
		p.id_parc ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_parc_get_all_by_id]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_get_all_by_id]
	@id_parc int
AS
BEGIN

	SELECT 
		p.id_parc,
	   ISNULL(Nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc ,
	   p.user_id 
	FROM
		dbo.[def_parc] P
		
	WHERE
		p.id_parc = @id_parc

END
GO
PRINT N'Modification de Procédure [dbo].[sp_parc_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_insert]
	@id_parc int,
	@nom_parc nchar(100),
	@tel_parc int,
	@adresse_parc nchar(100),
	@email_parc nchar(100) ,
	   @user_id int 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_parc] (id_parc, Nom_parc, tel_parc, adresse_parc, email_parc  , user_id)
					
	VALUES 
		(@id_parc, @nom_parc,@tel_parc, @adresse_parc, @email_parc  , @user_id)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_parc_update]...';


GO
ALTER PROCEDURE [dbo].[sp_parc_update]
	@id_parc int,
	@Nom_parc nchar(100),
	@tel_parc int,
	@adresse_parc nchar(100),
	@email_parc nchar(100),
	
	   @user_id int 
AS
BEGIN

	UPDATE
		dbo.[def_parc] 
	SET
		id_parc = @id_parc,
		Nom_parc = @Nom_parc,
		tel_parc = @tel_parc,
		adresse_parc = @adresse_parc,
		email_parc = @email_parc,
		
		user_id =@user_id
		
	WHERE
		id_parc = @id_parc

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_delete]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_delete]
		@id_reservation int
AS
BEGIN

	DELETE FROM
		dbo.[reservation] 
	WHERE 
		id_reservation = @id_reservation

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_get_all]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_get_all]
	AS
BEGIN

	SELECT 
		r.id_reservation,
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinreservation,
	  r.id_etat_demande ,
	  r.user_id
	   
	FROM
		dbo.[reservation] r
		
	ORDER BY
		r.id_reservation ASC

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_get_all_by_id]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_get_all_by_id]
	@id_reservation int
AS
BEGIN

	SELECT 
		r.id_reservation,
	   ISNULL(datedebutreservation, '') AS datedebutreservation,
	   ISNULL(datefinresevation, '') AS datefinresevation ,
	   r.id_etat_demande ,
	   r.user_id
	  
	FROM
		dbo.[reservation] r
		
	WHERE
		r.id_reservation = @id_reservation

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_insert]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_insert]
	@id_reservation int,
	@datedebutreservation date,
	@datefinresevation date ,
	@id_etat_demande int ,
	@user_id int
	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (id_reservation, datedebutreservation, datefinresevation , id_etat_demande , user_id)
					
	VALUES 
		(@id_reservation, @datedebutreservation, @datefinresevation , @id_etat_demande ,@user_id)
		 

END
GO
PRINT N'Modification de Procédure [dbo].[sp_reservation_update]...';


GO
ALTER PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@datedebutreservation date,
	@datefinresevation date,
	@id_etat_demande int ,
	@user_id int
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		id_reservation = @id_reservation,
		datedebutreservation = @datedebutreservation,
		datefinresevation = @datefinresevation,
		id_etat_demande = @id_etat_demande ,
		user_id =@user_id
		
	WHERE
		id_reservation = @id_reservation

END
GO
PRINT N'Modification de Procédure [dbo].[sp_voiture_delete]...';


GO
ALTER PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture nchar(100)
AS
BEGIN

	DELETE FROM
		dbo.[voiture] 
	WHERE 
		matricule_voiture = @matricule_voiture

END
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
	   ISNULL(nbre_place, '') AS nbre_voiture,
	     v.id_marque,
	   v.id_model ,
	   v.id_etat , 
	   v.id_reservation,
	   v.id_parc
	   
	FROM
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] dr ON dr.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dr ON dr.id_model = v.id_model
		INNER JOIN dbo.[def_etat] dr ON dr.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dr ON dr.id_parc = v.id_parc
		
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
	   ISNULL(nbre_place, '') AS nbre_voiture,
	   v.id_marque,
	   v.id_model ,
	   v.id_etat , 
	   v.id_reservation ,
	   v.id_parc
	FROM
		dbo.[voiture] v
		INNER JOIN dbo.[def_marque] dr ON dr.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dr ON dr.id_model = v.id_model
		INNER JOIN dbo.[def_etat] dr ON dr.id_etat = v.id_etat
		INNER JOIN dbo.[def_parc] dr ON dr.id_parc = v.id_parc
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
	@id_reservation int ,
	@id_parc int 

	
AS
BEGIN

	INSERT INTO
		dbo.[voiture] (matricule_voiture, couleur_voiture, Kilommetrage_Voiture, annee_voiture, nbre_place,id_marque,id_model,id_etat,id_reservation,id_parc )
					
	VALUES 
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_palce ,@id_marque ,@id_model ,@id_etat ,@id_reservation ,id_parc )
		 

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
	@id_marque int,
	@id_model int,
	@id_etat int,
	@id_reservation int,
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
		nbre_place = @nbre_place,
		id_marque=@id_marque,
		id_model=@id_model,
		id_etat=@id_etat,
		id_reservation=@id_reservation ,
		id_parc=@id_parc
		
	WHERE
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_delete]
	@id_etat int
AS
BEGIN

	DELETE FROM
		dbo.[def_etat] 
	WHERE 
		id_etat = @id_etat

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_insert]
	@id_etat int,
	@etat_code nchar(100) ,
	@etat_name nchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat] (id_etat, etat_code,etat_name )
					
	VALUES 
		(@id_etat, @etat_code, @etat_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_update]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_update]
	@id_etat int,
	@etat_code nchar(100),
	@etat_name nchar(100)

	
AS
BEGIN

	UPDATE
		dbo.[def_etat] 
	SET
		id_etat = @id_etat,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat= @id_etat

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_delete]
	@id_marque int
AS
BEGIN

	DELETE FROM
		dbo.[def_marque] 
	WHERE 
		id_marque = @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_insert]
	@id_marque int,
	@marque_name nchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_marque] (id_marque, marque_name )
					
	VALUES 
		(@id_marque, @marque_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_update]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_update]
	@id_marque int,
	@marque_name nchar(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_marque] 
	SET
		id_marque = @id_marque,
		marque_name = @marque_name
		
		
	WHERE
		id_marque= @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_model_delete]
	@id_model int
AS
BEGIN

	DELETE FROM
		dbo.[def_model] 
	WHERE 
		id_model = @id_model

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_model_insert]
	@id_model int,
	@name_model nchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_model] (id_model, name_model )
					
	VALUES 
		(@id_model, @name_model)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_model_update]...';


GO
CREATE PROCEDURE [dbo].[sp_model_update]
	@id_model int,
	@name_model nchar(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_model] 
	SET
		@id_model = @id_model,
		@name_model = @name_model
		
		
	WHERE
		@id_model= @id_model

END
GO
PRINT N'Actualisation de Procédure [dbo].[sp_parc_delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_parc_delete]';


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
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[localisation] WITH CHECK CHECK CONSTRAINT [FK_localisation_To_voiture];

ALTER TABLE [dbo].[maintenance] WITH CHECK CHECK CONSTRAINT [FK_maintenance_To_voiture];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_To_def_etat_demande];

ALTER TABLE [dbo].[reservation] WITH CHECK CHECK CONSTRAINT [FK_reservation_to_app_user];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_defmarquee];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_model];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_def_etat];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_reservation];

ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_parc];

ALTER TABLE [dbo].[def_parc] WITH CHECK CHECK CONSTRAINT [FK_parc_To_user_];


GO
PRINT N'Mise à jour terminée.';


GO
