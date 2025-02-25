using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Maintenances : List<Maintenance>
    {
        public Maintenances() : base() { }
        public Maintenances(int capacity) : base(capacity) { }
        public Maintenances(IEnumerable<Maintenance> collection) : base(collection) { }
    }

}

