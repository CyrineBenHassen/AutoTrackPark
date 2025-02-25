using Microsoft.AspNetCore.Mvc;

namespace PFE.HOTIX.API.Controllers
{
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }

}


   