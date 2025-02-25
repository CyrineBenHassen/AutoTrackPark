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
    public class ConfigDB : IConfig
    {

        #region Enums 

        private enum enumQryUserFields
        { 
            role_id = 0,
            role_code,
            role_name
        }

        private enum enumQryMarqueFields
        {
            marque_id = 0,
            marque_name
        }

        private enum enumQryModelFields
        {
            id_model = 0,
            name_model
        }


        private enum enumQryTypemaintenanceFields
        {
            id_type_maintenance = 0,
            name_type
        }  

        private enum enumQryEtatFields
        {
            id_etat = 0,
            etat_code,
            etat_name

        } 

        private enum enumQryEtatDemandeFields
        {
            id_etat_demande = 0,
            etat_code,
            etat_name

        } 

        private enum enumQrylocalisationFields
        {
            id_localisation = 0,
            Laititude_Localisation,
            Longitude_Localisation ,
            Date_Localisation ,
            Temps_Localisation ,
            matricule_voiture ,
            couleur_voiture ,
            Kilommetrage_Voiture ,
            annee_voiture ,
            nbre_place

        } 

        #endregion
         
        public IEnumerable<Marque> GetAllMarques()
        {
            Entities.Marques Ret = new Entities.Marques();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_marque_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Marque()
                            {
                                Id_marque = (!DR.IsDBNull((int)enumQryMarqueFields.marque_id))
                                            ? Convert.ToInt32(DR[(int)enumQryMarqueFields.marque_id])
                                            : 0,
                                marque_name = (!DR.IsDBNull((int)enumQryMarqueFields.marque_name))
                                              ? DR[(int)enumQryMarqueFields.marque_name].ToString()
                                              : string.Empty,
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

        public Marque MarqueGetOne(int id_marque)
        {
            Entities.Marque Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_marque_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add("@id_marque", SqlDbType.Int);
                        command.Parameters["@id_marque"].Value = id_marque;
                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Marque()
                            {
                                Id_marque = (!DR.IsDBNull((int)enumQryMarqueFields.marque_id))
                                            ? Convert.ToInt32(DR[(int)enumQryMarqueFields.marque_id])
                                            : 0,

                                marque_name = (!DR.IsDBNull((int)enumQryMarqueFields.marque_name))
                                           ? DR[(int)enumQryMarqueFields.marque_name].ToString()
                                           : string.Empty,


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

        public bool MarqueAdd(Marque marque)
                     {
                     int Ret = -1;

                       try
                       {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_marque_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                       

                        command.Parameters.Add("@marque_name", SqlDbType.VarChar);
                        command.Parameters["@marque_name"].Value = marque.marque_name;



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

        public bool MarqueUpdate(Marque marque)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_marque_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@Id_marque", SqlDbType.Int);
                        command.Parameters["@Id_marque"].Value = marque.Id_marque;

                        command.Parameters.Add("@marque_name", SqlDbType.VarChar);
                        command.Parameters["@marque_name"].Value = marque.marque_name;

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

        public bool MarqueRemove(Marque marque)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_marque_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_marque", SqlDbType.Int);
                        command.Parameters["@id_marque"].Value = marque.Id_marque;

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




        public IEnumerable<Type_maintenance> GetAllTypeMaintenances()
        {
            Entities.Types_maintenances Ret = new Entities.Types_maintenances();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_type_maintenance_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Type_maintenance()
                            {
                                id_type_maintenance = (!DR.IsDBNull((int)enumQryTypemaintenanceFields.id_type_maintenance))
                                            ? Convert.ToInt32(DR[(int)enumQryTypemaintenanceFields.id_type_maintenance])
                                            : 0,
                                name_type = (!DR.IsDBNull((int)enumQryTypemaintenanceFields.name_type))
                                              ? DR[(int)enumQryTypemaintenanceFields.name_type].ToString()
                                              : string.Empty,
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




        public Type_maintenance typegetone(int id_type_maintenance)
        {
            Entities.Type_maintenance Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_type_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add("@id_type_maintenance", SqlDbType.Int);
                        command.Parameters["@id_type_maintenance"].Value = id_type_maintenance;
                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {


                            Ret = new Entities.Type_maintenance()
                            {
                                id_type_maintenance = (!DR.IsDBNull((int)enumQryTypemaintenanceFields.id_type_maintenance))
                                            ? Convert.ToInt32(DR[(int)enumQryTypemaintenanceFields.id_type_maintenance])
                                            : 0,
                                name_type = (!DR.IsDBNull((int)enumQryTypemaintenanceFields.name_type))
                                              ? DR[(int)enumQryTypemaintenanceFields.name_type].ToString()
                                              : string.Empty,


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

        public bool TypeMaintenanceAdd(Type_maintenance type_Maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_type_maintenance_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                       
                        command.Parameters.Add("@name_type", SqlDbType.VarChar);
                        command.Parameters["@name_type"].Value = type_Maintenance.name_type;



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

        public bool TypeMaintenanceUpdate(Type_maintenance type_Maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_type_maintenance_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_type_maintenance", SqlDbType.Int);
                        command.Parameters["@id_type_maintenance"].Value = type_Maintenance.id_type_maintenance;

                        command.Parameters.Add("@name_type", SqlDbType.VarChar);
                        command.Parameters["@name_type"].Value = type_Maintenance.name_type;

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

        public bool TypeMaintenanceRemove(Type_maintenance type_Maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_type_maintenance_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_type_maintenance", SqlDbType.Int);
                        command.Parameters["@id_type_maintenance"].Value = type_Maintenance.id_type_maintenance;

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
       
        public IEnumerable<Model> GetAllModels()
        {
            Entities.Models Ret = new Entities.Models();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_model_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Model()
                            {
                                id_model = (!DR.IsDBNull((int)enumQryModelFields.id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryModelFields.id_model])
                                            : 0,
                                name_model = (!DR.IsDBNull((int)enumQryModelFields.name_model))
                                              ? DR[(int)enumQryModelFields.name_model].ToString()
                                              : string.Empty,
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

        public Model ModelGetOne(int id_model)
        {
            Entities.Model Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_model_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add("@id_model", SqlDbType.Int);
                        command.Parameters["@id_model"].Value = id_model;
                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Model()
                            {
                                id_model = (!DR.IsDBNull((int)enumQryModelFields.id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryModelFields.id_model])
                                            : 0,

                                name_model = (!DR.IsDBNull((int)enumQryModelFields.name_model))
                                           ? DR[(int)enumQryModelFields.name_model].ToString()
                                           : string.Empty,


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



        public bool ModelAdd(Model model)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_model_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        

                        command.Parameters.Add("@name_model", SqlDbType.VarChar);
                        command.Parameters["@name_model"].Value = model.name_model;



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

        public bool ModelUpdate(Model model)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_model_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_model", SqlDbType.Int);
                        command.Parameters["@id_model"].Value = model.id_model;

                        command.Parameters.Add("@name_model", SqlDbType.VarChar);
                        command.Parameters["@name_model"].Value = model.name_model;

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

        public bool ModelRemove(Model model)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_model_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_model", SqlDbType.Int);
                        command.Parameters["@id_model"].Value = model.id_model;

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


        public IEnumerable<Etat> GetAllEtats()
        {
            Entities.Etats Ret = new Entities.Etats();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etatvoiture_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Etat()
                            {
                                id_etat = (!DR.IsDBNull((int)enumQryEtatFields.id_etat))
                                            ? Convert.ToInt32(DR[(int)enumQryEtatFields.id_etat])
                                            : 0,
                                etat_code = (!DR.IsDBNull((int)enumQryEtatFields.etat_code))
                                              ? DR[(int)enumQryEtatFields.etat_code].ToString()
                                              : string.Empty,

                                etat_name = (!DR.IsDBNull((int)enumQryEtatFields.etat_name))
                                              ? DR[(int)enumQryEtatFields.etat_name].ToString()
                                              : string.Empty,


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
        public bool EtatAdd(Etat etat)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etatvoiture_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat", SqlDbType.Int);
                        command.Parameters["@id_etat"].Value = etat.id_etat;

                        command.Parameters.Add("@etat_code", SqlDbType.VarChar);
                        command.Parameters["@etat_code"].Value = etat.etat_code;

                        command.Parameters.Add("@etat_name", SqlDbType.VarChar);
                        command.Parameters["@etat_name"].Value = etat.etat_name;



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

        public bool EtatUpdate(Etat etat)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etatvoiture_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat", SqlDbType.Int);
                        command.Parameters["@id_etat"].Value = etat.id_etat;

                        command.Parameters.Add("@etat_code", SqlDbType.VarChar);
                        command.Parameters["@etat_code"].Value = etat.etat_code;

                        command.Parameters.Add("@etat_name", SqlDbType.VarChar);
                        command.Parameters["@etat_name"].Value = etat.etat_name;
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

        public bool EtatRemove(Etat etat)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etatvoiture_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat", SqlDbType.Int);
                        command.Parameters["@id_etat"].Value = etat.id_etat;

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
         

        public IEnumerable<Etat_demande> GetAllEtatDemande()
        {
            Entities.Etat_demandes Ret = new Entities.Etat_demandes();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etat_demande_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Etat_demande()
                            {
                                id_etat_demande = (!DR.IsDBNull((int)enumQryEtatDemandeFields.id_etat_demande))
                                            ? Convert.ToInt32(DR[(int)enumQryEtatDemandeFields.id_etat_demande])
                                            : 0,
                                etat_code = (!DR.IsDBNull((int)enumQryEtatDemandeFields.etat_code))
                                              ? DR[(int)enumQryEtatDemandeFields.etat_code].ToString()
                                              : string.Empty,

                                etat_name = (!DR.IsDBNull((int)enumQryEtatDemandeFields.etat_name))
                                              ? DR[(int)enumQryEtatDemandeFields.etat_name].ToString()
                                              : string.Empty,


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
        public bool EtatDemandeAdd(Etat_demande etat_demande)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etat_demande_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = etat_demande.id_etat_demande;

                        command.Parameters.Add("@etat_code", SqlDbType.VarChar);
                        command.Parameters["@etat_code"].Value = etat_demande.etat_code;

                        command.Parameters.Add("@etat_name", SqlDbType.VarChar);
                        command.Parameters["@etat_name"].Value = etat_demande.etat_name;



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

        public bool EtatDemandeUpdate(Etat_demande etat_demande)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etat_demande_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = etat_demande.id_etat_demande;

                        command.Parameters.Add("@etat_code", SqlDbType.VarChar);
                        command.Parameters["@etat_code"].Value = etat_demande.etat_code;

                        command.Parameters.Add("@etat_name", SqlDbType.VarChar);
                        command.Parameters["@etat_name"].Value = etat_demande.etat_name;
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

        public bool EtatDemandeRemove(Etat_demande etat_demande)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_etat_demande_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = etat_demande.id_etat_demande;

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

