using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Entities
{
    public class Reservation
    {


        public Reservation()
        {
            User = new User();
            Voiture = new Voiture();
            Etat_demande = new Etat_demande();
            Parc = new Parc();
        }


        #region Properties

        public int id_reservation { get; set; }

        public DateTime datedebutreservation { get; set; }
        public DateTime datefinresevation { get; set; }
        public string description_reservation { get; set; }
        public Voiture Voiture { get; set; }
        public User User  { get; set; }
        public Etat_demande Etat_demande { get; set; }
        public Model Model { get; set; }
        public Marque Marque { get; set; }
        public Parc Parc { get; set; }
        public object StatutReservation { get; set; }
        #endregion






    }
}
