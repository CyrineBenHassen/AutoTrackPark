using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.WEB.Models;
using System;

namespace PFE.HOTIX.WEB.Controllers
{
    public class TypemaintenanceController : Controller
    {
        public IActionResult Index()
        {

            TypeMaintenanceModel model = new TypeMaintenanceModel();

            if (HttpContext.Session.GetString("User") == null)

            {
                return RedirectToAction("Login", "Account");
            }

            model.Types_Maintenances = Repository.Config.GetAllTypeMaintenances();

            return View(model);
        }



        [HttpGet]
        public ActionResult Ajouter()
        {
            return View();
        }



        [HttpPost]
        public IActionResult Ajouter(TypeMaintenanceModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var typemaintenance = new Type_maintenance
                        {

                            id_type_maintenance = viewModel.id_type_maintenance,
                            name_type = viewModel.name_type,

                        };
                        Repository.Config.TypeMaintenanceAdd(typemaintenance);
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


        [HttpGet]
        public ActionResult Modifier(int id_type_maintenance)
        {
            var typeMainetnances = Repository.Config.typegetone(id_type_maintenance);
            try
            {

                Models.TypeMaintenanceModel Model = new TypeMaintenanceModel
                {
                    id_type_maintenance = typeMainetnances.id_type_maintenance,
                    name_type = typeMainetnances.name_type ,

                   
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
        public IActionResult Modifier(TypeMaintenanceModel viewmodel)

        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var typemaintenance = new Type_maintenance
                        {

                            id_type_maintenance = viewmodel.id_type_maintenance,
                            name_type = viewmodel.name_type,

                        };
                        Repository.Config.TypeMaintenanceUpdate(typemaintenance);
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


        [HttpPost]

        public bool Supprimer(int id_type_maintenance)
        {
            try
            {
                var typemaintenance = Repository.Config.typegetone(id_type_maintenance);
                Repository.Config.TypeMaintenanceRemove(typemaintenance);
                return true;
            }

            catch (System.Exception)
            {
                return false;

            }
        }

    }
}