using System.ComponentModel.DataAnnotations;

namespace PFE.HOTIX.WEB.Models
{
    public class TypeMaintenanceModel
    {
        public Entities.Types_maintenances Types_Maintenances { get; set; }
        public Entities.Type_maintenance type_maintenance { get; set; }


        [Required]
        public int id_type_maintenance  { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public string name_type { get; set; }


    }
}
