using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Entities
{
    public class Maintenance
    {
        public string matricule_voiture;

        public Maintenance()
        {
            Voiture = new Voiture();
            Type_Maintenance = new Type_maintenance();
        }

        public int id_maintenance { get; set; }

        public string Description_Maintenance { get; set; }

        public string Lieu_Maintenance { get; set; }
        public DateTime Date_Maintenance { get; set; }
        public Voiture Voiture { get; set; }
        public Type_maintenance Type_Maintenance { get; set; }

        
    }
}
