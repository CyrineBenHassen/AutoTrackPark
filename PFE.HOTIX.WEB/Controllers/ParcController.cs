using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.Repository;
using PFE.HOTIX.WEB.Models;
using System;
using System.Linq;
using static System.Reflection.Metadata.BlobBuilder;

namespace PFE.HOTIX.WEB.Controllers
{
    public class ParcController : Controller
    {
        public IActionResult Index()
        {

            ParcViewModel model = new ParcViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            model.Parcs = Repository.Parc.GetAll();



            return View(model);
        }

        [HttpGet]
        public ActionResult Ajouter()
        {
            ParcViewModel Model = new ParcViewModel();

            Entities.Users _AllUsers = Repository.User.GetAll();


            Model.Users = new Entities.Users(_AllUsers.Where(u => u.UserRole.Id == (int)Entities.Enumeration.UserRole.MANAGER).ToList());

            return View(Model);
        }

        [HttpPost]
        public IActionResult Ajouter(ParcViewModel viewModel)
        {





            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var parc = new Entities.Parc
                        {

                            id_parc = viewModel.id_parc,
                            nom_parc = viewModel.nom_parc,
                            adresse_parc = viewModel.adresse_parc,
                            tel_parc = viewModel.tel_parc,
                            email_parc = viewModel.email_parc,



                            User = new Entities.User() { Id = viewModel.id_user }
                        };
                        Repository.Parc.Add(parc);
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
        public IActionResult Modifier(int id_parc)
        {

            var parc = Repository.Parc.Getone(id_parc);


            ParcViewModel Model = new ParcViewModel();

            Entities.Users _AllUsers = Repository.User.GetAll();


          
            try
            {
                Models.ParcViewModel _Model = new Models.ParcViewModel
                {
                    id_parc = parc.id_parc,
                    nom_parc = parc.nom_parc,
                    adresse_parc = parc.adresse_parc,
                    tel_parc = parc.tel_parc,
                    email_parc = parc.email_parc,
                    Users = new Entities.Users(_AllUsers.Where(u => u.UserRole.Id == (int)Entities.Enumeration.UserRole.MANAGER).ToList()),
                    Parc = parc,



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
        public IActionResult Modifier(ParcViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var parc = new Entities.Parc
                        {
                            id_parc = viewModel.id_parc,
                            nom_parc = viewModel.nom_parc,
                            adresse_parc = viewModel.adresse_parc,
                            tel_parc = viewModel.tel_parc,
                            email_parc = viewModel.email_parc,

                            User = new Entities.User() { Id = viewModel.id_user },

                        };
                        Repository.Parc.Update(parc);
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

        public bool Supprimer(int id_parc)
        {
            try
            {
                var parc = Repository.Parc.Getone(id_parc);
                return Repository.Parc.Remove(parc);
            }

            catch (System.Exception)
            {
                return false;
            }
        }


        public ActionResult Consulter(int id_parc)
        {
            var parc = Repository.Parc.Getone(id_parc);
            if (parc == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.ParcViewModel _Model = new Models.ParcViewModel()
            {

                id_parc = parc.id_parc,
                nom_parc = parc.nom_parc,
                adresse_parc = parc.adresse_parc,
                email_parc = parc.email_parc,
                tel_parc = parc.tel_parc,
                Parc = parc,
                 Users = Repository.User.GetAll()
                 
            };
            return View(_Model);
        }

    }
}
