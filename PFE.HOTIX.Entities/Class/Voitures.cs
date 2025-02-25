using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Voitures : List<Voiture>
    {
        public Voitures() : base() { }
        public Voitures(int capacity) : base(capacity) { }
        public Voitures(IEnumerable<Voiture> collection) : base(collection) { }
    }

}
