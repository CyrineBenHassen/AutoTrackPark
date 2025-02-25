using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Types_maintenances: List<Type_maintenance>
    {
        public Types_maintenances() : base() { }
        public Types_maintenances(int capacity) : base(capacity) { }
        public Types_maintenances(IEnumerable<Type_maintenance> collection) : base(collection) { }
    }

}

