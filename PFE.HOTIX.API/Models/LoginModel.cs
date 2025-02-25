using Newtonsoft.Json;

namespace PFE.HOTIX.API
{
    public class LoginModel
    {
        #region Constructor

        public LoginModel()
        {
        }

        #endregion

        #region Properties


        [JsonProperty("Login")]
        public string Login { get; set; }

        [JsonProperty("Password")]
        public string Password { get; set; } 


        #endregion
    }
}
