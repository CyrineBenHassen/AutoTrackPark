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
    public class ParcDB : IParc
    {

        #region Enums

        private enum enumQryParcFields
        {
            id_parc = 0,
            nom_parc,
            tel_parc,
            adresse_parc,
            email_parc,
            user_id,
            full_name
        }

        #endregion




        public IEnumerable<Parc> GetAll()
        {
            Entities.Parcs Ret = new Entities.Parcs();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Parc()
                            {
                                id_parc = (!DR.IsDBNull((int)enumQryParcFields.id_parc))
                                            ? Convert.ToInt32(DR[(int)enumQryParcFields.id_parc])
                                            : 0,
                                nom_parc = (!DR.IsDBNull((int)enumQryParcFields.nom_parc))
                                              ? DR[(int)enumQryParcFields.nom_parc].ToString()
                                              : string.Empty,

                                tel_parc = (!DR.IsDBNull((int)enumQryParcFields.tel_parc))
                                            ? DR[(int)enumQryParcFields.tel_parc].ToString()
                                            : string.Empty,

                                adresse_parc = (!DR.IsDBNull((int)enumQryParcFields.adresse_parc))
                                              ? DR[(int)enumQryParcFields.adresse_parc].ToString()
                                              : string.Empty,

                                email_parc = (!DR.IsDBNull((int)enumQryParcFields.email_parc))
                                              ? DR[(int)enumQryParcFields.email_parc].ToString()
                                             : string.Empty,

                                User = new User()
                                {

                                    Id = Convert.ToInt32(DR[(int)enumQryParcFields.user_id]),
                                    FullName = (!DR.IsDBNull((int)enumQryParcFields.full_name))
                                            ? DR[(int)enumQryParcFields.full_name].ToString()
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


        public Parc Getone(int id_parc)
        {
            Entities.Parc Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_parc", SqlDbType.Int);
                        command.Parameters["@id_parc"].Value = id_parc;

                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Parc()
                            {
                                id_parc = Convert.ToInt32(DR[(int)enumQryParcFields.id_parc]),
                                nom_parc = (!DR.IsDBNull((int)enumQryParcFields.nom_parc))
                                              ? DR[(int)enumQryParcFields.nom_parc].ToString()
                                              : string.Empty,

                                tel_parc = (!DR.IsDBNull((int)enumQryParcFields.tel_parc))
                                            ? DR[(int)enumQryParcFields.tel_parc].ToString()
                                            : string.Empty,

                                adresse_parc = (!DR.IsDBNull((int)enumQryParcFields.adresse_parc))
                                              ? DR[(int)enumQryParcFields.adresse_parc].ToString()
                                              : string.Empty,

                                email_parc = (!DR.IsDBNull((int)enumQryParcFields.email_parc))
                                              ? DR[(int)enumQryParcFields.email_parc].ToString()
                                             : string.Empty,
                                User = new User()
                                {

                                    Id = Convert.ToInt32(DR[(int)enumQryParcFields.user_id]),
                                    FullName = (!DR.IsDBNull((int)enumQryParcFields.full_name))
                                            ? DR[(int)enumQryParcFields.full_name].ToString()
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

        public Parc GetOneByUserID(int User_ID)
        {
            Entities.Parc Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_get_one_by_user_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = User_ID;

                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Parc()
                            {
                                id_parc = Convert.ToInt32(DR[(int)enumQryParcFields.id_parc]),
                                nom_parc = (!DR.IsDBNull((int)enumQryParcFields.nom_parc))
                                              ? DR[(int)enumQryParcFields.nom_parc].ToString()
                                              : string.Empty,

                                tel_parc = (!DR.IsDBNull((int)enumQryParcFields.tel_parc))
                                            ? DR[(int)enumQryParcFields.tel_parc].ToString()
                                            : string.Empty,

                                adresse_parc = (!DR.IsDBNull((int)enumQryParcFields.adresse_parc))
                                              ? DR[(int)enumQryParcFields.adresse_parc].ToString()
                                              : string.Empty,

                                email_parc = (!DR.IsDBNull((int)enumQryParcFields.email_parc))
                                              ? DR[(int)enumQryParcFields.email_parc].ToString()
                                             : string.Empty,
                                User = new User()
                                {

                                    Id = Convert.ToInt32(DR[(int)enumQryParcFields.user_id]),
                                    FullName = (!DR.IsDBNull((int)enumQryParcFields.full_name))
                                            ? DR[(int)enumQryParcFields.full_name].ToString()
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


        public bool Add(Parc parc)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                      
                        command.Parameters.Add("@nom_parc", SqlDbType.VarChar);
                        command.Parameters["@nom_parc"].Value = parc.nom_parc;

                        command.Parameters.Add("@tel_parc", SqlDbType.VarChar);
                        command.Parameters["@tel_parc"].Value = parc.tel_parc;


                        command.Parameters.Add("@adresse_parc", SqlDbType.VarChar);
                        command.Parameters["@adresse_parc"].Value = parc.adresse_parc;

                        command.Parameters.Add("@email_parc", SqlDbType.VarChar);
                        command.Parameters["@email_parc"].Value = parc.email_parc;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = parc.User.Id;
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

        public bool Update(Parc parc)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id_parc", SqlDbType.Int);
                        command.Parameters["@id_parc"].Value = parc.id_parc;

                        command.Parameters.Add("@nom_parc", SqlDbType.VarChar);
                        command.Parameters["@nom_parc"].Value = parc.nom_parc;

                        command.Parameters.Add("@tel_parc", SqlDbType.VarChar);
                        command.Parameters["@tel_parc"].Value = parc.tel_parc;

                        command.Parameters.Add("@adresse_parc", SqlDbType.VarChar);
                        command.Parameters["@adresse_parc"].Value = parc.adresse_parc;

                        command.Parameters.Add("@email_parc", SqlDbType.VarChar);
                        command.Parameters["@email_parc"].Value = parc.email_parc;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = parc.User.Id;

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

        public bool Remove(Parc parc)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_parc_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_parc", SqlDbType.Int);
                        command.Parameters["@id_parc"].Value = parc.id_parc;

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

