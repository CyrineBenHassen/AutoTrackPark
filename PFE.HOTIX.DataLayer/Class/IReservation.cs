using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
    public interface IReservation
    {
        IEnumerable<Entities.Reservation> GetAll(int PrckID, int UserID );

        Entities.Reservation Getone(int id_reservation);



        bool Add(Entities.Reservation reservation);
        bool Update(Entities.Reservation reservation);
        bool Confirm(Entities.Reservation reservation);
        bool Archiver(Entities.Reservation reservation);

        bool Refuse(Entities.Reservation reservation);
        bool Remove(Entities.Reservation reservation);

    }
}

