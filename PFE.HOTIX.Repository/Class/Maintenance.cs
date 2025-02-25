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
    public static class Maintenance
    {
        private static IMaintenance Maintenance_DL;

        static Maintenance()
        {
            Maintenance_DL = new MaintenanceDB();
        }

        public static Entities.Maintenances GetAll(int PrckID)
        {
            return (Maintenance_DL != null)
                   ? new Entities.Maintenances(Maintenance_DL.GetAll(PrckID))
                   : null;
        }



        public static Entities.Maintenance Getone(int id_maintenance)
        {
            return (Maintenance_DL != null)
                   ? Maintenance_DL.Getone(id_maintenance)
                   : null;
        }



        public static bool Add(Entities.Maintenance maintenance)
        {
            return (Maintenance_DL != null)
                   ? Maintenance_DL.Add(maintenance)
                   : false;
        }

        public static bool Update(Entities.Maintenance maintenance)
        {
            return (Maintenance_DL != null)
                   ? Maintenance_DL.Update(maintenance)
                   : false;
        }

        public static bool Remove(Entities.Maintenance maintenance)
        {
            return (Maintenance_DL != null)
                   ? Maintenance_DL.Remove(maintenance)
                   : false;
        }

    }
}


