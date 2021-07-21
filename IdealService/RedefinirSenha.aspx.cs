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
    public partial class RedefinirSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmailTemporario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void btnRedefinirSenha_Click(object sender, EventArgs e)
        {
            if (txtNovaSenha.Text == txtRepetirSenha.Text)
            {
                var senhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtNovaSenha.Text);

                MySqlCommand cmd = new MySqlCommand();
                string email = Session["EmailTemporario"].ToString();

                try
                {
                    
                    cmd.Connection = Conexao.Connection;
                    cmd.CommandText = @"update usuario set senha = @senha where email=@email";  


                    cmd.Parameters.AddWithValue("email", email);
                    cmd.Parameters.AddWithValue("senha", senhaEncriptada);

                    Session["senha"] = txtNovaSenha.Text;

                    Conexao.Conectar();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    lblMsg.CssClass = "text-danger";
                    lblMsg.Text = "Falha: " + ex.Message;
                }
                finally
                {
                    Conexao.Desconectar();
                    Session.Abandon();
                    txtNovaSenha.Text = email;
                    Response.Redirect("Login.aspx");
                    Session["EmailTemporario"] = "";
                }
            }
            else
            {
                lblMsg.CssClass = "text-danger";
                lblMsg.Text = "As senhas digitadas não batem.";
            }

        }
        
    }
}