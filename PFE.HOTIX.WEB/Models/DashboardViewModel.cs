using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PFE.HOTIX.WEB.Models
{
    public class DashboardViewModel
    {
        public int voitures_count { get; set; }


        public int maintenances_count { get; set; }
        public int parcs_count { get; set; }
        public int users_count { get; set; }
        public int reservations_count { get; set; }



        public string Taux_Confirmed { get; set; }
        public string Taux_Refuser { get; set; }
        public string Taux_Encours { get; set; }





    }
}
