using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface IParc
    {
        IEnumerable<Entities.Parc> GetAll();

        Entities.Parc Getone(int id_parc);

        Entities.Parc GetOneByUserID(int User_ID);

        bool Add(Entities.Parc parc);
        bool Update(Entities.Parc parc);
        bool Remove(Entities.Parc parc);
    }
}

