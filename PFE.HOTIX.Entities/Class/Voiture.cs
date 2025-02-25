using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Entities
{
    public class Voiture
    {
        public object id_marque;
        public object id_model;
        public object id_etat;
        public object id_reservation;
        public object id_parc;

        public Voiture()
        {
            Model = new Model();
            Marque = new Marque();
     
            Parc = new Parc();
            Etat = new Etat();
        }

        public string matricule_voiture { get; set; }

        public string couleur_voiture { get; set; }
        public string Kilommetrage_Voiture { get; set; }

        public int annee_voiture { get; set; }
            
        public int nbre_place { get; set; }

        public Model Model { get; set; }
        public Marque Marque { get; set; }
       

        public Parc Parc { get; set; }

        public Etat Etat { get; set; }
    }
}
