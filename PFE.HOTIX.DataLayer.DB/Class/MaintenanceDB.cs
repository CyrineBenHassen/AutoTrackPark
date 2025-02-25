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
    public class MaintenanceDB : IMaintenance
    {

        #region Enums

        private enum enumQryMaintenanceFields
        {
            id_maintenance = 0,
            Description_Maintenance,
            Lieu_Maintenance,
            Date_Maintenance,

            matricule_voiture,
            couleur_voiture,
            Kilommetrage_Voiture,
            annee_voiture,
            nbre_place,

            id_type_maintenance,
            name_type
            
        }

        #endregion




        public IEnumerable<Maintenance> GetAll(int PrckID)
        {
            Entities.Maintenances Ret = new Entities.Maintenances();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_maintenance_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@parc_id", SqlDbType.Int);
                        command.Parameters["@parc_id"].Value = PrckID;
                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {

                            Ret.Add(new Entities.Maintenance()
                            {
                                id_maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.id_maintenance))
                                                 ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.id_maintenance].ToString())
                                                 : 0,

                                Description_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Description_Maintenance))
                                                          ? DR[(int)enumQryMaintenanceFields.Description_Maintenance].ToString()
                                                          : string.Empty,
                                Lieu_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Lieu_Maintenance))
                                                   ? DR[(int)enumQryMaintenanceFields.Lieu_Maintenance].ToString()
                                                   : string.Empty,

                                Date_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Date_Maintenance))
                                                   ? Convert.ToDateTime(DR[(int)enumQryMaintenanceFields.Date_Maintenance].ToString())
                                                   : new DateTime(1970, 1, 1),
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.matricule_voiture))
                                                        ? DR[(int)enumQryMaintenanceFields.matricule_voiture].ToString()
                                                        : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.couleur_voiture))
                                                      ? DR[(int)enumQryMaintenanceFields.couleur_voiture].ToString()
                                                      : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.Kilommetrage_Voiture))
                                                           ? DR[(int)enumQryMaintenanceFields.Kilommetrage_Voiture].ToString()
                                                           : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.annee_voiture))
                                                    ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.annee_voiture])
                                                    : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryMaintenanceFields.nbre_place))
                                                 ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.nbre_place])
                                                 : 0,
                                },

                                Type_Maintenance = new Type_maintenance()
                                {

                                    id_type_maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.id_type_maintenance))
                                                 ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.id_type_maintenance])
                                                 : 0,


                                    name_type = (!DR.IsDBNull((int)enumQryMaintenanceFields.name_type))
                                              ? DR[(int)enumQryMaintenanceFields.name_type].ToString()
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



        public Maintenance Getone(int id_maintenance)
        {
            Entities.Maintenance Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_maintenance_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add("@id_maintenance", SqlDbType.Int);
                        command.Parameters["@id_maintenance"].Value = id_maintenance;
                        conn.Open();


                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Maintenance()
                            {
                                id_maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.id_maintenance))
                                                  ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.id_maintenance].ToString())
                                                  : 0,

                                Description_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Description_Maintenance))
                                                           ? DR[(int)enumQryMaintenanceFields.Description_Maintenance].ToString()
                                                           : string.Empty,
                                Lieu_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Lieu_Maintenance))
                                                    ? DR[(int)enumQryMaintenanceFields.Lieu_Maintenance].ToString()
                                                    : string.Empty,

                                Date_Maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.Date_Maintenance))
                                                    ? Convert.ToDateTime(DR[(int)enumQryMaintenanceFields.Date_Maintenance].ToString())
                                                    : new DateTime(1970, 1, 1),
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.matricule_voiture))
                                                         ? DR[(int)enumQryMaintenanceFields.matricule_voiture].ToString()
                                                         : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.couleur_voiture))
                                                       ? DR[(int)enumQryMaintenanceFields.couleur_voiture].ToString()
                                                       : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.Kilommetrage_Voiture))
                                                            ? DR[(int)enumQryMaintenanceFields.Kilommetrage_Voiture].ToString()
                                                            : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryMaintenanceFields.annee_voiture))
                                                     ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.annee_voiture])
                                                     : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryMaintenanceFields.nbre_place))
                                                  ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.nbre_place])
                                                  : 0,
                                },

                                Type_Maintenance = new Type_maintenance()
                                {

                                    id_type_maintenance = (!DR.IsDBNull((int)enumQryMaintenanceFields.id_type_maintenance))
                                                  ? Convert.ToInt32(DR[(int)enumQryMaintenanceFields.id_type_maintenance])
                                                  : 0,


                                    name_type = (!DR.IsDBNull((int)enumQryMaintenanceFields.name_type))
                                               ? DR[(int)enumQryMaintenanceFields.name_type].ToString()
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




        public bool Add(Maintenance maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_maintenance_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add("@Description_Maintenance", SqlDbType.VarChar);
                        command.Parameters["@Description_Maintenance"].Value = maintenance.Description_Maintenance;

                        command.Parameters.Add("@Lieu_Maintenance", SqlDbType.VarChar);
                        command.Parameters["@Lieu_Maintenance"].Value = maintenance.Lieu_Maintenance;

                        command.Parameters.Add("@Date_Maintenance", SqlDbType.DateTime);
                        command.Parameters["@Date_Maintenance"].Value = (maintenance.Date_Maintenance.Year < 1900)
                                                                 ? new DateTime(1970, 1, 1)
                                                                 : maintenance.Date_Maintenance;


                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = maintenance.Voiture.matricule_voiture;

                        command.Parameters.Add("@id_type_maintenance", SqlDbType.Int);
                        command.Parameters["@id_type_maintenance"].Value = maintenance.Type_Maintenance.id_type_maintenance;
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

        public bool Update(Maintenance maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_maintenance_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_maintenance", SqlDbType.Int);
                        command.Parameters["@id_maintenance"].Value = maintenance.id_maintenance;

                        command.Parameters.Add("@Description_Maintenance", SqlDbType.VarChar);
                        command.Parameters["@Description_Maintenance"].Value = maintenance.Description_Maintenance;

                        command.Parameters.Add("@Lieu_Maintenance", SqlDbType.VarChar);
                        command.Parameters["@Lieu_Maintenance"].Value = maintenance.Lieu_Maintenance;

                        command.Parameters.Add("@Date_Maintenance", SqlDbType.DateTime);
                        command.Parameters["@Date_Maintenance"].Value = (maintenance.Date_Maintenance.Year < 1900)
                                                                 ? new DateTime(1970, 1, 1)
                                                                 : maintenance.Date_Maintenance;


                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = maintenance.Voiture.matricule_voiture;

                        command.Parameters.Add("@id_type_maintenance", SqlDbType.Int);
                        command.Parameters["@id_type_maintenance"].Value = maintenance.Type_Maintenance.id_type_maintenance;
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

        public bool Remove(Maintenance maintenance)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_maintenance_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_maintenance", SqlDbType.Int);
                        command.Parameters["@id_maintenance"].Value = maintenance.id_maintenance;

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