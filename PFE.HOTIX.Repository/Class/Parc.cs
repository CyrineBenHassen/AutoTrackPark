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
    public static class Parc
    {
        private static IParc Parc_DL;

        static Parc()
        {
            Parc_DL = new ParcDB();
        }

        public static Entities.Parcs GetAll()
        {
            return (Parc_DL != null)
                   ? new Entities.Parcs(Parc_DL.GetAll())
                   : null;
        }

        public static Entities.Parc Getone(int id_parc)
        {
            return (Parc_DL != null)
                   ? Parc_DL.Getone(id_parc)
                   : null;
        }

        public static Entities.Parc GetOneByUserID(int User_ID)
        {
            return (Parc_DL != null)
                   ? Parc_DL.GetOneByUserID(User_ID)
                   : null;
        }

        public static bool Add(Entities.Parc parc)
        {
            return (Parc_DL != null)
                   ? Parc_DL.Add(parc)
                   : false;
        }

        public static bool Update(Entities.Parc parc)
        {
            return (Parc_DL != null)
                   ? Parc_DL.Update(parc)
                   : false;
        }

        public static bool Remove(Entities.Parc parc)
        {
            return (Parc_DL != null)
                   ? Parc_DL.Remove(parc)
                   : false;
        }

        


    }
}


