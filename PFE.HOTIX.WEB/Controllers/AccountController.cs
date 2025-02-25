using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PFE.HOTIX.WEB.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace PFE.HOTIX.WEB.Controllers
{
    public class AccountController : Controller
    {

        private IConfiguration _Config;
        private readonly ILogger<AccountController> _logger;

        public AccountController(ILogger<AccountController> logger, IConfiguration iConfig)
        {
            _logger = logger;
            _Config = iConfig;
        }


        [HttpGet]
        public IActionResult Login()
        {
            LoginViewModel _Model = new LoginViewModel();

            _Model.Username = string.Empty;
            _Model.Password = string.Empty;




            return View(_Model);
        }

        [HttpPost]
        public IActionResult Login(Models.LoginViewModel _Model)
        {

            try
            {
                if (_Model.Username != null && _Model.Password != null)
                {
                    Entities.User _User = Repository.User.GetOneByLogin(_Model.Username);

                    if (_User == null)
                    {
                        ModelState.AddModelError("Username", "Nom d'utilisateur invalide !");
                        return View("Login", _Model);
                    }
                    else if (!_User.Authenticate(_Model.Username.Trim(), Utils.Crypto.Encrypt(_Model.Password, Entities.Constant.CONST_CIPHER_PHRASE)))
                    {
                        ModelState.AddModelError("Password", "Mot de passe invalide !");
                        return View("Login", _Model);
                    }
                   



                    HttpContext.Session.SetString("User", JsonConvert.SerializeObject(_User));
                    switch (_User.UserRole.Id)
                    {
                        case (int)Entities.Enumeration.UserRole.ADMIN:
                            return RedirectToAction("dashbord", "Home");
                            break;

                        case (int)Entities.Enumeration.UserRole.MANAGER:
                            Entities.Parc _Parc = Repository.Parc.GetOneByUserID(_User.Id);
                            HttpContext.Session.SetString("Parc", JsonConvert.SerializeObject(_Parc));
                            return RedirectToAction("Index", "Home");
                            break;

                        case (int)Entities.Enumeration.UserRole.USER:
                            return RedirectToAction("Index", "Home");
                            break;

                        default:
                            return RedirectToAction("Index", "Home");
                            break;
                    }






                }
                else
                {
                    return View("Login", _Model);
                }
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
        }







        [HttpGet]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("User");
            HttpContext.Session.Remove("Parc");
            return RedirectToAction("Login");
        }
    }

}