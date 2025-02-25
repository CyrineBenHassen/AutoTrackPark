using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface ILocalisation
    {
        IEnumerable<Entities.Localisation> GetAll();

        IEnumerable<Entities.Localisation> GetAllByMat(string Mat, DateTime DateRef, bool ByDate = false);

        bool Add(Entities.Localisation localisation);
        bool Update(Entities.Localisation localisation);
        bool Remove(Entities.Localisation localisation);
    }
}

