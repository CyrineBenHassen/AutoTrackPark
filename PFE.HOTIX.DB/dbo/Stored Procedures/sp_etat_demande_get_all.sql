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
