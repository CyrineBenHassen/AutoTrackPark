using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PFE.HOTIX.Entities
{
    public class Models : List<Model>
    {
        public Models() : base() { }
        public Models(int capacity) : base(capacity) { }
        public Models(IEnumerable<Model> collection) : base(collection) { }
    }

}

