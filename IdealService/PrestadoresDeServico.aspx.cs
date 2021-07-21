using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IdealService
{
    public partial class PrestadoresDeServico : System.Web.UI.Page
    {
        int idMi;
        int idMa;
        int data;
        string escolha;
        string Cidade;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Voltar"] = "PrestadoresDeServico.aspx";
            try
            {
                escolha = Session["Escolha"].ToString();
            }
            catch
            {

            }
            lblTitulo.Text = "Listagem de " + escolha + "s";
            if (lblTitulo.Text == "Listagem de Pintors")
            {
                lblTitulo.Text = "Listagem de Pintores";
            }
            if (lblTitulo.Text == "Listagem de Encanadors")
            {
                lblTitulo.Text = "Listagem de Encanadores";
            }

            idMi = (int)Session["IDmin"];
            idMa = (int)Session["IDmax"];
            Session["IDminA"] = 1;
            Session["IDmaxA"] = 20;

            if (idMi == 1 && idMa == 20)
            {
                btnVoltar.Enabled = false;
                lblPrestadores.Text = "Não há prestadores disponíveis no momento";
            }
            if (Session["Cidade"] == null)
            {
                Response.Redirect("DigiteOCEP.aspx");
            }
            CarregarUsuarios();
        }

        private void CarregarUsuarios()
        {
            Cidade = Session["Cidade"].ToString();
            escolha = Session["Escolha"].ToString();
            string query = @"SELECT id, titulo, servico, imgPerfil, descricao FROM anuncio WHERE id >= '" + idMi + "' AND id <='" + idMa + "' AND servico = '" + escolha + "' AND cidade = '" + Cidade + "' AND status = 'Aprovado'";
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

            escolha = Session["Escolha"].ToString();
            string query = "SELECT id, titulo, servico, imgPerfil FROM anuncio WHERE titulo LIKE '%" + txtProcurar.Text + "%' AND id >= '" + idMi + "' AND id <='" + idMa + "' AND servico = '" + escolha + "' AND cidade = '" + Cidade + "' AND status = 'Aprovado'";

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
                if(data == 0)
                {
                    lblPrestadores.Visible = true;
                    lblPrestadores.Text = "Não existe prestadores com esse nome.";
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

        protected void btnExcluir_Click(object sender, EventArgs e)
        {

        }
    }
}