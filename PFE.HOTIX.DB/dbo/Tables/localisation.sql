CREATE TABLE [dbo].[localisation]
(
	[id_localisation] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Laititude_Localisation] DECIMAL(20, 15) NULL, 
    [Longitude_Localisation] DECIMAL(20, 15) NULL, 
    [Date_Localisation] DATETIME NULL, 
    [Temps_Localisation] DATETIME NULL, 
    [matricule_voiture] VARCHAR(100) NOT NULL,
        CONSTRAINT [FK_localisation_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [voiture]([matricule_voiture]) ,

)
