CREATE TABLE [dbo].[def_parc]
(
	[id_parc] INT NOT NULL PRIMARY KEY, 
    [nom_parc] VARCHAR(100) NULL, 
    [tel_parc] VARCHAR(50) NULL, 
    [adresse_parc] VARCHAR(MAX) NULL, 
    [email_parc] VARCHAR(100) NULL, 
  
    [user_id] INT NOT NULL, 
  
     CONSTRAINT [FK_parc_To_user_] FOREIGN KEY ([user_id]) REFERENCES [app_user]([user_id])

)
