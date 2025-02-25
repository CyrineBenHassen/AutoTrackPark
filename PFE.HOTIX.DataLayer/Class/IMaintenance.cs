using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface IMaintenance
    {
        IEnumerable<Entities.Maintenance> GetAll(int PrckID);


        Entities.Maintenance Getone(int id_maintenance);

        bool Add(Entities.Maintenance maintenance);
        bool Update(Entities.Maintenance maintenance);
        bool Remove(Entities.Maintenance maintenance);
    }
}

