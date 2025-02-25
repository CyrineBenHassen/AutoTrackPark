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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[app_user]...';


GO
CREATE TABLE [dbo].[app_user] (
    [user_id]            INT          IDENTITY (1, 1) NOT NULL,
    [role_id]            INT          NULL,
    [user_full_name]     NCHAR (300)  NULL,
    [user_login]         NCHAR (100)  NULL,
    [user_password]      NCHAR (250)  NULL,
    [user_email]         NCHAR (100)  NULL,
    [user_phone]         NCHAR (30)   NULL,
    [user_url_image]     NCHAR (1000) NULL,
    [user_is_active]     BIT          NULL,
    [user_birth_date]    DATETIME     NULL,
    [user_creation_date] DATETIME     NULL,
    [user_is_valid]      BIT          NULL,
    PRIMARY KEY CLUSTERED ([user_id] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_etat]...';


GO
CREATE TABLE [dbo].[def_etat] (
    [id_etat]   INT           NOT NULL,
    [etat_code] VARCHAR (50)  NULL,
    [etat_name] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_etat] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_etat_demande]...';


GO
CREATE TABLE [dbo].[def_etat_demande] (
    [id_etat_demande] INT           NOT NULL,
    [etat_code]       VARCHAR (50)  NULL,
    [etat_name]       VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_etat_demande] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_marque]...';


GO
CREATE TABLE [dbo].[def_marque] (
    [id_marque]   INT           NOT NULL,
    [marque_name] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_marque] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_model]...';


GO
CREATE TABLE [dbo].[def_model] (
    [id_model]   INT           NOT NULL,
    [name_model] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_model] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_parc]...';


GO
CREATE TABLE [dbo].[def_parc] (
    [id_parc]      INT           NOT NULL,
    [nom_parc]     VARCHAR (100) NULL,
    [tel_parc]     VARCHAR (50)  NULL,
    [adresse_parc] VARCHAR (MAX) NULL,
    [email_parc]   VARCHAR (100) NULL,
    [user_id]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id_parc] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_type_maintenance]...';


GO
CREATE TABLE [dbo].[def_type_maintenance] (
    [id_type_maintenance] INT           NOT NULL,
    [name_type]           VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([id_type_maintenance] ASC)
);


GO
PRINT N'Création de Table [dbo].[def_user_role]...';


GO
CREATE TABLE [dbo].[def_user_role] (
    [role_id]   INT           NOT NULL,
    [role_code] VARCHAR (50)  NULL,
    [role_name] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([role_id] ASC)
);


GO
PRINT N'Création de Table [dbo].[localisation]...';


GO
CREATE TABLE [dbo].[localisation] (
    [id_localisation]        INT              IDENTITY (1, 1) NOT NULL,
    [Laititude_Localisation] DECIMAL (20, 15) NULL,
    [Longitude_Localisation] DECIMAL (20, 15) NULL,
    [Date_Localisation]      DATETIME         NULL,
    [Temps_Localisation]     DATETIME         NULL,
    [matricule_voiture]      VARCHAR (100)    NOT NULL,
    PRIMARY KEY CLUSTERED ([id_localisation] ASC)
);


GO
PRINT N'Création de Table [dbo].[maintenance]...';


GO
CREATE TABLE [dbo].[maintenance] (
    [id_maintenance]          INT           NOT NULL,
    [Description_Maintenance] VARCHAR (MAX) NULL,
    [Lieu_Maintenance]        VARCHAR (100) NULL,
    [Date_Maintenance]        DATE          NULL,
    [matricule_voiture]       VARCHAR (100) NOT NULL,
    [id_type_maintenance]     INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id_maintenance] ASC)
);


GO
PRINT N'Création de Table [dbo].[reservation]...';


GO
CREATE TABLE [dbo].[reservation] (
    [id_reservation]       INT           IDENTITY (1, 1) NOT NULL,
    [datedebutreservation] DATETIME      NULL,
    [datefinresevation]    DATETIME      NULL,
    [id_etat_demande]      INT           NOT NULL,
    [user_id]              INT           NOT NULL,
    [matricule_voiture]    VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([id_reservation] ASC)
);


GO
PRINT N'Création de Table [dbo].[voiture]...';


GO
CREATE TABLE [dbo].[voiture] (
    [matricule_voiture]    VARCHAR (100) NOT NULL,
    [couleur_voiture]      VARCHAR (100) NULL,
    [Kilommetrage_Voiture] VARCHAR (100) NULL,
    [annee_voiture]        INT           NULL,
    [nbre_place]           INT           NULL,
    [id_marque]            INT           NOT NULL,
    [id_model]             INT           NOT NULL,
    [id_etat]              INT           NOT NULL,
    [id_parc]              INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([matricule_voiture] ASC)
);


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[app_user]...';


GO
ALTER TABLE [dbo].[app_user]
    ADD DEFAULT 2 FOR [role_id];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[app_user]...';


GO
ALTER TABLE [dbo].[app_user]
    ADD DEFAULT 'user2.png' FOR [user_url_image];


GO
PRINT N'Création de Clé étrangère [dbo].[FK_AppUser_To_DefUserRole]...';


GO
ALTER TABLE [dbo].[app_user]
    ADD CONSTRAINT [FK_AppUser_To_DefUserRole] FOREIGN KEY ([role_id]) REFERENCES [dbo].[def_user_role] ([role_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_parc_To_user_]...';


GO
ALTER TABLE [dbo].[def_parc]
    ADD CONSTRAINT [FK_parc_To_user_] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_localisation_To_voiture]...';


GO
ALTER TABLE [dbo].[localisation]
    ADD CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_maintenance_To_voiture]...';


GO
ALTER TABLE [dbo].[maintenance]
    ADD CONSTRAINT [FK_maintenance_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_maintenance_To_type_maintenance]...';


GO
ALTER TABLE [dbo].[maintenance]
    ADD CONSTRAINT [FK_maintenance_To_type_maintenance] FOREIGN KEY ([id_type_maintenance]) REFERENCES [dbo].[def_type_maintenance] ([id_type_maintenance]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_To_def_etat_demande]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_To_def_etat_demande] FOREIGN KEY ([id_etat_demande]) REFERENCES [dbo].[def_etat_demande] ([id_etat_demande]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_app_user]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_to_app_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[app_user] ([user_id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_reservation_to_voiture]...';


GO
ALTER TABLE [dbo].[reservation]
    ADD CONSTRAINT [FK_reservation_to_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [dbo].[voiture] ([matricule_voiture]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_defmarquee]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_defmarquee] FOREIGN KEY ([id_marque]) REFERENCES [dbo].[def_marque] ([id_marque]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_model]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_def_model] FOREIGN KEY ([id_model]) REFERENCES [dbo].[def_model] ([id_model]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_def_etat]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_def_etat] FOREIGN KEY ([id_etat]) REFERENCES [dbo].[def_etat] ([id_etat]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_voiture_To_parc]...';


GO
ALTER TABLE [dbo].[voiture]
    ADD CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [dbo].[def_parc] ([id_parc]);


GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_delete]
	@id_etat_demande int
AS
BEGIN

	DELETE FROM
		dbo.[def_etat_demande] 
	WHERE 
		id_etat_demande = @id_etat_demande

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_get_all]
	AS
BEGIN
	SELECT 
		ed.id_etat_demande,
	   ISNULL(LTRIM(RTRIM(etat_code)), '') AS etat_code,
	   ISNULL(LTRIM(RTRIM(etat_name)), '') AS etat_name
	    
	FROM
		dbo.[def_etat_demande] ed                                                                                                                                                                                      
		
	ORDER BY
		ed.id_etat_demande ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_insert]
	@id_etat_demande int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_etat_demande] (id_etat_demande, etat_code,etat_name )
					
	VALUES 
		(@id_etat_demande, @etat_code, @etat_name)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_etat_demande_update]...';


GO
CREATE PROCEDURE [dbo].[sp_etat_demande_update]
	@id_etat_demande int,
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
AS
BEGIN

	UPDATE
		dbo.[def_etat_demande] 
	SET
		id_etat_demande = @id_etat_demande,
		etat_code = @etat_code,
		etat_name =@etat_name
		
		
	WHERE
		id_etat_demande= @id_etat_demande

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
	@etat_code VARCHAR(50) ,
	@etat_name VARCHAR(100)
	
	
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
	@etat_code VARCHAR(50),
	@etat_name VARCHAR(100)

	
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
PRINT N'Création de Procédure [dbo].[sp_localisation_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_delete]
	@id_localisation int
AS
BEGIN

	DELETE FROM
		dbo.[localisation] 
	WHERE 
		id_localisation = @id_localisation

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_get_all]
	AS
BEGIN

	SELECT 
		l.id_localisation,
		ISNULL(Laititude_Localisation, 0) AS Laititude_Localisation,
		ISNULL(Longitude_Localisation, 0) AS Longitude_Localisation ,
		Date_Localisation AS Date_Localisation ,
		Temps_Localisation AS Temps_Localisation ,
		l.matricule_voiture,
		vp.couleur_voiture,
		vp.Kilommetrage_Voiture,
		vp.annee_voiture,
		vp.nbre_place

	FROM
		dbo.[localisation] l       
		INNER JOIN dbo.[voiture] vp ON vp.matricule_voiture = l.matricule_voiture
		
	ORDER BY
		l.id_localisation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_insert] 
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture VARCHAR(100)  
	 
AS
BEGIN

	INSERT INTO
		dbo.[localisation] (Laititude_Localisation, Longitude_Localisation, Date_Localisation,Temps_Localisation,matricule_voiture )
					
	VALUES 
		(@Laititude_Localisation, @Longitude_Localisation, GETDATE(), GETDATE(), @matricule_voiture )
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_localisation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_localisation_update]
	@id_localisation int,
	@Laititude_Localisation decimal,
	@Longitude_Localisation decimal, 
	@matricule_voiture VARCHAR(100)
	
AS
BEGIN

	UPDATE
		dbo.[localisation] 
	SET
		Laititude_Localisation = @Laititude_Localisation, 
		Longitude_Localisation = @Longitude_Localisation ,
		Date_Localisation = GETDATE(),
		Temps_Localisation = GETDATE(),
		matricule_voiture = @matricule_voiture 
	
	WHERE
		id_localisation = @id_localisation

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_delete]
	@id_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[maintenance] 
	WHERE 
		id_maintenance = @id_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_get_all]
	AS
BEGIN

	SELECT 
		m.id_maintenance,
		ISNULL(Description_Maintenance,'') AS Description_Maintenance,
		ISNULL(Lieu_Maintenance ,'') AS Lieu_maintenance ,
		Date_Maintenance AS Date_Maintenance ,
		m.matricule_voiture,
		vm.couleur_voiture,
		vm.Kilommetrage_Voiture,
		vm.annee_voiture,
		vm.nbre_place,
		m.id_type_maintenance,
		tm.id_type_maintenance

	FROM
		dbo.[maintenance] m       
		INNER JOIN dbo.[voiture] vm ON vm.matricule_voiture = m.matricule_voiture
		INNER JOIN dbo.[def_type_maintenance] tm ON tm.id_type_maintenance = m.id_type_maintenance
		
	ORDER BY
		m.id_maintenance ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_insert] 

    @id_maintenance int ,
	@Description_Maintenance VARCHAR(100),
	@Lieu_Maintenance VARCHAR(100) , 
	@matricule_voiture VARCHAR(100) ,
	@id_type_maintenance int 
	 
AS
BEGIN

	INSERT INTO
		dbo.[maintenance] (id_maintenance,Description_Maintenance, Date_Maintenance,Lieu_Maintenance, matricule_voiture,id_type_maintenance )
					
	VALUES 
		(@id_maintenance,@Description_Maintenance,  GETDATE(), @Lieu_Maintenance, @matricule_voiture, @id_type_maintenance )
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_maintenance_update]...';


GO
CREATE PROCEDURE [dbo].[sp_maintenance_update]
    @id_maintenance int,
	@Description_Maintenance VARCHAR(100),
	@Lieu_Maintenance VARCHAR(100) , 
	@matricule_voiture VARCHAR(100) ,
	@id_type_maintenance int 
	
AS
BEGIN

	UPDATE
		dbo.[maintenance] 
	SET
		id_maintenance = @id_maintenance, 
		Description_Maintenance = @Description_Maintenance ,
		Lieu_Maintenance = @Lieu_Maintenance,
		Date_Maintenance = GETDATE(),
		matricule_voiture = @matricule_voiture ,
		id_type_maintenance = @id_type_maintenance
	
	WHERE
	id_maintenance = @id_maintenance

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
PRINT N'Création de Procédure [dbo].[sp_marque_get_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_by_id]
	@id_marque int

	AS
	BEGIN
	SELECT
	m.id_marque,
	ISNULL(marque_name,'')AS marque_name

	FROM
	dbo.[def_marque] m

	WHERE
		m.id_marque = @id_marque

END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_get_one_by_id]
	@id_marque int

	AS
	BEGIN
	SELECT
	m.id_marque,
	m.marque_name

	From 
			dbo.[def_marque] m


			where 
			m.id_marque= id_marque
END
GO
PRINT N'Création de Procédure [dbo].[sp_marque_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_marque_insert]
	@id_marque int,
	@marque_name VARCHAR(100)
	
	
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
	@marque_name VARCHAR(100)
	
	
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
	@name_model VARCHAR(100)
	
	
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
	@name_model VARCHAR(100)
	
	
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
            ap.user_full_name,
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
PRINT N'Création de Procédure [dbo].[sp_parc_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_get_one_by_id]
	@id_parc int 

	AS
	BEGIN
	SELECT

	p.id_parc,
	ISNULL(p.nom_parc, '') AS nom_parc,
	ISNULL(p.tel_parc,'')AS tel_parc,
	ISNull(p.adresse_parc,'')AS adresse_parc,
	ISNULL(p.email_parc,'')AS email_parc,
	u.user_id,
	u.user_full_name,

	u.user_login,
	u.user_password,
	u.user_email,
	u.user_phone,
	u.user_is_active,
	u.user_birth_date,
	u.user_creation_date

	FROM 
	dbo.[def_parc] p
		INNER JOIN dbo.[app_user] u ON u.user_id = p.user_id
    Where 
    p.id_parc=@id_parc

     END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_insert]
	@nom_parc VARCHAR(100),
	@tel_parc varchar(50),
	@adresse_parc VARCHAR(MAX),
	@email_parc VARCHAR(100) ,
	@user_id int 
	
AS
BEGIN

	INSERT INTO
		dbo.[def_parc] (id_parc, nom_parc, tel_parc, adresse_parc, email_parc  , user_id)
					
	VALUES 
		((SELECT ISNULL(MAX(id_parc), 0) From def_parc) + 1 ,@nom_parc ,@tel_parc ,@adresse_parc ,@email_parc  ,@user_id)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_parc_update]...';


GO
CREATE PROCEDURE [dbo].[sp_parc_update]
	@id_parc int,
	@nom_parc VARCHAR(100),
	@tel_parc varchar(50),
	@adresse_parc VARCHAR(MAX),
	@email_parc VARCHAR(100),
	@user_id int 
AS
BEGIN

	UPDATE
		dbo.[def_parc] 
	SET
		id_parc = @id_parc,
		nom_parc = @nom_parc,
		tel_parc = @tel_parc,
		adresse_parc =@adresse_parc,
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
	   datedebutreservation  AS datedebutreservation,
	   datefinresevation AS datefinreservation ,
	  RA.user_id,
	  RA.user_full_name,                                  
     
      RA.user_login,
      RA.user_password,
      RA. user_email,
      RA. user_phone,
      RA. user_is_active,
      RA. user_birth_date,
      RA. user_creation_date,
	   RV.matricule_voiture,
       RV.couleur_voiture,
       RV. Kilommetrage_Voiture,
       RV. annee_voiture,
       RV.nbre_place,
	    RE.id_etat_demande,
        RE.etat_code,
        RE.etat_name
	FROM
		dbo.[reservation] r
		INNER JOIN dbo.[voiture] RV ON RV.matricule_voiture = r.matricule_voiture
		INNER JOIN dbo.[app_user] RA ON RA.user_id = r.user_id
		INNER JOIN dbo.[def_etat_demande] RE ON RE.id_etat_demande = r.id_etat_demande
		
	ORDER BY
		r.id_reservation ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_get_one_by_id]

	@id_reservation int 

     AS
     BEGIN
     SELECT
	  r.id_reservation,
	  r.datedebutreservation AS datedebutreservation,
	  r.datefinresevation AS datefinresevation,
      u.user_id,
	  u.user_full_name,                                  

      u.user_login,
      u.user_password,
      u. user_email,
      u. user_phone,
      u. user_is_active,
      u. user_birth_date,
      u. user_creation_date,
	  v.matricule_voiture,
      v.couleur_voiture,
      v. Kilommetrage_Voiture,
      v. annee_voiture,
      v.nbre_place,
	  Re.id_etat_demande,
      Re.etat_code,
      Re.etat_name



       From 
       dbo.[reservation] r
       INNER JOIN dbo.[voiture] v ON v.matricule_voiture = r.matricule_voiture
	   INNER JOIN dbo.[app_user] u ON u.user_id = r.user_id
	   INNER JOIN dbo.[def_etat_demande] Re ON Re.id_etat_demande = r.id_etat_demande

       	
	WHERE
		r.id_reservation= @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_insert]
	@id_etat_demande int ,
	@user_id int,
	@matricule_voiture varchar(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[reservation] (datedebutreservation,datefinresevation,id_etat_demande , user_id ,matricule_voiture)
					
	VALUES 
		(GETDATE(),GETDATE(), @id_etat_demande ,@user_id ,@matricule_voiture)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_reservation_update]...';


GO
CREATE PROCEDURE [dbo].[sp_reservation_update]
	@id_reservation int,
	@id_etat_demande int ,
	@user_id int ,
	@matricule_voiture varchar(100)
	
AS
BEGIN

	UPDATE
		dbo.[reservation] 
	SET
		
		datedebutreservation = GETDATE(),
		datefinresevation = GETDATE(),
		id_etat_demande = @id_etat_demande ,
		user_id = @user_id,
		matricule_voiture = @matricule_voiture
		
	WHERE
		id_reservation = @id_reservation

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_delete]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_delete]
	@id_type_maintenance int
AS
BEGIN

	DELETE FROM
		dbo.[def_type_maintenance] 
	WHERE 
		id_type_maintenance = @id_type_maintenance

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_get_all]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_get_all]
AS
BEGIN

	SELECT 
		tm.id_type_maintenance,
	   ISNULL(name_type, '') AS name_type
	  
	   
	   
	FROM
		dbo.[def_type_maintenance] tm
		
	ORDER BY
		tm.id_type_maintenance ASC

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_insert]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_insert]
	@id_type_maintenance int,
	@name_type VARCHAR(100)
	
	
AS
BEGIN

	INSERT INTO
		dbo.[def_type_maintenance] (id_type_maintenance,name_type )
					
	VALUES 
		(@id_type_maintenance ,@name_type)
		 

END
GO
PRINT N'Création de Procédure [dbo].[sp_type_maintenance_update]...';


GO
CREATE PROCEDURE [dbo].[sp_type_maintenance_update]
	@id_type_maintenance int,
	@name_type VARCHAR(100)
	
	
AS
BEGIN

	UPDATE
		dbo.[def_type_maintenance] 
	SET
		id_type_maintenance = @id_type_maintenance,
		name_type = @name_type
		
		
	WHERE
		id_type_maintenance = @id_type_maintenance

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
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
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
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
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
		ISNULL(u.user_full_name, '') AS user_full_name,
		ISNULL(u.user_url_image, '') AS user_url_image,
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
	
	@fullName VARCHAR(300),
	@urlImage VARCHAR(MAX),
	@login VARCHAR(100),
	@password VARCHAR(250),
	@email VARCHAR(100),
	@isActive BIT, 
	@phone VARCHAR(30), 
	@birthDate DATE,
	@roleId int
AS
BEGIN

	INSERT INTO
		dbo.[app_user] (user_full_name, user_url_image, user_login, user_password,
					user_email, user_phone, user_is_active, user_birth_date, user_creation_date, role_id) 
	VALUES 
		(@fullName, @urlImage, @login, @password,
		 @email, @phone, @isActive, @birthDate, GETDATE(),@roleId)

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
PRINT N'Création de Procédure [dbo].[sp_user_role_get_one_by_id]...';


GO
CREATE PROCEDURE [dbo].[sp_user_role_get_one_by_id]
@userRoleId int
AS
BEGIN
SELECT 
		role_id,
		ISNULL(role_code, '') AS role_code,
		ISNULL(role_name, '') AS role_name
	FROM
		dbo.[def_user_role] 
	WHERE
		role_id = @userRoleId

END
GO
PRINT N'Création de Procédure [dbo].[sp_user_update]...';


GO
CREATE PROCEDURE [dbo].[sp_user_update]
	@userId int,
	@roleId int,
	@fullName VARCHAR(300),
	@urlImage VARCHAR(Max),
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
		user_full_name = @fullName,
		user_url_image= @urlImage,
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
	@matricule_voiture VARCHAR(100)
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
	   dp.nom_parc, 
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
	
	@matricule_voiture VARCHAR(100)
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
	   dppp.nom_parc, 
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
	@matricule_voiture VARCHAR(100),
	@couleur_voiture VARCHAR(100),
	@Kilommetrage_Voiture VARCHAR(100),
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
	@matricule_voiture VARCHAR(100),
	@couleur_voiture VARCHAR(100),
	@Kilommetrage_Voiture VARCHAR(100),
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
	INSERT INTO dbo.[app_user]([role_id], [user_full_name], [user_login], [user_password], 
						       [user_email], [user_phone], [user_is_active], [user_birth_date], [user_creation_date]) 
	VALUES 
		                       (1, N'Marwen Boudagga', N'ADMIN', N'1w7USZx2lywZENk8S0Cv8g==', N'admin@mail.com', N'00 00000000', 1, '19700101', GETDATE())
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

IF NOT EXISTS (SELECT 1 FROM dbo.[def_type_maintenance])
BEGIN
	INSERT INTO dbo.[def_type_maintenance]([id_type_maintenance], [name_type]) 
	VALUES 
		(1, 'MOUTEUR')
		
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
		(1, 'ParcTunis','+21622145789' , 'Tunis' , 'parcTunis@gmail.com' , 1),
		(2, 'ParcGafsa','+21655145787' , 'Gafsa' , 'parcGafsa@gmail.com' , 1),
		(3, 'ParcBizerte','+21699145389' , 'Bizerte' , 'parcBizerte@gmail.com' , 1),
		(4, 'ParcKef','+21622145789' , 'Kef' , 'ParcKef@gmail.com' , 1)
		
	
END





IF NOT EXISTS (SELECT 1 FROM dbo.[def_etat_demande])
BEGIN
	INSERT INTO dbo.[def_etat_demande]([Id_etat_demande], [etat_code],[etat_name]) 
	VALUES 
		(1, 'R','Refuser'),
		(2, 'A','Accepter' )
END


--IF NOT EXISTS (SELECT 1 FROM dbo.[reservation])
--BEGIN
--	INSERT INTO dbo.[reservation]([id_reservation],[datedebutreservation],[datefinresevation],[id_etat_demande],[user_id],[matricule_voiture] )
--	VALUES 
--		(,GETDATE(),GETDATE(),1,1,'123TN4124')
		
--END


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



--IF NOT EXISTS (SELECT 1 FROM dbo.[localisation])
--BEGIN
--	INSERT INTO dbo.[localisation]([Laititude_Localisation],[Longitude_Localisation],[Date_Localisation],[Temps_Localisation],[matricule_voiture]) 
--	VALUES 
--		('36,851599', '10,203624', GETDATE(), GETDATE(),'122TN1424')		
--END



GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
