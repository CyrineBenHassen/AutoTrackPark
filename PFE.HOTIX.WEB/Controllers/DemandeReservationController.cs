using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using Microsoft.VisualStudio.Web.CodeGeneration.Contracts.ProjectModel;
using Newtonsoft.Json;
using PFE.HOTIX.DataLayer;
using PFE.HOTIX.DataLayer.DB;
using PFE.HOTIX.Entities;
using PFE.HOTIX.Repository;
using PFE.HOTIX.WEB.Models;
using System;



namespace PFE.HOTIX.WEB.Controllers
{
    public class DemandeReservationController : Controller
    {
        public IActionResult Index()
        {

            ReservationViewModel model = new ReservationViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            Entities.Parc _Parc = (HttpContext.Session.GetString("Parc") != null)
                                  ? JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"))
                                  : null;

            model.Reservations = Repository.Reservation.GetAll(((_Parc != null) ? _Parc.id_parc : -1), -1);


            return View(model);
        }



        public IActionResult Indexx()
        {

            ReservationViewModel model = new ReservationViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }


            Entities.Parc _Parc = (HttpContext.Session.GetString("Parc") != null)
                                  ? JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"))
                                  : null;

            model.Reservations = Repository.Reservation.GetAll(((_Parc != null) ? _Parc.id_parc : -1), -1);


            return View(model);
        }


        [HttpGet]
        public IActionResult Affecter(int id_reservation)
        {

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            ReservationViewModel model = new ReservationViewModel();

            model.Reservation = new Entities.Reservation() { id_reservation = id_reservation };

            model.Voitures = Repository.Voiture.GetAll();


            Entities.Parc _Parc = (HttpContext.Session.GetString("Parc") != null)
                                ? JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"))
                                : null;

            model.Voitures = Repository.Voiture.GetAll((_Parc != null) ? _Parc.id_parc : -1);




            return View(model);
        }

        [HttpGet]
        public IActionResult AffecterVoiture(int id_reservation, string matricule_voiture)
        {
            Entities.Reservation _Reservation = Repository.Reservation.Getone(id_reservation);
            Entities.Voiture _voiture = Repository.Voiture.GetOne(matricule_voiture);


            if (_Reservation == null)
            {
                return RedirectToAction("Index", "DemandeReservation");
            }


            _Reservation.Voiture.matricule_voiture = matricule_voiture;
            _Reservation.Etat_demande.id_etat_demande = (int)Entities.Enumeration.EtatDemande.CONFIRMER;
            _voiture.Etat.id_etat = (int)Entities.Enumeration.Etat.NONDISPONIBLE;



            if (Repository.Reservation.Confirm(_Reservation))
            {
                Repository.Voiture.Update(_voiture);

                Entities.User ToUser = Repository.User.GetOne(_Reservation.User.Id);
                Entities.MailData _Data = new Entities.MailData()
                {
                    ReceiverName = ToUser.FullName.Trim(),
                    EmailTo = ToUser.Email.Trim(),
                    SenderName = "developpement@hotixsoft.com",
                    EmailSubject = "Compte Utilisateur",
                    EmailBody = string.Concat("Bonjour ", " Nous sommes ravis de vous informer que votre demande de réservation a été confirmée avec succès ! Nous avons effectué l'affectation de la voiture : " + _Reservation.Voiture.matricule_voiture),
                    EmailFrom = "developpement@hotixsoft.com",
                    EmailPass = "hD@123456",
                    SmtpServer = "mail.bmail.tn",
                    SmtpPort = 465,
                    UseSsl = true,
                    IsHTML = true
                };

                if (_Data != null)
                {
                    bool _Success = PFE.HOTIX.Utils.Mailing.sendMailHtml(_Data.ReceiverName, _Data.EmailTo, _Data.SenderName, _Data.EmailSubject, _Data.EmailBody,
                                                                         _Data.EmailFrom, _Data.EmailPass, _Data.SmtpServer, _Data.SmtpPort, _Data.UseSsl, _Data.IsHTML);

                }

                return RedirectToAction("Index", "DemandeReservation");
            }



            return RedirectToAction("CarList", "DemandeReservation", new { id_reservation = id_reservation });
        }

        [HttpGet]
        public ActionResult Consulter(int id_reservation)
        {
            var reservation = Repository.Reservation.Getone(id_reservation);
            if (reservation == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.ReservationViewModel _Model = new Models.ReservationViewModel()
            {
                Reservation = reservation,
                id_reservation = reservation.id_reservation,
                datedebutreservation = reservation.datedebutreservation,
                datefinresrvation = reservation.datefinresevation,
                description_reservation = reservation.description_reservation,

                Users = Repository.User.GetAll(),


            };
            return View(_Model);
        }

        public ActionResult ConsulterVoitureAffecter(int id_reservation)
        {
            var reservation = Repository.Reservation.Getone(id_reservation);
            if (reservation == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.ReservationViewModel _Model = new Models.ReservationViewModel()
            {
                Reservation = reservation,
                id_reservation = reservation.id_reservation,
                datedebutreservation = reservation.datedebutreservation,
                datefinresrvation = reservation.datefinresevation,
                description_reservation = reservation.description_reservation,

                Users = Repository.User.GetAll(),


            };
            return View(_Model);
        }
        [HttpGet]
        public IActionResult Rejeter(int id_reservation)
        {
            Entities.Reservation _Reservation = Repository.Reservation.Getone(id_reservation);

            if (_Reservation == null)
            {
                return RedirectToAction("Index", "DemandeReservation");
            }

            _Reservation.Etat_demande.id_etat_demande = (int)Entities.Enumeration.EtatDemande.REFUSER;


            if (Repository.Reservation.Refuse(_Reservation))
            {
                Entities.User ToUser = Repository.User.GetOne(_Reservation.User.Id);
                Entities.MailData _Data = new Entities.MailData()
                {
                    ReceiverName = ToUser.FullName.Trim(),
                    EmailTo = ToUser.Email.Trim(),
                    SenderName = "developpement@hotixsoft.com",
                    EmailSubject = "Compte Utilisateur",
                    EmailBody = string.Concat("Bonjour", " Nous regrettons de vous informer que votre demande de réservation a été refusée "),
                    EmailFrom = "developpement@hotixsoft.com",
                    EmailPass = "hD@123456",
                    SmtpServer = "mail.bmail.tn",
                    SmtpPort = 465,
                    UseSsl = true,
                    IsHTML = true
                };

                if (_Data != null)
                {
                    bool _Success = PFE.HOTIX.Utils.Mailing.sendMailHtml(_Data.ReceiverName, _Data.EmailTo, _Data.SenderName, _Data.EmailSubject, _Data.EmailBody,
                                                                         _Data.EmailFrom, _Data.EmailPass, _Data.SmtpServer, _Data.SmtpPort, _Data.UseSsl, _Data.IsHTML);

                }

                return RedirectToAction("Index", "DemandeReservation");

            }

            return RedirectToAction("CarList", "DemandeReservation", new { id_reservation = id_reservation });

        }
        public IActionResult Localiser(int id_reservation)
        {
            var reservation = Repository.Reservation.Getone(id_reservation);
            if (reservation == null)
            {
                return RedirectToAction("ConsulterVoitureAffecter", new { id_reservation = id_reservation });
            }

            Models.ReservationViewModel _Model = new Models.ReservationViewModel()
            {
                Reservation = reservation,
                Localisations = Repository.Localisation.GetAllByMat(reservation.Voiture.matricule_voiture, DateTime.Now, false),
            };

            if ((_Model.Localisations != null) && (_Model.Localisations.Count > 0))
            {
                _Model.Localisations[0].Title = "Cur Location";
                _Model.Localisations[0].Color = "red";

                _Model.Localisations[_Model.Localisations.Count - 1].Title = "Start Location";
                _Model.Localisations[_Model.Localisations.Count - 1].Color = "green";
            }
            return View(_Model);
        }

    }


}



