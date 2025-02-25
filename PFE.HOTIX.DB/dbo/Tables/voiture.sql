CREATE TABLE [dbo].[voiture]
(
	[matricule_voiture] VARCHAR(100) NOT NULL PRIMARY KEY, 
    [couleur_voiture] VARCHAR(100) NULL, 
    [Kilommetrage_Voiture] VARCHAR(100) NULL, 
    [annee_voiture] INT NULL, 
    [nbre_place] INT NULL, 
    [id_marque] INT NOT NULL, 
    [id_model] INT NOT NULL, 
    [id_etat] INT NOT NULL
        CONSTRAINT [FK_voiture_To_defmarquee] FOREIGN KEY ([id_marque]) REFERENCES [def_marque]([id_marque]) ,
            
    
     
    [id_parc] INT NOT NULL, 
    CONSTRAINT [FK_voiture_To_def_model] FOREIGN KEY ([id_model]) REFERENCES [def_model]([id_model]) ,
     CONSTRAINT [FK_voiture_To_def_etat] FOREIGN KEY ([id_etat]) REFERENCES [def_etat]([id_etat]) ,
      CONSTRAINT [FK_voiture_To_parc] FOREIGN KEY ([id_parc]) REFERENCES [def_parc]([id_parc])
   
)
