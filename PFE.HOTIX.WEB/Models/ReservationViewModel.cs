using System;
using System.ComponentModel.DataAnnotations;

namespace PFE.HOTIX.WEB.Models
{
    public class ReservationViewModel
    {

        public Entities.Reservations Reservations { get; set; }

        public Entities.Reservation Reservation { get; set; }

        public Entities.Voitures Voitures { get; set; }
        public Entities.Voiture Voiture { get; set; }
        public Entities.Marques Marques { get; set; }

        public Entities.Marque Marque { get; set; }

        public Entities.Models Models { get; set; }

        public Entities.Model Model { get; set; }

        public Entities.Localisations Localisations { get; set; }


        public Entities.Users Users { get; set; }
        public Entities.User User { get; set; }


        public Entities.Etat_demandes Etat_Demandes { get; set; }
        public Entities.Etat_demande Etat_Demande { get; set; }



        public Entities.Parcs Parcs { get; set; }


        public int id_reservation { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public DateTime datedebutreservation { get; set; }

        [Required(ErrorMessage = "veuillez compléter ce champ")]
        public DateTime datefinresrvation { get; set; }

        public string description_reservation { get; set; }


        public int id_etat_demande { get; set; }

        public int user_id { get; set; }

        public int parc_id { get; set; }

        public string matricule_voiture { get; set; }



    }

}
