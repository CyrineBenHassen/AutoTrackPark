using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Entities
{
    public class Localisation
    {


        public Localisation()
        {
            Voiture = new Voiture();
        }

        public int id_localisation { get; set; }

        public decimal Laititude_Localisation { get; set; }
        public decimal Longitude_Localisation { get; set; }

		public string Title { get; set; } = "Title";
		public string Desc { get; set; } = "Desc";
		public string Color { get; set; } = "gray";

		public DateTime Date_Localisation { get; set; }
        public DateTime Temps_Localisation { get; set; }

        public Voiture Voiture { get; set; }













    }
}

