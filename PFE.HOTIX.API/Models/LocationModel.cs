using Newtonsoft.Json;

namespace PFE.HOTIX.API
{
    public class LocationModel
    {
        #region Constructor

        public LocationModel()
        {
        }

        #endregion

        #region Properties


        [JsonProperty("Laititude_Localisation")]
        public decimal Laititude_Localisation { get; set; }

        [JsonProperty("Longitude_Localisation")]
        public decimal Longitude_Localisation { get; set; }

        [JsonProperty("matricule_voiture")]
        public string matricule_voiture { get; set; }


        #endregion
    }
}
