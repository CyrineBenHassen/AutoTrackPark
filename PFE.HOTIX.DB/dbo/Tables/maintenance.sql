CREATE TABLE [dbo].[maintenance]
(
	[id_maintenance] INT NOT NULL PRIMARY KEY, 
    [Description_Maintenance] VARCHAR(MAX) NULL, 
    [Lieu_Maintenance] VARCHAR(100) NULL, 
    [Date_Maintenance] DATETIME NULL, 
    [matricule_voiture] VARCHAR(100) NOT NULL,
    [id_type_maintenance] INT NOT NULL, 
    CONSTRAINT [FK_maintenance_To_voiture] FOREIGN KEY ([matricule_voiture]) REFERENCES [voiture]([matricule_voiture]) ,
    CONSTRAINT [FK_maintenance_To_type_maintenance] FOREIGN KEY ([id_type_maintenance]) REFERENCES [def_type_maintenance]([id_type_maintenance])

)
