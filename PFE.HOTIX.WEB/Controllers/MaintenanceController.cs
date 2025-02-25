using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.WEB.Models;
using System;
using System.Linq.Expressions;

namespace PFE.HOTIX.WEB.Controllers
{
    public class MaintenanceController : Controller
    {
        public IActionResult Index()
        {

            MaintenanceViewModel model = new MaintenanceViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }




            Entities.Parc _Parc = (HttpContext.Session.GetString("Parc") != null)
                                   ? JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"))
                                   : null;

            model.Maintenances = Repository.Maintenance.GetAll((_Parc != null) ? _Parc.id_parc : -1);


            return View(model);
        }




        public ActionResult Ajouter()
        {
            MaintenanceViewModel Model = new MaintenanceViewModel();

            Model.Types_Maintenances = Repository.Config.GetAllTypeMaintenances();

            Model.Voitures = Repository.Voiture.GetAll();

            return View(Model);
        }


        [HttpPost]
        public IActionResult Ajouter(MaintenanceViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var maintenance = new Maintenance
                        {

                            id_maintenance = viewModel.id_maintenance,
                            Description_Maintenance = viewModel.Description_Maintenance,
                            Lieu_Maintenance = viewModel.Lieu_Maintenance,
                            Date_Maintenance = viewModel.Date_Maintenance,
                            Voiture = new Voiture() { matricule_voiture = viewModel.matricule_voiture },
                            Type_Maintenance = new Type_maintenance() { id_type_maintenance = viewModel.id_type_maintenance },




                        };
                        Repository.Maintenance.Add(maintenance);
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


        public ActionResult Modifier(int id_maintenance)
        {
            var maintenance = Repository.Maintenance.Getone(id_maintenance);

            try
            {

                MaintenanceViewModel Model = new MaintenanceViewModel
                {
                    Maintenance = maintenance,
                    id_maintenance = maintenance.id_maintenance,
                    Description_Maintenance = maintenance.Description_Maintenance,
                    Lieu_Maintenance = maintenance.Lieu_Maintenance,
                    Date_Maintenance = maintenance.Date_Maintenance,
                    matricule_voiture = maintenance.Voiture.matricule_voiture,
                    Types_Maintenances = Repository.Config.GetAllTypeMaintenances(),
                    Voitures = Repository.Voiture.GetAll()

                };

                return View(Model);
            }
            catch (Exception ex)
            {
                ErrorViewModel _EModel = new ErrorViewModel() { RequestId = String.Concat("User.Edit ", Environment.NewLine, ex.Message) };
                return RedirectToAction("Error", "Errors", _EModel);
            }
        }


        [HttpPost]
        public IActionResult Modifier(MaintenanceViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var maintenance = new Maintenance
                        {

                            id_maintenance = viewModel.id_maintenance,
                            Description_Maintenance = viewModel.Description_Maintenance,
                            Lieu_Maintenance = viewModel.Lieu_Maintenance,
                            Date_Maintenance = viewModel.Date_Maintenance,
                            Voiture = new Voiture() { matricule_voiture = viewModel.matricule_voiture },
                            Type_Maintenance = new Type_maintenance() { id_type_maintenance = viewModel.id_type_maintenance },






                        };
                        Repository.Maintenance.Update(maintenance);
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



        public ActionResult Consulter(int id_maintenance)
        {
            var maintenance = Repository.Maintenance.Getone(id_maintenance);
            if (maintenance == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.MaintenanceViewModel _Model = new Models.MaintenanceViewModel()
            {
                Maintenance = maintenance,
                id_maintenance = maintenance.id_maintenance,
                Description_Maintenance = maintenance.Description_Maintenance,
                Lieu_Maintenance = maintenance.Lieu_Maintenance,
                Date_Maintenance = maintenance.Date_Maintenance,
                Voitures = Repository.Voiture.GetAll(),

            };
            return View(_Model);
        }


        public bool Supprimer(int id_maintenance)
        {
            try
            {
                var maintenance = Repository.Maintenance.Getone(id_maintenance);
                if (maintenance != null)
                { 
                    Repository.Maintenance.Remove(maintenance); 
                }
                return true;
            }

            catch (System.Exception)
            {
                return false;

            }
        }
    }
}
