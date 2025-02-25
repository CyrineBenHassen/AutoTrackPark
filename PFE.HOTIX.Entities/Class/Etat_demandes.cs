using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Etat_demandes : List<Etat_demande>
    {
        public Etat_demandes() : base() { }
        public Etat_demandes(int capacity) : base(capacity) { }
        public Etat_demandes(IEnumerable<Etat_demande> collection) : base(collection) { }
    }

}

