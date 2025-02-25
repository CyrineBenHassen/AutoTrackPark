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
    public static class Localisation
    {
        private static ILocalisation Localisation_DL;

        static Localisation()
        {
            Localisation_DL = new LocalisationDB();
        }

        public static Entities.Localisations GetAll()
        {
            return (Localisation_DL != null)
                   ? new Entities.Localisations(Localisation_DL.GetAll())
                   : null;
        }

        public static Entities.Localisations GetAllByMat(string Mat, DateTime DateRef, bool ByDate = false)
        {
            return (Localisation_DL != null)
                   ? new Entities.Localisations(Localisation_DL.GetAllByMat(Mat, DateRef, ByDate))
                   : null;
        }

        public static bool Add(Entities.Localisation localisation)
        {
            return (Localisation_DL != null)
                   ? Localisation_DL.Add(localisation)
                   : false;
        }

        public static bool Update(Entities.Localisation localisation)
        {
            return (Localisation_DL != null)
                   ? Localisation_DL.Update(localisation)
                   : false;
        }

        public static bool Remove(Entities.Localisation localisation)
        {
            return (Localisation_DL != null)
                   ? Localisation_DL.Remove(localisation)
                   : false;
        }

    }
}


