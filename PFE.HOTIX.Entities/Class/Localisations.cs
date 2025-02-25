using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Localisations : List<Localisation>
    {
        public Localisations() : base() { }
        public Localisations(int capacity) : base(capacity) { }
        public Localisations(IEnumerable<Localisation> collection) : base(collection) { }
    }

}

