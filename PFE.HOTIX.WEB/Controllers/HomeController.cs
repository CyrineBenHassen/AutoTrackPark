using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using PFE.HOTIX.WEB.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

using PFE.HOTIX.Repository;
using PFE.HOTIX.Entities;

namespace PFE.HOTIX.WEB.Controllers
{
    public class HomeController : Controller
    {

        private IConfiguration _Config;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, IConfiguration iConfig)
        {
            _logger = logger;
            _Config = iConfig;
        }


        [AllowAnonymous]
        public IActionResult Index()
        {

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }
            DashboardViewModel dashboard = new DashboardViewModel();
            {
                var Users = Repository.User.GetAll();
                var Voitures = Repository.Voiture.GetAll();
                var Reservations = Repository.Reservation.GetAll(-1,-1);
                var Parcs = Repository.Parc.GetAll();
                var Etats = Repository.Config.GetAllEtatDemande();
                var Maintenances = Repository.Maintenance.GetAll(-1);

                dashboard.voitures_count = Voitures.Count();
                dashboard.maintenances_count = Maintenances.Count();
                dashboard.parcs_count = Parcs.Count();
                dashboard.users_count = Users.Count();
                dashboard.reservations_count = Reservations.Count();

            }

            return View(dashboard);

        }


        public IActionResult Dashbord()
        {

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            DashboardViewModel dashboard = new DashboardViewModel();
            {
                var Users = Repository.User.GetAll();
                var Maintenances = Repository.Maintenance.GetAll(-1);
                var Voitures = Repository.Voiture.GetAll();
                var Reservations = Repository.Reservation.GetAll(-1, -1);
                var Parcs = Repository.Parc.GetAll();
                var Etats = Repository.Config.GetAllEtatDemande();
                dashboard.voitures_count = Voitures.Count();
                dashboard.parcs_count = Parcs.Count();
                dashboard.users_count = Users.Count();
                dashboard.maintenances_count = Maintenances.Count();



                int confirmedReservationsCount = Reservations.Count(r => r.Etat_demande.id_etat_demande == (int)Entities.Enumeration.EtatDemande.CONFIRMER);
                dashboard.Taux_Confirmed = String.Format("{0:P2}.", ((Convert.ToDecimal(confirmedReservationsCount) / Convert.ToDecimal(Reservations.Count))));

                int refuserReservationsCount = Reservations.Count(r => r.Etat_demande.id_etat_demande == (int)Entities.Enumeration.EtatDemande.ARCHIVER);
                dashboard.Taux_Refuser = String.Format("{0:P2}.", ((Convert.ToDecimal(refuserReservationsCount) / Convert.ToDecimal(Reservations.Count))));

                int encoursReservationsCount = Reservations.Count(r => r.Etat_demande.id_etat_demande == (int)Entities.Enumeration.EtatDemande.ENATTENTE);
                dashboard.Taux_Encours = String.Format("{0:P2}.", ((Convert.ToDecimal(encoursReservationsCount) / Convert.ToDecimal(Reservations.Count))));






            }

            return View(dashboard);

        }


        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

    }
}