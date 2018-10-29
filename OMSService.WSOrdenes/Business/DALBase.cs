using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using OMSService.WSOrder.Models;
using OMSService.WSOrder.Payload;

namespace OMSService.WSOrder.Business
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
        #endregion CreateParameter

        protected static List<Order> GetOrder(ref SqlCommand command)
        {
            List<Order> dtoList = new List<Order>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Order item = new Order();

                    if (reader["idOrder"].ToString() != "") item.idOrder = (long)reader["idOrder"];
                    if (reader["idStateOrder"].ToString() != "") item.idStateOrder = (long)reader["idStateOrder"];
                    if (reader["amount"].ToString() != "") item.amount = (decimal)reader["amount"];
                    if (reader["idCustomer"].ToString() != "") item.idCustomer = (long)reader["idCustomer"];
                    if (reader["numberCard"].ToString() != "") item.numberCard = (long)reader["numberCard"];
                    if (reader["creationDate"].ToString() != "") item.creationDate = (DateTime)reader["creationDate"];
                    if (reader["modificationDate"].ToString() != "") item.modificationDate = (DateTime)reader["modificationDate"];
                    item.country = reader["country"].ToString();
                    item.city = reader["city"].ToString();
                    if (reader["IdUser"].ToString() != "") item.IdUser = (long)reader["IdUser"];

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

        protected static List<ResponseOrderClosed> GetOrderClosed(ref SqlCommand command)
        {
            List<ResponseOrderClosed> dtoList = new List<ResponseOrderClosed>();
            try
            {
                command.Connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    ResponseOrderClosed item = new ResponseOrderClosed();

                    item.Periodo = reader["Periodo"].ToString();
                    if (reader["Cantidad"].ToString() != "") item.Cantidad = (int)reader["Cantidad"];
                    if (reader["Facturado"].ToString() != "") item.Facturado = (decimal)reader["Facturado"];

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