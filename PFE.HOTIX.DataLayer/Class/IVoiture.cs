using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface IVoiture
    {
        IEnumerable<Entities.Voiture> GetAll(int ParcID);
        Entities.Voiture GetOne(string matricule_voiture);
       

        bool Add(Entities.Voiture voiture);
        bool Update(Entities.Voiture voiture);
        bool Remove(Entities.Voiture voiture);
    }
}

