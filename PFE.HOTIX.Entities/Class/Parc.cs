using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Entities
{
    public class Parc
    {


        public Parc()
        {
            User = new User();
           
        }

        public int id_parc { get; set; }

        public string nom_parc { get; set; }
        public string tel_parc { get; set; }
        public string adresse_parc { get; set; }
        public string email_parc { get; set; }
        public string FullName { get; set; }


        public User User { get; set; }
       









    }
}
