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