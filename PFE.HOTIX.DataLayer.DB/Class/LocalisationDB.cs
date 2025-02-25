using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using PFE.HOTIX.Entities;

namespace PFE.HOTIX.DataLayer.DB
{
    public class LocalisationDB : ILocalisation
    {

        #region Enums 

        private enum enumQryLocalisationFields
        {
            id_localisation=0,
            Laititude_Localisation,
            Longitude_Localisation,
            Date_Localisation,
            Temps_Localisation,

            matricule_voiture ,
            couleur_voiture,
            Kilommetrage_Voiture,
            annee_voiture,
            nbre_place
            
        }

        #endregion




        public IEnumerable<Localisation> GetAll()
        {
            Entities.Localisations Ret = new Entities.Localisations();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_localisation_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Localisation()
                            {
                                id_localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.id_localisation))
                                            ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.id_localisation])
                                            : 0,
                                Laititude_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Laititude_Localisation))
                                                         ? Convert.ToDecimal(DR[(int)enumQryLocalisationFields.Laititude_Localisation])
                                                         : 0,
                                Longitude_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Longitude_Localisation))
                                                         ? Convert.ToDecimal(DR[(int)enumQryLocalisationFields.Longitude_Localisation])
                                                         : 0,
                                Date_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Date_Localisation))
                                                    ? Convert.ToDateTime(DR[(int)enumQryLocalisationFields.Date_Localisation].ToString())
                                                    : new DateTime(1970, 1, 1),
                                Temps_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Temps_Localisation))
                                                     ? Convert.ToDateTime(DR[(int)enumQryLocalisationFields.Temps_Localisation].ToString())
                                                     : new DateTime(1970, 1, 1),
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.matricule_voiture))
                                                        ? DR[(int)enumQryLocalisationFields.matricule_voiture].ToString()
                                                         : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.couleur_voiture))
                                                      ? DR[(int)enumQryLocalisationFields.couleur_voiture].ToString()
                                                      : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.Kilommetrage_Voiture))
                                                           ? DR[(int)enumQryLocalisationFields.Kilommetrage_Voiture].ToString()
                                                           : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.annee_voiture))
                                                    ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.annee_voiture])
                                                    : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryLocalisationFields.nbre_place))
                                                 ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.nbre_place])
                                                 : 0,



                                },
                            });
                        }
                    }
                }

                return Ret;
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
            finally
            {
                if (DR != null)
                {
                    DR.Close();
                    DR = null;
                }
            }
        }


        public IEnumerable<Localisation> GetAllByMat(string Mat, DateTime DateRef, bool ByDate = false)
        {
            Entities.Localisations Ret = new Entities.Localisations();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_localisation_get_all_by_mat", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@carMat", SqlDbType.VarChar);
                        command.Parameters["@carMat"].Value = Mat;

                        command.Parameters.Add("@dateRef", SqlDbType.Date);
                        command.Parameters["@dateRef"].Value = DateRef;

                        command.Parameters.Add("@byDate", SqlDbType.Int);
                        command.Parameters["@byDate"].Value = (ByDate) ? 1 : -1;

                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Localisation()
                            {
                                id_localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.id_localisation))
                                            ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.id_localisation])
                                            : 0,
                                Laititude_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Laititude_Localisation))
                                                         ? Convert.ToDecimal(DR[(int)enumQryLocalisationFields.Laititude_Localisation])
                                                         : 0,
                                Longitude_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Longitude_Localisation))
                                                         ? Convert.ToDecimal(DR[(int)enumQryLocalisationFields.Longitude_Localisation])
                                                         : 0,
                                Date_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Date_Localisation))
                                                    ? Convert.ToDateTime(DR[(int)enumQryLocalisationFields.Date_Localisation].ToString())
                                                    : new DateTime(1970, 1, 1),
                                Temps_Localisation = (!DR.IsDBNull((int)enumQryLocalisationFields.Temps_Localisation))
                                                     ? Convert.ToDateTime(DR[(int)enumQryLocalisationFields.Temps_Localisation].ToString())
                                                     : new DateTime(1970, 1, 1),
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.matricule_voiture))
                                                        ? DR[(int)enumQryLocalisationFields.matricule_voiture].ToString()
                                                         : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.couleur_voiture))
                                                      ? DR[(int)enumQryLocalisationFields.couleur_voiture].ToString()
                                                      : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.Kilommetrage_Voiture))
                                                           ? DR[(int)enumQryLocalisationFields.Kilommetrage_Voiture].ToString()
                                                           : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryLocalisationFields.annee_voiture))
                                                    ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.annee_voiture])
                                                    : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryLocalisationFields.nbre_place))
                                                 ? Convert.ToInt32(DR[(int)enumQryLocalisationFields.nbre_place])
                                                 : 0,



                                },
                            });
                        }
                    }
                }

                return Ret;
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
            finally
            {
                if (DR != null)
                {
                    DR.Close();
                    DR = null;
                }
            }
        }


        public bool Add( Localisation localisation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_localisation_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;  

                        command.Parameters.Add(new SqlParameter("@Laititude_Localisation", SqlDbType.Decimal)
                        {
                            Precision = 20,
                            Scale = 15
                        }); 
                        command.Parameters["@Laititude_Localisation"].Value = localisation.Laititude_Localisation;

                        command.Parameters.Add(new SqlParameter("@Longitude_Localisation", SqlDbType.Decimal)
                        {
                            Precision = 20,
                            Scale = 15
                        }); 
                        command.Parameters["@Longitude_Localisation"].Value = localisation.Longitude_Localisation; 

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = localisation.Voiture.matricule_voiture;

                        command.Prepare();

                        conn.Open();

                        Ret = command.ExecuteNonQuery();
                    }
                }

                return Ret > -1;
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
        }

        public bool Update(Localisation localisation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_localisation_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id_localisation", SqlDbType.Int);
                        command.Parameters["@id_localisation"].Value = localisation.id_localisation; 

                        command.Parameters.Add("@Laititude_Localisation", SqlDbType.Decimal);
                        command.Parameters["@Laititude_Localisation"].Value = localisation.Laititude_Localisation;

                        command.Parameters.Add("@Longitude_Localisation", SqlDbType.Decimal);
                        command.Parameters["@Longitude_Localisation"].Value = localisation.Longitude_Localisation;
                         
                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = localisation.Voiture.matricule_voiture;
                        conn.Open();
                        Ret = command.ExecuteNonQuery();
                    }
                }

                return Ret > -1;
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
        }

        public bool Remove(Localisation localisation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_localisation_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_localisation", SqlDbType.Int);
                        command.Parameters["@id_localisation"].Value = localisation.id_localisation;

                        conn.Open();
                        Ret = command.ExecuteNonQuery();
                    }
                }

                return Ret > -1;
            }
            catch (Exception ex)
            {
                string strEx = ex.Message;
                throw;
            }
        }

    }
}

