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