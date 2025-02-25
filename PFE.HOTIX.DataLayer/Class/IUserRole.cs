using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PFE.HOTIX.DataLayer
{
public interface IUserRole
    {
        IEnumerable<Entities.UserRole> GetAll();
        Entities.UserRole GetOne(int userRoleId);
    }
}
