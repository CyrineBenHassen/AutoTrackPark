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
    public static class Reservation
    {
        private static IReservation Reservation_DL;

        static Reservation()
        {
            Reservation_DL = new ReservationDB();
        }

        public static Entities.Reservations GetAll(int PrckID, int UserID)
        {
            return (Reservation_DL != null)
                   ? new Entities.Reservations(Reservation_DL.GetAll(PrckID, UserID))
                   : null;
        }

        public static Entities.Reservation Getone(int id_reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Getone(id_reservation)
                   : null;
        }

        public static bool Add(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Add(reservation)
                   : false;
        }

        public static bool Update(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Update(reservation)
                   : false;
        }

        public static bool Confirm(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Confirm(reservation)
                   : false;
        }

        public static bool Refuse(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Refuse(reservation)
                   : false;
        }
        public static bool Archiver(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Archiver(reservation)
                   : false;
        }

        public static bool Remove(Entities.Reservation reservation)
        {
            return (Reservation_DL != null)
                   ? Reservation_DL.Remove(reservation)
                   : false;
        }


    }
}
