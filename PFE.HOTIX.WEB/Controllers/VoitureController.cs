using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PFE.HOTIX.Entities;
using PFE.HOTIX.WEB.Models;
using System;

namespace PFE.HOTIX.WEB.Controllers
{
    public class VoitureController : Controller
    {
        public IActionResult Index()
        {

            VoitureViewModel model = new VoitureViewModel();

            if (HttpContext.Session.GetString("User") == null)
            {
                return RedirectToAction("Login", "Account");
            }

            Entities.Parc _Parc = (HttpContext.Session.GetString("Parc") != null)
                                 ? JsonConvert.DeserializeObject<Entities.Parc>(HttpContext.Session.GetString("Parc"))
                                 : null;

            model.Voitures = Repository.Voiture.GetAll((_Parc != null) ? _Parc.id_parc : -1);

            return View(model);
        }


        [HttpGet]
        public ActionResult Ajouter()

        {

            VoitureViewModel Model = new VoitureViewModel();

            Model.Marques = Repository.Config.GetAllMarques();

            Model.Models = Repository.Config.GetAllModels();

            Model.Etats = Repository.Config.GetAllEtats();

            Model.Parcs = Repository.Parc.GetAll();

            return View(Model);
        }


        [HttpPost]
        public IActionResult Ajouter(VoitureViewModel viewModel)
        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var voiture = new Voiture
                        {

                            matricule_voiture = viewModel.matricule_voiture,
                            couleur_voiture = viewModel.couleur_voiture,
                            Kilommetrage_Voiture = viewModel.Kilommetrage_Voiture,
                            annee_voiture = viewModel.annee_voiture,
                            nbre_place = viewModel.nbre_place,
                            Marque = new Marque() { Id_marque = viewModel.id_marque },
                            Model = new Model() { id_model = viewModel.id_model },
                            Etat = new Etat() { id_etat = viewModel.id_etat },
                            Parc = new Parc() { id_parc = viewModel.id_parc }

                        };
                        Repository.Voiture.Add(voiture);
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
      
        public IActionResult Modifier(string matricule_voiture)
        {

            var voiture = Repository.Voiture.GetOne(matricule_voiture);
            try
            {
                Models.VoitureViewModel _Model = new Models.VoitureViewModel
                {
                    matricule_voiture = voiture.matricule_voiture,
                    couleur_voiture = voiture.couleur_voiture,
                    Kilommetrage_Voiture = voiture.Kilommetrage_Voiture,
                    annee_voiture = voiture.annee_voiture,
                    nbre_place = voiture.nbre_place,
                    Marques = Repository.Config.GetAllMarques(),
                    Models = Repository.Config.GetAllModels(),
                    Etats = Repository.Config.GetAllEtats(),
                    Parcs = Repository.Parc.GetAll(),
                    Voiture = voiture,  
                };

                return View(_Model);
            }
            catch (Exception ex)
            {
                ErrorViewModel _EModel = new ErrorViewModel() { RequestId = String.Concat("Voiture.Modifier ", Environment.NewLine, ex.Message) };
                return RedirectToAction("Error", "Errors", _EModel);
            }


        }


        [HttpPost]
        public IActionResult Modifier(VoitureViewModel viewModel)

        {
            {
                if (ModelState.IsValid)
                    try
                    {
                        Entities.User _User = JsonConvert.DeserializeObject<Entities.User>(HttpContext.Session.GetString("User"));

                        var voiture = new Voiture
                        {

                            matricule_voiture = viewModel.matricule_voiture,
                            couleur_voiture = viewModel.couleur_voiture,
                            Kilommetrage_Voiture = viewModel.Kilommetrage_Voiture,
                            annee_voiture = viewModel.annee_voiture,
                            nbre_place = viewModel.nbre_place,
                            Marque = new Marque() { Id_marque = viewModel.id_marque },
                            Model = new Model() { id_model = viewModel.id_model },
                            Etat = new Etat() { id_etat = viewModel.id_etat },
                            Parc = new Parc() { id_parc = viewModel.id_parc }

                        };
                        Repository.Voiture.Update(voiture);
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


        public ActionResult Consulter(string matricule_voiture)
        {
            var voiture = Repository.Voiture.GetOne(matricule_voiture);
            if (voiture == null)
            {
                return RedirectToAction(nameof(Index));
            }

            Models.VoitureViewModel _Model = new Models.VoitureViewModel()
            {
                Voiture = voiture,  
                matricule_voiture = voiture.matricule_voiture,
                couleur_voiture = voiture.couleur_voiture,
                Kilommetrage_Voiture = voiture.Kilommetrage_Voiture,
                annee_voiture = voiture.annee_voiture,
                nbre_place = voiture.nbre_place,

                 Marques = Repository.Config.GetAllMarques(),
                Models = Repository.Config.GetAllModels(),
                Etats = Repository.Config.GetAllEtats(),
                Parcs = Repository.Parc.GetAll(),

            };
            return View(_Model);
        }


        public bool Supprimer(string matricule_voiture)
        {
            try
            {
                var voiture = Repository.Voiture.GetOne(matricule_voiture);
                Repository.Voiture.Remove(voiture);
                return true;
            }

            catch (System.Exception)
            {
                return false;

            }
        }
    }
}
