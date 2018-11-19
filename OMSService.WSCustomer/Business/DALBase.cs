using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using OMSService.WSCustomer.Models;
using OMSService.WSCustomer.Payload;

namespace OMSService.WSCustomer.Business
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

        /// <summary>
        /// Create long parameter
        /// </summary>
        /// <param name="name">Parameters name.</param>
        /// <param name="value">parameters value.</param>
        /// <returns>SqlParameter</returns>
        protected static SqlParameter CreateParameter(string name, long value)
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


        protected static List<Customer> GetCustomer(ref SqlCommand command) //where T : CommonBase
        {
            List<Customer> dtoList = new List<Customer>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Customer item = new Customer();

                    if (reader["idCustomer"].ToString() != "") item.idCustomer = (long)reader["idCustomer"];
                    if (reader["idCategory"].ToString() != "") item.idCategory = (long)reader["idCategory"];
                    item.email = reader["email"].ToString();
                    item.userName = reader["userName"].ToString();
                    if (reader["idCard"].ToString() != "") item.idCard = (long)reader["idCard"];
                    item.first_name = reader["first_name"].ToString();
                    item.last_name = reader["last_name"].ToString();
                    item.phone_number = reader["phone_number"].ToString();
                    item.address = reader["address"].ToString();
                    item.country = reader["country"].ToString();
                    item.numberDoc = reader["numberDoc"].ToString();
                    item.TypeDoc = reader["TypeDoc"].ToString();
                    item.city = reader["city"].ToString();
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

        protected static List<RespCustomerProduct> CustomerProduct(ref SqlCommand command)
        {
            List<RespCustomerProduct> dtoList = new List<RespCustomerProduct>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    RespCustomerProduct item = new RespCustomerProduct();

                    if (reader["idCustomer"].ToString() != "") item.idCustomer = (long)reader["idCustomer"];
                    item.email = reader["email"].ToString();
                    item.first_name = reader["first_name"].ToString();
                    item.last_name = reader["last_name"].ToString();    
                    if (reader["idProduct"].ToString() != "") item.idProduct = (long)reader["idProduct"];
                    item.name = reader["name"].ToString();

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

        protected static List<RespTopCustomer> TopCustomer(ref SqlCommand command)
        {
            List<RespTopCustomer> dtoList = new List<RespTopCustomer>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    RespTopCustomer item = new RespTopCustomer();

                    if (reader["idCustomer"].ToString() != "") item.idCustomer = (long)reader["idCustomer"];
                    item.first_name = reader["first_name"].ToString();
                    item.last_name = reader["last_name"].ToString();
                    if (reader["Acumulado"].ToString() != "") item.Acumulado = (decimal)reader["Acumulado"];
   
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