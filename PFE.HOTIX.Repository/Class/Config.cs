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
    public static class Config
    {
        private static IConfig Config_DL;

        static Config()
        {
            Config_DL = new ConfigDB();
        }
         

        #region Marque

        public static Entities.Marques GetAllMarques()
        {
            return (Config_DL != null)
                   ? new Entities.Marques(Config_DL.GetAllMarques())
                   : null;
        }


        public static Entities.Marque MarqueGetOne(int id_marque)
        {
            return (Config_DL != null)
                   ? Config_DL.MarqueGetOne(id_marque)
                   : null;
        }


        public static bool MarqueAdd(Entities.Marque marque)
        {
            return (Config_DL != null)
                   ? Config_DL.MarqueAdd(marque)
                   : false;
        }

        public static bool MarqueUpdate(Entities.Marque marque)
        {
            return (Config_DL != null)
                   ? Config_DL.MarqueUpdate(marque)
                   : false;
        }

        public static bool MarqueRemove(Entities.Marque marque)
        {
            return (Config_DL != null)
                   ? Config_DL.MarqueRemove(marque)
                   : false;
        }

        #endregion


        #region Type_Maintenance

        public static Entities.Types_maintenances GetAllTypeMaintenances()
        {
            return (Config_DL != null)
                   ? new Entities.Types_maintenances(Config_DL.GetAllTypeMaintenances())
                   : null;
        }

        public static Entities.Type_maintenance typegetone(int id_type_maintenance)
        {
            return (Config_DL != null)
                   ? Config_DL.typegetone(id_type_maintenance)
                   : null;
        }
        public static bool TypeMaintenanceAdd(Entities.Type_maintenance type_Maintenance)
        {
            return (Config_DL != null)
                   ? Config_DL.TypeMaintenanceAdd(type_Maintenance)
                   : false;
        }

        public static bool TypeMaintenanceUpdate(Entities.Type_maintenance type_Maintenance)
        {
            return (Config_DL != null)
                   ? Config_DL.TypeMaintenanceUpdate(type_Maintenance)
                   : false;
        }

        public static bool TypeMaintenanceRemove(Entities.Type_maintenance type_Maintenance)
        {
            return (Config_DL != null)
                   ? Config_DL.TypeMaintenanceRemove(type_Maintenance)
                   : false;
        }

        #endregion

        #region Model

        public static Entities.Models GetAllModels()
        {
            return (Config_DL != null)
                   ? new Entities.Models(Config_DL.GetAllModels())
                   : null;
        }

        public static Entities.Model ModelGetOne(int id_model)
        {
            return (Config_DL != null)
                   ? Config_DL.ModelGetOne(id_model)
                   : null;
        }
        public static bool ModelAdd(Entities.Model model)
        {
            return (Config_DL != null)
                   ? Config_DL.ModelAdd(model)
                   : false;
        }

        public static bool ModelUpdate(Entities.Model model)
        {
            return (Config_DL != null)
                   ? Config_DL.ModelUpdate(model)
                   : false;
        }

        public static bool ModelRemove(Entities.Model model)
        {
            return (Config_DL != null)
                   ? Config_DL.ModelRemove(model)
                   : false;
        }

        #endregion


        #region Etat

        public static Entities.Etats GetAllEtats()
        {
            return (Config_DL != null)
                   ? new Entities.Etats(Config_DL.GetAllEtats())
                   : null;
        }


        public static bool EtatAdd(Entities.Etat etat)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatAdd(etat)
                   : false;
        }

        public static bool EtatUpdate(Entities.Etat etat)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatUpdate(etat)
                   : false;
        }

        public static bool EtatRemove(Entities.Etat etat)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatRemove(etat)
                   : false;
        }

        #endregion



        #region EtatDemande

        public static Entities.Etat_demandes GetAllEtatDemande()
        {
            return (Config_DL != null)
                   ? new Entities.Etat_demandes(Config_DL.GetAllEtatDemande())
                   : null;
        }


        public static bool EtatDemandeAdd(Entities.Etat_demande etat_demande)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatDemandeAdd(etat_demande)
                   : false;
        }

        public static bool EtatDemandeUpdate(Entities.Etat_demande etat_demande)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatDemandeUpdate(etat_demande)
                   : false;
        }

        public static bool EtatDemandeRemove(Entities.Etat_demande etat_demande)
        {
            return (Config_DL != null)
                   ? Config_DL.EtatDemandeRemove(etat_demande)
                   : false;
        }

        #endregion
    }
}

