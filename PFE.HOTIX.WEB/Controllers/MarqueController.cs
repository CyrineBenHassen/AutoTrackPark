using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.WEB.Models;
using System;

namespace PFE.HOTIX.WEB.Controllers
{
    public class MarqueController : Controller
    {
        public IActionResult Index()
        {

            MarqueViewModel model = new MarqueViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            model.Marques = Repository.Config.GetAllMarques();

            return View(model);
        }

        [HttpGet]
        public ActionResult Ajouter()
        {
            return View();
        }


        [HttpPost]
        public IActionResult Ajouter(MarqueViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var marque = new Marque
                        {

                            Id_marque = viewModel.id_marque,
                            marque_name= viewModel.marque_name,
                           
                        };
                        Repository.Config.MarqueAdd(marque);
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










      
        public ActionResult Modifier( int id_marque)
        {

            var marque = Repository.Config.MarqueGetOne(id_marque);

            try
            {
                Models.MarqueViewModel _Model = new Models.MarqueViewModel
                
                {

                    id_marque = marque.Id_marque,
                    marque_name = marque.marque_name

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
       public IActionResult Modifier(MarqueViewModel viewmodel)
            
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var marque = new Marque
                        {

                            Id_marque = viewmodel.id_marque,
                            marque_name = viewmodel.marque_name

                        };
                        Repository.Config.MarqueUpdate(marque);
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




        public bool Supprimer(int id_marque)
        {
            try
            {
                var marque = Repository.Config.MarqueGetOne(id_marque);
                Repository.Config.MarqueRemove(marque);
                return true;
            }

            catch (System.Exception)
            {
                return false;

            }
        }
    }

}
