using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;

namespace PFE.HOTIX.WEB.Models
{
    public class VoitureViewModel
    {

        public Entities.Voitures Voitures { get; set; }

        public Entities.Voiture Voiture { get; set; }

        public Entities.Marques Marques { get; set; }

        public Entities.Models Models { get; set; }

        public Entities.Etats Etats { get; set; }

        public Entities.Parcs Parcs { get; set; }


        [Required]
        public string matricule_voiture { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string couleur_voiture { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string Kilommetrage_Voiture { get; set; }


        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public int annee_voiture { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public int nbre_place { get; set; }

        [Required]
        public int id_marque { get; set; }
        [Required]
        public int id_model { get; set; }
        [Required]
        public int id_etat { get; set; }
        [Required]
        public int id_parc { get; set; }


    }
}
