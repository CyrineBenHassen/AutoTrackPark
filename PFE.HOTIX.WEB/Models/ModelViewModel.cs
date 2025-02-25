using System.ComponentModel.DataAnnotations;

namespace PFE.HOTIX.WEB.Models
{
    public class ModelViewModel
    {
        public Entities.Models Models { get; set; }


        [Required]
        public int id_model { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string name_model { get; set; }

    }
}   