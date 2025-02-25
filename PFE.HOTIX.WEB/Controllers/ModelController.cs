using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.WEB.Models;
using System;

namespace PFE.HOTIX.WEB.Controllers
{
    public class ModelController : Controller
    {
        public IActionResult Index()
        {
            ModelViewModel model = new ModelViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            model.Models = Repository.Config.GetAllModels();

            return View(model);

        }



        [HttpGet]
        public ActionResult Ajouter()
        {
            return View();
        }


        [HttpPost]
        public IActionResult Ajouter(ModelViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var model = new Model
                        {

                            id_model = viewModel.id_model,
                            name_model = viewModel.name_model,

                        };
                        Repository.Config.ModelAdd(model);
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



        public ActionResult Modifier(int id_model)
        {

            var model = Repository.Config.ModelGetOne(id_model);
            try
            {
                Models.ModelViewModel _Model = new Models.ModelViewModel

                {

                    id_model= model.id_model,
                    name_model = model.name_model,

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
        public IActionResult Modifier(ModelViewModel viewmodel)

        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var model = new Model
                        {

                            id_model = viewmodel.id_model,
                            name_model = viewmodel.name_model,

                        };
                        Repository.Config.ModelUpdate(model);
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

        public bool Supprimer(int id_model)
        {
            try
            {
                var model = Repository.Config.ModelGetOne(id_model);
                
                return Repository.Config.ModelRemove(model);
            }

            catch (System.Exception)
            {
                return false;

            }
        }
    }
}
