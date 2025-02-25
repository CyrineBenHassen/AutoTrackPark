CREATE PROCEDURE [dbo].[sp_parc_get_one_by_user_id]
	@user_id int 

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
    p.user_id = @user_id

     END