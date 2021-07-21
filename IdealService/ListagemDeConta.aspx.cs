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
    public partial class ListagemDeConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            CarregarUsuarios();
        }

        private void CarregarUsuarios()
        {
            string query = @"select id, nome, nivel, email from usuario Where id > 1";
            DataTable dt = new DataTable();
            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                da.Fill(dt);

                //Popular o Repeater
                rptContas.DataSource = dt;
                rptContas.DataBind();

            }
            catch (Exception ex)
            {
                lblMsg.Text = "Falha: " + ex.Message;
            }
        }

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adicionar.aspx");
        }

    }
}