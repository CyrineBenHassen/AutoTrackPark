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
La colonne id_parc de la table [dbo].[voiture] doit être modifiée de NULL à NOT NULL. Si la table contient des données, le script ALTER peut ne pas fonctionner. Pour éviter ce problème, vous devez ajouter des valeurs à cette colonne pour toutes les lignes, marquer la colonne comme autorisant les valeurs NULL ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[voiture])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture] DROP CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Modification de Table [dbo].[voiture]...';


GO
ALTER TABLE [dbo].[voiture] ALTER COLUMN [id_parc] INT NOT NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture] WITH NOCHECK
    ADD CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


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
PRINT N'Création de Procédure [dbo].[sp_etatvoiture_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_etatvoiture_get_all]
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
PRINT N'Création de Procédure [dbo].[sp_marque_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_all]
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
PRINT N'Création de Procédure [dbo].[sp_model_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_model_get_all]
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
PRINT N'Création de Procédure [dbo].[sp_parc_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_delete]
	@id_parc int
AS
BEGIN

	DELETE FROM
		dbo.[def_parc] 
	WHERE 
		id_parc = @id_parc

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_all]
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
PRINT N'Création de Procédure [dbo].[sp_parc_get_all_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_all_by_id]
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
PRINT N'Création de Procédure [dbo].[sp_parc_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_insert]
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
PRINT N'Création de Procédure [dbo].[sp_parc_update]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_update]
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
PRINT N'Création de Procédure [dbo].[sp_reservation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_delete]
		@id_reservation int
AS
BEGIN

	DELETE FROM
		dbo.[reservation] 
	WHERE 
		id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all]
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
PRINT N'Création de Procédure [dbo].[sp_reservation_get_all_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_all_by_id]
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
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
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
PRINT N'Création de Procédure [dbo].[sp_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_update]
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
PRINT N'Création de Procédure [dbo].[sp_user_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_user_delete]
	@userId int
AS
BEGIN

	DELETE FROM
		dbo.[app_user] 
	WHERE 
		user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_all] 
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_first_name, '') AS user_first_name,
		ISNULL(u.user_last_name, '') AS user_last_name,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
		
	ORDER BY
		u.user_id ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_one_by_id]
	@userId int
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_first_name, '') AS user_first_name,
		ISNULL(u.user_last_name, '') AS user_last_name,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
		
	WHERE
		u.user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_get_one_by_login]...';


GO
CREATE PROCEDURE [dbo].[sp_user_get_one_by_login]
	@userLogin VARCHAR(100)
AS
BEGIN

	SELECT 
		u.user_id,
		u.role_id,
		ISNULL(dr.role_code, '') AS role_code,
		ISNULL(dr.role_name, '') AS role_name,
		ISNULL(u.user_first_name, '') AS user_first_name,
		ISNULL(u.user_last_name, '') AS user_last_name,
		u.user_login,
		u.user_password,
		ISNULL(u.user_email, '') AS user_email,
		ISNULL(u.user_phone, '') AS user_phone,
		ISNULL(u.user_is_active, 0) AS user_is_active,
		u.user_birth_date,
		u.user_creation_date
		
	FROM
		dbo.[app_user] u
		INNER JOIN dbo.[def_user_role] dr ON dr.role_id = u.role_id
		
	WHERE
		u.user_login = @userLogin

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_user_insert]
	@roleId int,
	@firstName VARCHAR(100),
	@lastName VARCHAR(100),
	@login VARCHAR(100),
	@password VARCHAR(250),
	@email VARCHAR(100),
	@phone VARCHAR(30), 
	@birthDate DATE 
	
AS
BEGIN

	INSERT INTO
		dbo.[app_user] (role_id, user_first_name, user_last_name, user_login, user_password,
					user_email, user_phone, user_is_active, user_birth_date, user_creation_date ) 
	VALUES 
		(@roleId, @firstName, @lastName, @login, @password,
		 @email, @phone, 1, @birthDate, GETDATE())

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_role_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_user_role_get_all]
AS
BEGIN

	SELECT 
		role_id,
		ISNULL(role_code, '') AS role_code,
		ISNULL(role_name, '') AS role_name
	FROM
		dbo.[def_user_role] 
	ORDER BY
		role_id ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_update]...';


GO
CREATE PROCEDURE [dbo].[sp_user_update]
	@userId int,
	@roleId int,
	@firstName VARCHAR(100),
	@lastName VARCHAR(100),
	@login VARCHAR(100),
	@password VARCHAR(250),
	@email VARCHAR(100),
	@phone VARCHAR(30), 
	@isActive BIT, 
	@birthDate DATE

AS
BEGIN

	UPDATE
		dbo.[app_user] 
	SET
		role_id = @roleId,
		user_first_name = @firstName,
		user_last_name = @lastName,
		user_login = @login,
		user_password = @password,
		user_email = @email,
		user_phone = @phone,
		user_is_active = @isActive,
		user_birth_date = @birthDate
	
	WHERE
		user_id = @userId

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_delete]
	@matricule_voiture nchar(100)
AS
BEGIN

	DELETE FROM
		dbo.[voiture] 
	WHERE 
		matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_get_all] 
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
		INNER JOIN dbo.[def_marque] dev ON dev.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvm ON dvm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] der ON der.id_etat = v.id_etat
		INNER JOIN dbo.[reservation] du ON du.id_reservation = v.id_reservation
		INNER JOIN dbo.[def_parc] dp ON dp.id_parc = v.id_parc
		
		
	ORDER BY
		v.matricule_voiture ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_get_one_by_matricule]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_get_one_by_matricule]
	
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
		INNER JOIN dbo.[def_marque] devv ON devv.id_marque = v.id_marque
		INNER JOIN dbo.[def_model] dvmm ON dvmm.id_model = v.id_model
		INNER JOIN dbo.[def_etat] derr ON derr.id_etat = v.id_etat
		INNER JOIN dbo.[reservation] duu ON duu.id_reservation = v.id_reservation
		INNER JOIN dbo.[def_parc] dpp ON dpp.id_parc = v.id_parc
		
	WHERE
		v.matricule_voiture = @matricule_voiture

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_insert]
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
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_palce ,@id_marque ,@id_model ,@id_etat ,@id_reservation ,@id_parc )
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_voiture_update]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_update]
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
GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[voiture] WITH CHECK CHECK CONSTRAINT [FK_voiture_To_parc];


GO
PRINT N'Mise à jour terminée.';


GO
