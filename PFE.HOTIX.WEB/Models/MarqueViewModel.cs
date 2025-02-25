using System.ComponentModel.DataAnnotations;

namespace PFE.HOTIX.WEB.Models
{
    public class MarqueViewModel
    {

        public Entities.Marques Marques { get; set; }


        [Required]
        public int id_marque { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string marque_name { get; set; }
    }



}
