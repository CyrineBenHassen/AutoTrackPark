using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Reservations : List<Reservation>
    {
        public Reservations() : base() { }
        public Reservations(int capacity) : base(capacity) { }
        public Reservations(IEnumerable<Reservation> collection) : base(collection) { }
    }

}
