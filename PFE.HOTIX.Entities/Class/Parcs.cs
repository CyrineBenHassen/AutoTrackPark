using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Parcs : List<Parc>
    {
        public Parcs() : base() { }
        public Parcs(int capacity) : base(capacity) { }
        public Parcs(IEnumerable<Parc> collection) : base(collection) { }
    }

}

