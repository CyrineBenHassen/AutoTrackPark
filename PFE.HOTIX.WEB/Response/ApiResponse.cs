using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.WEB
{
   
    public class ApiResponse
    {
        public ApiResponse()
        {

        }

       
    
        public bool Success { get; set; }

        public int Error { get; set; } = -1;

        
        public string Message { get; set; }

      
        public object Data { get; set; }
    }
}
