using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Marques : List<Marque>
    {
        public Marques() : base() { }
        public Marques(int capacity) : base(capacity) { }
        public Marques(IEnumerable<Marque> collection) : base(collection) { }
    }

}

