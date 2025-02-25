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
    public class ReservationDB : IReservation
    {

        #region Enums 
        private enum enumQryReservationFields
        {
            id_reservation = 0,
            datedebutreservation,
            datefinresevation,
            description_reservation,

            user_id,
            user_full_name,
            user_url_image,
            user_login,
            user_password,
            user_email,
            user_phone,
            user_is_active,
            user_birth_date,
            user_creation_date,

            matricule_voiture,
            couleur_voiture,
            Kilommetrage_Voiture,
            annee_voiture,
            nbre_place,

            Id_marque,
            marque_name,
            Id_model,
            name_model,

            id_etat_demande,
            etat_code,
            etat_name,
            id_parc,
            nom_parc
        }

        #endregion




        public IEnumerable<Reservation> GetAll(int PrckID, int UserID)
        {
            Entities.Reservations Ret = new Entities.Reservations();
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_get_all", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;



                        command.Parameters.Add("@parc_id", SqlDbType.Int);
                        command.Parameters["@parc_id"].Value = PrckID;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = UserID;

                        conn.Open();
                        DR = command.ExecuteReader();

                        while (DR.Read())
                        {
                            Ret.Add(new Entities.Reservation()
                            {
                                id_reservation = (!DR.IsDBNull((int)enumQryReservationFields.id_reservation))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.id_reservation])
                                            : 0,
                                datedebutreservation = (!DR.IsDBNull((int)enumQryReservationFields.datedebutreservation))
                                                    ? Convert.ToDateTime(DR[(int)enumQryReservationFields.datedebutreservation].ToString())
                                                    : new DateTime(1970, 1, 1),
                                datefinresevation = (!DR.IsDBNull((int)enumQryReservationFields.datefinresevation))
                                                    ? Convert.ToDateTime(DR[(int)enumQryReservationFields.datefinresevation].ToString())
                                                    : new DateTime(1970, 1, 1),
                                description_reservation = (!DR.IsDBNull((int)enumQryReservationFields.description_reservation))
                                        ? DR[(int)enumQryReservationFields.description_reservation].ToString()
                                        : string.Empty,

                                User = new User()
                                {

                                    Id = Convert.ToInt32(DR[(int)enumQryReservationFields.user_id]),
                                    FullName = (!DR.IsDBNull((int)enumQryReservationFields.user_full_name))
                                            ? DR[(int)enumQryReservationFields.user_full_name].ToString()
                                            : string.Empty,

                                    ImageUrl = (!DR.IsDBNull((int)enumQryReservationFields.user_url_image))
                                           ? DR[(int)enumQryReservationFields.user_url_image].ToString()
                                           : string.Empty,
                                    Login = (!DR.IsDBNull((int)enumQryReservationFields.user_login))
                                        ? DR[(int)enumQryReservationFields.user_login].ToString()
                                        : string.Empty,
                                    Password = (!DR.IsDBNull((int)enumQryReservationFields.user_password))
                                           ? DR[(int)enumQryReservationFields.user_password].ToString()
                                           : string.Empty,
                                    Email = (!DR.IsDBNull((int)enumQryReservationFields.user_email))
                                        ? DR[(int)enumQryReservationFields.user_email].ToString()
                                        : string.Empty,
                                    Phone = (!DR.IsDBNull((int)enumQryReservationFields.user_phone))
                                        ? DR[(int)enumQryReservationFields.user_phone].ToString()
                                        : string.Empty,
                                    IsActive = (!DR.IsDBNull((int)enumQryReservationFields.user_is_active))
                                           ? Convert.ToBoolean(DR[(int)enumQryReservationFields.user_is_active].ToString())
                                           : false,
                                    BirthDate = (!DR.IsDBNull((int)enumQryReservationFields.user_birth_date))
                                            ? Convert.ToDateTime(DR[(int)enumQryReservationFields.user_birth_date].ToString())
                                            : new DateTime(1970, 1, 1),
                                    CreationDate = (!DR.IsDBNull((int)enumQryReservationFields.user_creation_date))
                                               ? Convert.ToDateTime(DR[(int)enumQryReservationFields.user_creation_date].ToString())
                                               : new DateTime(1970, 1, 1),
                                },
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryReservationFields.matricule_voiture))
                                                        ? DR[(int)enumQryReservationFields.matricule_voiture].ToString()
                                                         : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryReservationFields.couleur_voiture))
                                                      ? DR[(int)enumQryReservationFields.couleur_voiture].ToString()
                                                      : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryReservationFields.Kilommetrage_Voiture))
                                                           ? DR[(int)enumQryReservationFields.Kilommetrage_Voiture].ToString()
                                                           : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryReservationFields.annee_voiture))
                                                    ? Convert.ToInt32(DR[(int)enumQryReservationFields.annee_voiture])
                                                    : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryReservationFields.nbre_place))
                                                 ? Convert.ToInt32(DR[(int)enumQryReservationFields.nbre_place])
                                                 : 0,

                                    Marque = new Marque()
                                    {

                                        Id_marque = (!DR.IsDBNull((int)enumQryReservationFields.Id_marque))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.Id_marque])
                                            : 0,

                                        marque_name = (!DR.IsDBNull((int)enumQryReservationFields.marque_name))
                                              ? DR[(int)enumQryReservationFields.marque_name].ToString()
                                              : string.Empty,
                                    },
                                    Model = new Model()

                                    {
                                        id_model = (!DR.IsDBNull((int)enumQryReservationFields.Id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.Id_model])
                                            : 0,
                                        name_model = (!DR.IsDBNull((int)enumQryReservationFields.name_model))
                                              ? DR[(int)enumQryReservationFields.name_model].ToString()
                                              : string.Empty,
                                    },
                                },

                                Etat_demande = new Etat_demande()

                                {
                                    id_etat_demande = (!DR.IsDBNull((int)enumQryReservationFields.id_etat_demande))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.id_etat_demande])
                                            : 0,
                                    etat_code = (!DR.IsDBNull((int)enumQryReservationFields.etat_code))
                                              ? DR[(int)enumQryReservationFields.etat_code].ToString()
                                              : string.Empty,

                                    etat_name = (!DR.IsDBNull((int)enumQryReservationFields.etat_name))
                                              ? DR[(int)enumQryReservationFields.etat_name].ToString()
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

        public Reservation Getone(int id_reservation)
        {
            Entities.Reservation Ret = null;
            SqlDataReader DR = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_get_one_by_id", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = id_reservation;
                        conn.Open();
                        DR = command.ExecuteReader();

                        if (DR.Read())
                        {
                            Ret = new Entities.Reservation()
                            {
                                id_reservation = (!DR.IsDBNull((int)enumQryReservationFields.id_reservation))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.id_reservation])
                                            : 0,

                                datedebutreservation = (!DR.IsDBNull((int)enumQryReservationFields.datedebutreservation))
                                            ? Convert.ToDateTime(DR[(int)enumQryReservationFields.datedebutreservation].ToString())
                                            : new DateTime(1970, 1, 1),

                                datefinresevation = (!DR.IsDBNull((int)enumQryReservationFields.datefinresevation))
                                            ? Convert.ToDateTime(DR[(int)enumQryReservationFields.datefinresevation].ToString())
                                            : new DateTime(1970, 1, 1),

                                description_reservation = (!DR.IsDBNull((int)enumQryReservationFields.description_reservation))
                                        ? DR[(int)enumQryReservationFields.description_reservation].ToString()
                                        : string.Empty,


                                User = new User()

                                {
                                    Id = Convert.ToInt32(DR[(int)enumQryReservationFields.user_id]),
                                    FullName = (!DR.IsDBNull((int)enumQryReservationFields.user_full_name))
                                            ? DR[(int)enumQryReservationFields.user_full_name].ToString()
                                            : string.Empty,

                                },

                                Etat_demande = new Etat_demande()

                                {
                                    id_etat_demande = (!DR.IsDBNull((int)enumQryReservationFields.id_etat_demande))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.id_etat_demande])
                                            : 0,
                                    etat_code = (!DR.IsDBNull((int)enumQryReservationFields.etat_code))
                                              ? DR[(int)enumQryReservationFields.etat_code].ToString()
                                              : string.Empty,

                                    etat_name = (!DR.IsDBNull((int)enumQryReservationFields.etat_name))
                                              ? DR[(int)enumQryReservationFields.etat_name].ToString()
                                              : string.Empty,
                                },
                                Voiture = new Voiture()
                                {
                                    matricule_voiture = (!DR.IsDBNull((int)enumQryReservationFields.matricule_voiture))
                                                        ? DR[(int)enumQryReservationFields.matricule_voiture].ToString()
                                                         : string.Empty,
                                    couleur_voiture = (!DR.IsDBNull((int)enumQryReservationFields.couleur_voiture))
                                                      ? DR[(int)enumQryReservationFields.couleur_voiture].ToString()
                                                      : string.Empty,
                                    Kilommetrage_Voiture = (!DR.IsDBNull((int)enumQryReservationFields.Kilommetrage_Voiture))
                                                           ? DR[(int)enumQryReservationFields.Kilommetrage_Voiture].ToString()
                                                           : string.Empty,
                                    annee_voiture = (!DR.IsDBNull((int)enumQryReservationFields.annee_voiture))
                                                    ? Convert.ToInt32(DR[(int)enumQryReservationFields.annee_voiture])
                                                    : 0,
                                    nbre_place = (!DR.IsDBNull((int)enumQryReservationFields.nbre_place))
                                                 ? Convert.ToInt32(DR[(int)enumQryReservationFields.nbre_place])
                                                 : 0,

                                    Marque = new Marque()
                                    {

                                        Id_marque = (!DR.IsDBNull((int)enumQryReservationFields.Id_marque))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.Id_marque])
                                            : 0,

                                        marque_name = (!DR.IsDBNull((int)enumQryReservationFields.marque_name))
                                              ? DR[(int)enumQryReservationFields.marque_name].ToString()
                                              : string.Empty,
                                    },
                                    Model = new Model()

                                    {
                                        id_model = (!DR.IsDBNull((int)enumQryReservationFields.Id_model))
                                            ? Convert.ToInt32(DR[(int)enumQryReservationFields.Id_model])
                                            : 0,
                                        name_model = (!DR.IsDBNull((int)enumQryReservationFields.name_model))
                                              ? DR[(int)enumQryReservationFields.name_model].ToString()
                                              : string.Empty,
                                    },

                                },

                                Parc = new Parc()
                                {
                                    id_parc = (!DR.IsDBNull((int)enumQryReservationFields.id_parc))
                                              ? Convert.ToInt32(DR[(int)enumQryReservationFields.id_parc])
                                              : 0,
                                    nom_parc = (!DR.IsDBNull((int)enumQryReservationFields.nom_parc))
                                               ? DR[(int)enumQryReservationFields.nom_parc].ToString()
                                               : string.Empty,
                                }

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

        public bool Add(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_insert", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@date_start", SqlDbType.VarChar);
                        command.Parameters["@date_start"].Value = reservation.datedebutreservation;

                        command.Parameters.Add("@date_end", SqlDbType.VarChar);
                        command.Parameters["@date_end"].Value = reservation.datefinresevation;

                        command.Parameters.Add("@description_reservation", SqlDbType.VarChar);
                        command.Parameters["@description_reservation"].Value = reservation.description_reservation;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = reservation.User.Id;

                        command.Parameters.Add("@parc_id", SqlDbType.Int);
                        command.Parameters["@parc_id"].Value = reservation.Parc.id_parc;

                        command.Parameters.Add("@etat_id", SqlDbType.Int);
                        command.Parameters["@etat_id"].Value = reservation.Etat_demande.id_etat_demande;

                       
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

        public bool Update(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_update", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = reservation.id_reservation;

                        command.Parameters.Add("@date_start", SqlDbType.DateTime);
                        command.Parameters["@date_start"].Value = reservation.datedebutreservation;

                        command.Parameters.Add("@date_end", SqlDbType.DateTime);
                        command.Parameters["@date_end"].Value = reservation.datefinresevation;

                        command.Parameters.Add("@description_reservation", SqlDbType.VarChar);
                        command.Parameters["@description_reservation"].Value = reservation.description_reservation;

                        command.Parameters.Add("@etat_id", SqlDbType.Int);
                        command.Parameters["@etat_id"].Value = reservation.Etat_demande.id_etat_demande;

                        command.Parameters.Add("@user_id", SqlDbType.Int);
                        command.Parameters["@user_id"].Value = reservation.User.Id;

                        command.Parameters.Add("@parc_id", SqlDbType.Int);
                        command.Parameters["@parc_id"].Value = reservation.Parc.id_parc;

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

        public bool Confirm(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_confirm", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = reservation.id_reservation;

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = reservation.Voiture.matricule_voiture;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = reservation.Etat_demande.id_etat_demande;

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

        public bool Archiver(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_archiver", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = reservation.id_reservation;

                        command.Parameters.Add("@matricule_voiture", SqlDbType.VarChar);
                        command.Parameters["@matricule_voiture"].Value = reservation.Voiture.matricule_voiture;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = (int)Entities.Enumeration.EtatDemande.ARCHIVER;

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

        public bool Refuse(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_refuse", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = reservation.id_reservation;

                        command.Parameters.Add("@id_etat_demande", SqlDbType.Int);
                        command.Parameters["@id_etat_demande"].Value = reservation.Etat_demande.id_etat_demande;

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

        public bool Remove(Reservation reservation)
        {
            int Ret = -1;

            try
            {
                using (SqlConnection conn = new SqlConnection(SettingDB.ConnStr))
                {
                    using (SqlCommand command = new SqlCommand("sp_reservation_delete", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@id_reservation", SqlDbType.Int);
                        command.Parameters["@id_reservation"].Value = reservation.id_reservation;

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

