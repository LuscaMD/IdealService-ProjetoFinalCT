using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class MeusAnuncios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            CarregarMeusAnuncios();   
        }
        protected void CarregarMeusAnuncios()
        {
            string query = @"SELECT id, titulo, servico, imgPerfil, descricao FROM anuncio WHERE  idUsuario = '" + Session["id"] + "'";
            

            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                da.Fill(dt);


                rptMeusAnuncios.DataSource = dt;
                rptMeusAnuncios.DataBind();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Erro: " + ex.Message;
            }
        }

    }
}