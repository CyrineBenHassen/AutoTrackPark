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