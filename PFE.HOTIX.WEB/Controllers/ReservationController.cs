using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Org.BouncyCastle.Crypto.Parameters;
using PFE.HOTIX.DataLayer.DB;
using PFE.HOTIX.Entities;
using PFE.HOTIX.Repository;
using PFE.HOTIX.WEB.Models;
using System;
using System.Linq;
using Reservation = PFE.HOTIX.Entities.Reservation;

namespace PFE.HOTIX.WEB.Controllers
{
    public class ReservationController : Controller
    {
        public IActionResult Index()
        {
            ReservationViewModel model = new ReservationViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            Entities.User _User = null;
            if (HttpContext.Session.GetString("User") != null)
            {
                _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));
            }

            switch (_User.UserRole.Id)
            {
                case (int)Entities.Enumeration.UserRole.ADMIN:
                   
                    Entities.Reservations _Reservations = Repository.Reservation.GetAll(-1, -1) ;

                    model.Reservations = new Reservations(_Reservations.Where(r => r.datefinresevation >= DateTime.Now.Date).ToList());

                    break;

                case (int)Entities.Enumeration.UserRole.USER:
                    model.Reservations = Repository.Reservation.GetAll(-1, _User.Id); 
                    break;

                case (int)Entities.Enumeration.UserRole.MANAGER:
                    Entities.Parc _Parc = null;
                    if (HttpContext.Session.GetString("Parc") != null)
                    {
                        _Parc = JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"));
                    }
                    model.Reservations = Repository.Reservation.GetAll(((_Parc != null) ? _Parc.id_parc : -1), -1);
                    break;
            }

            return View(model);
        }
        public ActionResult Modifier(int id_reservation)
        {

            var reservation = Repository.Reservation.Getone(id_reservation);

            try
            {
                Models.ReservationViewModel _Model = new Models.ReservationViewModel()

                {
                    Reservation = reservation,
                    id_reservation = reservation.id_reservation,
                    datedebutreservation = reservation.datedebutreservation,
                    datefinresrvation = reservation.datefinresevation,
                    description_reservation = reservation.description_reservation,
                    Parcs = Repository.Parc.GetAll()

                };

                return View(_Model);
            }
            catch (Exception ex)
            {
                ErrorViewModel _EModel = new ErrorViewModel() { RequestId = String.Concat("User.Edit ", Environment.NewLine, ex.Message) };
                return RedirectToAction("Error", "Errors", _EModel);
            }


        }

        [HttpPost]
        public IActionResult Modifier(ReservationViewModel viewmodel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var reservation = new Reservation
                        {
                            id_reservation = viewmodel.id_reservation,
                            datedebutreservation = viewmodel.datedebutreservation,
                            datefinresevation = viewmodel.datefinresrvation,
                            description_reservation = viewmodel.description_reservation,
                            Etat_demande = new Etat_demande() { id_etat_demande = (int)Entities.Enumeration.EtatDemande.ENATTENTE},
                            Parc = new Entities.Parc() { id_parc = viewmodel.parc_id },
                            User = _User,

                        };
                        Repository.Reservation.Update(reservation);
                        return RedirectToAction(nameof(Index));
                    }
                    catch (Exception ex)
                    {
                        return View(ex.Message);
                    }
            }
            ModelState.AddModelError("", "Error");
            return View();
        }
        
        public ActionResult Ajouter()
        {
            Models.ReservationViewModel _Model = new Models.ReservationViewModel();
            _Model.Parcs = Repository.Parc.GetAll();

            return View(_Model);
        }


        [HttpPost]
        public IActionResult Ajouter(ReservationViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var reservation = new Entities.Reservation
                        {

                            datedebutreservation = viewModel.datedebutreservation,
                            datefinresevation = viewModel.datefinresrvation,
                            description_reservation = viewModel.description_reservation,
                            Etat_demande = new Etat_demande() { id_etat_demande = (int)Entities.Enumeration.EtatDemande.ENATTENTE},
                            Parc = new Entities.Parc() { id_parc = viewModel.parc_id },
                            User = _User,
                        };

                        Repository.Reservation.Add(reservation);

                        return RedirectToAction(nameof(Index));
                    }
                    catch (Exception ex)
                    {
                        return View(ex.Message);
                    }
            }
            ModelState.AddModelError("", "Error");
            return View();
        }

        public bool Supprimer(int id_reservation)
        {
            try
            {
                var reservation = Repository.Reservation.Getone(id_reservation);
                if (reservation != null)
                {
                    Repository.Reservation.Remove(reservation);
                }
                return true;
            }

            catch (System.Exception)
            {
                return false;

            }
        }

        public ActionResult Consulter(int id_reservation)
        {
            var reservation = Repository.Reservation.Getone(id_reservation);
            if (reservation == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.ReservationViewModel _Model = new Models.ReservationViewModel()
            {
                Reservation=reservation,
                id_reservation = reservation.id_reservation,
                datedebutreservation = reservation.datedebutreservation,
                datefinresrvation = reservation.datefinresevation,
                description_reservation = reservation.description_reservation,

                Etat_Demandes=Repository.Config.GetAllEtatDemande(),
                Voitures=Repository.Voiture.GetAll()

            };
            return View(_Model);
        }



    }
}
