using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface IConfig
    {
        

        #region Marque

        IEnumerable<Entities.Marque> GetAllMarques();

        Entities.Marque MarqueGetOne(int id_marque);
        bool MarqueAdd(Entities.Marque marque);
        bool MarqueUpdate(Entities.Marque marque);
        bool MarqueRemove(Entities.Marque marque);

        #endregion

        #region Type_maintenance

        IEnumerable<Entities.Type_maintenance> GetAllTypeMaintenances();
        Entities.Type_maintenance typegetone(int id_type_maintenance);

        bool TypeMaintenanceAdd(Entities.Type_maintenance type_Maintenance);
        bool TypeMaintenanceUpdate(Entities.Type_maintenance type_Maintenance);
        bool TypeMaintenanceRemove(Entities.Type_maintenance type_Maintenance);

        #endregion

        #region Model

        IEnumerable<Entities.Model> GetAllModels();
        Entities.Model ModelGetOne(int id_model);

        bool ModelAdd(Entities.Model model);
        bool ModelUpdate(Entities.Model model);
        bool ModelRemove(Entities.Model model);

        #endregion


        #region Etat

        IEnumerable<Entities.Etat> GetAllEtats();

        bool EtatAdd(Entities.Etat etat);
        bool EtatUpdate(Entities.Etat etat);
        bool EtatRemove(Entities.Etat etat);

        #endregion



        #region EtatDemande

        IEnumerable<Entities.Etat_demande> GetAllEtatDemande();

        bool EtatDemandeAdd(Entities.Etat_demande etat_Demande);
        bool EtatDemandeUpdate(Entities.Etat_demande etat_Demande);
        bool EtatDemandeRemove(Entities.Etat_demande etat_Demande);

        #endregion
    }
}
