using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IdealService
{
    public partial class Login1 : System.Web.UI.Page
    {
        string Token;
        protected void Page_Load(object sender, EventArgs e)
        {

            lblMsg.Text = "";
            Session["IDmin"] = 1;
            Session["IDmax"] = 20;
            Session["IDminA"] = 1;
            Session["IDmaxA"] = 20;
            Session["Procurar"] = 0;
            Session["Analisar"] = 0;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            int senhaemail = 0;

            MySqlCommand cmd = new MySqlCommand();
            try
            {
                string email = txtEmail.Text,
                       senha = txtSenha.Text;

                // Recuperar senha encriptada
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select senha from usuario where email = @email";
                cmd.Parameters.AddWithValue("email", email);
                Conexao.Conectar();


                string senhaEncriptada = Convert.ToString(cmd.ExecuteScalar());

                if (string.IsNullOrEmpty(senhaEncriptada))
                {

                    lblMsg.Text = "Usuário ou senha ínválidos";
                    //throw new Exception("Usuário ou senha ínválidos");
                }


                // Comparar as senhas
                if (BCrypt.Net.BCrypt.Verify(senha, senhaEncriptada))
                {
                    // Vai pegar o nome do usuario para usar posteriormente na Session
                    cmd.CommandText = @"select nome from usuario where email = @email";

                    string nome = Convert.ToString(cmd.ExecuteScalar());

                    //Redirecionamento
                    FormsAuthentication.RedirectFromLoginPage(nome, false);
                    Session["Perfil"] = nome;
                    

                    MySqlCommand cmd2 = new MySqlCommand();
                    cmd2.Connection = Conexao.Connection;
                    cmd2.CommandText = @"select id, email, nivel, telefone, TokenDigitado from usuario where email LIKE '%" + txtEmail.Text + "%' ";

                   
                    Conexao.Conectar();
                    var reader = cmd2.ExecuteReader();
                    while (reader.Read())
                    {
                        Session["id"] = reader["id"];
                        Session["nivel"] = reader["nivel"];
                        Session["telefone"] = reader["telefone"];
                        Token = reader["TokenDigitado"].ToString();
                    }

                    Session["Email"] = txtEmail.Text;
                    Session["senha"] = txtSenha.Text;
                    Conexao.Desconectar();
                    if (Token == "" )
                    {
                        MySqlCommand cmd3 = new MySqlCommand();

                        try
                        {
                            cmd3.Connection = Conexao.Connection;

                            cmd3.CommandText = @"delete from usuario
                                    where email = @email";

                            cmd3.Parameters.AddWithValue("email", Session["Email"]);

                            Conexao.Conectar();

                            cmd3.ExecuteNonQuery();
                        }
                        finally
                        {
                            Session.Abandon();
                            Conexao.Desconectar();
                            MessageBox.Show("Registre novamente esse email", "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error) ;
                            Response.Redirect("CriarConta.aspx");
                        }
                    }

                    if ((int)Session["id"] == 1 && Session["nivel"] == "A")
                    {
                        Response.Redirect("PADM.aspx", false);
                    }

                    if ((int)Session["id"] == 1)
                    {
                        Response.Redirect("PADM.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("DigiteOCEP.aspx", false);
                    }
                }
                else
                {
                    senhaemail = 1;
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Email e/ou senha incorretos "; 
                }
            }
            catch(Exception ex)
            {
                if (senhaemail == 1) { }
                else
                {
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Email e/ou senha incorretos ";
                }
            }
        }
    }
}