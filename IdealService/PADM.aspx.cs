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
    public partial class PADM : System.Web.UI.Page
    {
        int idMi;
        int idMa;
        int data;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Voltar"] = "PADM.aspx";

            idMi = (int)Session["IDmin"];

            if (idMi == 1)
            {
                btnVoltar.Enabled = false;
            }
            idMa = (int)Session["IDmax"];
            if ((int)Session["id"] != 1 && Session["nivel"] != "A")
            {
               // Response.Redirect("SelecionarPrestador.aspx");
            }
            Session["Analisar"] = 1;
            CarregarUsuarios();
        }


        private void CarregarUsuarios()
        {
            string query = @"SELECT id, titulo, servico, imgPerfil, descricao FROM anuncio WHERE id >= '" + idMi + "' AND id <='" + idMa + "' AND status = 'Pendente'";
            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);

                data = da.Fill(dt);


                rptPrestadores.DataSource = dt;
                rptPrestadores.DataBind();
            }
            catch (Exception ex)
            {
            }


            if (data == 0)
            {
                lblPrestadores.Visible = true;
                lblPrestadores.Text = "Não há prestador de serviço pendente";
                btnProximo.Enabled = false;
            }
            else
            {
                lblPrestadores.Visible = false;
                btnProximo.Enabled = true;
            }
        }
        protected void btnProcurar_Click(object sender, EventArgs e)
        {


            string query = "SELECT id, titulo, servico, imgPerfil, nivel FROM anuncio WHERE titulo LIKE '%" + txtProcurar.Text + "%' AND id >= '" + idMi + "' AND id <='" + idMa + "' AND status= 'Pendente'";

            DataTable dt = new DataTable();

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                data = da.Fill(dt);

                if (data <= 40)
                {
                    rptPrestadores.DataSource = dt;
                    rptPrestadores.DataBind();
                    btnProximo.Enabled = false;
                    btnVoltar.Enabled = false;
                }
                else
                {
                    rptPrestadores.Visible = false;
                    lblPrestadores.Visible = true;
                    lblPrestadores.Text = "Digite mais letras";
                }
                if (data == 0)
                {
                    lblPrestadores.Visible = true;
                    lblPrestadores.Text = "Não existe prestadore de serviço pendente com esse nome.";
                }


            }
            catch
            {

            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            idMi = idMi - 20;
            idMa = idMa - 20;
            Session["IDmin"] = idMi;
            Session["IDmax"] = idMa;
            CarregarUsuarios();
            if (idMi == 1)
            {
                btnVoltar.Enabled = false;
            }
        }

        protected void btnProximo_Click(object sender, EventArgs e)
        {
            idMi = idMi + 20;
            idMa = idMa + 20;
            Session["IDmin"] = idMi;
            Session["IDmax"] = idMa;
            CarregarUsuarios();
            btnVoltar.Enabled = true;
        }
        protected void btnPTeste_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}
