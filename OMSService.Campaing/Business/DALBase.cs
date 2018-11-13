using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using OMSService.WSCampaign.Models;

namespace OMSService.WSCampaign.Business
{
    public class DALBase
    {
        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["APIConectionString"].ConnectionString;
            }
        }

        protected static SqlConnection GetDbConnection()
        {
            return new SqlConnection(ConnectionString);
        }
        protected static SqlCommand GetDbCommand(string sqlQuery)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = GetDbConnection();
            command.CommandType = CommandType.Text;
            command.CommandText = sqlQuery;
            return command;
        }

        #region getProcedures

        // GetDbSprocCommand
        protected static SqlCommand GetDbSprocCommand(string sprocName)
        {
            SqlCommand command = new SqlCommand(sprocName);
            command.Connection = GetDbConnection();
            command.CommandType = CommandType.StoredProcedure;
            return command;
        }

        #endregion

        #region CreateNullparameters
        protected static SqlParameter CreateNullParameter(string name, SqlDbType paramType)
        {
            SqlCommand parameter = new SqlCommand();
            var p = parameter.CreateParameter();
            p.SqlDbType = paramType;
            p.ParameterName = name;
            p.Value = null;
            p.Direction = ParameterDirection.Input;
            return p;
        }

        #endregion


        protected static SqlParameter CreateINParameter(string name, SqlDbType paramType)
        {
            SqlParameter parameter = new SqlParameter();
            parameter.SqlDbType = paramType;
            parameter.ParameterName = name;
            parameter.Direction = ParameterDirection.Input;
            return parameter;
        }

        #region CreateParameter

        /// <summary>
        /// Create string parameter
        /// </summary>
        /// <param name="name">Parameters name.</param>
        /// <param name="value">parameters value.</param>
        /// <returns>SqlParameter</returns>
        protected static SqlParameter CreateParameter(string name, string value)
        {
            SqlParameter parameter = new SqlParameter();
            if (value == CommonBase.String_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.VarChar);
            }
            else
            {
                parameter = CreateINParameter(name, SqlDbType.VarChar);
                parameter.Value = value;
                return parameter;
            }
        }

        /// <summary>
        /// Create IN parameter
        /// </summary>
        /// <param name="name">Parameters name.</param>
        /// <param name="value">parameters value.</param>
        /// <returns>SqlParameter</returns>
        protected static SqlParameter CreateParameter(string name, int value)
        {
            SqlParameter parameter = new SqlParameter();
            if (value == CommonBase.Int_NullValue)
            {
                // If value is null then create a null parameter
                return CreateNullParameter(name, SqlDbType.Int);
            }
            else
            {
                parameter = CreateINParameter(name, SqlDbType.Int);
                parameter.Value = value;
                return parameter;
            }
        }
        #endregion CreateParameter

        #region Singleton


        //protected static List<TopProducts> GetDTOListJSON<T>(ref SqlCommand command) where T : CommonBase
        //{
        //    List<TopProducts> dtoList = new List<TopProducts>();
        //    try
        //    {
        //        command.Connection.Open();
        //        SqlDataReader reader = command.ExecuteReader();

        //        while (reader.Read())
        //        {
        //            TopProducts item = new TopProducts()
        //            {
        //                IdProduct = (long)reader["idProduct"],
        //                Name = reader["name"].ToString(),
        //                Description = reader["description"].ToString(),
        //                IdEntertainment = (long)reader["idEntertainment"],
        //                Cantidad = (int)reader["cantidad"]

        //            };
        //            dtoList.Add(item);

        //        }
        //        reader.Close();
        //    }
        //    catch (SqlException oEx)
        //    {
        //        throw oEx;
        //    }
        //    finally
        //    {
        //        command.Connection.Close();
        //        command.Connection.Dispose();
        //    }
        //    return dtoList;
        //}

        protected static List<Campaign> GetCampaing(ref SqlCommand command) //where T : CommonBase
        {
            List<Campaign> dtoList = new List<Campaign>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Campaign item = new Campaign();

                    if (reader["idCampaign"].ToString() != "") item.idCampaign = (long)reader["idCampaign"];
                    item.name = reader["name"].ToString();
                    if (reader["idStateCampaign"].ToString() != "") item.idStateCampaign = (long)reader["idStateCampaign"];
                    item.urlImage = reader["urlImage"].ToString();
                    item.description = reader["description"].ToString();
                    if (reader["idProduct"].ToString() != "") item.idProduct = (long)reader["idProduct"];
                    if (reader["startDate"].ToString() != "") item.startDate = (DateTime)reader["startDate"];
                    if (reader["endDate"].ToString() != "") item.startDate = (DateTime)reader["endDate"];
                    if (reader["idUser"].ToString() != "") item.idUser = (long)reader["idUser"];
                    if (reader["modificationDate"].ToString() != "") item.modificationDate = (DateTime)reader["modificationDate"];

                    dtoList.Add(item);

                }
                reader.Close();
            }
            catch (SqlException oEx)
            {
                throw oEx;
            }
            finally
            {
                command.Connection.Close();
                command.Connection.Dispose();
            }
            return dtoList;
        }

        #endregion

        protected static void ExecuteNonQuery(SqlCommand command)
        {
            try
            {
                command.Connection.Open();
                command.ExecuteNonQuery();
                command.Connection.Close();
            }
            catch (Exception e)
            {
                if (command.Connection.State == ConnectionState.Open)
                    command.Connection.Close();
                throw e;
            }
        }
    }
}