using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using PFE.HOTIX.Repository;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using PFE.HOTIX.WEB.Models;

namespace PFE.HOTIX.WEB.Controllers
{
    public class UserController : Controller
    {
        private readonly IWebHostEnvironment hostEnvironment;
        public UserController(IWebHostEnvironment hostEnvironment)
        {

            this.hostEnvironment = hostEnvironment;
        }
       
        public ActionResult Index()
        {

            var Users = Repository.User.GetAll();
            return View(Users);

        }

      
        public ActionResult Details(int id)
        {
            var User = Repository.User.GetOne(id);
            return View(User);
        }

       
        public ActionResult Create()
        {
            Models.UserViewModel _Model = new Models.UserViewModel
            {
                UserRoles = Repository.UserRole.GetAll()
            };

            return View(_Model);
        }

    
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.UserViewModel _Model)
        {
            if (ModelState.IsValid)
            {
                Entities.Users _Users = Repository.User.GetAll();

                if (_Users.FirstOrDefault(u => u.Login.Trim().Equals(_Model.Login.Trim())) != null)
                {
                    ModelState.AddModelError("Login", "login invalide!");
                    _Model.UserRoles = Repository.UserRole.GetAll();

                    return View(_Model);
                }

                if (_Users.FirstOrDefault(u => u.Email.Trim().Equals(_Model.Email.Trim())) != null)
                {
                    ModelState.AddModelError("Email", "email invalide!");
                    _Model.UserRoles = Repository.UserRole.GetAll();

                    return View(_Model);
                }

                var userRole = Repository.UserRole.GetOne(_Model.UserRoleId);
                string fileName = "user3.png";
                if (_Model.File != null)
                {
                    string uploads = Path.Combine(hostEnvironment.WebRootPath, "uploads");
                    fileName = _Model.File.FileName;
                    string fullPath = Path.Combine(uploads, fileName);
                    _Model.File.CopyTo(new FileStream(fullPath, FileMode.Create));
                }

                var user = new Entities.User
                {
                    FullName = _Model.FullName,
                    Login = _Model.Login,
                    Password = _Model.Password,
                    Email = _Model.Email,
                    Phone = _Model.Phone,
                    IsActive = _Model.Active,
                    BirthDate = _Model.BirthDate,
                    CreationDate = _Model.CreationDate,
                    ImageUrl = fileName,

                    UserRole = userRole

                };


                if (Repository.User.Add(user))
                {
                    Entities.MailData _Data = new Entities.MailData()
                    {
                        ReceiverName = user.FullName,
                        EmailTo = user.Email,
                        SenderName = "developpement@hotixsoft.com",
                        EmailSubject = "Compte Utilisateur",
                        EmailBody = string.Concat("Félicitations", " votre compte d'utilisateur a été créé avec succès.Voici les informations nécessaires à votre identification:Login: " + user.Login + " " + "votre mot de passe: " + user.Password),
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
                }

                return RedirectToAction(nameof(Index));

            }

            _Model.UserRoles = Repository.UserRole.GetAll();

            return View(_Model);


        }



        
        public ActionResult Edit(int id)
        {

            var user = Repository.User.GetOne(id);
         
            try
            {
                Models.UserViewModel _Model = new Models.UserViewModel
                {
                    User = user,
                    FullName = user.FullName,
                    Login = user.Login,
                    Password = Utils.Crypto.Decrypt(user.Password.Trim(), Entities.Constant.CONST_CIPHER_PHRASE),
                    Email = user.Email,
                    Phone = user.Phone,
                    ImageUrl = user.ImageUrl,
                    Active = user.IsActive,
                    BirthDate = user.BirthDate,
                    CreationDate = user.CreationDate,
                    UserRoles = Repository.UserRole.GetAll(),
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
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, Models.UserViewModel _Model)
        {
            var user = Repository.User.GetOne(id);
            if (ModelState.IsValid)
            {

                string fileName = user.ImageUrl;
                if (_Model.File != null)
                {
                    string uploads = Path.Combine(hostEnvironment.WebRootPath, "uploads");
                    fileName = _Model.File.FileName;
                    string fullPath = Path.Combine(uploads, fileName);
                    //Delete the old file
                    string oldFileName = Repository.User.GetOne(_Model.Id).ImageUrl;
                    string fullOldPath = Path.Combine(uploads, oldFileName);
                    if (fullPath != fullOldPath)
                    {
                        if (fullPath != fullOldPath)
                        {
                            
                        }
                        
                        _Model.File.CopyTo(new FileStream(fullPath, FileMode.Create));
                    }
                }
                var userRole = Repository.UserRole.GetOne(_Model.UserRoleId);
               

                var editeUser = new Entities.User
                {
                    Id = _Model.Id,
                    FullName = _Model.FullName,
                    Login = _Model.Login,
                    Password = _Model.Password,
                    Email = _Model.Email,
                    Phone = _Model.Phone,
                    IsActive = _Model.Active,
                    BirthDate = _Model.BirthDate,
                    CreationDate = _Model.CreationDate,
                    ImageUrl = fileName,
                    UserRole = userRole

                };


                Repository.User.Update(editeUser);

                return RedirectToAction(nameof(Index));
            }

            _Model.UserRoles = Repository.UserRole.GetAll();
            _Model.ImageUrl = user.ImageUrl;

            return View(_Model);

        }
        public bool Supprimer(int Id)
        {
            try
            {
                var user = Repository.User.GetOne(Id);
                if (user != null)
                {
                    Repository.User.Remove(user);
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
    

