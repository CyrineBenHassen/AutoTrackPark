using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Etats : List<Etat>
    {
        public Etats() : base() { }
        public Etats(int capacity) : base(capacity) { }
        public Etats(IEnumerable<Etat> collection) : base(collection) { }
    }

}


