CREATE TABLE [dbo].[reservation]
(
	[id_reservation] INT NOT NULL PRIMARY KEY IDENTITY, 
    [datedebutreservation] DATETIME NULL, 
    [datefinresevation] DATETIME NULL,  
    [date_create] DATETIME NULL,  
    [date_update] DATETIME NULL, 
    [id_etat_demande] INT NULL ,
    [user_id] int NOT NULL ,
    [matricule_voiture] VARCHAR(100) NULL, 
    [description_reservation] VARCHAR(100) NULL, 
    [id_parc] INT NOT NULL, 
    CONSTRAINT [FK_reservation_To_def_etat_demande] FOREIGN KEY ([id_etat_demande]) REFERENCES [def_etat_demande]([id_etat_demande]) ,
    CONSTRAINT [FK_reservation_to_app_user] FOREIGN KEY ([user_id]) REFERENCES [app_user]([user_id]) ,
    CONSTRAINT [FK_reservation_to_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [voiture]([matricule_voiture]),
    CONSTRAINT [FK_reservation_to_parc] FOREIGN KEY ([id_parc]) REFERENCES [def_parc]([id_parc]) ,

)
