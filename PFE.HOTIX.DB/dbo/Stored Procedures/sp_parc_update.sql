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
