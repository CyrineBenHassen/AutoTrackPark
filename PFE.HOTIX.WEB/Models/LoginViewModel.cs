using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace PFE.HOTIX.WEB.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "veuillez compléter ce champ.")]
        [DataType(DataType.Text)]
        public string Username { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
