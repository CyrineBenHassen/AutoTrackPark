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
PRINT N'L''opération de refactorisation de changement de nom avec la clé 456b91e0-b137-4609-9a43-00ffc8da0798 est ignorée, l''élément [dbo].[maintenance].[Idmaintenance] (SqlSimpleColumn) ne sera pas renommé en Id_maintenance';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 614b911c-0124-470e-b256-35c545ee94e8 est ignorée, l''élément [dbo].[def_parc].[ma] (SqlSimpleColumn) ne sera pas renommé en matricule_voiture';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé f6cd1de9-5846-4ff3-9ca3-9a8ec076411e est ignorée, l''élément [dbo].[reservation].[Id_reservation] (SqlSimpleColumn) ne sera pas renommé en id_reservation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 938c8627-ec01-4781-b60e-50a8cbcadaab est ignorée, l''élément [dbo].[localisation].[Id_localisation] (SqlSimpleColumn) ne sera pas renommé en id_localisation';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 6d5fada4-57d1-4438-b394-4b6f9f68be89 est ignorée, l''élément [dbo].[def_parc].[Nom_parc] (SqlSimpleColumn) ne sera pas renommé en nom_parc';


GO
PRINT N'Création de Procédure [dbo].[sp_localisation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_update]
	@id_localisation int,
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal,
	@Date_Localisation datetime,
	@Temps_Localisation nchar(100),
	@matricule_voiture int
	
AS
BEGIN

	UPDATE
		dbo.[localisation] 
	SET
	id_localisation =	@id_localisation ,
	Laititude_Localisation = @Laititude_Localisation, 
	Longitude_Localisation=@Longitude_Localisation ,
	Date_Localisation=@Date_Localisation ,
	Temps_Localisation=@Temps_Localisation ,
	matricule_voiture= @matricule_voiture 
	
	WHERE
		id_localisation = @id_localisation

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
		id_model = @id_model,
		name_model = @name_model
		
		
	WHERE
		id_model= @id_model

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
	   ISNULL(nom_parc, '') AS nom_parc,
	   ISNULL(tel_parc, '') AS tel_parc,
	   ISNULL(adresse_parc, '') AS adresse_parc,
	   ISNULL(email_parc, '') AS email_parc , 
	          p.user_id ,
            ap.user_first_name,
           ap. user_last_name,
          ap.  user_login,
          ap. user_password,
          ap. user_email,
           ap.user_phone,
           ap. user_is_active,
           ap. user_birth_date,
          ap.user_creation_date

	FROM
		dbo.[def_parc] p
		INNER JOIN dbo.[app_user] ap ON ap.user_id = p.user_id
		
	ORDER BY
		p.id_parc ASC

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
PRINT N'Création de Procédure [dbo].[sp_voiture_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_voiture_insert]
	@matricule_voiture nchar(100),
	@couleur_voiture nchar(100),
	@Kilommetrage_Voiture nchar(100),
	@annee_voiture int,
	@nbre_place int,
	@id_marque int ,
	@id_model int ,
	@id_etat int ,
	@id_parc int 
AS
BEGIN

	INSERT INTO
		dbo.[voiture] (matricule_voiture, couleur_voiture, Kilommetrage_Voiture, annee_voiture,nbre_place,id_marque,id_model,id_etat,id_parc )
				
	VALUES 
		(@matricule_voiture, @couleur_voiture, @Kilommetrage_Voiture, @annee_voiture, @nbre_place,@id_marque ,@id_model ,@id_etat  ,@id_parc )
		 

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
	     nbre_place= @nbre_place,
		id_marque=@Id_marque,
		id_model=@id_model,
		id_etat=@id_etat,
		id_parc=@id_parc
		
	WHERE
		matricule_voiture = @matricule_voiture

END
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

GO

GO
IF NOT EXISTS (SELECT 1 FROM dbo.[def_user_role])
BEGIN
	INSERT INTO dbo.[def_user_role]([role_id],[role_code],[role_name]) 
	VALUES 
		(1, N'ADMIN', N'Administrateur'),
		(2, N'USER', N'Utilisateur'),
		(3, N'MANAGER', N'Responsable De Parc')

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
		(1, 'KIA'),
		(2, 'BMW'),
		(3, 'BUGATTI'),
		(4, 'OPEL'),
		(5, 'TESLA')

END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_model])
BEGIN
	INSERT INTO dbo.[def_model]([id_model], [name_model]) 
	VALUES 
		(1, 'COUPE'),
		(2, 'VAN'),
		(3, 'TRUCK'),
		(4, 'MICRO'),
		(5, 'LIMOUSINE')
END



IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat])
BEGIN
	INSERT INTO dbo.[def_etat]([id_etat], [etat_code],[etat_name]) 
	VALUES 
		(1, 'D','Disponible '),
		(2, 'ND',' Non Disponible ' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[def_parc] )
BEGIN
	INSERT INTO dbo.[def_parc]([id_parc],[Nom_parc],[tel_parc] ,[adresse_parc] ,[email_parc],[user_id] ) 
	VALUES 
		(1, 'ParcTunis',22145789 , 'Tunis' , 'parcTunis@gmail.com' , 1),
		(2, 'ParcGafsa',55145787 , 'Gafsa' , 'parcGafsa@gmail.com' , 1),
		(3, 'ParcBizerte',99145389 , 'Bizerte' , 'parcBizerte@gmail.com' , 1),
		(4, 'ParcKef',22145789 , 'Kef' , 'ParcKef@gmail.com' , 1)
		
	
END





IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R','Refuser'),
		(2, 'A','Accepter' )
END


IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
BEGIN
	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation],[id_etat_demande],[user_id],[matricule_voiture] )
	VALUES 
		(1, '1/02/2023','1/02/2023',1,1,'123TN4124')
		
END


IF NOT EXISTS (SELECT 1 FROM dbo.[voiture])
BEGIN
	INSERT INTO dbo.[voiture]([matricule_voiture],[couleur_voiture],[Kilommetrage_Voiture],[annee_voiture],[nbre_place], 
						      [id_marque],[id_model],[id_etat],[id_parc]) 
	VALUES 
		('123TN4124','BLACK','4000KM','2019',4,1,1,1,1),
		('789TN9724','RED','2000KM','2018',4,1,1,1,2),
		('159TN6524','BLUE','9854KM','2016',4,1,1,2,3),
		('321TN7424','GRAY','14780KM','2020',4,1,1,1,4),
		('122TN1424','GREEN','14789KM','2017',4,1,1,1,4)

END



IF NOT EXISTS (SELECT 1 FROM dbo.[localisation])
BEGIN
	INSERT INTO dbo.[localisation]([Laititude_Localisation],[Longitude_Localisation],[Date_Localisation],[Temps_Localisation],[matricule_voiture]) 
	VALUES 
		(36.851599, 10.203624, '11/1/2023','11:20','122TN1424')		
END



GO

GO
PRINT N'Mise à jour terminée.';


GO
