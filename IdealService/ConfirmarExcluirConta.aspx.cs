using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class ConfirmarExcluirConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand();
            MySqlCommand cmd2 = new MySqlCommand();

            try
            {
                cmd.Connection = Conexao.Connection;
                cmd2.Connection = Conexao.Connection;

                cmd.CommandText = @"delete from usuario
                                    where id = @id";
                cmd2.CommandText = @"delete from anuncio 
                                     where idUsuario = @idUsuario";

                cmd.Parameters.AddWithValue("id", Session["id"]);
                cmd2.Parameters.AddWithValue("idUsuario", Session["id"]);

                Conexao.Conectar();

                cmd2.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblResultado.CssClass = "text-danger";
                lblResultado.Text = "Falhar: " + ex.Message;
            }
            finally
            {
                Session.Abandon();
                Conexao.Desconectar();
                Response.Redirect("CriarConta.aspx");
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarConta.aspx");
        }
    }
}
