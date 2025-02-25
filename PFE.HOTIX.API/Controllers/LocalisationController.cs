using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PFE.HOTIX.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocalisationController : ControllerBase
    {

        private IConfiguration configuration;

        public LocalisationController(IConfiguration iConfig)
        {
            configuration = iConfig;
        }

        [HttpGet]
        [Route("GetLocalisations")]
        public ApiResponse GetLocalisations()
        {
            try
            {
                Entities.Localisations _Data = Repository.Localisation.GetAll();
                if (_Data != null)
                {
                    return new ApiResponse
                    {
                        Success = true,
                        Error = -1,
                        Message = "Success",
                        Data = _Data
                    };
                }
                else
                {
                    return new ApiResponse
                    {
                        Success = false,
                        Error = 2,
                        Message = "No Data Found!!!",
                        Data = null
                    };
                }
            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    Error = 0,
                    Message = ex.Message,
                    Data = null
                };
            }
        }



        [HttpPost]
        [Route("AddLocalisation")]
        public ApiResponse AddLocalisation(LocationModel localisation)
        {
            try
            {

                Entities.Localisation _Localisation = new Entities.Localisation() 
                {
                    Laititude_Localisation = localisation.Laititude_Localisation,
                    Longitude_Localisation = localisation.Longitude_Localisation,
                    Voiture = new Entities.Voiture() { matricule_voiture = localisation.matricule_voiture },
                };
                bool _Success = Repository.Localisation.Add(_Localisation);

                return new ApiResponse
                {
                    Success = _Success,
                    Error = _Success ? -1 : 1,
                    Message = _Success ? "Success" : "User Add Failed!!!!!!",
                    Data = null
                };

            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    Error = 0,
                    Message = ex.Message,
                    Data = null
                };
            }
        }

        [HttpPost]
        [Route("UpdateLocalisation")]
        public ApiResponse UpdateUser(Entities.Localisation localisation)
        {
            try
            {
                bool _Success = Repository.Localisation.Update(localisation);

                return new ApiResponse
                {
                    Success = _Success,
                    Error = _Success ? -1 : 1,
                    Message = _Success ? "Success" : "User Update Failed!!!",
                    Data = null
                };

            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    Error = 0,
                    Message = ex.Message,
                    Data = null
                };
            }
        }

        [HttpPost]
        [Route("RemoveLocalisation")]
        public ApiResponse Removelocalisation(Entities.Localisation localisation)
        {
            try
            {
                bool _Success = Repository.Localisation.Remove(localisation);

                return new ApiResponse
                {
                    Success = _Success,
                    Error = _Success ? -1 : 1,
                    Message = _Success ? "Success" : "User Delete Failed!!!",
                    Data = null
                };

            }
            catch (Exception ex)
            {
                return new ApiResponse
                {
                    Success = false,
                    Error = 0,
                    Message = ex.Message,
                    Data = null
                };
            }
        }
    }
}
