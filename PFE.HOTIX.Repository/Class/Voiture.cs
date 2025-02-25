using PFE.HOTIX.DataLayer;
using PFE.HOTIX.DataLayer.DB;
using PFE.HOTIX.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.Repository
{
    public static class Voiture
    {
        private static IVoiture Voiture_DL;

        static Voiture()
        {
            Voiture_DL = new VoitureDB();
        }

        public static Entities.Voitures GetAll(int ParcID = -1)
        {
            return (Voiture_DL != null)
                   ? new Entities.Voitures(Voiture_DL.GetAll(ParcID))
                   : null;
        }

        public static Entities.Voiture GetOne(string matricule_voiture)
        {
            return (Voiture_DL != null)
                   ? Voiture_DL.GetOne(matricule_voiture)
                   : null;
        }

       

        public static bool Add(Entities.Voiture voiture)
        {
            return (Voiture_DL != null)
                   ? Voiture_DL.Add(voiture)
                   : false;
        }

        public static bool Update(Entities.Voiture voiture)
        {
            return (Voiture_DL != null)
                   ? Voiture_DL.Update(voiture)
                   : false;
        }

        public static bool Remove(Entities.Voiture voiture)
        {
            return (Voiture_DL != null)
                   ? Voiture_DL.Remove(voiture)
                   : false;
        }

    }
}

