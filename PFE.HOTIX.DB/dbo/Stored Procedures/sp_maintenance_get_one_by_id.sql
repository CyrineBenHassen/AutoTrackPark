CREATE PROCEDURE [dbo].[sp_maintenance_get_one_by_id]
@id_maintenance int
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
tm.name_type


 From
      dbo.[maintenance] m      
INNER JOIN dbo.[voiture] vm ON vm.matricule_voiture = m.matricule_voiture
INNER JOIN dbo.[def_type_maintenance] tm ON tm.id_type_maintenance = m.id_type_maintenance

     
WHERE
m.id_maintenance= @id_maintenance

END
