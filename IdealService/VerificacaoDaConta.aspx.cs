using MySqlConnector;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Windows.Forms;

namespace IdealService
{
    public partial class VerificacaoDaConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlCommand cmd2 = new MySqlCommand();
            cmd2.Connection = Conexao.Connection;
            cmd2.CommandText = @"select id, email, nivel, telefone,token from usuario where email LIKE '%" + Session["Email"] + "%' ";


            Conexao.Conectar();
            var reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                Session["Token"] = reader["Token"];
            }
            Conexao.Desconectar();
        }

        protected void btnverificar_Click(object sender, EventArgs e)
        {
            if (txtConferir.Text == Session["Token"].ToString())
            {

                string query = "SELECT id, nome, email, senha,cep,telefone,TokenDigitado FROM usuario WHERE email ='" + Session["Email"] + "' ";

                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                MySqlCommand cmd = new MySqlCommand();

                try
                {
                    cmd.Connection = Conexao.Connection;
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"update usuario
                                    set TokenDigitado = @TokenDigitado";

                    cmd.Parameters.AddWithValue("TokenDigitado", txtConferir.Text);


                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Você será redirecionado à tela de login", "Conta criada com sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Response.Redirect("Login.aspx");
                }
                catch(Exception ex)
                {

                }
            }
            else
            {
                MessageBox.Show("Código Incorreto", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}