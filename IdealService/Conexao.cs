using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IdealService
{
    
    public class Conexao
    {
        #region Parâmetros de conexao
        // Aqui você coloca o banco de dados
        private static string Server = "localhost";
        private static string Database = "ideal_service";
        private static string User = "root";
        private static string Password = "senai";
        private static string connectionString = $@"Server={Server}; Database={Database};
                                                    Uid={User}; Pwd={Password}; SslMode=Required;
                                                     Charset=utf8;";
        #endregion
        public static MySqlConnection Connection = new MySqlConnection(connectionString);

        #region Conectar
        public static void Conectar()
        {
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
        }
        #endregion

        #region Desconectar
        public static void Desconectar()
        {
            if (Connection.State == System.Data.ConnectionState.Open)
            {
                Connection.Close();
            }
        }
        #endregion
    }
}