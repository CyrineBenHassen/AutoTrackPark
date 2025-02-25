using Microsoft.AspNetCore.Http;
using PFE.HOTIX.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PFE.HOTIX.WEB.Models
{
    public class MaintenanceViewModel
    {



        public Entities.Maintenances Maintenances { get; set; }

        public Entities.Maintenance Maintenance { get; set; }

        public Entities.Types_maintenances Types_Maintenances { get; set; }
        public Entities.Type_maintenance Type_maintenance { get; set; }


        public Entities.Voitures Voitures { get; set; }
        public Entities.Voiture Voiture { get; set; }





        [Required]
        public int id_maintenance { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string Description_Maintenance { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string Lieu_Maintenance { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public DateTime Date_Maintenance { get; set; }



        [Required]
        public int id_type_maintenance { get; set; }



        [Required]
        public string matricule_voiture { get; set; }



    }
}
