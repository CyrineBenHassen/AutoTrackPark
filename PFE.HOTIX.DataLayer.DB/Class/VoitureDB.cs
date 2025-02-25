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
    public class VoitureDB : IVoiture
    {
        private string marque_name;

        #region Enums 

        private enum enumQryVoitureFields
        {
            matricule_voiture = 0,
            couleur_voiture,
            Kilommetrage_Voiture,
            annee_voiture,
            nbre_place,
            Id_marque,
            marque_name,
            Id_model,
            name_model,
            id_etat,
            etat_code,
            etat_name,
            
            Id_parc,
            nom_parc ,
            tel_parc ,
            adresse_parc,
            email_parc

           

        }

        #endregion



        public IEnumerable<Voiture> GetAll(int ParcID)
        {
            Entities.Voitures Ret = new Entities.Voitures();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_Voiture_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@parc_id", SqlDbType.Int);
                        command.Parameters["@parc_id"].Value = ParcID;

                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Voiture()
                            {

                                matricule_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.matricule_voiture))
                                           ? DR[(int)enumQryVoitureFields.matricule_voiture].ToString()
                                           : string.Empty,
                                couleur_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.couleur_voiture))
                                           ? DR[(int)enumQryVoitureFields.couleur_voiture].ToString()
                                           : string.Empty,
                                Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryVoitureFields.Kilommetrage_Voiture))
                                        ? DR[(int)enumQryVoitureFields.Kilommetrage_Voiture].ToString()
                                        : string.Empty,
                                annee_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.annee_voiture))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.annee_voiture])
                                            : 0,
                                nbre_place = (!DR.IsDBNull((int)enumQryVoitureFields.nbre_place))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.nbre_place])
                                            : 0,
                                     Marque = new Marque()
                            {  

                                         Id_marque = (!DR.IsDBNull((int)enumQryVoitureFields.Id_marque))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_marque])
                                            : 0,

                                    marque_name = (!DR.IsDBNull((int)enumQryVoitureFields.marque_name))
                                              ? DR[(int)enumQryVoitureFields.marque_name].ToString()
                                              : string.Empty,
                                     },

                                Model = new Model()

                            {
                                    id_model = (!DR.IsDBNull((int)enumQryVoitureFields.Id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_model])
                                            : 0,
                                    name_model = (!DR.IsDBNull((int)enumQryVoitureFields.name_model))
                                              ? DR[(int)enumQryVoitureFields.name_model].ToString()
                                              : string.Empty,
                                },

                                Etat = new Etat()

                                {
                                    id_etat = (!DR.IsDBNull((int)enumQryVoitureFields.id_etat))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.id_etat])
                                            : 0,
                                    etat_code = (!DR.IsDBNull((int)enumQryVoitureFields.etat_code))
                                              ? DR[(int)enumQryVoitureFields.etat_code].ToString()
                                              : string.Empty,

                                    etat_name = (!DR.IsDBNull((int)enumQryVoitureFields.etat_name))
                                              ? DR[(int)enumQryVoitureFields.etat_name].ToString()
                                              : string.Empty,
                                },
                                Parc = new Parc()

                                {
                                    id_parc = (!DR.IsDBNull((int)enumQryVoitureFields.Id_parc))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_parc])
                                            : 0,
                                    nom_parc = (!DR.IsDBNull((int)enumQryVoitureFields.nom_parc))
                                              ? DR[(int)enumQryVoitureFields.nom_parc].ToString()
                                              : string.Empty,
                                    tel_parc= (!DR.IsDBNull((int)enumQryVoitureFields.tel_parc))
                                              ? DR[(int)enumQryVoitureFields.tel_parc].ToString()
                                              : string.Empty,


                                    adresse_parc = (!DR.IsDBNull((int)enumQryVoitureFields.adresse_parc))
                                              ? DR[(int)enumQryVoitureFields.adresse_parc].ToString()
                                              : string.Empty,

                                    email_parc = (!DR.IsDBNull((int)enumQryVoitureFields.email_parc))
                                              ? DR[(int)enumQryVoitureFields.email_parc].ToString()
                                              : string.Empty,

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

        public Voiture GetOne(string matricule_voiture)
        {
            Entities.Voiture Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_voiture_get_one_by_matricule", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        
                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = matricule_voiture;
                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Voiture()
                            {
                                matricule_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.matricule_voiture))
                                           ? DR[(int)enumQryVoitureFields.matricule_voiture].ToString()
                                           : string.Empty,
                                couleur_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.couleur_voiture))
                                           ? DR[(int)enumQryVoitureFields.couleur_voiture].ToString()
                                           : string.Empty,
                                Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryVoitureFields.Kilommetrage_Voiture))
                                        ? DR[(int)enumQryVoitureFields.Kilommetrage_Voiture].ToString()
                                        : string.Empty,
                                annee_voiture = (!DR.IsDBNull((int)enumQryVoitureFields.annee_voiture))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.annee_voiture])
                                            : 0,
                                nbre_place = (!DR.IsDBNull((int)enumQryVoitureFields.nbre_place))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.nbre_place])
                                            : 0,




                                Marque = new Marque()
                                {

                                    Id_marque = (!DR.IsDBNull((int)enumQryVoitureFields.Id_marque))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_marque])
                                            : 0,

                                    marque_name = (!DR.IsDBNull((int)enumQryVoitureFields.marque_name))
                                              ? DR[(int)enumQryVoitureFields.marque_name].ToString()
                                              : string.Empty,
                                },




                                Model = new Model()

                                {
                                    id_model = (!DR.IsDBNull((int)enumQryVoitureFields.Id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_model])
                                            : 0,
                                    name_model = (!DR.IsDBNull((int)enumQryVoitureFields.name_model))
                                              ? DR[(int)enumQryVoitureFields.name_model].ToString()
                                              : string.Empty,
                                },

                                Etat = new Etat()

                                {
                                    id_etat = (!DR.IsDBNull((int)enumQryVoitureFields.id_etat))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.id_etat])
                                            : 0,
                                    etat_code = (!DR.IsDBNull((int)enumQryVoitureFields.etat_code))
                                              ? DR[(int)enumQryVoitureFields.etat_code].ToString()
                                              : string.Empty,

                                    etat_name = (!DR.IsDBNull((int)enumQryVoitureFields.etat_name))
                                              ? DR[(int)enumQryVoitureFields.etat_name].ToString()
                                              : string.Empty,
                                },



                                Parc = new Parc()

                                {
                                    id_parc = (!DR.IsDBNull((int)enumQryVoitureFields.Id_parc))
                                            ? Convert.ToInt32(DR[(int)enumQryVoitureFields.Id_parc])
                                            : 0,
                                    nom_parc = (!DR.IsDBNull((int)enumQryVoitureFields.nom_parc))
                                              ? DR[(int)enumQryVoitureFields.nom_parc].ToString()
                                              : string.Empty,

                                    tel_parc = (!DR.IsDBNull((int)enumQryVoitureFields.tel_parc))
                                              ? DR[(int)enumQryVoitureFields.tel_parc].ToString()
                                              : string.Empty,


                                    adresse_parc = (!DR.IsDBNull((int)enumQryVoitureFields.adresse_parc))
                                              ? DR[(int)enumQryVoitureFields.adresse_parc].ToString()
                                              : string.Empty,

                                    email_parc = (!DR.IsDBNull((int)enumQryVoitureFields.email_parc))
                                              ? DR[(int)enumQryVoitureFields.email_parc].ToString()
                                              : string.Empty,

                                },

                                
                            };
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

       
        public bool Add(Voiture voiture)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_voiture_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = voiture.matricule_voiture;



                        command.Parameters.Add("@couleur_voiture", SqlDbType.VarChar);
                        command.Parameters["@couleur_voiture"].Value = voiture.couleur_voiture;

                        command.Parameters.Add("@Kilommetrage_Voiture", SqlDbType.VarChar);
                        command.Parameters["@Kilommetrage_Voiture"].Value = voiture.Kilommetrage_Voiture;

                        command.Parameters.Add("@annee_voiture", SqlDbType.Int);
                        command.Parameters["@annee_voiture"].Value = voiture.annee_voiture;

                        command.Parameters.Add("@nbre_place", SqlDbType.Int);
                        command.Parameters["@nbre_place"].Value = voiture.nbre_place;

                        command.Parameters.Add("@Id_marque", SqlDbType.Int);
                        command.Parameters["@Id_marque"].Value = voiture.Marque.Id_marque;


                        command.Parameters.Add("@id_model", SqlDbType.Int);
                        command.Parameters["@id_model"].Value = voiture.Model.id_model;

                        command.Parameters.Add("@id_etat", SqlDbType.Int);
                        command.Parameters["@id_etat"].Value = voiture.Etat.id_etat;

                       

                        command.Parameters.Add("@id_parc", SqlDbType.Int);
                        command.Parameters["@id_parc"].Value = voiture.Parc.id_parc;



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

        public bool Update(Voiture voiture)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_Voiture_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = voiture.matricule_voiture;



                        command.Parameters.Add("@couleur_voiture", SqlDbType.VarChar);
                        command.Parameters["@couleur_voiture"].Value = voiture.couleur_voiture;

                        command.Parameters.Add("@Kilommetrage_Voiture", SqlDbType.VarChar);
                        command.Parameters["@Kilommetrage_Voiture"].Value = voiture.Kilommetrage_Voiture;

                        command.Parameters.Add("@annee_voiture", SqlDbType.Int);
                        command.Parameters["@annee_voiture"].Value = voiture.annee_voiture;

                        command.Parameters.Add("@nbre_place", SqlDbType.Int);
                        command.Parameters["@nbre_place"].Value = voiture.nbre_place;

                        command.Parameters.Add("@Id_marque", SqlDbType.Int);
                        command.Parameters["@Id_marque"].Value = voiture.Marque.Id_marque;


                        command.Parameters.Add("@id_model", SqlDbType.Int);
                        command.Parameters["@id_model"].Value = voiture.Model.id_model;

                        command.Parameters.Add("@id_etat", SqlDbType.Int);
                        command.Parameters["@id_etat"].Value = voiture.Etat.id_etat;



                        command.Parameters.Add("@id_parc", SqlDbType.Int);
                        command.Parameters["@id_parc"].Value = voiture.Parc.id_parc;





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

        public bool Remove(Voiture voiture)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_voiture_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = voiture.matricule_voiture;

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
