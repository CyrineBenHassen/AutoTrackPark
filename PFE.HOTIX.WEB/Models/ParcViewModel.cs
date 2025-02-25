using Microsoft.AspNetCore.Http;
using PFE.HOTIX.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PFE.HOTIX.WEB.Models

{
    public class ParcViewModel
    {

        public Entities.Parcs Parcs { get; set; }

        public Entities.Parc Parc { get; set; }
        public Entities.Users Users { get; set; }
        public Entities.User user { get; set; }


        [Required]
        public int id_parc { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string nom_parc { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string adresse_parc { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string tel_parc { get; set; }

        [Required]
        public string email_parc { get; set; }

        [Required]


        public int id_user { get; set; }


    }
}